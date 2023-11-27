#!/usr/bin/env bash
# This script is used to do bare-minimum setup on an Arch system so that we
# may run the actual setup script which is written for fish (friendly 
# interactive shell).
#
# This script is run as root, since no other user account is on the system
# after the arch install completes. After this has run, we need to log in to 
# the new user account

#TODO
# - Create normal user account
# - update system
# - install fish
#

# function to do basic setup for the next phase using the fish script. This 
# function takes a single argument: the username for the new account to be made
function setup_new_system() {
    USER=$1

    echo "Updating system"
    sudo pacman -Syyu
    # install sudo and fish
    pacman -S --needed sudo fish

    echo "Creating user $USER..."
    # create user account
    useradd -m $USER
    
    echo "Please enter a password for the user."
    # create password for user
    passwd $USER
    
    echo "Adding new user to group: wheel"
    # add user to the wheel group
    usermod -aG wheel $USER
    
    echo "Enabling sudo for group: wheel"
    # enable sudo for wheel group without password
    echo "%wheel ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
   
    
}

setup_new_system "testUser"
echo "Done!"
echo ""
echo "You may now login as the new user and continue setup."

