# Terraform Install Ubuntu

sudo apt-get update;
sudo apt-get install unzip;
cd /tmp 
sudo  wget https://releases.hashicorp.com/terraform/0.12.12/terraform_0.12.12_linux_amd64.zip;

sudo unzip terraform_0.12.12_linux_amd64.zip;

sudo mv terraform /usr/local/bin

sudo chown -R root:root /usr/local/bin/terraform 

