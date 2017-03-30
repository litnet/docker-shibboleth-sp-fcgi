#!/bin/bash

SHIB_DIR="/etc/shibboleth"

if [ ! -d $SHIB_DIR ] || [ ! -f ${SHIB_DIR}/shibboleth2.xml  ]; then
   mkdir -p ${SHIB_DIR}
   cp -r ${SHIB_DIR}-orig/* ${SHIB_DIR}
fi

service shibd start
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf -n

