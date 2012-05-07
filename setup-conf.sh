#!/bin/bash
############################
# setup-conf.sh
# This script creates symlinks from the home directory to any desired config files in $CONF_HOME.
# CONF_HOME is assumed to be the directory from which this script is executed (usually ~/conf)
############################

CONF_HOME=`pwd`
CONF_BACKUP=$CONF_HOME/backup
CONF_FILES="bashrc bash_aliases dircolors"

mkdir -pv $CONF_BACKUP

# move any existing config in $HOME to $CONF_BACKUP directory, then create symlinks
for file in $CONF_FILES; do
    mv -uv ~/.$file $CONF_BACKUP
    ln -sv $CONF_HOME/$file ~/.$file
done

