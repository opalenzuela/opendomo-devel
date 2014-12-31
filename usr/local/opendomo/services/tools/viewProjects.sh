#!/bin/sh
#desc:View projects
#package:oddevel

# Copyright(c) 2014 OpenDomo Services SL. Licensed under GPL v3 or later

## This service will let the developer choose which projects are available.

DEVELDIR="/var/opendomo/tmp"
echo "#>Developer manual"
if test -z "$1"; then
	echo "list:viewProjects.sh	detailed filterable"
	cd $DEVELDIR
	for project in *; do
		if test -d $project && test -f ./$project/build.bat
		then
			found=1
			echo "	-$project	$project 	project"
		fi
	done
	if test -z "$found"; then
		echo "#INFO No projects were found"
	fi
else
	echo "form:viewProjects.sh"
	cd $DEVELDIR
	source $1/var/opendomo/plugins/*.info
	echo "	name	Name	readonly	$NAME"
	echo "actions:"
	echo "	goback	Back"
fi
echo
