Linux and UNIX Configuration Files
==================================

Shahid's .bashrc and other standard linux config files. When you create a new account
and want to use these configuration files, do the following:

    git clone git://github.com/shah/linux-user-conf.git $HOME/conf

Then, symlink the common configurations:

    cd $HOME/conf
    ./setup-conf.sh
    