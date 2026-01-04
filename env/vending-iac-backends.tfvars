#=================================================================#
# Vending: IaC Backends
#=================================================================#

# Object of projects that require separate IaC backend.
# Add projects to the existing object and run the workflow to deploy. 
projects = {
  "plz-governance" = {
    create_github_env = true # Enable creation of GitHub repository environment.
  }
  "plz-management" = {
    create_github_env = true
  }
  "plz-connectivity" = {
    create_github_env = true
  }
  "plz-identity" = {
    create_github_env = true
  }
}
