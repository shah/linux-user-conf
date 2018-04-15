Linux on Windows (Ubuntu on WSL) Runbook
=================================

To remove and then re-install Ubuntu on Windows use the Windows Store distributions. After installation, run the following to see what version was installed.

    uname -a
    lsb_release -a 

Sudo doesn’t inherit root’s HOME. Add the following in your /etc/sudoers somewhere:

    sudo vi /etc/sudoers
    Defaults always_set_home

Install zsh and set user's /bin/bash to /bin/zsh

    sudo apt-get install zsh
    sudo vi /etc/passwd
    
Linux and UNIX Configuration Files
==================================

Shahid uses zsh and the http://ohmyz.sh/ framework. After setting up user's $SHELL to use /bin/zsh, add this to .zshrc:

    umask 0022 # required if running in WSL

Set the theme:

    ZSH_THEME="bira"

Setup Node.js using NVM on Ubuntu 16.04 LTS (do research if different version). This comes from https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-16-04

    sudo apt-get update
    sudo apt-get install build-essential libssl-dev
    
    # Install the NVM package (see https://github.com/creationix/nvm)
    sudo vi .zshrc

Add 'nvm' to the plugins variable, then exit the shell and come back in.
Type:

    nvm ls-remote
    
Find something that looks like this:

    v8.11.1   (Latest LTS: Carbon)
    
Whatever that version is, install it and use it and verify what version you see:

    nvm install v8.11.1
    nvm ls
    node -v

Now you can run Node.js, but should install yarn package management too:

    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    
Since we're running NVM, install jarn only (not nodejs): 

    sudo apt-get install --no-install-recommends yarn

Some Node.js packages and yarn require python:

    sudo apt-get install python
