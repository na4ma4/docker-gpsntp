#!/bin/bash

rm /dev/ttyAMA0 /dev/pps0

ln -s /host/dev/ttyAMA0 /dev/ttyAMA0
ln -s /host/dev/pps0 /dev/pps0
ln -s /host/dev/gps* /dev/

/sbin/syslogd -S -O - -n &

exec /usr/sbin/gpsd -N -n -r -G -D ${DEBUG_LEVEL:-0} --sockfile /run/gpsd.sock ${GPS_DEVICE} --
