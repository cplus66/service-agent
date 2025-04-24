#!/bin/bash
# Date: Mar 14, 2025
# Author: cplus.shen@gmail.com
# Description: monitoring web services

AGENT_HOME=$(dirname $0)
LOG=$AGENT_HOME/log/webservice.log
mkdir -p $AGENT_HOME/log
rm -f $LOG

TO=cplus.shen@gmail.com
SUBJECT='[service-agent] Out of web services'
RET=0

# Gitweb
# Jenkins
# tftp
# Twiki

LIST="
http://172.17.4.253:8081/
http://172.17.4.253:8082/
http://172.17.5.219:8080/login
http://172.17.22.195/tftp/
http://172.17.22.238/cgi-bin/twiki/view/Main/WebHome
https://172.17.4.45:5000/account/sign-in
http://172.17.4.45:8080/login
"

exec &> >(tee -a "$LOG")
date
echo

for i in $LIST; do
  curl -s --head --insecure --request GET $i | grep "200 OK" > /dev/null
  if [ $? -ne 0 ]; then
    echo "ERR,$i"
    RET=1
  fi
done

if [ $RET -eq 1 ]; then
  BODY="$(cat $LOG)"
  $AGENT_HOME/aws-ses-sendmail.sh $TO "${SUBJECT}" "${BODY}"
fi
