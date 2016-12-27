#!/usr/bin/env bash

#Fucntion to source from the user home directory
user_source() {
	source /home/$(whoami)/$1
}

# Load Our bash libraries
user_source .bash_libs/index.sh

# Load NVM
export NVM_DIR="/home/$(whoami)/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


# Load our aliases
user_source .bash_aliases
