#!/usr/bin/env bash
ln -s $HOME/Projects/dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json;
ln -s $HOME/Projects/dotfiles/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json;
./extensions.sh;
