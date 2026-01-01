# Utilities

_List of tools and utilities used within this project._

## [Terraform Docs](https://terraform-docs.io/)

Used to produce Terraform module information, such as required providers, inputs and outputs. 

```shell
cd modules/my-tf-module
terraform-docs markdown table --output-file ./README.md --output-mode inject .
```

