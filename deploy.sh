#!/bin/bash
ENVIRONMENT=$1
if [ $ENVIRONMENT = "QA" ];then
for i in `cat ip.txt`
do
  echo "Deploying war file into $i QA server.."
  sleep 3
  sshpass -p "priya1@" scp target/ola.war priya@$i:/home/priya/apache-tomcat-8.5.32/webapps
  echo "starting tomcat server in $i QA server.."
  sshpass -p "priya1@" ssh priya@$i "JAVA_HOME=/home/priya/jdk1.8.0_172" "/home/priya/apache-tomcat-8.5.32/bin/./startup.sh"
done
 echo "deploy success"
fi
