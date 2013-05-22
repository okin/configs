# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

# Start Dropbox after logging in.
if [ -f "$HOME/.dropbox-dist/dropboxd" ]; then
    (sleep 10 && $HOME/.dropbox-dist/dropboxd) &
fi

#Setting an environment var used by virtualenvwrapper
export WORKON_HOME=~/.virtualenvs

# Pimping git by using colors:
git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.status auto

# Setting vim as my default editor
export EDITOR="vim"

# Using redshift to relax the eyes
# Location is Frankfurt am Main, Germany
(sleep 10 && redshift -l 50.117:8.683 & disown)

