Bash on Ubuntu on Windows Runbook
=================================

To remove and then re-install Bash on Ubuntu on Windows (will get the latest version):
    
    lxrun /uninstall /full /y
    lxrun /install

Default umask seems to be 0000 (RW for world, yuck).
Uncomment (or add if it's not there) "umask 0022" in ~/.profile
    
Sudo doesn’t inherit root’s HOME. Add the following in your /etc/sudoers somewhere:

    Defaults always_set_home

Linux and UNIX Configuration Files
==================================

Shahid's .bashrc and other standard linux config files. When you create a new account
and want to use these configuration files, do the following:

    git clone git://github.com/shah/linux-user-conf.git $HOME/conf

Then, symlink the common configurations by running setup-conf.sh:

    cd $HOME/conf && ./setup-conf.sh
    
    
