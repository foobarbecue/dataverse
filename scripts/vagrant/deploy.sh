#!/bin/bash
echo "Deploying Dataverse 4.0 to Vagrant"
GLASSFISH_USER=glassfish
GLASSFISH_USER_HOME=~glassfish
SOLR_HOME=$GLASSFISH_USER_HOME/solr
su $GLASSFISH_USER -s /bin/sh -c "mkdir $SOLR_HOME"
su $GLASSFISH_USER -s /bin/sh -c "cp /downloads/solr-4.6.0.tgz $SOLR_HOME"
su $GLASSFISH_USER -s /bin/sh -c "cd $SOLR_HOME && tar xfz solr-4.6.0.tgz"
su $GLASSFISH_USER -s /bin/sh -c "cp /conf/solr/4.6.0/schema.xml $SOLR_HOME/solr-4.6.0/example/solr/collection1/conf/schema.xml"
su $GLASSFISH_USER -s /bin/sh -c "cd $SOLR_HOME/solr-4.6.0/example && java -jar start.jar &"

#su $GLASSFISH_USER -s /bin/sh -c "cp /builds/dataverse-4.0.war /home/glassfish/glassfish4/glassfish/domains/domain1/autodeploy"
cp /builds/dataverse-4.0.war /home/glassfish/glassfish4/glassfish/domains/domain1/autodeploy
sleep 60
cd /scripts/api
./datasetfields.sh
./setup-users.sh
./setup-dvs.sh
