#!/bin/sh

tar cvfz $oddevel-`date '+%Y%m%d'`.od.noarch.tar.gz usr var --owner 1000 --group 1000 --exclude "*~" --exclude .svn --exclude "*.a"