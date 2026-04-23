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
- Then, TGW has to be Shared via AWS RAM (Resource Access Manager) with Spoke account. Follow this videoguide: https://www.youtube.com/watch?v=A_51fhOJfVY 

Once Spoke resources are deployed, Hub account must accept the vpc_attachment just create by Spoke according Terraform code:

```
resource "aws_ec2_transit_gateway_vpc_attachment_accepter" "dev" {
  transit_gateway_attachment_id = <ATTACHMENT_ID_FROM_DEV>
}
```
Read: https://registry.terraform.io/providers/hashicorp/aws/3.36.0/docs/resources/ec2_transit_gateway_vpc_attachment_accepter

https://github.com/hashicorp/terraform-provider-aws/tree/main/examples/transit-gateway-cross-account-vpc-attachment