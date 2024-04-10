#!/bin/bash

echo "Setting up git config..."
read -p "Enter your name: " name
read -p "Enter your email address: " email

echo "Setting up --global configs"
git config --global user.name "$name"
git config --global user.email "$email"
git config --global init.defaultBranch main
git config --global alias.stash 'stash --all'
git config --global branch.sort -committerdate
git config --global help.autocorrect 05
git config --global commit.verbose true
git config --global --list

# Check if ssh-keygen command is installed
if ! [ -x "$(command -v ssh-keygen)" ]; then
  echo "Error: ssh-keygen command not found."
  exit 1
fi

# Generate a new SSH key
ssh-keygen -t ed25519 -C "$email"

# Add the SSH key to the ssh-agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Output the public key for the user to copy and paste to their Git account
echo "Here is your public key:"
cat ~/.ssh/id_ed25519.pub

read -p "Have you pasted the key to github account? (y/n) " answer
if [[ "$answer" == [yY] ]]; then
    echo "Continuing..."
    ssh -T git@github.com
    ssh -T git@github.com
elif [[ "$answer" == [nN] ]]; then
    echo "Exiting..."
else
    echo "Invalid input. Exiting..."
fi

echo "Press any key to continue..."
read -n 1 -s -r -p ""
