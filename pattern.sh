#install and test procedure for github actions runner on RHEL and podman

#pre-req
#========

#+ RHEL instance registered
#subscription-manager register --activationkey rhel-gha-podman --org 11009103
#subscription-manager attach --auto

#+ current updates - dnf update
#+ access (ssh) to box and root access for config, install and test
#+ runner & podman users - create or re-use?

# Ensure SELinux is enforcing
#sudo setenforce 1

# Create runner user for example
#sudo useradd -m -s /bin/bash runner
#echo 'runner ALL=(ALL) NOPASSWD:ALL' | sudo tee /etc/sudoers.d/runner

#install
#========
#needed or part of playbook?
#+ install required packages:
#- py policy?
#- ansible-core
#- podman
#- podman-docker
# Update system and install dependencies
sudo yum update -y
sudo yum install -y ansible-core

#+ create podman-docker service, start

#sudo systemctl enable --user podman.socket
#sudo systemctl start --user podman.socket
#export DOCKER_HOST="unix://$(podman info -f "{{.Host.RemoteSocket.Path}}")"

#Start the user systemd socket for a rootless service.

#systemctl --user start podman.socket

#Configure the systemd socket to be automatically started after reboots, and run as the specified user.

#systemctl --user enable podman.socket
#loginctl enable-linger runner

#Start the systemd socket for the rootful service.

#sudo systemctl start podman.socket

#Configure the socket to be automatically started after reboots.

#sudo systemctl enable podman.socket

#+ download and install validated-pattern-ansible-depencies tar
#+ edit ansible-config/variable file(s?)
#- github account, token, user names, dir, ...
#+ install ping-test workflow and app source project into user github account
#+ configure github to call runner

ansible-playbook -i localhost, deploy_github_runner.yml


#+ run install_validate script - ansible playbook
#- pre-req's
#- github & project access
#- check that config file has changed looking at hash of it)
#- look for variables in config and test  e.g. linux user names, ping githib IP, login?

#validate
#========
#+ run validate_install script , first manual?
#- change specific file in githib ping-test project to kick off workflow
#- workflow transfers job to runner
#- job pulls down ping-test project builds container and runs it