#!/bin/sh
# RedHat startup script for a supervisor instance
#
# chkconfig: 2345 80 20
# description: supervisor

# Source function library.
. /etc/rc.d/init.d/functions

supervisorctl="/var/plone/sylar/genwebupcPreFEs/bin/supervisorctl"
supervisord="/var/plone/sylar/genwebupcPreFEs/bin/supervisord"
name="GenwebPreFEs"

[ -f $supervisord ] || exit 1
[ -f $supervisorctl ] || exit 1

RETVAL=0

start() {
     echo -n "Starting $name ... "
     $supervisord
     RETVAL=$?
     [ $RETVAL -eq 0 ] && touch /var/lock/subsys/$name
     echo
     return $RETVAL
}

stop() {
     echo -n "Stopping $name ... "
     $supervisorctl shutdown
     RETVAL=$?
     [ $RETVAL -eq 0 ] && rm -f /var/lock/subsys/$name
     echo
     return $RETVAL
}

case "$1" in
         start)
             start
             ;;

         stop)
             stop
             ;;

         restart)
             stop
             start
             ;;
         varnishrestart)
             $supervisorctl restart varnish1
             $supervisorctl restart varnish2
             $supervisorctl restart varnish3
             $supervisorctl restart varnish4
             $supervisorctl restart varnish5
             $supervisorctl restart varnish6
             $supervisorctl restart varnish7
             $supervisorctl restart varnish8
             $supervisorctl restart varnish9
             $supervisorctl restart varnish10
             $supervisorctl restart varnish11
             $supervisorctl restart varnish12
             ;;
         haproxyrestart)
             $supervisorctl restart haproxy1
             $supervisorctl restart haproxy2
             $supervisorctl restart haproxy3
             $supervisorctl restart haproxy4
             $supervisorctl restart haproxy5
             $supervisorctl restart haproxy6
             $supervisorctl restart haproxy7
             $supervisorctl restart haproxy8
             $supervisorctl restart haproxy9
             $supervisorctl restart haproxy10
             $supervisorctl restart haproxy11
             $supervisorctl restart haproxy12
             ;;

         *)
             echo "Usage: /etc/init.d/genwebupcPreFEs { start | stop | restart | varnishrestart | haproxyrestart }"
             ;;

esac

exit $REVAL
