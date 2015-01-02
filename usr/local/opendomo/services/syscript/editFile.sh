#!/bin/sh
#desc:Edit file
#package:oddevel

# Copyright(c) 2015 OpenDomo Services SL. Licensed under GPL v3 or later

echo "#>Editing file"
echo "form:editFile.sh"
echo "	fullpath	Filename	readonly	$1"
echo "	filecontent	File contents 	application	/cgi-bin/texteditor.py?fname=$1"
echo "actions:"
echo "	goback	Back"
echo 

echo
