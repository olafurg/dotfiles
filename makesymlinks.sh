#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles
# in ~/dotfiles
############################

########## Variables

dir=~/dotfiles
olddir=~/dotfiles_old

# List of files/dirs to symlink in home dir.
directories=".config/terminator
             .vim/UltiSnips"
files=".zshrc
       .rubocop.yml
       .vimrc
       .bash
       .bashrc
       .gitconfig
       .gemrc
       .rspec
       .tmux.conf
       .config/terminator/config
       .vim/UltiSnips/*
       "

########## Install zsh and oh-my-zsh

install_zsh () {
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
}

install_zsh

########## Setup of dotfiles

# Create dotfiles_old in home dir
printf "Creating $olddir for backup of any existing dotfiles in ~ ... "
mkdir -p $olddir
printf "done\n"

# Change to the dotfiles directory
printf "Change to the dotfiles directory ... "
cd $dir
printf "done\n"

# Move any existing dotfiles in homedir to dotfiles_old directory, then create
# symlinks from the homedir to any files in the ~/dotfiles directory specified
# in $files

echo "Creating directories if needed"
for directory in $directories; do
  echo "Creating directory structure $directory"
  mkdir --parents $directory
done

for file in $files; do
  echo "Moving any existing dotfiles from ~ to $olddir"
  mv ~/$file $olddir
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/$file
done
echo "done"
