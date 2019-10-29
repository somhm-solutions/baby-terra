# Common Terraform Show Commands

# Show Resources
terraform show;

# Show Graph
# Outputs dependency graph in DOT graph format.
# Output can be piped to a file for graph visualization
terraform graph > base.dot;
cat base.dot;



