#!/bin/bash

sudo apt update

# Get vim and set up vim + vim-airline
sudo apt install -y vim
cp ./vimrc ~/.vimrc
git clone https://github.com/vim-airline/vim-airline ~/.vim/

# Get tmux
sudo apt install -y tmux
cp ./tmux.conf ~/.tmux.conf

# Get docker
# https://docs.docker.com/engine/install/ubuntu/
sudo apt remove docker docker-engine docker.io containerd runc
# set up repo
sudo apt install ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# install docker engine
sudo apt update # GPG error please see webpage
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
# test installation
sudo docker run hello-world

# Set zsh as default shell for current user
sudo apt install -y zsh
sudo chsh -s $(which zsh) $(whoami)
# customise zsh
cat ./zshrc_alias >> ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
echo 'source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> ~/.zshrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k
echo 'source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

# Generate new ssh keys for github if needed
ssh-keygen -t ed25519 -C "github $(hostname)" -N "" -f ~/.ssh/id_github
echo 'eval "$(ssh-agent -s)" > /dev/null 2>&1; ssh-add ~/.ssh/id_github > /dev/null 2>&1' >> ~/.zshrc
echo 'Add this key to github (optional) ~/.ssh/id_github.pub'
cat ~/.ssh/id_github.pub

# Prompt
while true; do
    read -p 'Script completed. Reload as zsh and configure powerlevel10k? [Y/n]' yn
    case $yn in
        [Yy]* ) $(which zsh);;
	[Nn]* ) exit;;
    esac
done
