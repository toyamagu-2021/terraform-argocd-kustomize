variable "ha_enabled" {
  description = "ArgoCD is HA mode"
  type        = bool
  default     = false
}

variable "namespace_enabled" {
  description = "ArgoCD is namespace-install"
  type        = bool
  default     = false
}

variable "argocd_version" {
  description = "Argocd version. e.g.) v1.0.0"
  type        = string
  default     = "master"
}

variable "argocd_url" {
  description = "Argocd url"
  type        = string
  default     = "https://raw.githubusercontent.com/argoproj/argo-cd"
}

variable "argocd_path" {
  description = "ArgoCD manifest path for non-HA mode"
  type        = string
  default     = "manifests"
}

variable "argocd_path_ha" {
  description = "ArgoCD manifest path for HA mode"
  type        = string
  default     = "manifests/ha"
}

variable "argocd_manifest_cluster_install" {
  description = "ArgoCD manifest name for the cluster-install mode."
  type        = string
  default     = "install.yaml"
}

variable "argocd_manifest_namespace_install" {
  description = "ArgoCD manifest name for the namespace-install mode."
  type        = string
  default     = "namespace-install.yaml"
}

variable "argocd_namespace" {
  description = "ArgoCD namespace"
  type        = string
  default     = "argocd"
}

variable "create_namespace" {
  description = "Create namespace"
  type        = bool
  default     = true
}


variable "patches" {
  description = "kustomize patches"
  type = list(object({
    patch = optional(string)
    path  = optional(string)
    target = optional(list(object({
      group               = optional(string)
      version             = optional(string)
      kind                = optional(string)
      name                = optional(string)
      namespace           = optional(string)
      label_selector      = optional(string)
      annotation_selector = optional(string)
      }))
    )
    options = optional(list(object({
      allow_kind_change = optional(bool)
      allow_name_change = optional(bool)
      }))
    )
  }))
  default = []
}

variable "argocd_apps_name" {
  description = "ArgoCD apps name"
  type        = string
  default     = "argocd-apps"
}

variable "argocd_helm_repo" {
  description = "ArgoCD helm repository URL"
  type        = string
  default     = "https://argoproj.github.io/argo-helm"
}

variable "argocd_apps_helm_chart" {
  description = "ArgoCD helm chart name"
  type        = string
  default     = "argocd-apps"
}

variable "argocd_applications" {
  description = "ArgoCD applications"
  type        = list(string)
  default     = []
}

variable "argocd_projects" {
  description = "ArgoCD projects"
  type        = list(string)
  default     = []
}

variable "argocd_apps_helm_version" {
  description = "ArgoCD apps helm version"
  type        = string
  default     = "0.0.1"
}
