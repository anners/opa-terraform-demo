# opa-terraform-demo

[Install OPA](https://www.openpolicyagent.org/docs/latest/#running-opa)

[Install Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html)

For this demo you will need a Terraform state file has google_container_cluster and location. You can use the gk-cluster.tf I have included or you can create your own. 

To create the state file you will need to run:
```
#only run init if you haven't before
terraform init
terraform plan
terraform apply
```

Once you have your state file you can run :
`opa eval --input terraform.tfstate --data state.rego --format=pretty "data.tfstate.analysis.test"`
