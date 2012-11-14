#!/bin/sh
# Arranc de l'stack de serveis del qual es composa el Pre Frontends del servei GenwebUPC
# Arrenca els seguents serveis: varnish-ro varnish-rw haproxy
#
# chkconfig: 2345 85 15
# description: Arranc de l'stack de serveis del qual es composa el Pre Frontends del servei GenwebUPC 

HAPROXY=/var/plone/genwebupcPreFEs/bin/haproxy
HAPROXYALPHAPID=/var/plone/genwebupcPreFEs/var/haproxyAlpha.pid
HAPROXYBETAPID=/var/plone/genwebupcPreFEs/var/haproxyBeta.pid
HAPROXYGAMMAPID=/var/plone/genwebupcPreFEs/var/haproxyGamma.pid
HAPROXYDELTAPID=/var/plone/genwebupcPreFEs/var/haproxyDelta.pid
HAPROXYALPHACONF=/var/plone/genwebupcPreFEs/production/balancerAlpha.conf
HAPROXYBETACONF=/var/plone/genwebupcPreFEs/production/balancerBeta.conf
HAPROXYGAMMACONF=/var/plone/genwebupcPreFEs/production/balancerGamma.conf
HAPROXYDELTACONF=/var/plone/genwebupcPreFEs/production/balancerDelta.conf

VARNISHALPHA=/var/plone/genwebupcPreFEs/parts/varnish-alpha-build/sbin/varnishd
VARNISHBETA=/var/plone/genwebupcPreFEs/parts/varnish-beta-build/sbin/varnishd
VARNISHGAMMA=/var/plone/genwebupcPreFEs/parts/varnish-gamma-build/sbin/varnishd
VARNISHDELTA=/var/plone/genwebupcPreFEs/parts/varnish-delta-build/sbin/varnishd
VARNISHALPHAPID=/var/plone/genwebupcPreFEs/parts/varnish-alpha/varnish.pid
VARNISHBETAPID=/var/plone/genwebupcPreFEs/parts/varnish-beta/varnish.pid
VARNISHGAMMAPID=/var/plone/genwebupcPreFEs/parts/varnish-gamma/varnish.pid
VARNISHDELTAPID=/var/plone/genwebupcPreFEs/parts/varnish-delta/varnish.pid

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
        echo "Arrencant Balancejador de l'entorn GW Alpha"
        start-stop-daemon --start --quiet --pidfile "$HAPROXYALPHAPID" \
                --exec $HAPROXY -- -f "$HAPROXYALPHACONF" -D -p "$HAPROXYALPHAPID"
        echo "Arrencant Balancejador de l'entorn GW Beta"
        start-stop-daemon --start --quiet --pidfile "$HAPROXYBETAPID" \
                --exec $HAPROXY -- -f "$HAPROXYBETACONF" -D -p "$HAPROXYBETAPID"
        echo "Arrencant Balancejador de l'entorn GW Gamma"
        start-stop-daemon --start --quiet --pidfile "$HAPROXYGAMMAPID" \
                --exec $HAPROXY -- -f "$HAPROXYGAMMACONF" -D -p "$HAPROXYGAMMAPID"
        echo "Arrencant Balancejador de l'entorn GW Delta"
        start-stop-daemon --start --quiet --pidfile "$HAPROXYDELTAPID" \
                --exec $HAPROXY -- -f "$HAPROXYDELTACONF" -D -p "$HAPROXYDELTAPID"

        echo "Arrencant Servidor de Cache de l'entorn Alpha"
        /var/plone/genwebupcPreFEs/bin/varnish-alpha
        echo "Arrencant Servidor de Cache de l'entorn Beta"
        /var/plone/genwebupcPreFEs/bin/varnish-beta
        echo "Arrencant Servidor de Cache de l'entorn Gamma"
        /var/plone/genwebupcPreFEs/bin/varnish-gamma
        echo "Arrencant Servidor de Cache de l'entorn Delta"
        /var/plone/genwebupcPreFEs/bin/varnish-delta

    ;;
