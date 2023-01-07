FROM alpine:3.17

RUN adduser -S -u 100 -G dialout gpsd && adduser gpsd tty

RUN apk add --no-cache \
    'gpsd=3.24-r0' \
    'gpsd-clients=3.24-r0'

# capture output of gpsd to logging via syslogd
ARG GPS_DEVICE
ARG DEBUG_LEVEL=5

COPY init.sh /init.sh

ENTRYPOINT ["/init.sh"]
