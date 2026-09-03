#!/usr/bin/env bash

cd "$(dirname "$0")"

for file in gitconfig vimrc zprofile zshrc psqlrc pgenv tmux.conf; do
    rm -f ~/.$file
    ln -s "$(pwd)/$file" ~/.$file
done

for file in tmux-dev; do
    rm -f ~/.local/bin/$file
    ln -s "$(pwd)/$file" ~/.local/bin/$file
done

rm -f ~/.claude/settings.json
ln -s "$(pwd)/claude/settings.json" ~/.claude/settings.json
