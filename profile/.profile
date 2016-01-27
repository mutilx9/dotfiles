if [[ $TERM == 'vt220' ]]; then
	export TERM=wsvt25
fi

if [[ -z $SSH_AGENT_PID ]]; then
	eval `ssh-agent`
fi

# Locale
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LESSCHARSET=utf-8

# User env
export EDITOR=vim
export MAILREADER=mutt
export BROWSER=qutebrowser
export RANGER_LOAD_DEFAULT_RC=FALSE
export GPG_TTY=`tty`
