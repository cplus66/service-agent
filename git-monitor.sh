#!/bin/bash

TO=cplus.shen@gmail.com
SUBJECT="Git Out of service"
SERVICE_HOME=/home/cplus/service-agent

OUTPUT=/dev/null
exec &> >(tee -a "$OUTPUT")
date
echo

docker ps | grep gitweb
if [ $? -ne 0 ]; then
  BODY="$(date)"
  $SERVICE_HOME/aws-ses-sendmail.sh $TO "${SUBJECT}" "${BODY}"
fi
