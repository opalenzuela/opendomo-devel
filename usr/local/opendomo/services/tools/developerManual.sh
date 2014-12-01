#!/bin/sh
#desc:Developer manual
#package:oddevel

# Copyright(c) 2014 OpenDomo Services SL. Licensed under GPL v3 or later

## This service will display the manual page corresponding to the 
## requested service.

echo "#>Developer manual"
if test -z "$1"; then
	echo "list:$0"
	echo "	-intro	Introduction	chapter"
else
	cat /usr/local/opendomo/docs/$1.txt | sed 's/^/# /'
fi
echo
