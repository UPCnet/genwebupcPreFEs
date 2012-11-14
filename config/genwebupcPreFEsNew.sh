#!/bin/sh
# Arranc de l'stack de serveis del qual es composa el Pre Frontends del servei GenwebUPC
# Arrenca els seguents serveis: varnish-ro varnish-rw haproxy
#
# chkconfig: 2345 85 15
# description: Arranc de l'stack de serveis del qual es composa el Pre Frontends del servei GenwebUPC 

HAPROXY=/var/plone/genwebupcPreFEsNew/bin/haproxy
HAPROXY1PID=/var/plone/genwebupcPreFEsNew/var/haproxy1.pid
HAPROXY2PID=/var/plone/genwebupcPreFEsNew/var/haproxy2.pid
HAPROXY3PID=/var/plone/genwebupcPreFEsNew/var/haproxy3.pid
HAPROXY4PID=/var/plone/genwebupcPreFEsNew/var/haproxy4.pid
HAPROXY5PID=/var/plone/genwebupcPreFEsNew/var/haproxy5.pid
HAPROXY6PID=/var/plone/genwebupcPreFEsNew/var/haproxy6.pid
HAPROXY7PID=/var/plone/genwebupcPreFEsNew/var/haproxy7.pid
HAPROXY8PID=/var/plone/genwebupcPreFEsNew/var/haproxy8.pid
HAPROXY9PID=/var/plone/genwebupcPreFEsNew/var/haproxy9.pid
HAPROXY10PID=/var/plone/genwebupcPreFEsNew/var/haproxy10.pid
HAPROXY11PID=/var/plone/genwebupcPreFEsNew/var/haproxy11.pid
HAPROXY12PID=/var/plone/genwebupcPreFEsNew/var/haproxy12.pid
HAPROXY1CONF=/var/plone/genwebupcPreFEsNew/production/balancer1.conf
HAPROXY2CONF=/var/plone/genwebupcPreFEsNew/production/balancer2.conf
HAPROXY3CONF=/var/plone/genwebupcPreFEsNew/production/balancer3.conf
HAPROXY4CONF=/var/plone/genwebupcPreFEsNew/production/balancer4.conf
HAPROXY5CONF=/var/plone/genwebupcPreFEsNew/production/balancer5.conf
HAPROXY6CONF=/var/plone/genwebupcPreFEsNew/production/balancer6.conf
HAPROXY7CONF=/var/plone/genwebupcPreFEsNew/production/balancer7.conf
HAPROXY8CONF=/var/plone/genwebupcPreFEsNew/production/balancer8.conf
HAPROXY9CONF=/var/plone/genwebupcPreFEsNew/production/balancer9.conf
HAPROXY10CONF=/var/plone/genwebupcPreFEsNew/production/balancer10.conf
HAPROXY11CONF=/var/plone/genwebupcPreFEsNew/production/balancer11.conf
HAPROXY12CONF=/var/plone/genwebupcPreFEsNew/production/balancer12.conf

