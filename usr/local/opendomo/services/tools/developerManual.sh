#!/bin/sh
#desc:Developer manual
#package:oddevel

# Copyright(c) 2015 OpenDomo Services SL. Licensed under GPL v3 or later

## This service will display the manual page corresponding to the requested service.

echo "#>Developer manual"
if test -z "$1"; then
	echo "list:developerManual.sh	detailed filterable"
	cd /usr/local/opendomo/docs
	for filename in *.txt; do
		echo "	-$filename	$filename 	chapter"
	done
	echo "	-intro	Introduction	chapter"
else
	echo "list:developerManual.sh"
	cat /usr/local/opendomo/docs/$1 | sed ':a;N;$!ba;s/\n/ /g'
	echo "actions:"
	echo "	goback	Back"
fi
echo
