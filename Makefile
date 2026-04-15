DOTFILES := $(shell pwd)

.PHONY: install brew nvim zsh omz

install: brew omz nvim zsh
	ln -sf $(DOTFILES)/git/gitconfig $(HOME)/.gitconfig
	@echo "Done."

omz:
	@if [ ! -d "$(HOME)/.oh-my-zsh" ]; then \
		sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended; \
	else \
		echo "oh-my-zsh already installed, skipping."; \
	fi

zsh:
	@if ! grep -q "# dotfiles" $(HOME)/.zshrc; then \
		cat $(DOTFILES)/zsh/zshrc >> $(HOME)/.zshrc; \
		echo "Appended zsh config."; \
	else \
		echo "zsh config already present, skipping."; \
	fi

brew:
	brew bundle --file=$(DOTFILES)/Brewfile

nvim:
	mkdir -p $(HOME)/.config/nvim
	ln -sf $(DOTFILES)/nvim/init.lua $(HOME)/.config/nvim/init.lua
