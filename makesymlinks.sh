#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles
# in ~/dotfiles
############################

########## Variables

dir=~/dotfiles
olddir=~/dotfiles_old

# List of files/dirs to symlink in home dir.
directories=(
              # ".config/terminator"
              # ".vim/UltiSnips"
              ".vim/undodir"
            )
files=(
        # ".bash"
        # ".bashrc"
        # ".config/terminator"
        ".gemrc"
        ".gitconfig"
        ".gitignore"
        # ".rubocop.yml"
        ".rspec"
        ".tmux.conf"
        # ".vim/UltiSnips"
        ".vimrc"
        ".vim/undodir"
        ".zshrc"
     )

########## Install zsh and oh-my-zsh (another script)
./install_zsh.sh

########## Setup of dotfiles

function print_done () {
  printf " done\n"
}

# Create dotfiles_old in home dir
printf "Creating $olddir for backup of any existing dotfiles in ~ ... "
mkdir -p $olddir
print_done

# Change to the dotfiles directory
cd $dir
print_done

# Move any existing dotfiles in homedir to dotfiles_old directory, then create
# symlinks from the homedir to any files in the ~/dotfiles directory specified
# in $files

echo "Creating directories as needed"
for directory in "${directories[@]}"
do
  printf "* Creating directory structure $directory ..."
  mkdir -p $directory
  print_done
done

echo "Creating files and symlinks as needed"
for file in "${files[@]}"
do
  printf "* Moving file \"$file\" to $olddir ..."
  mv ~/$file $olddir
  print_done

  printf "* Creating symlink to $file in home directory ... "
  ln -s $dir/$file ~/$file
  print_done
done
echo "All done"
