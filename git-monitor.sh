#!/bin/bash
# Date: Mar 14, 2025
# Author: cplus.shen@gmail.com
# Description: monitoring Docker git service

SERVICE_HOME=$(dirname $0)
LOG=$SERVICE_HOME/log/git.log
mkdir -p $SERVICE_HOME/log

TO=cplus.shen@gmail.com
SUBJECT="Git Out of service"

exec &> >(tee -a "$LOG")
date
echo

docker ps | grep gitweb
if [ $? -ne 0 ]; then
  BODY="$(date)"
  $SERVICE_HOME/aws-ses-sendmail.sh $TO "${SUBJECT}" "${BODY}"
fi
