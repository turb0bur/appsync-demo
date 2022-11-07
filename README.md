# AWS AppSync Demo

[AWS AppSync](https://docs.aws.amazon.com/appsync/index.html) 
allows creating backendless [GraphQL API](https://graphql.org/)
with multiple and different data sources (DynamoDB, RDS Aurora, HTTP endpoint, OpenSearch or/and Lambda)

This repository consists all needed AWS infrastructure created as a code via
[Terraform](https://developer.hashicorp.com/terraform/intro)

## Terraform Installation
[Installation guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

## Usage
Ubuntu example

#### Exporting AWS credentials

```shell
export AWS_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXXXXX
export AWS_SECRET_ACCESS_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

#### Terraform project and modules initialization
```shell
terraform init
```
#### Terraform resources creating/updating 
```shell
terraform apply
```

#### Destroying all created infrastructure
```shell
terraform destroy
```

## RDS Jumpbox
In this example is being used RDS Aurora serverless MySQL database (not free).
It doesn't have public access, so you can not access it via db tool like DataGrip or Workbench.
You can access it via Jumpbox server (EC2).

You need to:
- open Session Manager service, 
- click **Start Session**, 
- choose _appsync-rds-jump-box_ from the list of target instances
- in the terminal will be being opened type next commands one by one
```shell
sudo yum update
sudo pip3 install mycli
```
- after installing **mycli** run next command
```shell
mycli -h <AWS_RDS_HOST> -u <RDS_DB_USER> -P 3306
```
and prompt `AWS_RDS_PASSWORD`

All mentioned above credentials you will be shown in the terminal output after successfull creation of all AWS resources.
If some values are hidden as sensitive, please check them in `terraform.tfstate` file
in the section **outputs**

Some dummy data for MySQL you can find in `rds_tables_and_records.sql` file 

## Don't forget to destroy all resources in order to be not charged money!