# Azure: Platform Landing Zone

_Automated, IaC-driven Azure platform landing zone, implementing governance, automation, and targeting operational best practices._

This repository contains my production Azure tenant, providing an enterprise-style environment for hands-on skill development. 
The project includes a platform landing zone, providing centralised shared services for workloads deployed within the tenant. 

Designed to be cost efficient, utilising free or low-cost options where possible, while maintaining a minimalistic footprint. 

---

## 🚀 Platform Landing Zone

Light-weight platform landing zone designed for personal use or by small organizations. Utilises IaC to deploy and manage shared resources, connectivity, governance, policy-as-code, monitoring and observability - aiming to align with CAF guidelines and best practice principals where possible.

- **[Bootstrapping (Powershell + Terraform)](./utilities/bootstrap-azure-github)** 
  - Provides the initial setup process to bootstrap Azure and GitHub for automation and IaC. 
  - Using templated Terraform configuration and triggering post-deployment state migration to new resources in Azure. 
  - Creates Entra ID Service Principal, secured with Federated Credentials (OIDC), adding the details as secrets into GitHub repository. 
- **Management**
  - Centralized Log Analytics workspace for monitoring, with diagnostic settings applied via policy. 
  - Microsoft Defender for Cloud (Foundational CSPM) providing security posture information and recommendations. 
- **Governance**
  - Management groups for policy hierarchy and subscription management. 
  - RBAC and policy assignments providing guard rails to secure the environment. 
- **Connectivity**
  - Hub-Spoke architecture, providing centralised network management and control. 
  - Workload VNets peered as spokes, isolating and securing environments. 
- **Identity**
  - Create groups within Entra ID for RBAC assignment. 
  - Automate the creation and management of groups, users, and PIM role assignments. 

---

## ▶️ Deployment Process & Stacks

1. **Bootstrap:** Execute [bootstrap script](./utilities/bootstrap-azure-github) to begin interactive deployment process. 
2. **Management:** Create monitoring/observability resources, referenced by policies in Governance stack. 
3. **Governance:** Deploy Management Group structure and assign policies at management group levels. 
4. **Connectivity:** Deploy networking resources using a hub-spoke architecture for centralised control. 
5. **Identity:** Deploy core Entra ID groups, RBAC assignments, and managed identities. 

---

## 🛠️ Tooling & Automation

- **Terraform:** Cloud-agnostic Infra-as-Code tool for deploying and managing resources in Azure and GitHub. 
- **Powershell:** Environment configuration, bootstrapping process, and misc utility scripts. 
- **GitHub Actions:** Providing CI/CD workflows for automating deployment of stacks. 

---

## 📝 To Do / Future Improvements

- [ ] Platform Landing Zone: Governance
- [ ] Platform Landing Zone: Management
- [ ] Platform Landing Zone: Connectivity
- [ ] Subscription Vending
