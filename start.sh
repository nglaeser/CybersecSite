#!/bin/bash
# mostly copied from https://www.nginx.com/resources/wiki/start/topics/tutorials/solaris_11/#startup-script

NGINX="${NGINX:-`which nginx`}" # use passed parameter or default
DIR=${DIR:-$(realpath `pwd`)}
NGINX_CONF="${NGINX_CONF:-$DIR/nginx.conf}" # ditto
RETVAL=0
echo Using $NGINX_CONF

start() {
   if ! [ "`pwd`" = "`grep '^[[:blank:]]*root [^[:blank:]]*;' nginx.conf | tr ' ' '\n' | tr -d ';' | tail -1`" ]; then
	echo "Serving `pwd` (and messing up our lovely indents)"
	sed -i "s%^[[:blank:]]*root [^[:blank:]]*;% root `pwd`;%" $NGINX_CONF
   fi
   echo "Starting NGINX Web Server..."
   $NGINX -c $NGINX_CONF &
   RETVAL=$?
   [ $RETVAL -eq 0 ] && echo "ok" || echo "failed"
   return $RETVAL
}
stop() {
   echo "Stopping NGINX Web Server:"
   $NGINX -s quit
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
