#!/bin/bash
ENVIRONMENT=$1
if [ $ENVIRONMENT = "QA" ];then
for i in 'cat IPs'
do
  echo "Deploying war file into $i QA server.."
  sleep 3
  sshpass -p 'priya' scp target/ola.war priya@$i:/home/priya/softwares/apache-tomcat-7.0.88/webapps
  echo "starting tomcat server in $i QA server.."
  sshpass -p 'priya' ssh priya@$i "JAVA_HOME=/home/priya/softwares/jdk1.8.0_172" "/home/priya/softwares/apache-tomcat-7.0.88/bin/./startup.sh"
done
 echo "deploy success"
fi
