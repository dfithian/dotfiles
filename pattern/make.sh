#!/usr/bin/env bash

cd "$(dirname "$0")"

for file in gitconfig vimrc zshrc; do
    rm -f ~/.$file
    ln -s "$(pwd)/$file" ~/.$file
done
