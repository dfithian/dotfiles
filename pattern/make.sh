#!/usr/bin/env bash

cd "$(dirname "$0")"

for file in gitconfig vimrc zshrc psqlrc; do
    rm -f ~/.$file
    ln -s "$(pwd)/$file" ~/.$file
done

rm -f ~/.claude/settings.json
ln -s "$(pwd)/claude/settings.json" ~/.claude/settings.json

rm -rf ~/.local/bin/ppsql
ln -s "$(pwd)/ppsql" ~/.local/bin/ppsql