VARNISH1=/var/plone/genwebupcPreFEsNew/parts/varnish-build/sbin/varnishd
VARNISH2=/var/plone/genwebupcPreFEsNew/parts/varnish-build/sbin/varnishd
VARNISH3=/var/plone/genwebupcPreFEsNew/parts/varnish-build/sbin/varnishd
VARNISH4=/var/plone/genwebupcPreFEsNew/parts/varnish-build/sbin/varnishd
VARNISH5=/var/plone/genwebupcPreFEsNew/parts/varnish-build/sbin/varnishd
VARNISH6=/var/plone/genwebupcPreFEsNew/parts/varnish-build/sbin/varnishd
VARNISH7=/var/plone/genwebupcPreFEsNew/parts/varnish-build/sbin/varnishd
VARNISH8=/var/plone/genwebupcPreFEsNew/parts/varnish-build/sbin/varnishd
VARNISH9=/var/plone/genwebupcPreFEsNew/parts/varnish-build/sbin/varnishd
VARNISH10=/var/plone/genwebupcPreFEsNew/parts/varnish-build/sbin/varnishd
VARNISH11=/var/plone/genwebupcPreFEsNew/parts/varnish-build/sbin/varnishd
VARNISH12=/var/plone/genwebupcPreFEsNew/parts/varnish-build/sbin/varnishd
VARNISH1PID=/var/plone/genwebupcPreFEsNew/parts/varnish1/varnish.pid
VARNISH2PID=/var/plone/genwebupcPreFEsNew/parts/varnish2/varnish.pid
VARNISH3PID=/var/plone/genwebupcPreFEsNew/parts/varnish3/varnish.pid
VARNISH4PID=/var/plone/genwebupcPreFEsNew/parts/varnish4/varnish.pid
VARNISH5PID=/var/plone/genwebupcPreFEsNew/parts/varnish5/varnish.pid
VARNISH6PID=/var/plone/genwebupcPreFEsNew/parts/varnish6/varnish.pid
VARNISH7PID=/var/plone/genwebupcPreFEsNew/parts/varnish7/varnish.pid
VARNISH8PID=/var/plone/genwebupcPreFEsNew/parts/varnish8/varnish.pid
VARNISH9PID=/var/plone/genwebupcPreFEsNew/parts/varnish9/varnish.pid
VARNISH10PID=/var/plone/genwebupcPreFEsNew/parts/varnish10/varnish.pid
VARNISH11PID=/var/plone/genwebupcPreFEsNew/parts/varnish11/varnish.pid
VARNISH12PID=/var/plone/genwebupcPreFEsNew/parts/varnish12/varnish.pid

NGINX=/var/plone/genwebupcPreFEsNew/parts/nginx-build/sbin/nginx
NGINXCONF=/var/plone/genwebupcPreFEs/production/nginx.conf

haproxy_stop()
{
        if [ ! -f $HAPROXYPID ] ; then
                # This is a success according to LSB
                return 0
        fi
        for pid in $(cat $HAPROXYPID) ; do
                /bin/kill $pid || return 4
        done
        rm -f $HAPROXYPID
        return 0
}


