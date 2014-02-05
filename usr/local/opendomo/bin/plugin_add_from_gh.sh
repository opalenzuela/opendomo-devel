#!/bin/sh

# Copyright(c) 2014 OpenDomo Services SL. Licensed under GPL v3 or later

if test -z "$2"
then
    echo "usage: $0 GITuser GITproject"
    echo
    exit 1
fi

GITUSER="$1"
GITPROJ="$2"
TMPDIR="/var/opendomo/tmp"
LOGDIR="/var/opendomo/log"
URLPROJ="https://github.com/$GITUSER/$GITPROJ"

cd "$TMPDIR"
if wget --no-check-certificate -qO- "$URLPROJ" &>/dev/null
then
	URLFILE="https://github.com/$GITUSER/$GITPROJ/tarball/master"
	echo "# Retrieving file $URLFILE"
else
	echo "#ERROR: invalid project $URLPROJ"
	exit 2
fi

rm -fr $TMPDIR/$GITUSER-$GITPROJ-*
if wget --no-check-certificate -q "$URLFILE" -O $TMPDIR/$GITPROJ.tar.gz
then
	cd $TMPDIR
	tar -zxf $GITPROJ.tar.gz
	cd $GITUSER-$GITPROJ-*

	if ! test -f mkpkg.sh
	then
		echo "#ERROR mkpkg.sh script is missing!"
		exit 3
	fi
	if ! test -d usr
	then
		echo "#ERROR usr directory is missing!"
		exit 4
	fi
	if ! test -d var
	then
		echo "#WARN var directory is missing!"
	fi	
	

	. ./mkpkg.sh >> $LOGDIR/$GITPROJ.log
	if test -z "$PKGID"
	then
		echo "#ERROR PKGID is not specified!"
		exit 5
	fi
	TGZFILE=`ls *.tar.gz`
	echo "# Installing $PKGID"
	if test -z "$TGZFILE"
	then
		echo "#ERROR Tar.gz file was not created"
		exit 6
	else
		TGZFILE="`pwd`/$TGZFILE"
		cd /
		tar  --no-overwrite-dir -zxvf $TGZFILE
	fi
	createwrappers.sh
fi