#!/bin/sh
#desc:Add plugin from GitHub
#package:oddevel
#type:local

# Copyright(c) 2014 OpenDomo Services SL. Licensed under GPL v3 or later

if test -z "$2"
then
    echo "usage: $0 GITuser GITproject"
    echo
    exit 1
fi

GITUSER="$1"
GITPROJ="$2"

LOGDIR="/var/opendomo/log"
URLPROJ="https://github.com/$GITUSER/$GITPROJ"
CLONEPROJ="https://github.com/$GITUSER/$GITPROJ.git"

# First we go to the home directory
cd 
TMPDIR=`pwd`
cd "$TMPDIR"
if wget --no-check-certificate -qO- "$URLPROJ" &>/dev/null
then
	URLFILE="https://github.com/$GITUSER/$GITPROJ/tarball/master"
	echo "# Retrieving file $URLFILE"
else
	echo "#ERROR: invalid project $URLPROJ"
	exit 2
fi

# If GIT is installed, it's our first option
if test -x /usr/bin/git
then
	git clone $CLONEPROJ
	cd $GITPROJ
else
	rm -fr $TMPDIR/$GITUSER-$GITPROJ-*
	if ! wget --no-check-certificate -q "$URLFILE" -O $TMPDIR/$GITPROJ.tar.gz
	then
		echo "#ERROR downloading file $URLFILE"
		exit 1
	fi

	cd $TMPDIR
	tar -zxf $GITPROJ.tar.gz
	cd $GITUSER-$GITPROJ-*
fi



echo
echo "   ##########################################################################"
echo "   ##   WARNING: you are installing a plugin from the development branch.  ##"
echo "   ##   This means that  the code might be unstable,  so it shouldn't be   ##" 
echo "   ##   used in production environments. Use it AT YOUR OWN RISK!          ##"
echo "   ##########################################################################"
echo 

if ! test -f mkpkg.sh
then
	echo "#ERROR mkpkg.sh script is missing!"
	exit 3
else
	if ! test -x mkpkg.sh
	then
		echo "#ERROR mkpkg.sh script doesn't have execution privileges!"
		exit 3
	fi
fi

if ! test -f build.bat
then
	echo "#ERROR build.bat script is missing!"
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
	echo " This is not a compulsory directory if the plugin doesn't have styles, images or interface modifications"
fi	

. ./mkpkg.sh >> $LOGDIR/$GITPROJ.log
if test -z "$PKGID"
then
	echo "#ERROR PKGID is not specified!"
	exit 5
fi

TGZFILE=`ls *.tar.gz`
echo "# Installing $PKGID ... "
if test -z "$TGZFILE"
then
	echo "#ERROR Plugin tar.gz file was not created"
	exit 6
fi

TGZFILE="`pwd`/$TGZFILE"
echo > $TMPDIR/$GITPROJ.files 
cd /
if tar  --no-overwrite-dir -zxvf $TGZFILE  >> $TMPDIR/$GITPROJ.files 
then
	
	createwrappers.sh
	
	echo "# Plugin $PKGID installed successfully"
else
	echo "#ERROR decompressing file"
	exit 7
fi

