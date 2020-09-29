// ----------------------------------------------------------------------------
// Required Variables
// ----------------------------------------------------------------------------
variable "gcp_project" {
  description = "The name of the GCP project"
  type        = string
}

variable "cluster_location" {
  description = "The location (region or zone) in which the cluster master will be created. If you specify a zone (such as us-central1-a), the cluster will be a zonal cluster with a single cluster master. If you specify a region (such as us-west1), the cluster will be a regional cluster with multiple masters spread across zones in the region"
  type        = string
}

variable "cluster_name" {
  description = "Name of the Kubernetes cluster"
  type        = string
}

variable "jenkins_x_namespace" {
  description = "Kubernetes namespace to install Jenkins X in"
  type        = string
}

variable "cluster_id" {
  description = "A random generated to uniqly name cluster resources"
  type        = string
}

// ----------------------------------------------------------------------------
// Optional Variables
// ----------------------------------------------------------------------------
// storage
variable "bucket_location" {
  description = "Bucket location for storage"
  type        = string
  default     = "US"
}

variable "enable_log_storage" {
  description = "Flag to enable or disable storage of build logs in a cloud bucket"
  type        = bool
  default     = true
}

variable "enable_report_storage" {
  description = "Flag to enable or disable storage of build reports in a cloud bucket"
  type        = bool
  default     = true
}

variable "enable_repository_storage" {
  description = "Flag to enable or disable storage of artifacts in a cloud bucket"
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "Flag to determine whether storage buckets get forcefully destroyed"
  type        = bool
  default     = false
}

// cluster configuration
variable "node_machine_type" {
  description = "Node type for the Kubernetes cluster"
  type        = string
}

variable "machine_types_cpu" {
  type = map
  default = {
    "n1-standard-1"  = 1
    "n1-standard-2"  = 2
    "n1-standard-4"  = 4
    "n1-standard-8"  = 8
    "n1-standard-16" = 16
    "n1-standard-32" = 32
    "n1-standard-64" = 64
    "n1-standard-96" = 96
  }
}

variable "machine_types_memory" {
  type = map
  default = {
    "n1-standard-1"  = 3.75
    "n1-standard-2"  = 7.50
    "n1-standard-4"  = 15
    "n1-standard-8"  = 30
    "n1-standard-16" = 60
    "n1-standard-32" = 120
    "n1-standard-64" = 240
    "n1-standard-96" = 360
  }
}

variable "min_node_count" {
  description = "Minimum number of cluster nodes"
  type        = number
  default     = 3
}

variable "max_node_count" {
  description = "Maximum number of cluster nodes"
  type        = number
  default     = 5
}

variable "release_channel" {
  description = "The GKE release channel to subscribe to.  See https://cloud.google.com/kubernetes-engine/docs/concepts/release-channels"
  type        = string
  default     = "UNSPECIFIED"
}

variable "resource_labels" {
  description = "Set of labels to be applied to the cluster"
  type        = map
  default     = {}
}

variable "node_preemptible" {
  description = "Use preemptible nodes"
  type        = bool
  default     = false
}

variable "node_disk_type" {
  description = "Node disk type (pd-ssd or pd-standard)"
  type        = string
  default     = "pd-ssd"
}

variable "node_disk_size" {
  description = "Node disk size in GB"
  type        = string
  default     = "100"
}

variable "enable_kubernetes_alpha" {
  type    = bool
  default = false
}

variable "enable_legacy_abac" {
  type    = bool
  default = true
}

variable "auto_repair" {
  type    = bool
  default = false
}

variable "auto_upgrade" {
  type    = bool
  default = false
}

variable "monitoring_service" {
  description = "The monitoring service to use. Can be monitoring.googleapis.com, monitoring.googleapis.com/kubernetes (beta) and none"
  type        = string
  default     = "monitoring.googleapis.com/kubernetes"
}

variable "logging_service" {
  description = "The logging service to use. Can be logging.googleapis.com, logging.googleapis.com/kubernetes (beta) and none"
  type        = string
  default     = "logging.googleapis.com/kubernetes"
}

// service accounts
variable "create_ui_sa" {
  description = "Whether the service accounts for the UI should be created"
  type        = bool
  default     = false
}

variable "jx2" {
  description = "Is a Jenkins X 2 install"
  type        = bool
  default     = true
}

variable "content" {
  description = "Interpolated jx-requirements.yml"
  type        = string
  default     = ""
}

variable "jx_git_url" {
  description = "URL for the Jenins X cluster git repository"
  type        = string
  default     = ""
}

variable "jx_bot_username" {
  description = "Bot username used to interact with the Jenkins X cluster git repository"
  type        = string
  default     = ""
}

variable "jx_bot_token" {
  description = "Bot token used to interact with the Jenkins X cluster git repository"
  type        = string
  default     = ""
}

variable "cluster_secondary_range_name" {
  description = "The name of the secondary ip range of the subnet to use for cluster pods"
  type        = string
}

variable "services_secondary_range_name" {
  description = "The name of the secondary ip range of the subnet to use for cluster services"
  type        = string
}

variable "control_plane_cidr_block" {
  description = "The cidr range that the kubernetes control plane will be listening on"
  type        = string
}

# variable "control_plane_authorized_networks" {
#   description = "The authorized networks that can speak to a public k8s control plane"
#   type        = map(string)
#   default     = {}
# }

variable cluster_ipv4_cidr_block {
  description = "(Optional) The IP address range for the cluster pod IPs. Set to blank to have a range chosen with the default size. Set to /netmask (e.g. /14) to have a range chosen with a specific netmask. Set to a CIDR notation (e.g. 10.96.0.0/14) from the RFC-1918 private networks (e.g. 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16) to pick a specific range to use."
  type        = string
}

variable services_ipv4_cidr_block {
  description = "(Optional) The IP address range of the services IPs in this cluster. Set to blank to have a range chosen with the default size. Set to /netmask (e.g. /14) to have a range chosen with a specific netmask. Set to a CIDR notation (e.g. 10.96.0.0/14) from the RFC-1918 private networks (e.g. 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16) to pick a specific range to use."
  type        = string
}

variable network {
  description = ""
  type        = string
  default     = "default"
}

variable subnetwork {
  description = ""
  type        = string
  default     = "default"
}
