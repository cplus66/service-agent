#!/bin/bash

TO=cplus.shen@gmail.com
SUBJECT="Git Out of service"
SERVICE_HOME=/home/cplus/service-agent

docker ps | grep gitweb
if [ $? -ne 0 ]; then
  BODY="$(date)"
  $SERVICE_HOME/aws-ses-sendmail.sh $TO "${SUBJECT}" "${BODY}"
fi
