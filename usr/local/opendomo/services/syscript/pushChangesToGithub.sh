#!/bin/sh
#desc:Push changes to GitHub
#package:oddevel
#type:local

# Copyright(c) 2015 OpenDomo Services SL. Licensed under GPL v3 or later

TMPDIR="/var/opendomo/tmp"
GITPROJ="$1"
DESCRIPTION="$2"
LOGDIR="/var/opendomo/log"

if test -z "$2"
then
    echo "form:pushChangesToGithub.sh"
	echo "	repo	Repository	text	$1"
	echo "	comments	Comments	text	$2"
    echo
    exit 1
fi


if test -f "/home/$USER/.gitdata"; then
	source "/home/$USER/.gitdata"
else
	echo "#ERR Your Github user account is not yet configured"
	echo 
	/usr/local/opendomo/configureGithub.sh
	exit 0
fi



# First we go to the working directory
cd "$TMPDIR/$GITPROJ"
INFOFILE=`ls var/opendomo/plugins/*.info`

# Find information of the project
source $INFOFILE

# Last: commit changes 
if test -x /usr/bin/git
then
	git commit -a -m "$DESCRIPTION"
	if git push https://$USERNAME:$PASSWORD@github.com/$AUTHORID/$REPOSITORY.git master
	then
		echo "#INFO Changes successfully uploaded"
		echo
	fi
else
	echo "#ERROR GIT is not installed"
	exit 1
fi


