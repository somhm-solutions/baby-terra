# Module Loading and use

# First load module 
module_path=$1
terraform get $module_path;

# If module has been update
terraform get -update $module_path;