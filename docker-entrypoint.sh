#!/bin/bash
set -e
GOSU="gosu dogecoin"
# don't use gosu when id is not 0
if [ "$(id -u)" -ne "0" ];then
  GOSU=""
fi
if [[ "$1" == "dogecoin-cli" || "$1" == "dogecoin-tx" || "$1" == "dogecoind" || "$1" == "test_dogecoin" ]]; then
	exec $GOSU "$@"
else
  exec $GOSU dogecoind "$@"
fi
