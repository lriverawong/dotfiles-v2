#!/bin/bash

# requirements:
# - openvpn-update-systemd-resolved (https://github.com/jonathanio/update-systemd-resolved)
#   OR openvpn-systemd-resolved from your package manager
# - expect software package
# - your sudo password in a file $HOME/.sudo_creds
# - your office creds in a file $HOME/.officevpn_creds

# bash equivalent
# sudo openvpn --config $HOME/.vpn/ecobee.ovpn --auth-retry interact --auth-user-pass $HOME/.officevpn_creds

username="$(echo $USER)"
password="$(awk 'NR==1{print $1}' $HOME/.sudo_creds)"
# echo $username
# echo $password

expect -c "
   set timeout -1
   spawn sudo openvpn --config $HOME/.vpn/ecobee.ovpn --auth-retry interact --auth-user-pass $HOME/.officevpn_creds
   match_max 100000
   expect -exact \"\[sudo\] password for ${username}: \"
   send -- \"${password}\r\"
   expect -exact \"CHALLENGE: Duo passcode or second factor: \"
   send -- \"push\r\"
   expect eof "
