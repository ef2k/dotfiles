#!/usr/bin/env bash
ln -s $HOME/dotfiles/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
ln -s $HOME/dotfiles/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
./extensions.sh
