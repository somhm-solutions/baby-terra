# Common Terraform workflow
project_name=$1
plan_name=$2


# Create and Initialize Tf proj
mkdir $project_name && cd $project_name;
git init $project_name;
terraform init;

# Setup Common Project Schema
mkdir base plans prod stag dev;
touch README.md base/base.tf;


