#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/CheetoFTP"
git clone https://github.com/413mbic/CheetoFTP.git $DIR

if ! sudo pip freeze | grep -q ftputil
then
  echo "Installing ftputil"
  if ! sudo pip3 install ftputil
  then
    exit 1
  fi
fi

if ! sudo pip freeze | grep -q requests
then
  echo "Installing requests"
  if ! sudo pip install requests
  then
    exit 1
  fi
fi

exit 0
