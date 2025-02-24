Azure Virtual Machine creation using Terraform.
Explanation
This code is parameterized and we are using different modules for every Azure Resource. This allows us to manage our code along with enabling the reusability. This repositiry contains two subfolders :

terraform-modules
This directory contains all the modules.
Any variable conditional needs to be checked in the variable.tf file under respective module
terraform-resources
This folder has these files :
main.tf -> This file contains all the resources that we are going to deploy.
variables.tf -> Variables are defined in this file.
terraform.tfvars -> Tfvars file is automatically loaded without any additional option. This is the file where you need to update your resource values\names.
Usage :
Things to keep in mind are :

We are using Azure BLOB as backend configuration, so you need to ensure the storage account and container mentioned in the backend configuration exists.
Since we are using data block to fetch key vault secrets, where we store all our sensitive information. The key vault and the secrets should already exist.
To run this example, simply follow to steps below:

Navigate to terraform-resources folder, if the terminal is opened in Linux Virtual Machine Deployment directory, use :
  cd terraform-resources
  terraform init
  terraform plan
  terraform apply

Explanation :
Terraform init -> It initializes the directory and downloads required provider along with configuring the module.
Terraform plan -> This helps you verify the code is going to deploy the resources as expected. This also ensures we don't face any unwanted surprise. This isn't mandatory, but a recommended step.
Terraform apply -> This step applies the resources specified in this code. This will ask you to approve this later. We can skip manual approval by using --auto-approve parameter.
Best Practices & Recommendations
Use Terraform workspaces for easier management of the deployments. This can also help us manage Dev, UAT and Production deployments instead of creating multiple state files\directories.
If you are creating new resources\variables. Ensure naming convention is easily relatable, since we have a lot of variables in this code.
Use conditionals to avoid unwanted surprises.
