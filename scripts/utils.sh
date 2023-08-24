# !/bin/bash

function envvars {
echo 'Setting up temporary environment variables'
export pm="dnf"
export iy="sudo ${pm} install -y"
export addRepo="sudo ${pm} config-manager --add-repo"
}


function yesno {
read -p "Do you wish to continue?[y/n] " -n 1 yn
case $yn in
y|Y ) echo -e "\nProceeding"; break;;
n|N ) echo -e "\nExiting"; exit;;
* ) echo -e "\nInvalid response"; exit;;
esac
}


function check_sudo {
if [ $EUID -ne 0 ]
        then
                echo "This program must run as root to function." 
                exit 1
fi
}
