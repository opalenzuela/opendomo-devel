#!/bin/sh
#desc:Remove development plugin
#type:local
#package:oddevel

# Copyright(c) 2015 OpenDomo Services SL. Licensed under GPL v3 or later

TMPDIR="/var/opendomo/tmp"

if test -z "$2"
then
	echo "#>Remove development plugin "
	echo "form:`basename $0`"
	echo "	user	User	text	$1"
	echo "	project	Project	text	$2" 
else
	cd $TMPDIR 
	cd "$2/var/opendomo/plugins/"
	PLUGINID=`basename *.info |cut -f1 -d.`
	if test -f /var/opendomo/plugins/$PLUGINID.version
	then
		echo "00000000" > /var/opendomo/plugins/$PLUGINID.version
		echo "#INFO Plugin [$PLUGINID] restored"
	else
		echo "#ERRO The plugin [$PLUGINID] was not found"
	fi
fi
echo "actions:"
echo "	goback	Back"
echo
