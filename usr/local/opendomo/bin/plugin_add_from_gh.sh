#!/bin/sh
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
if wget -q "$URLPROJ" 2>/dev/null
then
	URLFILE="https://github.com/$GITUSER/$GITPROJ/tarball/master"
	echo "# Retrieving file $URLFILE"
else
	echo "#ERROR: invalid project $URLPROJ"
	exit 2
fi

rm -fr $TMPDIR/$GITUSER-$GITPROJ-*
if wget -q "$URLFILE" -O $TMPDIR/$GITPROJ.tar.gz
then
	cd $TMPDIR
	tar -zxf $GITPROJ.tar.gz
	if ! test -d usr
	then
		echo "#ERROR usr directory is missing!"
		exit 3
	fi
	if ! test -d var
	then
		echo "#ERROR var directory is missing!"
		exit 4
	fi	
	
	cd $GITUSER-$GITPROJ-*
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
fi