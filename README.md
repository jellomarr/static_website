# Project Title

An example of a static website setup on AWS using Terraform, S3 and HTML.

## Description

This project is an example of a static website on AWS, using Terraform and S3. I have added all the required resources in main.tf, which included all the required S3 resources needed to display a static website, which is defined in "src/index.html". 

## Getting Started

### Dependencies

* Terraform CLI
* AWS CLI 

### Setting up Terraform CLI and AWS CLI.

Before attempting to deploy resources in this repo, please ensure you have installed;

* Terraform CLI for your relevant OS (https://developer.hashicorp.com/terraform/install)
* AWS CLI. Please (https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)

As well as this, please ensure that you have setup:
* AWS CLI profiles. Please refer to https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html for an example of how you can setup an AWS CLI profile.


### Deploying resources to AWS

* How to run the program
The below steps assume that you have setup an AWS CLI profile with the name "default"


* Firstly, run the below command on the root of this repo
```
terraform init
```
* Secondly, when you are ready to deploy run the below command on the root of this repo to see the planned output
```
terraform plan -var-file=prod.tfvars
```

* when you are ready to deploy run the below command on the root of this repo to deploy the resources.

```
terraform deploy -var-file=prod.tfvars
```

Once the resources have been deployed, you will encounter an output value like the example below, which is the value of the S3 endpoint, which you can use to access the static site.
```
Outputs:

s3_website_endpoint = "hans-static-website-bucket.s3-website-ap-southeast-2.amazonaws.com"
```


### Destroying resources in AWS

* When you are ready to destroy run the below command on the root of this repo to destroy the resources.

```
terraform destroy -var-file=prod.tfvars
```
