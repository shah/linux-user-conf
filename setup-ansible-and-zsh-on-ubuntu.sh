#!/usr/bin/env bash
title() {
    local color='\033[1;37m'
    local nc='\033[0m'
    printf "\n${color}$1${nc}\n"
}

title "Install Ansible"
sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible -y
if [ -f /etc/apt/sources.list.d/ansible-ansible-jessie.list ]; then
    sudo sed -i 's/jessie/trusty/g' /etc/apt/sources.list.d/ansible-ansible-jessie.list
fi
sudo apt-get update
sudo apt-get install curl ansible -y

if grep -q Microsoft /proc/version; then
  title "Running on WSL, download /etc/wsl.conf"
  curl https://raw.githubusercontent.com/shah/linux-user-conf/master/wsl.conf > /etc/wsl.conf
fi

title "Install viasite-ansible.zsh"
sudo ansible-galaxy install viasite-ansible.zsh --force

title "Download .zshrc.local to $HOME"
curl https://raw.githubusercontent.com/shah/linux-user-conf/master/.zshrc.local > $HOME/.zshrc.local

title "Download .vimrc to $HOME"
curl https://raw.githubusercontent.com/shah/linux-user-conf/master/.vimrc > $HOME/.vimrc

title "Download playbook to $HOME/setup/zsh.ansible-playbook.yml"
mkdir -p $HOME/setup
curl https://raw.githubusercontent.com/shah/linux-user-conf/master/zsh.ansible-playbook.yml > $HOME/setup/zsh.ansible-playbook.yml

title "Provision playbook for root"
sudo ansible-playbook -i "localhost," -c local $HOME/setup/zsh.ansible-playbook.yml

title "Provision playbook for $(whoami)"
sudo ansible-playbook -i "localhost," -c local $HOME/setup/zsh.ansible-playbook.yml --extra-vars="zsh_user=$(whoami)"
