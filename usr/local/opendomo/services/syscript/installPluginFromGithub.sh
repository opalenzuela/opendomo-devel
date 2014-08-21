#!/bin/sh
#desc:Install plugin from Github
#type:local
#package:oddevel


if test -z "$2"
then
	echo "#>Install plugin from Github"
	echo "form:`basename $0`"
	echo "	user	User	text	$1"
	echo "	project	Project	text	$2" 
else
	echo "#LOADING Installing plugin"
	if /usr/local/opendomo/bin/plugin_add_from_gh.sh $1 $2 >/dev/null
	then
		echo "#INFO Plugin [$2] installed"
	else
		echo "#ERRO The plugin was not found"	
	fi
fi
echo
echo