#!/bin/sh
#desc:Update system
#type:local
#package:oddevel

# Copyright(c) 2015 OpenDomo Services SL. Licensed under GPL v3 or later

echo "#INFO Updating system. Please wait"
echo "" > /var/opendomo/apt/queue
echo 0 > /var/opendomo/apt/update
echo
