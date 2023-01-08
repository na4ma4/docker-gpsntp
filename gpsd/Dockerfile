# FROM ubuntu:jammy

# # RUN adduser -S -u 100 -G dialout gpsd && adduser gpsd tty

# RUN apt-get update \
#  && apt-get install --quiet --yes --no-install-recommends \
#    gpsd gpsd-clients \
#  && apt-get remove needrestart snapd cloud-init \
#  && apt-get clean \
#  && rm -rf /var/lib/apt/lists/*

# # capture output of gpsd to logging via syslogd
# ARG GPS_DEVICE
# ARG DEBUG_LEVEL=5

# COPY init.sh /init.sh

# ENTRYPOINT ["/init.sh"]

FROM alpine:3.17

RUN adduser -S -u 100 -G dialout gpsd && adduser gpsd tty

RUN apk add --no-cache \
    'bash' \
    'gpsd=3.24-r0' \
    'gpsd-clients=3.24-r0'

# capture output of gpsd to logging via syslogd
ARG GPS_DEVICE
ARG DEBUG_LEVEL=5

COPY init.sh /init.sh

ENTRYPOINT ["/init.sh"]
