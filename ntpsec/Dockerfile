# FROM alpine:3.17

# RUN apk add --no-cache \
#     'ntpsec=1.2.1-r6'

# COPY ntp.conf /etc/ntpsec/ntp.conf

# VOLUME [ "/var/log/ntpsec" ]

# RUN mkdir /var/log/ntpsec && chown ntp:ntp /var/log/ntpsec

# CMD [ "/usr/sbin/ntpd", "-g", "-N", "-G", "-n", "-c", "/etc/ntpsec/ntp.conf" ]

FROM ubuntu:jammy

RUN apt-get update \
 && apt-get install --quiet --yes --no-install-recommends \
   ntpsec ntpstat \
 && apt-get remove needrestart snapd cloud-init \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY ntp.conf /etc/ntpsec/ntp.conf
COPY init.sh /init.sh

VOLUME [ "/var/log/ntpsec" ]

RUN mkdir /var/log/ntpsec && chown ntpsec:ntpsec /var/log/ntpsec

ENTRYPOINT [ "/init.sh" ]

CMD [ "/usr/sbin/ntpd", "-g", "-N", "-n", "-c", "/etc/ntpsec/ntp.conf" ]