case "$1" in
'start')
        #echo arrencant el servidor de recursos estatics
        $NGINX -c $NGINXCONF
        #echo "Arrencant Balancejador de l'entorn GW1"
        #start-stop-daemon --start --quiet --pidfile "$HAPROXY1PID" \
        #        --exec $HAPROXY -- -f "$HAPROXY1CONF" -D -p "$HAPROXY1PID"

        #echo "Arrencant Balancejador de l'entorn GW2"
        #start-stop-daemon --start --quiet --pidfile "$HAPROXY2PID" \
        #        --exec $HAPROXY -- -f "$HAPROXY2CONF" -D -p "$HAPROXY2PID"

        #echo "Arrencant Balancejador de l'entorn GW3"
        #start-stop-daemon --start --quiet --pidfile "$HAPROXY3PID" \
        #        --exec $HAPROXY -- -f "$HAPROXY3CONF" -D -p "$HAPROXY3PID"

        #echo "Arrencant Balancejador de l'entorn GW4"
        #start-stop-daemon --start --quiet --pidfile "$HAPROXY4PID" \
        #        --exec $HAPROXY -- -f "$HAPROXY4CONF" -D -p "$HAPROXY4PID"

        #echo "Arrencant Balancejador de l'entorn GW5"
        #start-stop-daemon --start --quiet --pidfile "$HAPROXY5PID" \
        #        --exec $HAPROXY -- -f "$HAPROXY5CONF" -D -p "$HAPROXY5PID"

        #echo "Arrencant Balancejador de l'entorn GW6"
        #start-stop-daemon --start --quiet --pidfile "$HAPROXY6PID" \
        #        --exec $HAPROXY -- -f "$HAPROXY6CONF" -D -p "$HAPROXY6PID"

        echo "Arrencant Balancejador de l'entorn GW7"
        start-stop-daemon --start --quiet --pidfile "$HAPROXY7PID" \
                --exec $HAPROXY -- -f "$HAPROXY7CONF" -D -p "$HAPROXY7PID"

        echo "Arrencant Balancejador de l'entorn GW8"
        start-stop-daemon --start --quiet --pidfile "$HAPROXY8PID" \
                --exec $HAPROXY -- -f "$HAPROXY8CONF" -D -p "$HAPROXY8PID"

        #echo "Arrencant Balancejador de l'entorn GW9"
        #start-stop-daemon --start --quiet --pidfile "$HAPROXY9PID" \
        #        --exec $HAPROXY -- -f "$HAPROXY9CONF" -D -p "$HAPROXY9PID"

        #echo "Arrencant Balancejador de l'entorn GW10"
        #start-stop-daemon --start --quiet --pidfile "$HAPROXY10PID" \
        #        --exec $HAPROXY -- -f "$HAPROXY10CONF" -D -p "$HAPROXY10PID"

        #echo "Arrencant Balancejador de l'entorn GW11"
        #start-stop-daemon --start --quiet --pidfile "$HAPROXY11PID" \
        #        --exec $HAPROXY -- -f "$HAPROXY11CONF" -D -p "$HAPROXY11PID"

        #echo "Arrencant Balancejador de l'entorn GW12"
        #start-stop-daemon --start --quiet --pidfile "$HAPROXY12PID" \
        #        --exec $HAPROXY -- -f "$HAPROXY12CONF" -D -p "$HAPROXY12PID"


        #echo "Arrencant Servidor de Cache de l'entorn GW1"
        #/var/plone/genwebupcPreFEsNew/bin/varnish1
        #echo "Arrencant Servidor de Cache de l'entorn GW2"
        #/var/plone/genwebupcPreFEsNew/bin/varnish2
        #echo "Arrencant Servidor de Cache de l'entorn GW3"
        #/var/plone/genwebupcPreFEsNew/bin/varnish3
        #echo "Arrencant Servidor de Cache de l'entorn GW4"
        #/var/plone/genwebupcPreFEsNew/bin/varnish4
        #echo "Arrencant Servidor de Cache de l'entorn GW5"
        #/var/plone/genwebupcPreFEsNew/bin/varnish5
        #echo "Arrencant Servidor de Cache de l'entorn GW6"
        #/var/plone/genwebupcPreFEsNew/bin/varnish6
        echo "Arrencant Servidor de Cache de l'entorn GW7"
        /var/plone/genwebupcPreFEsNew/bin/varnish7
        echo "Arrencant Servidor de Cache de l'entorn GW8"
        /var/plone/genwebupcPreFEsNew/bin/varnish8
        #echo "Arrencant Servidor de Cache de l'entorn GW9"
        #/var/plone/genwebupcPreFEsNew/bin/varnish9
        #echo "Arrencant Servidor de Cache de l'entorn GW10"
        #/var/plone/genwebupcPreFEsNew/bin/varnish10
        #echo "Arrencant Servidor de Cache de l'entorn GW11"
        #/var/plone/genwebupcPreFEsNew/bin/varnish11
        #echo "Arrencant Servidor de Cache de l'entorn GW12"
        #/var/plone/genwebupcPreFEsNew/bin/varnish12

    ;;
