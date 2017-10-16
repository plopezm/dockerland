FROM openjdk:8-jre-alpine
MAINTAINER Pablo López Martínez

ENV DERBY_VERSION db-derby-10.13.1.1
ENV DERBY_URL http://apache.uvigo.es//db/derby/${DERBY_VERSION}/${DERBY_VERSION}-bin.zip

ENV ADMIN sa
ENV ADMIN_PASS sa
ENV INSTALL_DIR /etc/derby
ENV DATABASES_FOLDER /storage

RUN apk update && \
	apk add curl && \
	apk add unzip && \
	curl -O ${DERBY_URL} && \
	apk del curl && \
	mkdir ${INSTALL_DIR} && \
	unzip ${DERBY_VERSION}-bin.zip -d ${INSTALL_DIR} && \
	apk del unzip && \
	rm ${DERBY_VERSION}-bin.zip && \
	echo "derby.authentication.provider=BUILTIN" > ${INSTALL_DIR}/${DERBY_VERSION}-bin/bin/derby.properties && \
	echo "derby.user.${USER}" > ${INSTALL_DIR}/${DERBY_VERSION}-bin/bin/derby.properties && \
	echo "derby.user.${ADMIN}=${ADMIN_PASS}" > ${INSTALL_DIR}/${DERBY_VERSION}-bin/bin/derby.properties
	
WORKDIR ${DATABASES_FOLDER}
VOLUME ${DATABASES_FOLDER}
EXPOSE 1527
	
ENTRYPOINT ${INSTALL_DIR}/${DERBY_VERSION}-bin/bin/startNetworkServer -h 0.0.0.0
	


	

	

