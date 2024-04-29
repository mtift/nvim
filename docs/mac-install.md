# Install on a Mac

*[← Back](./../README.md)*

## Install a Nerd Font
```
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

## Install Neovim and dependencies
```
brew install neovim
brew install ripgrep
brew install fd
xcode-select --install
brew install php
pecl install xdebug
```

## Install alacritty (optional)
```
brew install --cask alacritty
sudo spctl --master-disable
# [launch alacritty]
sudo spctl --master-enable
mkdir ~/.config/alacritty/
touch ~/.config/alacritty/alacritty.toml
```

## Clone the repo
```
rmdir ~/.config/nvim
cd ~/.config
git clone git@github.com:mtift/nvim.git
```
