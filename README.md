Install OPA
https://www.openpolicyagent.org/docs/latest/#running-opa

Install Terraform

terraform plan --out tfplan.binary
terraform show -json tfplan.binary > tfplan.json
cat tfplan.json | jq
# opa-terraform-demo
