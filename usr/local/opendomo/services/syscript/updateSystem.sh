#!/bin/sh
#desc:Update system
#type:local
#package:oddevel


echo "#INFO Updating system. Please wait"
echo "" > /var/opendomo/apt/queue
echo 0 > /var/opendomo/apt/update
echo
