
# [tfsec] Results
## Failed: 2 issue(s)
| # | ID | Severity | Title | Location | Description |
|---|----|----------|-------|----------|-------------|
| 1 | `aws-ec2-enable-at-rest-encryption` | *HIGH* | _Instance with unencrypted block device._ | `main.tf:17-29` | Root block device is not encrypted. |
| 2 | `aws-ec2-enforce-http-token-imds` | *HIGH* | _aws_instance should activate session tokens for Instance Metadata Service._ | `main.tf:17-29` | Instance does not require IMDS access to require a token |

