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
URLPROJ="https://github.com/$GITUSER/$GITPROJ"
if wget -q "$URLPROJ" -O - 2>/dev/null
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
	tar -zxvf $GITPROJ.tar.gz
	cd $GITUSER-$GITPROJ-*
	. ./mkpkg.sh
	echo "# Installing $PKGID"
	/usr/local/bin/plugin_add.sh $PKGID
fi