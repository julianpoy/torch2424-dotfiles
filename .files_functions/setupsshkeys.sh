#/bin/bash

# https://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/

setupSshKeys() {

  if [ "$#" -lt 2 ] || [ "$#" -gt 2 ]; then
    echo "setupSshKeys USAGE:"
    echo "setupSshKeys [username] [url]"
  else

    echo "Will have to login for $1@$2 multiple times :)"

    echo "Generating passwordless keys..."
    ssh-keygen -f id_rsa -t rsa -N ''

    echo "Creating .ssh directory if none"
    ssh $1@$2 mkdir -p .ssh

    echo "Appending ssh key to authorized keys..."
    cat .ssh/id_rsa.pub | ssh $1@$2 'cat >> .ssh/authorized_keys'

    echo "Setting .ssh permissions..."
    ssh $1@$2 "chmod 700 .ssh; chmod 640 .ssh/authorized_keys"

    echo "Done!"
    echo "Please try to SSh now:"
    echo "$1@$2"
  fi
}

alias setupsshkeys='setupSshKeys'
alias setup-ssh-keys='setupsshkeys'