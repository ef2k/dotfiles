# dotfiles

## Install

```sh
make install
```

## Dependencies

- [oh-my-zsh](https://ohmyz.sh) — handled by `make install`
- [vim-plug](https://github.com/junegunn/vim-plug) — install manually:

```sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Brew

All dependencies are managed via `Brewfile`. To install:

```sh
brew bundle
```

