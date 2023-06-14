aws ec2 describe-instances --region eu-central-1

# Save graph
    terraform graph -type=plan | dot -Tpng > graph.png

# Compliance
https://github.com/aquasecurity/tfsec
https://aquasecurity.github.io/tfsec/v1.28.1/

    tfsec .

## custom check
    tfsec . -e aws-ec2-enforce-http-token-imds
    tfsec --config-file tfsec.yaml

## save report
    tfsec --format json > result.json
    tfsec --format markdown > result.md

# Docs
https://terraform-docs.io/

see tfdoc.sh for installation

    terraform-docs markdown table .

## save output to file
    terraform-docs markdown table . --output-file DOC.md