# Plan tf build

plans_dir='../plans/';
plan_name=$1-$(date);
current_state="CURRENT-STATE"-$(date)

# Show Resources
echo "______________________"
echo "Current Resources"
terraform show > $plans_dir$current_state;
cat $plans_dir$current_state;

# Plan Build
echo "__________________"
terraform plan -out=$plans_dir$plan_name-$(date);
cat $plans_dir$plan_name-$(date);

