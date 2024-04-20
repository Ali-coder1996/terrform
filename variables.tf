/************************** Variables Declaration **************************/
variable "tagEnvironment" {}

variable "environment" {} /* dev|stg|uat|prod small letters */

variable "awsProfileName" {}
variable "awsRegion" {}

variable "eksInfraMgmtDesiredNodes" {}
variable "eksInfraMgmtMinNodes" {}
variable "eksInfraMgmtMaxNodes" {}
variable "eksInfraMgmtNodeDiskSize" {}
variable "eksInfraMgmtInstanceType" {type = list}
variable "eksInfraMgmtNodesLabel" {}
variable "eksSubnets" {type = list}