'stop')
        #echo "Parant Balancejadors de l'entorn Gw1"
        #start-stop-daemon --stop --quiet --pidfile "$HAPROXY1PID"
        #echo "Parant Balancejadors de l'entorn Gw2"
        #start-stop-daemon --stop --quiet --pidfile "$HAPROXY2PID"
        #echo "Parant Balancejadors de l'entorn Gw3"
        #start-stop-daemon --stop --quiet --pidfile "$HAPROXY3PID"
        #echo "Parant Balancejadors de l'entorn Gw4"
        #start-stop-daemon --stop --quiet --pidfile "$HAPROXY4PID"
        #echo "Parant Balancejadors de l'entorn Gw5"
        #start-stop-daemon --stop --quiet --pidfile "$HAPROXY5PID"
        #echo "Parant Balancejadors de l'entorn Gw6"
        #start-stop-daemon --stop --quiet --pidfile "$HAPROXY6PID"
        echo "Parant Balancejadors de l'entorn Gw7"
        start-stop-daemon --stop --quiet --pidfile "$HAPROXY7PID"
        echo "Parant Balancejadors de l'entorn Gw8"
        start-stop-daemon --stop --quiet --pidfile "$HAPROXY8PID"
        #echo "Parant Balancejadors de l'entorn Gw9"
        #start-stop-daemon --stop --quiet --pidfile "$HAPROXY9PID"
        #echo "Parant Balancejadors de l'entorn Gw10"
        #start-stop-daemon --stop --quiet --pidfile "$HAPROXY10PID"
        #echo "Parant Balancejadors de l'entorn Gw11"
        #start-stop-daemon --stop --quiet --pidfile "$HAPROXY11PID"
        #echo "Parant Balancejadors de l'entorn Gw12"
        #start-stop-daemon --stop --quiet --pidfile "$HAPROXY12PID"

        #echo "Parant Servidor de Cache de l'entorn Gw1"
        #start-stop-daemon --stop --quiet --pidfile "$VARNISH1PID" \
        #        --exec $VARNISH1

        #echo "Parant Servidor de Cache de l'entorn Gw2"
        #start-stop-daemon --stop --quiet --pidfile "$VARNISH2PID" \
        #        --exec $VARNISH2

        #echo "Parant Servidor de Cache de l'entorn Gw3"
        #start-stop-daemon --stop --quiet --pidfile "$VARNISH3PID" \
        #        --exec $VARNISH3

        #echo "Parant Servidor de Cache de l'entorn Gw4"
        #start-stop-daemon --stop --quiet --pidfile "$VARNISH4PID" \
        #        --exec $VARNISH4

        #echo "Parant Servidor de Cache de l'entorn Gw5"
        #start-stop-daemon --stop --quiet --pidfile "$VARNISH5PID" \
        #        --exec $VARNISH5

        #echo "Parant Servidor de Cache de l'entorn Gw6"
        #start-stop-daemon --stop --quiet --pidfile "$VARNISH6PID" \
        #        --exec $VARNISH6

        echo "Parant Servidor de Cache de l'entorn Gw7"
        start-stop-daemon --stop --quiet --pidfile "$VARNISH7PID" \
                --exec $VARNISH7

        echo "Parant Servidor de Cache de l'entorn Gw8"
        start-stop-daemon --stop --quiet --pidfile "$VARNISH8PID" \
                --exec $VARNISH8

        #echo "Parant Servidor de Cache de l'entorn Gw9"
        #start-stop-daemon --stop --quiet --pidfile "$VARNISH9PID" \
        #        --exec $VARNISH9

        #echo "Parant Servidor de Cache de l'entorn Gw10"
        #start-stop-daemon --stop --quiet --pidfile "$VARNISH10PID" \
        #        --exec $VARNISH10

        #echo "Parant Servidor de Cache de l'entorn Gw11"
        #start-stop-daemon --stop --quiet --pidfile "$VARNISH11PID" \
        #        --exec $VARNISH11

        #echo "Parant Servidor de Cache de l'entorn Gw12"
        #start-stop-daemon --stop --quiet --pidfile "$VARNISH12PID" \
        #        --exec $VARNISH12

        #echo "parant el servidor de recursos estatics"
        #$NGINX -c $NGINXCONF -s stop

