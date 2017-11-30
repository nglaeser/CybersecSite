#!/bin/bash
# mostly copied from https://www.nginx.com/resources/wiki/start/topics/tutorials/solaris_11/#startup-script

NGINX="${NGINX:-`which nginx`}" # use passed parameter or default
NGINX_CONF="${NGINX_CONF:-$(realpath `pwd`)/nginx.conf}" # ditto
RETVAL=0
echo Using $NGINX_CONF

if [ ! -L /etc/nginx/sites-available/cybersec ]; then
	sudo ln -s $(realpath `pwd`)/site.conf /etc/nginx/sites-available/cybersec
fi

setup() {
   if  [ ! -L /usr/share/nginx/local.conf ]; then
	sudo ln -s $NGINX_CONF /usr/share/nginx/local.conf
   fi
   if  [ ! -L /etc/nginx/sites-enabled/cybersec ]; then
	sudo ln -s /etc/nginx/sites-available/cybersec /etc/nginx/sites-enabled
   fi
   if [ ! -L /var/www/html/cybersec ]; then
	sudo ln -s "$(realpath `pwd`)/templates" /var/www/html/cybersec
   fi
}
destruct() {
   for file in /usr/share/nginx/local.conf /etc/nginx/sites-enabled/cybersec; do
	if [ -L $file ]; then sudo rm $file; fi
   done
}
start() {
   setup
   echo "Starting NGINX Web Server..."
   sudo $NGINX -c local.conf
   RETVAL=$?
   [ $RETVAL -eq 0 ] && echo "ok" || echo "failed"
   return $RETVAL
}
stop() {
   echo "Stopping NGINX Web Server:"
   sudo $NGINX -s quit
   destruct
   RETVAL=$?
   [ $RETVAL -eq 0 ] && echo "ok" || echo "failed"
   return $RETVAL
}
case "$1" in
   destruct)
	destruct;;
   setup)
	setup;;
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
      echo "Usage: $0 {start|stop|restart}"
      exit 1
esac
exit $RETVAL
