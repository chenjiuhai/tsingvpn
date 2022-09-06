#!/bin/bash

# Author: chenjiuhai@tsingmicro.com
# Will support multiple username?
# Will support modify username and password.
# Will support search username.

# command Help
help()
{
  echo "Usage: $0 vpn_username"
  echo ""
  echo "auto random 10 bit password and save to /etc/openvpn/psw-file"
  echo "Must enter one username and don't support multiple username Now."
}

# command xargs error
die()
{
  echo "Usage: $0 vpn_username"
  exit 1
}

# global variable
export vpn_username="$1"
export vpn_password=$(/root/mgtopenvpn/randPass.sh 2>/dev/null)

# add single user to /etc/openvpn/psw-file
if [ -z $vpn_password ]; then
  echo "password is NULL."
else
  if [ $# == 1 ]; then
    case ${vpn_username} in
      help)
        help
        ;;
      *)
        sed -i '$a\'''$vpn_username''' '''$vpn_password'''' /etc/openvpn/psw-file
        #sed -i '$a\'''$vpn_username''' '''$vpn_password'''' /tmp/chenjiuhai.txt
        echo "Your VPN username: $vpn_username and Password: $vpn_password"
        /root/mgtopenvpn/vpnusrinfo.sh
        ;;
    esac
  else
    die
  fi
fi
