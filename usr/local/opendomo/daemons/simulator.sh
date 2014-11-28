#!/bin/sh
### BEGIN INIT INFO
# Provides:          odauto
# Required-Start:    
# Required-Stop:
# Should-Start:      
# Default-Start:     1 2 3 4 5
# Default-Stop:      0 6
# Short-Description: Simulator
# Description:       Simulator
#
### END INIT INFO
### Copyright(c) 2014 OpenDomo Services SL. Licensed under GPL v3 or later

. /lib/lsb/init-functions
PIDFILE="/var/opendomo/run/simulator.pid"

do_background() {
	# 1. Saving PID file
	echo -n >$PIDFILE

	# 2. Performing the actual loop
	while test -f $PIDFILE
	do
		sleep 5
	done
}
	
do_start () {
	log_action_begin_msg "Starting simulator"
	cd /usr/local/opendomo/daemons/
	$0 background > /dev/null &
	log_action_end_msg $?
}

do_stop () {
	log_action_begin_msg "Stoping simulator"
	rm $PIDFILE 2>/dev/null	
	log_action_end_msg $?
}

do_status () {
	if test -f $PIDFILE; then
		echo "simulator is running"
		exit 0
	else
		echo "simulator is not running"
		exit 1
	fi
}

case "$1" in
	background)
		do_background
		;;
	start)
		do_start
		;;
	restart|reload|force-reload)
		do_stop
		do_start
		exit 3
		;;
	stop)
		do_stop
		exit 3
	;;
	status)
		do_status
		exit $?
		;;
	*)
		echo "Usage: $0 [start|stop|restart|status]" >&2
		exit 3
		;;
esac