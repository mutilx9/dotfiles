if [[ -e "/etc/profile" ]]; then
	emulate sh -c 'source /etc/profile'
fi
emulate sh -c 'source ~/.profile'
