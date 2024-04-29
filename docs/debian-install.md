# Install on Debian/Ubuntu

*[← Back](./../README.md)*

## Download a Nerd Font (any one will do)
```
mkdir /tmp/NerdFont
cd /tmp/NerdFont
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip
mv *ttf ~/.local/share/fonts
fc-cache -fv
```

## Install ripgrep
```
cd /tmp
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb
```

## Install fd
```
sudo apt -y install fd-find
```

## Install latest Neovim
```
cd /tmp
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
```

## Clone the repo
```
rmdir ~/.config/nvim
cd ~/.config
git clone git@github.com:mtift/nvim.git
```

## Install alacritty (optional)
```
sudo apt -y install alacritty
mkdir ~/.config/alacritty/
```

## Install powerlevel10k (optional)
```
sudo apt install -y git fonts-font-awesome
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
```
