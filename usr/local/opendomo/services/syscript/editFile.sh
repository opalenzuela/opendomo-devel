#!/bin/sh
#desc:Edit file
#package:oddevel

# Copyright(c) 2015 OpenDomo Services SL. Licensed under GPL v3 or later

extension=${1##*.}

echo "#>Editing file"
echo "form:editFile.sh"
echo "	fullpath	Filename	readonly	$1"
case $extension in
	jpeg|jpg|png|gif)
		echo "	filecontent	File contents 	application	/cgi-bin/displayfile.cgi?$1"
		echo "	realfile	Upload file	file	$1"
		echo "actions:"
		echo "	goback	Back"
		;;
	*)
		echo "	filecontent	File contents 	application	/cgi-bin/texteditor.py?fname=$1"
	
esac
echo 