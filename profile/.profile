if [[ $TERM == 'vt220' ]]; then
	export TERM=wsvt25
fi

if [[ -z $SSH_AGENT_PID ]]; then
	eval `ssh-agent -s -t 3600`
fi

# Locale
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LESSCHARSET=utf-8

# User env
export PS1='\033[1;36m\u\033[00m@\033[1;32m\h\033[00m \033[1;33m\w\033[00m\n\$ '
export HISTFILE=~/.sh_history
export HISTSIZE=5000
export PATH=~/bin:$PATH
export EDITOR=vim
export MAILREADER=mutt
export BROWSER=qutebrowser
export RANGER_LOAD_DEFAULT_RC=FALSE
export GPG_TTY=`tty`
