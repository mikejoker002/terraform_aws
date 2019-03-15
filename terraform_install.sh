#!/bin/bash
#check the user ####

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

#######package details######
terra_pkg="wget unzip"
terra="terraform"

#######installing the terraform dependency package######
for pkg in $terra_pkg ; do
        which $pkg > /dev/null 2>&1
        if [ "$?" == 0 ]
          then
                echo "$pkg is already installed. "
        else
                echo "$pkg is not installed and installing package $pkg"
                apt install $pkg -y
        fi
done

######### Installing the terraform pacakge ################
for pkg in $terra; do
        which $pkg > /dev/null 2>&1
          if [ $? == 0 ]
            then
                version=`terraform -version | grep Terraform |awk '{print $2}'`
                echo "$pkg already installed installed : $version"
          else
                echo " installing terraform pkg "
                 cd /tmp
                 wget https://releases.hashicorp.com/terraform/0.11.13/terraform_0.11.13_linux_amd64.zip > /dev/null 2>&1
                 unzip terraform_0.11.13_linux_amd64.zip -d /usr/local/bin/ > /dev/null 2>&1
                 version=`terraform -version | grep Terraform |awk '{print $2}'`
                echo " Terraform installed : $version "
                 rm -rf /tmp/terraform_0.11.13_linux_amd64.zip
        fi

done
