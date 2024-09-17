variable "token-id" {
  type = string
}

variable "cloud-id" {
  type = string
}

variable "folder-id" {
  type = string
}

variable "image-id" {
  type = string
}

variable "bastion-image-id" {
  type = string
}

variable "bastion-ip-address" {
  type = string
}

variable "external-bastion-segment-CIDR" {
  type = string
}

variable "internal-bastion-segment-CIDR" {
  type = string
}

variable "internal-bastion-sg-ingress-CIDR" {
  type = string
}

variable "bastion-segment-CIDR" {
  type = string
}
