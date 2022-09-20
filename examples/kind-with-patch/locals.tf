locals {
  kind = {
    cluster_name = var.kind_cluster_name
  }

  patches = [
    {
      patch = templatefile("./patches/argocd-cm.yaml.tftpl", {
        url : "https://patched.example.com"
      })
    },
    {
      target = [
        {
          kind = "Deployment"
          name = "argocd-server"
        }
      ]
      patch = <<-EOF
        - op: replace
          path: /spec/replicas
          value: 2
      EOF
    }
  ]
}

# argocd-apps
local {
  argocd_applications_vars = {
    repo_url        = var.argocd_apps_repo
    target_revision = var.argocd_apps_target_revision
    path            = "examples/kind-with-patch/argocd/guestbook"
  }
  argocd_applications = [
    templatefile("${path.module}/argocd/apps/applications.yaml.tftpl", local.argocd_applications_vars)
  ]
}
