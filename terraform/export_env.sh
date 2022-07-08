#! /bin/bash
terraform output -json | jq -r '@sh "export JENKINS_IP=\(.jenkins_ip.value)\nexport WEB_IP=\(.web_ip.value)\nexport WEB_PRIV_IP=\(.web_priv_ip.value)"' > env.sh
source ./env.sh
echo $JENKINS_IP 
echo $WEB_IP 
echo $WEB_PRIV_IP
