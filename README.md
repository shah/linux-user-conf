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

    
    
