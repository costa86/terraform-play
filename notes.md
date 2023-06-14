aws ec2 describe-instances --region eu-central-1

# save graph
terraform graph -type=plan | dot -Tpng > graph.png

# compliance
https://github.com/aquasecurity/tfsec
tfsec .

## custom check
tfsec . -e aws-ec2-enforce-http-token-imds
tfsec --config-file tfsec.yaml

# docs
https://terraform-docs.io/
see tfdoc.sh for installation
terraform-docs markdown table .

## save output to file
terraform-docs markdown table . --output-file DOC.md