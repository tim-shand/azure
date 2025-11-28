#=================================================================#
# Vending: IaC Backends
#=================================================================#

# Object of projects that require IaC backend.
projects = {
  "azure-mgt-platformlz" = {
    create_github_env = true # Enable creation of GitHub repository environment.
  }
  "azure-wrk-wwwtshandcom-prd" = {
    create_github_env = true # Enable creation of GitHub repository environment.
  }
  "azure-wrk-wwwtshandcom-dev" = {
    create_github_env = true # Enable creation of GitHub repository environment.
  }
}
