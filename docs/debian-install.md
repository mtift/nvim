# Install on Debian/Ubuntu

*[← Back](./../README.md)*

## Download a Nerd Font (any one will do)
```
wget -P ~/.local/share/fonts wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
cd ~/.local/share/fonts
unzip JetBrainsMono.zip
rm JetBrainsMono.zip
fc-cache -fv
```

## Install LazyVim dependencies
```
sudo apt install -y fzf
sudo apt install -y ripgrep
sudo apt install -y fd-find
sudo apt install -y lazygit
```

## Install Neovim
```
sudo apt install -y neovim
```

## Clone the repo
```
rmdir ~/.config/nvim
cd ~/.config
git clone git@github.com:mtift/nvim.git
```

## Open up port 9003
```
sudo ufw allow 9003
```

## Add a launch.json to the .vscode directory

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
