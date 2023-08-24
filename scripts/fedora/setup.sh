# !/bin/bash

#Imports
source ../utils.sh

check_sudo
envvars

echo -e 'This script installs basic system packages for fedora OS, changes the default shell to Fish and installs the following packages:-\n1)Vivaldi-browser\n2)Brave-browser\n3)VS-Code-Insiders'
yesno

echo "--------------------------------------------------------------------------------"

echo 'Installing required dependencies'
$iy dnf-plugins-core util-linux-user

echo "--------------------------------------------------------------------------------"

echo 'Adding Repositories'

echo '	1. Vivaldi-browser'
$addRepo https://repo.vivaldi.com/stable/vivaldi-fedora.repo

echo '	2. Brave-browser'
$addRepo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

echo '	3. VS-Code'
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

echo '	4. VLC Media Player'
$iy
 https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

echo "--------------------------------------------------------------------------------"

echo 'Installing packages'

pkgs=""

while read line;do
pkgs="${pkgs} $line"
done < apps.txt

$iy $pkgs

echo "--------------------------------------------------------------------------------"

echo 'Setting up 🐟 shell'
chsh -s "/usr/bin/fish"

echo "--------------------------------------------------------------------------------"

echo 'Running cleanup'
sudo rm /etc/yum.repos.d/vivaldi.repo 

