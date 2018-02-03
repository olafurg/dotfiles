#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
dir=~/dotfiles
olddir=~/dotfiles_old

# List of files/dirs to symlink in home dir (without leading dot)
files="zshrc rubocop.yml vim/vimrc bashrc bash gitconfig gemrc rspec config/terminator/config"

########## Setup

# Create dotfiles_old in home dir
printf "Creating $olddir for backup of any existing dotfiles in ~ ... "
mkdir -p $olddir
printf "done\n"

# Change to the dotfiles directory
printf "Change to the dotfiles directory ... "
cd $dir
printf "done\n"

# Create directories
printf "Creating directories ... "
mkdir -p ~/.config/terminator
mkdir -p ~/.vim
printf "done\n"

# Move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
  mv ~/.$file $olddir
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done
echo "done"

install_zsh () {
# Test to see if zshell is installed.  If it is:
	if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
# Clone the official oh-my-zsh repository from GitHub only if it isn't already present
		if [[ ! -d $dir/oh-my-zsh/ ]]; then
			git clone https://github.com/robbyrussell/oh-my-zsh.git
				fi
# Set the default shell to zsh if it isn't currently set to zsh
				if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
					chsh -s $(which zsh)
						fi
				else
# If zsh isn't installed, get the platform of the current machine
					platform=$(uname);
# If the platform is Linux, try an apt-get to install zsh and then recurse
	if [[ $platform == 'Linux' ]]; then
		sudo apt-get install zsh
			install_zsh
# If the platform is OS X, tell the user to install zsh :)
			elif [[ $platform == 'Darwin' ]]; then
			echo "Please install zsh, then re-run this script!"
			exit
			fi
			fi
}

install_zsh
