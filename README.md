# Learning Devops: AWS, Terraform, Ansible, Jenkins, And Docker
 
> Getting started with the Terraform for provision a base free-tier AWS resources. 

This is a [Terraform](https://www.terraform.io/) project for managing AWS resources. 

It can build the following infrastructure:

* [VPC](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html)
* Jenkins/Web [Subnet](https://docs.aws.amazon.com/vpc/latest/userguide/working-with-vpcs.html#AddaSubnet) in the `VPC`
* [IGW](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Internet_Gateway.html) to enable access to or from the Internet for `VPC`
* [Route Table](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Route_Tables.html) to associate `IGW`, `VPC` and `Subnet`
* Jenkins/Web [EC2 Instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html) in the public `Subnet` with the HTTP & SSH access
