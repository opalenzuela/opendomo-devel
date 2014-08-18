#!/bin/sh
#desc:Commit plugin to GitHub
#package:oddevel
#type:local

# Copyright(c) 2014 OpenDomo Services SL. Licensed under GPL v3 or later

if test -z "$1"
then
    echo "usage: $0 GITproject"
    echo
    exit 1
fi

GITPROJ="$1"

LOGDIR="/var/opendomo/log"

# First we go to the home directory
cd 
TMPDIR=`pwd`
cd "$TMPDIR/$GITPROJ"

#TODO move files from FS to repo


# Last: commit changes 
if test -x /usr/bin/git
then
	echo "Please enter a description for the changes: "
	read description
	git commit -a -m "$description"
	git push
else
	echo "#ERROR GIT is not installed"
	exit 1
fi


