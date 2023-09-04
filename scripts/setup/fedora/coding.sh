# !/bin/bash

# C# using Monodevelop
sudo rpm --import "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
sudo curl https://download.mono-project.com/repo/centos7-vs.repo | tee /etc/yum.repos.d/mono-centos7-vs.repo
sudo dnf install monodevelop
