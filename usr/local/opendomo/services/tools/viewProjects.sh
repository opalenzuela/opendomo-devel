#!/bin/sh
#desc:View projects
#package:oddevel

# Copyright(c) 2014 OpenDomo Services SL. Licensed under GPL v3 or later

## This service will let the developer choose which projects are available.

DEVELDIR="/var/opendomo/tmp"
echo "#>Installed plugins"
if test -z "$1"; then
	echo "list:viewProjects.sh	detailed"
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
	echo
	echo "#>Get development version"
	echo "list:viewProjects.sh	detailed"
	cd /var/opendomo/plugins
	for project in *.info; do
		source ./$project
		if test -z "$AUTHORID" || test -z "$REPOSITORY"; then
			echo "	-	$project	project invalid	Missing parameters"
		else
			if test -d $DEVELDIR/$REPOSITORY; then
				echo "	-$REPOSITORY	$project 	project selected	$DESCRIPTION"
			else
				echo "	-$AUTHORID:$REPOSITORY	$project 	project	$DESCRIPTION"
			fi
		fi
	done
else
	echo "#>Details"
	echo "form:viewProjects.sh"
	cd $DEVELDIR/$1
	INFOFILE=`ls ./var/opendomo/plugins/*.info`
	CODENAME=`basename $INFOFILE | cut -f1 -d.`
	DEPENDENCES=`cat ./var/opendomo/plugins/$CODENAME.deps` 
	source $INFOFILE
	echo "	owner	owner	hidden	$AUTHORID"
	echo "	dir 	Directory	hidden	$1"
	echo "	desc	Description	readonly	$DESCRIPTION"
	echo "	auth	Author	readonly	$AUTHOR"
	echo "	deps	Dependences 	readonly	$DEPENDENCES"
	echo "actions:"
	echo "	goback	Back"
	echo "	installPluginFromGithub.sh	Update"
fi
echo
