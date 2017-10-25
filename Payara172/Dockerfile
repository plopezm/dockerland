FROM payara/server-full:172
MAINTAINER Pablo López Martínez <pabloplm@gmail.com>

ENV AUTODEPLOY_PATH ${PAYARA_PATH}/glassfish/domains/${PAYARA_DOMAIN}/autodeploy/
#ENV AUTH_SERVICE_URL http://192.168.99.100:8080/auth/api/v1/

COPY config/initializer.sh .
RUN /bin/bash initializer.sh
COPY deployables/ ${AUTODEPLOY_PATH}