;;
'haproxyrestart')
        #echo "Parant Balancejador de l'entorn GW1"
        #start-stop-daemon --stop --quiet --pidfile "$HAPROXY1PID"
        #echo "Arrencant Balancejador de l'entorn GW1"
        #start-stop-daemon --start --quiet --pidfile "$HAPROXY1PID" \
        #        --exec $HAPROXY -- -f "$HAPROXY1CONF" -D -p "$HAPROXY1PID"
        #echo "Parant Balancejador de l'entorn GW2"
        #start-stop-daemon --stop --quiet --pidfile "$HAPROXY2PID"
        #echo "Arrencant Balancejador de l'entorn GW2"
        #start-stop-daemon --start --quiet --pidfile "$HAPROXY2PID" \
        #        --exec $HAPROXY -- -f "$HAPROXY2CONF" -D -p "$HAPROXY2PID"
        #echo "Parant Balancejador de l'entorn GW3"
        #start-stop-daemon --stop --quiet --pidfile "$HAPROXY3PID"
        #echo "Arrencant Balancejador de l'entorn GW3"
        #start-stop-daemon --start --quiet --pidfile "$HAPROXY3PID" \
        #        --exec $HAPROXY -- -f "$HAPROXY3CONF" -D -p "$HAPROXY3PID"
        #echo "Parant Balancejador de l'entorn GW4"
        #start-stop-daemon --stop --quiet --pidfile "$HAPROXY4PID"
        #echo "Arrencant Balancejador de l'entorn GW4"
        #start-stop-daemon --start --quiet --pidfile "$HAPROXY4PID" \
        #        --exec $HAPROXY -- -f "$HAPROXY4CONF" -D -p "$HAPROXY4PID"
        #echo "Parant Balancejador de l'entorn GW5"
        #start-stop-daemon --stop --quiet --pidfile "$HAPROXY5PID"
        #echo "Arrencant Balancejador de l'entorn GW5"
        #start-stop-daemon --start --quiet --pidfile "$HAPROXY5PID" \
        #        --exec $HAPROXY -- -f "$HAPROXY5CONF" -D -p "$HAPROXY5PID"
        #echo "Parant Balancejador de l'entorn GW6"
        #start-stop-daemon --stop --quiet --pidfile "$HAPROXY6PID"
        #echo "Arrencant Balancejador de l'entorn GW6"
        #start-stop-daemon --start --quiet --pidfile "$HAPROXY6PID" \
        #        --exec $HAPROXY -- -f "$HAPROXY6CONF" -D -p "$HAPROXY6PID"
        echo "Parant Balancejador de l'entorn GW7"
        start-stop-daemon --stop --quiet --pidfile "$HAPROXY7PID"
        echo "Arrencant Balancejador de l'entorn GW7"
        start-stop-daemon --start --quiet --pidfile "$HAPROXY7PID" \
                --exec $HAPROXY -- -f "$HAPROXY7CONF" -D -p "$HAPROXY7PID"
        echo "Parant Balancejador de l'entorn GW8"
        start-stop-daemon --stop --quiet --pidfile "$HAPROXY8PID"
        echo "Arrencant Balancejador de l'entorn GW8"
        start-stop-daemon --start --quiet --pidfile "$HAPROXY8PID" \
                --exec $HAPROXY -- -f "$HAPROXY8CONF" -D -p "$HAPROXY8PID"
        #echo "Parant Balancejador de l'entorn GW9"
        #start-stop-daemon --stop --quiet --pidfile "$HAPROXY9PID"
        #echo "Arrencant Balancejador de l'entorn GW9"
        #start-stop-daemon --start --quiet --pidfile "$HAPROXY9PID" \
        #        --exec $HAPROXY -- -f "$HAPROXY9CONF" -D -p "$HAPROXY9PID"
        #echo "Parant Balancejador de l'entorn GW10"
        #start-stop-daemon --stop --quiet --pidfile "$HAPROXY10PID"
        #echo "Arrencant Balancejador de l'entorn GW10"
        #start-stop-daemon --start --quiet --pidfile "$HAPROXY10PID" \
        #        --exec $HAPROXY -- -f "$HAPROXY10CONF" -D -p "$HAPROXY10PID"
        #echo "Parant Balancejador de l'entorn GW11"
        #start-stop-daemon --stop --quiet --pidfile "$HAPROXY11PID"
        #echo "Arrencant Balancejador de l'entorn GW11"
        #start-stop-daemon --start --quiet --pidfile "$HAPROXY11PID" \
        #        --exec $HAPROXY -- -f "$HAPROXY11CONF" -D -p "$HAPROXY11PID"
        #echo "Parant Balancejador de l'entorn GW12"
        #start-stop-daemon --stop --quiet --pidfile "$HAPROXY12PID"
        #echo "Arrencant Balancejador de l'entorn GW12"
        #start-stop-daemon --start --quiet --pidfile "$HAPROXY12PID" \
        #        --exec $HAPROXY -- -f "$HAPROXY12CONF" -D -p "$HAPROXY12PID"

;;

