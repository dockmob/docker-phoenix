#!/bin/bash

HBASE_VERSION=1.0
VERSION=4.5.2

if [ ! -f "phoenix-${VERSION}-HBase-${HBASE_VERSION}-bin.tar.gz" ]; then
    wget http://archive.eu.apache.org/dist/phoenix/phoenix-${VERSION}-HBase-${HBASE_VERSION}/bin/phoenix-${VERSION}-HBase-${HBASE_VERSION}-bin.tar.gz
fi

tar -xzf phoenix-${VERSION}-HBase-${HBASE_VERSION}-bin.tar.gz -C /usr/lib/
ln -s /usr/lib/phoenix-4.5.2-HBase-1.0-bin /usr/lib/phoenix

cp /usr/lib/phoenix/phoenix-server-${VERSION}-HBase-${HBASE_VERSION}.jar /usr/lib/hbase/lib/
cp /usr/lib/phoenix/phoenix-core-${VERSION}-HBase-${HBASE_VERSION}.jar /usr/lib/hbase/lib/

# Replace the template
mv hbase-site.template /usr/lib/hbase/conf/

# Remove unnecessary files
rm -rf /usr/lib/phoenix/examples
find /usr/lib/phoenix/ -name "*tests.jar" | xargs rm -rf
find /usr/lib/phoenix/ -name "*sources.jar" | xargs rm -rf
find /usr/lib/phoenix/ -name "*flume*.jar" | xargs rm -rf
find /usr/lib/phoenix/ -name "*pherf*.jar" | xargs rm -rf
find /usr/lib/phoenix/ -name "*pig*.jar" | xargs rm -rf
find /usr/lib/phoenix/ -name "*spark*.jar" | xargs rm -rf
find /usr/lib/phoenix/ -name "*server*.jar" | xargs rm -rf
find /usr/lib/phoenix/ -name "*core*.jar" | xargs rm -rf
find /usr/lib/phoenix/ -name "*client-minimal.jar" | xargs rm -rf
find /usr/lib/phoenix/ -name "*client-without-hbase.jar" | xargs rm -rf
find /usr/lib/phoenix/ -name "*thin-client.jar" | xargs rm -rf

# Remove archive
rm -rf /phoenix-setup/*.gz
