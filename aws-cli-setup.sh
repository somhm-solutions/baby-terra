# AWS Install and Config

# Install Debian
sudo apt install awscli;

# Add aws to Path
printf "\nexport PATH=$PATH:/usr/bin/aws" >> $BASHRC_LOCATION;
source $BASHRC_LOCATION;

# Make Configuration dir
mkdir ~/.aws

aws configure
