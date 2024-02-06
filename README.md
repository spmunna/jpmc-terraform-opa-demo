# Policy and Compliance as Code (PaCaC)

This repository demonstrates best practices for secure Infrastructure as Code (IaC) using Terraform, and Open Policy Agent (OPA). It features an example setup to create an AWS EC2 instance and an RDS database, along with a GitHub Actions workflow for automated validation and cost estimation.

## Overview

The example Terraform code provisions an AWS EC2 instance and an RDS database. The repository also includes a Rego policy that enforces specific constraints:

1/ Allow changes to infrastructure only if blast radius” are within reasonable bounds
2/ Ensure presence of pre-defined mandatory tags and labels on all deployable resources
3/ Dont allow public ingress in a security group attached to resources like EC2
4/ Dont allow "http" protocol and/or certain ports to be opened for the connectivity for specific servers/apps
5/ Prevent the destruction of RDS instances
6/ Ensure that the monthly cost for the EC2 instance is under $X
7/ Ensure that the monthly cost for the RDS instance is under $Y
8/ Prohibit creation of storage resources unless they are encrypted
9/ Dont allow deployment to happen on Fridays

The GitHub Actions workflow runs on pull requests, validating the Terraform code, generating Infracost JSON output, and evaluating the Rego policy against the generated output. If any constraints are violated, the workflow will fail, preventing the pull request from being merged.

## Prerequisites

- Terraform v1.x
- Open Policy Agent (OPA)
