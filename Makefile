DOTFILES := $(shell pwd)
UNAME    := $(shell uname)

.PHONY: install brew nvim zsh omz

install:
ifeq ($(UNAME), Darwin)
	$(MAKE) brew
endif
	$(MAKE) omz nvim zsh
	ln -sf $(DOTFILES)/git/gitconfig $(HOME)/.gitconfig
	@echo "Done."

brew:
	brew bundle --file=$(DOTFILES)/Brewfile

omz:
	@if [ ! -d "$(HOME)/.oh-my-zsh" ]; then \
		sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended; \
	else \
		echo "oh-my-zsh already installed, skipping."; \
	fi

nvim:
	mkdir -p $(HOME)/.config/nvim
	ln -sf $(DOTFILES)/nvim/init.lua $(HOME)/.config/nvim/init.lua

zsh:
	ln -sf $(DOTFILES)/zsh/zshrc $(HOME)/.zshrc
	@echo "Symlinked zsh config."
