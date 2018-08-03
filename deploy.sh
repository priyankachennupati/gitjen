#!/bin/bash
ENVIRONMENT=$1
if [ $ENVIRONMENT = "QA" ];then
for i in `cat ip.txt`
do
  echo "Deploying war file into $i QA server.."
  sleep 3
  sshpass -p "priya" scp target/ola.war priya@$i:/home/priya/softwares/apache-tomcat-8.5.32/webapps
  echo "starting tomcat server in $i QA server.."
  sshpass -p "priya" ssh priya@$i "JAVA_HOME=/home/priya/softwares/jdk1.8.0_172" "/home/priya/softwares/apache-tomcat-8.5.32/bin/./startup.sh"
done
 echo "deploy success"
fi