'stop')
        echo "Parant Balancejador de l'entorn Alpha"
        #haproxy_stop
        start-stop-daemon --stop --quiet --pidfile "$HAPROXYALPHAPID"
        echo "Parant Balancejador de l'entorn Beta"
        start-stop-daemon --stop --quiet --pidfile "$HAPROXYBETAPID"
        echo "Parant Balancejador de l'entorn Gamma"
        start-stop-daemon --stop --quiet --pidfile "$HAPROXYGAMMAPID"
        echo "Parant Balancejador de l'entorn Delta"
        start-stop-daemon --stop --quiet --pidfile "$HAPROXYDELTAPID"
        echo "Parant Servidor de Cache de l'entorn Alpha"
        start-stop-daemon --stop --quiet --pidfile "$VARNISHALPHAPID" \
                --exec $VARNISHALPHA
        echo "Parant Servidor de Cache de l'entorn Beta"
        start-stop-daemon --stop --quiet --pidfile "$VARNISHBETAPID" \
                --exec $VARNISHBETA
        echo "Parant Servidor de Cache de l'entorn Gamma"
        start-stop-daemon --stop --quiet --pidfile "$VARNISHGAMMAPID" \
                --exec $VARNISHGAMMA
        echo "Parant Servidor de Cache de l'entorn Delta"
        start-stop-daemon --stop --quiet --pidfile "$VARNISHDELTAPID" \
                --exec $VARNISHDELTA
;;
'haproxyrestart')
        echo "Parant Balancejador de l'entorn Alpha"
        start-stop-daemon --stop --quiet --pidfile "$HAPROXYALPHAPID"
        echo "Arrencant Balancejador de l'entorn GW Alpha"
        start-stop-daemon --start --quiet --pidfile "$HAPROXYALPHAPID" \
                --exec $HAPROXY -- -f "$HAPROXYALPHACONF" -D -p "$HAPROXYALPHAPID"
        echo "Parant Balancejador de l'entorn Beta"
        start-stop-daemon --stop --quiet --pidfile "$HAPROXYBETAPID"
        echo "Arrencant Balancejador de l'entorn GW Beta"
        start-stop-daemon --start --quiet --pidfile "$HAPROXYBETAPID" \
                --exec $HAPROXY -- -f "$HAPROXYBETACONF" -D -p "$HAPROXYBETAPID"
        echo "Parant Balancejador de l'entorn Gamma"
        start-stop-daemon --stop --quiet --pidfile "$HAPROXYGAMMAPID"
        echo "Arrencant Balancejador de l'entorn GW Gamma"
        start-stop-daemon --start --quiet --pidfile "$HAPROXYGAMMAPID" \
                --exec $HAPROXY -- -f "$HAPROXYGAMMACONF" -D -p "$HAPROXYGAMMAPID"
        echo "Parant Balancejador de l'entorn Delta"
        start-stop-daemon --stop --quiet --pidfile "$HAPROXYDELTAPID"
        echo "Arrencant Balancejador de l'entorn GW Delta"
        start-stop-daemon --start --quiet --pidfile "$HAPROXYDELTAPID" \
                --exec $HAPROXY -- -f "$HAPROXYDELTACONF" -D -p "$HAPROXYDELTAPID"
;;

'varnishrestart')
        echo "Parant Servidor de Cache de l'entorn Alpha"
        start-stop-daemon --stop --quiet --pidfile "$VARNISHALPHAPID" \
                --exec $VARNISHALPHA
        echo "Arrencant Servidor de Cache de l'entorn Alpha"
        /var/plone/genwebupcPreFEs/bin/varnish-alpha
        echo "Parant Servidor de Cache de l'entorn Beta"
        start-stop-daemon --stop --quiet --pidfile "$VARNISHBETAPID" \
                --exec $VARNISHBETA
        echo "Arrencant Servidor de Cache de l'entorn Beta"
        /var/plone/genwebupcPreFEs/bin/varnish-beta
        echo "Parant Servidor de Cache de l'entorn Gamma"
        start-stop-daemon --stop --quiet --pidfile "$VARNISHGAMMAPID" \
                --exec $VARNISHGAMMA
        echo "Arrencant Servidor de Cache de l'entorn Gamma"
        /var/plone/genwebupcPreFEs/bin/varnish-gamma
        echo "Parant Servidor de Cache de l'entorn Delta"
        start-stop-daemon --stop --quiet --pidfile "$VARNISHDELTAPID" \
                --exec $VARNISHDELTA
        echo "Arrencant Servidor de Cache de l'entorn Delta"
        /var/plone/genwebupcPreFEs/bin/varnish-delta
;;
*)
    echo "Usage: /etc/init.d/zope { start | stop }"
    ;;
esac 
exit 0
