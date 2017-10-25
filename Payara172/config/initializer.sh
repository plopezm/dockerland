#!/bin/bash

#Example initializer

POOL_NAME=ANEMPool 
DATASOURCE_NAME=anem
DATASOURCE_CLASS_NAME=org.apache.derby.jdbc.ClientConnectionPoolDataSource
DATASOURCE_USER=sa
DATASOURCE_PASS=sa
DB_SERVER_NAME=192.168.99.100
DB_SERVER_PORT=1527
DATABASE_NAME=anemdb
CONNECTION_ATTRIBUTES=\;create\\=true

AUTH_POOL_NAME=AUTHPool 
AUTH_DATASOURCE_NAME=auth
AUTH_DATABASE_NAME=authdb


$PAYARA_PATH/bin/asadmin start-domain $PAYARA_DOMAIN
$PAYARA_PATH/bin/asadmin --user admin --passwordfile /opt/pwdfile create-jdbc-connection-pool --datasourceclassname $DATASOURCE_CLASS_NAME --restype javax.sql.DataSource --isolationlevel read-committed --property user=$DATASOURCE_USER:password=$DATASOURCE_PASS:DatabaseName=$DATABASE_NAME:ServerName=$DB_SERVER_NAME:port=$DB_SERVER_PORT:connectionAttributes=$CONNECTION_ATTRIBUTES $POOL_NAME
$PAYARA_PATH/bin/asadmin --user admin --passwordfile /opt/pwdfile create-jdbc-resource --connectionpoolid $POOL_NAME jdbc/$DATASOURCE_NAME
$PAYARA_PATH/bin/asadmin --user admin --passwordfile /opt/pwdfile create-jdbc-connection-pool --datasourceclassname $DATASOURCE_CLASS_NAME --restype javax.sql.DataSource --isolationlevel read-committed --property user=$DATASOURCE_USER:password=$DATASOURCE_PASS:DatabaseName=$AUTH_DATABASE_NAME:ServerName=$DB_SERVER_NAME:port=$DB_SERVER_PORT:connectionAttributes=$CONNECTION_ATTRIBUTES $AUTH_POOL_NAME
$PAYARA_PATH/bin/asadmin --user admin --passwordfile /opt/pwdfile create-jdbc-resource --connectionpoolid $AUTH_POOL_NAME jdbc/$AUTH_DATASOURCE_NAME
$PAYARA_PATH/bin/asadmin stop-domain $PAYARA_DOMAIN