variable "template_name" {
	type = string
	description = "launch template name"
}

variable "image_id" {
	type = string
	description = "ami id"
}

variable "sg_ids" {
	type = list(string)
	default = []
	description = "security group id list"
}

variable "user_data" {
	type = string
	description = "user data script"
}

variable "bd_config" {
	type = object({
		device_name = string
		volume_type = string
		volume_size = number
	})
	description = "block device config (ebs only)"
	default = {
		device_name = "/dev/sda1"
		volume_type = "gp2"
		volume_size = 30
	}
}

variable "cluster_name" {
	type = string
	description = "eks cluster name"
}

variable "ng_name" {
	type = string
	description = "node group name"
}

variable "node_role_arn" {
	type = string
	description = "worker node role arn"
	default = null
}

variable "subnet_ids" {
	type = list(string)
	description = "Subnet ids on which to create the worker node"
}

variable "instance_types" {
	type = list(string)
	description = "create instance types"
}

variable "capacity_type" {
	type = string
	description = "ON_DEMAND or SPOT"
	default = "ON_DEMAND"
}

variable "scaling_config" {
	type = object({
		desired_size = number
		max_size = number
		min_size = number
		change_desired_size = bool
	})
	description = "scaling config"
	default = {
		desired_size = 1
		max_size = 1
		min_size = 1
		change_desired_size = false
	}
}

variable "ec2_monitoring" {
	type = bool
	description = "enable ec2 monitoring"
	default = true
}

variable "taints" {
	type = list(object({
		key = string
		value = string
		effect = string
	}))
	description = "k8s taints"
	default = []
}
