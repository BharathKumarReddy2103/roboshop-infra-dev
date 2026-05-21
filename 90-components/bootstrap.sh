#!/bin/bash

component=$1
export AWS_DEFAULT_REGION=us-east-1
export AWS_REGION=us-east-1
export NO_PROXY="169.254.169.254,169.254.170.2,localhost,127.0.0.1"
export no_proxy="$NO_PROXY"

dnf install ansible python3-boto3 python3-botocore -y

TOKEN=$(curl -sS -X PUT \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600" \
  --connect-timeout 2 \
  http://169.254.169.254/latest/api/token || true)

for i in {1..30}; do
  if [ -n "$TOKEN" ]; then
    ROLE_NAME=$(curl -sS \
      -H "X-aws-ec2-metadata-token: $TOKEN" \
      --connect-timeout 2 \
      http://169.254.169.254/latest/meta-data/iam/security-credentials/ || true)
  else
    ROLE_NAME=$(curl -sS \
      --connect-timeout 2 \
      http://169.254.169.254/latest/meta-data/iam/security-credentials/ || true)
  fi

  if [ -n "$ROLE_NAME" ]; then
    echo "IAM role available from metadata: $ROLE_NAME"
    break
  fi

  echo "Waiting for IAM role credentials from EC2 metadata..."
  sleep 5
done

if [ -z "$ROLE_NAME" ]; then
  echo "ERROR: IAM role credentials are not available from EC2 metadata."
  exit 1
fi

python3 - <<'PY'
import botocore.session

session = botocore.session.get_session()
credentials = session.get_credentials()

if credentials is None:
    raise SystemExit("ERROR: botocore cannot load AWS credentials.")

print(f"botocore credential provider: {credentials.method}")
PY

ansible-pull -U https://github.com/BharathKumarReddy2103/ansible-roboshop-roles-tf.git -e component=$1 -e env=$2 main.yaml
