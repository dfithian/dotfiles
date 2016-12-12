#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
bindir=~/bin
dotfiles="ghci gitconfig gitignore spacemacs vimrc zprofile zshrc"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $dotfiles; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir/$file
    echo "Creating symlink to $file in home directory"
    ln -s $dir/$file ~/.$file
done
