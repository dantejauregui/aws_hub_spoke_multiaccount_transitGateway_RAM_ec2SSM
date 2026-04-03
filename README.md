# Hub-and-Spoke multi-account network with centralized egress and hybrid connectivity

## Target architecture

```
DEV VPC (Spoke - AWS Account "A")
   ↓
TGW Attachment
   ↓
Transit Gateway (HUB AWS account)
   ↓
Egress VPC (HUB AWS account)
   ↓
NAT Gateway
   ↓
Internet Gateway
   ↓
Internet
```


## Pre-requisite: 
HUB account:
- TransitGateway is created using Terraform in Hub account.
- Then, TGW has to be Shared via AWS RAM (Resource Access Manager) with Spoke account.

Once Spoke resources are deployed, Hub account must accept the vpc_attachment:

```
resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "dev" {
  transit_gateway_attachment_id = <ATTACHMENT_ID_FROM_DEV>
}
```