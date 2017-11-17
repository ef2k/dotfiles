## Keys

- Unzip ssh keys to ~/.ssh.
- Keep all other keys in a ~/.secrets folder.

## Dependencies

- Brew
  ```sh
  # homebrew install
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ```

### Installed via brew

- Cask - `brew tap caskroom/cask`
- Neovim - `brew install neovim`
- Git - `brew install git`

#### CLI utils

- Tree - `brew install tree`
- libssl - `brew install readline xz`
- Pyenv - `brew install pyenv`
- Rbenv - `brew install rbenv ruby-build`
- Cmake - `brew install cmake`
- Ag - `brew install ag`

**Install Python 2 and 3**

```
pyenv install 2.7.11
pyenv install 3.4.4
# install neovim in 2 via pip2 install neovim
# install neovim in 3 via pip2 install neovim
pip2 install neovim
pip3 install neovim
```

**Install Ruby**

```sh
rbenv install 2.4.2
rbenv global 2.4.2
ruby -v
gem install neovim
```

### Via brew cask

- Chrome - `brew cask install google-chrome`
- Docker - `brew cask install docker`
- Cyberduck - `brew cask install cyberduck`

```sh
brew cask install docker google-chrome cyberduck
```

### Setting up Golang

- go `brew install go --cross-compile-common`
- godep `go get github.com/tools/godep`

## Security

Install these via their respective websites to be safe.

- [1Password](https://1password.com) - Installed via App Store.
- [gpgtools](https://gpgtools.org) - Generate key, encrypt/decrypt.
- [Keybase](https://keybase.io) - Download to install.

Unzip SSH keys from 1Password.

## Safari plugins

- Vimium
- Adblock Plus
