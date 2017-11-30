#!/bin/bash
# mostly copied from https://www.nginx.com/resources/wiki/start/topics/tutorials/solaris_11/#startup-script

NGINX="${NGINX:-`which nginx`}" # use passed parameter or default
NGINX_CONF="${NGINX_CONF:-`pwd`/nginx.conf}" # ditto
RETVAL=0

start() {
   echo "Starting NGINX Web Server: \c"
   $NGINX -c $NGINX_CONF &
   RETVAL=$?
   [ $RETVAL -eq 0 ] && echo "ok" || echo "failed"
   return $RETVAL
}
stop() {
   echo "Stopping NGINX Web Server: \c"
   $NGINX_CMD -s quit
   RETVAL=$?
   [ $RETVAL -eq 0 ] && echo "ok" || echo "failed"
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
   *)
      echo "Usage: [NGINX NGINX_CONF] $0 {start|stop|restart}"
      exit 1
esac
exit $RETVAL
