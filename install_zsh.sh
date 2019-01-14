#!/bin/bash
#
########## Install zsh and oh-my-zsh

# Test to see if zsh is installed.
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
  # Install oh-my-zsh acc. to their instructions.
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  # Set the default shell to zsh if it isn't currently set to zsh
  if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
    chsh -s $(which zsh)
  fi
else # If zsh isn't installed, get the platform of the current machine
  platform=$(uname -a);
  # If the platform is some Linux version, tell the user to install zsh
  if [[ ${platform,,} = *"linux"* ]]; then
    # Ubuntu (including Microsoft WSL)?
    if [[ ${platform,,} = *"ubuntu"* ]] || [[ ${platform,,} = *"microsoft"* ]]; then
      sudo apt-get install zsh
      install_zsh
      # Arch?
    elif [[ ${platform,,} = *"arch"* ]]; then
      sudo pacman -S zsh
      install_zsh
      # Other (you're on your own)
    else
      echo "Please install zsh, then re-run this script"
      exit
    fi
    # If the platform is OS X, tell the user to install zsh :)
  elif [[ $platform == 'Darwin' ]]; then
    echo "Please install zsh, then re-run this script!"
    exit
  fi
fi
