DOTFILES := $(shell pwd)

.PHONY: install brew nvim

install: brew nvim
	ln -sf $(DOTFILES)/bash_profile $(HOME)/.bash_profile
	ln -sf $(DOTFILES)/gitconfig $(HOME)/.gitconfig
	@echo "Done."

brew:
	brew bundle --file=$(DOTFILES)/Brewfile

nvim:
	mkdir -p $(HOME)/.config/nvim
	ln -sf $(DOTFILES)/init.vim $(HOME)/.config/nvim/init.vim
	ln -sf $(DOTFILES)/plugins.vim $(HOME)/.config/nvim/plugins.vim
