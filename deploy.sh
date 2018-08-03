#!/bin/bash
ENVIRONMENT=$i
if [ $ENVIRONMENT = "QA" ]
then
for i in 'cat IPs txt'
do
  echo "Deploying war file into $i QA server.."
  sleep 3
  sshpass -p "priya1@" scp target/ola.war priya@$i:/home/priya/apache-tomcat-7.0.88/webapps
  echo "starting tomcat server in $i QA server.."
  sshpass -p "priya1@" ssh priya@$i "JAVA_HOME=/home/priya/jdk1.8.0_172" "/home/priya/apache-tomcat-7.0.88/bin/./startup.sh"
done
 echo "deploy success"
