terraform {
	required_providers {
		aws = {
			source  = "hashicorp/aws "
			version = ">= 3.75.0"
		}
	}
	experiments = [module_variable_optional_attrs]
	required_version = ">= 1"
}

# lt
resource "aws_launch_template" "lt" {
	name = var.template_name
	image_id = var.image_id
	vpc_security_group_ids = var.sg_ids
	user_data = base64encode(var.user_data)

	monitoring {
		enabled = var.ec2_monitoring
	}

	block_device_mappings {
		device_name = var.bd_config.device_name
		ebs {
			volume_type = var.bd_config.volume_type
			volume_size = var.bd_config.volume_size
		}
	}
}

# node group
resource "aws_eks_node_group" "ng" {
	cluster_name = var.cluster_name
	node_group_name = var.ng_name
	node_role_arn = var.node_role_arn
	subnet_ids = var.subnet_ids
	instance_types = var.instance_types
	capacity_type = var.capacity_type

	scaling_config {
		desired_size = var.scaling_config.desired_size
		max_size = var.scaling_config.max_size
		min_size = var.scaling_config.min_size
	}

	launch_template {
		id = aws_launch_template.lt.id
		version = aws_launch_template.lt.latest_version
	}

	dynamic "taint" {
		for_each = var.taints
		content {
			key = taint.value["key"]
			value = taint.value["value"]
			effect = taint.value["effect"]
		}
	}

	lifecycle {
		ignore_changes = [scaling_config[0].desired_size]
	}

	depends_on = [
		aws_launch_template.lt,
	]
}
