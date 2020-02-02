#!/bin/bash

# install a package if not exists
install_pkg () {
   pkgs=$1
  if ! dpkg -s $pkgs >/dev/null 2>&1; then
    sudo apt-get install $pkgs
  fi
}

install_pkg curl
install_pkg jq

# return country name of server which is located in
curl -s https://ipvigilante.com/$(curl -s https://ipinfo.io/ip) | jq '.data.country_name'
