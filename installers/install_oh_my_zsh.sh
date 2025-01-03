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
# If zsh isn't installed, get the platform of the current machine
else
  platform=$(uname -a);
  # If the platform is some Linux version, tell the user to install zsh
  if [[ ${platform,,} = *"linux"* ]]; then
    # Ubuntu (including Microsoft WSL)?
    if [[ ${platform,,} = *"ubuntu"* ]] || [[ ${platform,,} = *"microsoft"* ]]; then
      sudo apt-get install zsh
      install_zsh
      # Arch or Manjaro?
    elif [[ ${platform,,} = *"arch"* ]] || [[ ${platform,,} = *"manjaro"* ]]; then
      sudo pacman -S zsh
      install_zsh
      # Other (you're on your own)
    else
      echo "Please install zsh, then re-run this script"
      exit
    fi
  # Zsh is default in macOS now.
  elif [[ $platform == 'Darwin' ]]; then
    echo "Zsh is default in macOS, continuing."
  fi
fi
