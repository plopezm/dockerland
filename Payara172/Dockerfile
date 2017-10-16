FROM payara/server-full:172
MAINTAINER Pablo López Martínez <pabloplm@gmail.com>

ENV POOL_NAME AppPool
ENV DATASOURCE_CLASS_NAME org.apache.derby.jdbc.ClientConnectionPoolDataSource 
ENV DATASOURCE_NAME App
ENV DATASOURCE_USER sa
ENV DATASOURCE_PASS sa
ENV SERVER_NAME 192.168.99.100
ENV SERVER_PORT 1527
ENV DATABASE_NAME testdb
ENV CONNECTION_ATTRIBUTES \;create\\=true

ENV AUTODEPLOY_PATH ${PAYARA_PATH}/glassfish/domains/${PAYARA_DOMAIN}/autodeploy/

RUN ${PAYARA_PATH}/bin/asadmin start-domain ${PAYARA_DOMAIN} && \
	${PAYARA_PATH}/bin/asadmin --user admin --passwordfile /opt/pwdfile create-jdbc-connection-pool --datasourceclassname ${DATASOURCE_CLASS_NAME} --restype javax.sql.DataSource --isolationlevel read-committed --property user=${DATASOURCE_USER}:password=${DATASOURCE_PASS}:DatabaseName=${DATABASE_NAME}:ServerName=${SERVER_NAME}:port=${SERVER_PORT}:connectionAttributes=${CONNECTION_ATTRIBUTES} jdbc/connection-pool/${POOL_NAME} && \
	${PAYARA_PATH}/bin/asadmin --user admin --passwordfile /opt/pwdfile create-jdbc-resource --connectionpoolid jdbc/connection-pool/${POOL_NAME} jdbc/resource/${DATASOURCE_NAME} && \
	${PAYARA_PATH}/bin/asadmin stop-domain ${PAYARA_DOMAIN}
	
	