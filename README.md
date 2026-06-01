# M365 Exchange Online Administration Lab
### ProctorCloud Tenant · Built May 2026

This repository documents hands-on Exchange Online and email security administration labs completed in a Microsoft 365 E5 developer tenant. Labs were built to develop practical skills in Exchange Online management, mail flow, email authentication, and PowerShell automation — aligned to real-world Sr. Cloud Engineer responsibilities in enterprise M365 environments.

---

## What Was Built

| Lab | Topic | Key Skills |
|-----|-------|------------|
| [Lab 01](./lab-01-exchange-online/) | Exchange Online Administration | Shared mailboxes, distribution groups, dynamic distribution groups, transport rules — GUI and PowerShell |
| [Lab 02](./lab-02-email-auth/) | Email Authentication (SPF / DKIM / DMARC) | DKIM signing enabled, SPF record analysis, DMARC architecture and deployment strategy |
| [Lab 03](./lab-03-teams-governance/) | Teams Governance & Policy Administration | Meeting policies, messaging policies, app permission policies — GUI and PowerShell |
| [Lab 04](./lab-04-purview-compliance/) | Purview Compliance — eDiscovery & Retention | Retention policies, retention labels, content search, eDiscovery holds |
---

## Environment

- **Tenant:** ProctorCloud.onmicrosoft.com (Microsoft 365 E5 Developer Tenant)
- **Admin Portals Used:** Exchange Admin Center, Microsoft Defender (security.microsoft.com)
- **PowerShell Modules:** ExchangeOnlineManagement (`Connect-ExchangeOnline`)
- - **External Validation:** MXToolbox SPF/DMARC lookup

---

## Approach

Every task was completed twice: once through the GUI to understand the interface an admin uses daily, and once via PowerShell to demonstrate automation capability. This mirrors real-world practice where GUI is used for investigation and PowerShell is used for bulk operations, scripting, and repeatability.

---

## Related Projects

- [AZ-104 Enterprise Azure Lab](https://github.com/mdproctor0/az104-labs) — Governance, networking, storage, monitoring across Azure
- [Secure Azure Foundation (Terraform IaC)](https://github.com/mdproctor0/secure-azure-foundation-terraform/tree/main) — Zero-trust network segmentation, Sentinel, Log Analytics
- [Vulnerability Management Simulation](https://github.com/mdproctor0/Vulnerability-Management-Simulation) — Enterprise VM lifecycle, PowerShell remediation, 81% reduction

---

*Tenant: ProctorCloud.onmicrosoft.com · Author: Marquell Proctor · [LinkedIn](https://linkedin.com/in/marquell-proctor-cyber) · [GitHub](https://github.com/mdproctor0)*
