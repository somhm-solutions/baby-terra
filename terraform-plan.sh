# Terraform Plans
plan_name=$1;

terraform plan -out $plan_name-'date +'%s''.plan;

