# Azure Platform: Personal Tenant

Welcome to my personal homelab! :wave:  

This project provides an environment for self-hosting and experimenting with different technologies.  
A base for hands-on learning, developing knowledge and improving skills in DevOps and Cloud platforms.  
Bootstrapped, deployed, and managed using Infra-as-Code and CI/CD workflows.  

As a big fan of small tech (think micro-pcs, Raspberry Pi etc), a primary requirement is maintaining a small footprint for my on-prem environment. I aim to re-use as much existing hardware as possible, recycling second hand gear and giving it a new life in my lab. 

![Photo of my current homelab setup.](docs/images/homelab.jpg)

---

## :cloud: Cloud Services

### Azure

- **Automated bootstrapping using Powershell + Terraform** 
  - Generates required Terraform files, kicks off the bootstrapping deployment, and triggers post-deployment state migration to Azure. 
  - Creates Entra ID Service Principal, secured with Federated Credentials (OIDC), adding the SP details as secrets to the specified GitHub repository. 
- **Platform Landing Zone** 
  - Minimalistic, light-weight platform landing zone for connectivity, governance, monitoring and shared resources. 
  - Hub/Spoke network topology, with hub VNet providing centralized connectivity for workload (spoke) VNet peering. 
- **IaC Backend Vending** 
  - Utilizes a dedicated IaC subscription to contain remote Terraform states, with per-project Azure Blob Containers and GitHUb ACtions environments for remote state management. 
  - Project backends are deployed using the `IaC Backend Vending` module to create Azure and GitHub resources. 

### Cloudflare

- Domain registrar and DNS provider for personal domains. 
- DNS zones updated using Terraform resources + API token stored in a repository secret. 

### GitHub + Actions

- Contains the overall project, and provides a centralized code repository. 
- GitHub Actions providing CI/CD by automating deployments using workflows. 
- Utilizing both top-level repository and environment variables/secrets for workload specific deployments. 

---

## :hammer_and_wrench: Deployment Tool Set

- **[Terraform](https://www.terraform.io/)**
  - Provider agnostic IaC tool, free to use, plenty of discussion, guides and support available. 
  - Deploy and manage on-prem and cloud resources using dedicated providers. 
  - Other considerations: Pulumi, OpenTofu. 
- **Bash/Powershell**
  - Bootstrapping and misc utility scripts. 

---

## :jigsaw: Workloads

- **Personal Website (www.tshand.com) \[Azure\]**
  - Static website built with Hugo, deployed to Azure Static Web Apps using Terraform and GitHub workflows. 
  - Infra deployed from home lab repo, website source code located in separate GitHub repository. 
  - Workflow uses Azure SWA deployment token held as repo secret to trigger build on commit/PR. 

---

## :memo: To Do

- [ ] Platform Landing Zone: Governance
- [ ] Platform Landing Zone: Observability
- [ ] Platform Landing Zone: Connectivity
- [ ] Platform Landing Zone: Security
- [ ] Subscription Vending
