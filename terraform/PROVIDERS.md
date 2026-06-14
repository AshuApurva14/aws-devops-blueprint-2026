## Terraform providers configuration and uses
---

**What is Providers in terraform?**

- Providers are binary plugins used by terraform to manage your resources by calling your cloud provider's API.
- Terraform providers are distributed and versioned separately from terraform.
- Terraform providers can support any infrastructure vendor with an API, by decoupling providers from terraform binary.
- Terraform provides you to define `required_providers` block which lets you set version constraint on the providers your configuration uses.
- Below are the configs you can set inside `required_providers` block.

   - `source` and `version` arguments.

   


