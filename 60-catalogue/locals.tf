locals {
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    private_subnet_id = split ("," , data.aws_ssm_parameter.private_subnet_ids.value)[0]
    private_subnet_ids = split ("," , data.aws_ssm_parameter.private_subnet_ids.value)
    ami_id = data.aws_ami.bharathdevops.id
    catalogue_sg_id = data.aws_ssm_parameter.catalogue_sg_id.value
    backend_alb_listener_arn = data.aws_ssm_parameter.backend_alb_listener_arn.value
    common_tags = {
        Project = var.project
        Environment = var.environment
        Terraform = "true"
    }
}