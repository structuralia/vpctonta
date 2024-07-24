variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
}

# ----------------------------------------------------
# Environment
# ----------------------------------------------------
variable "env" {
    description = "Environment"
    type    = string
    default = "javierh"
}

# ----------------------------------------------------
# Nombre del Poyecto
# ----------------------------------------------------
variable "project_name" {
    description = "Npmbre del proyecto"
    type    = string
    default = "pharos-javierh"
}