'varnishrestart')
        #echo "Parant Servidor de Cache de l'entorn GW1"
        #start-stop-daemon --stop --quiet --pidfile "$VARNISH1PID" \
        #        --exec $VARNISH1
        #echo "Arrencant Servidor de Cache de l'entorn GW1"
        #/var/plone/genwebupcPreFEsNew/bin/varnish1
        #echo "Parant Servidor de Cache de l'entorn GW2"
        #start-stop-daemon --stop --quiet --pidfile "$VARNISH2PID" \
        #        --exec $VARNISH2
        #echo "Arrencant Servidor de Cache de l'entorn GW2"
        #/var/plone/genwebupcPreFEsNew/bin/varnish2

        #echo "Parant Servidor de Cache de l'entorn GW3"
        #start-stop-daemon --stop --quiet --pidfile "$VARNISH3PID" \
        #        --exec $VARNISH3
        #echo "Arrencant Servidor de Cache de l'entorn GW3"
        #/var/plone/genwebupcPreFEsNew/bin/varnish3

        #echo "Parant Servidor de Cache de l'entorn GW4"
        #start-stop-daemon --stop --quiet --pidfile "$VARNISH4PID" \
        #        --exec $VARNISH4
        #echo "Arrencant Servidor de Cache de l'entorn GW4"
        #/var/plone/genwebupcPreFEsNew/bin/varnish4

        #echo "Parant Servidor de Cache de l'entorn GW5"
        #start-stop-daemon --stop --quiet --pidfile "$VARNISH5PID" \
        #        --exec $VARNISH5
        #echo "Arrencant Servidor de Cache de l'entorn GW5"
        #/var/plone/genwebupcPreFEsNew/bin/varnish5

        #echo "Parant Servidor de Cache de l'entorn GW6"
        #start-stop-daemon --stop --quiet --pidfile "$VARNISH6PID" \
        #        --exec $VARNISH6
        #echo "Arrencant Servidor de Cache de l'entorn GW6"
        #/var/plone/genwebupcPreFEsNew/bin/varnish6

        echo "Parant Servidor de Cache de l'entorn GW7"
        start-stop-daemon --stop --quiet --pidfile "$VARNISH7PID" \
                --exec $VARNISH7
        echo "Arrencant Servidor de Cache de l'entorn GW7"
        /var/plone/genwebupcPreFEsNew/bin/varnish7

        echo "Parant Servidor de Cache de l'entorn GW8"
        start-stop-daemon --stop --quiet --pidfile "$VARNISH8PID" \
                --exec $VARNISH8
        echo "Arrencant Servidor de Cache de l'entorn GW8"
        /var/plone/genwebupcPreFEsNew/bin/varnish8

        #echo "Parant Servidor de Cache de l'entorn GW9"
        #start-stop-daemon --stop --quiet --pidfile "$VARNISH9PID" \
        #        --exec $VARNISH9
        #echo "Arrencant Servidor de Cache de l'entorn GW9"
        #/var/plone/genwebupcPreFEsNew/bin/varnish9

        #echo "Parant Servidor de Cache de l'entorn GW10"
        #start-stop-daemon --stop --quiet --pidfile "$VARNISH10PID" \
        #        --exec $VARNISH10
        #echo "Arrencant Servidor de Cache de l'entorn GW10"
        #/var/plone/genwebupcPreFEsNew/bin/varnish10

        #echo "Parant Servidor de Cache de l'entorn GW11"
        #start-stop-daemon --stop --quiet --pidfile "$VARNISH11PID" \
        #        --exec $VARNISH11
        #echo "Arrencant Servidor de Cache de l'entorn GW11"
        #/var/plone/genwebupcPreFEsNew/bin/varnish11

        #echo "Parant Servidor de Cache de l'entorn GW12"
        #start-stop-daemon --stop --quiet --pidfile "$VARNISH12PID" \
        #        --exec $VARNISH12
        #echo "Arrencant Servidor de Cache de l'entorn GW12"
        #/var/plone/genwebupcPreFEsNew/bin/varnish12

;;
'nginxrestart')
        #echo "Parant el servidor de recursos estatics"
        #$NGINX -c $NGINXCONF -s stop
        #echo arrencant el servidor de recursos estatics
        #$NGINX -c $NGINXCONF
;;
*)
    echo "Usage: /etc/init.d/genwebupcPreFEsNew { start | stop }"
    ;;
esac 
exit 0
