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
             .vim/UltiSnips
            "
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
       .vim/UltiSnips
       "

########## Install zsh and oh-my-zsh (another script)
./install_zsh.sh

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

echo "Creating directories as needed"
for directory in $directories; do
  echo "Creating directory structure $directory"
  mkdir --parents $directory
done

echo "Creating files as needed"
for file in $files; do
  echo "Moving any existing dotfiles from ~ to $olddir"
  mv ~/$file $olddir
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/$file
done
echo "done"
