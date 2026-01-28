# Variables: Global
global = {
  locations = {
    default   = "newzealandnorth" # Primary region to use for resource creation. 
    secondary = "australiaeast"   # Secondary region to use for resource creation. 
  }
  naming = {
    org_code     = "tjs"      # Short code of the organisation, can be used with resource naming. 
    project_name = "platform" # Name of the project or workload: platform, mywebapp. 
    environment  = "plz"      # Workload environment: dev, tst, prd, alz. 
  }
  tags = {
    Organisation = "TJS"                 # Name or abbreviation used to identify the organisation. 
    Owner        = "PlatformTeam"        # Name of the team that owns the project. 
    Environment  = "plz"                 # Workload environment: dev, tst, prd, alz, plz. 
    Project      = "PlatformLandingZone" # Project name, used to group and identify related resources. 
    CreatedBy    = "IaC-Terraform"       # Name of the user or service that created the resources. 
  }
  repo_config = {
    org    = "tim-shand"         # Name of the repository organisation owner. 
    repo   = "azure-platform-lz" # Repository where this project is stored. 
    branch = "main"              # Name of the default repository branch. 
  }
  shared_services_reference = {
    iac_service_principal_deploy = "iac-serviceprincipal-deploy"       # Name of the Key Vault secret containing the workflow Service Principal name.
    gov_managed_identity_deploy  = "gov-managedidentity-policy-deploy" # Name of the Key Vault secret containing the Managed Identity name. 
    gov_log_analytics_workspace  = "gov-policy-law"                    # Name of the Key Vault secret containing the central Log Analytics Workspace. 
    con_hub_vnet                 = "con-hub-vnet"                      # Name of the Key Vault secret containing the hub VNet in the connectivity stack. 
  }
}
