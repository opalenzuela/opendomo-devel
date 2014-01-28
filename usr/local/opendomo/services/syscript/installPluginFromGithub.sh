#!/bin/sh
#desc:Install plugin from Github
#type:local
#package:oddevel


if test -z "$1"
then
	echo "#>Install plugin from Github"
	echo "form:`basename $0`"
	echo "	user	User	text"
	echo "	project	Project	text"
else
	if /usr/local/opendomo/bin/plugin_add_from_gh.sh $1 $2 >/dev/null
	then
		echo "# Installing plugin"
	else
		echo "#ERROR The plugin was not found"	
	fi
fi
echo
echo