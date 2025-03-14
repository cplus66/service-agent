#!/bin/bash
# Date: Mar 14, 2025
# Author: cplus.shen@gmail.com
# Description: monitoring Docker git service

AGENT_HOME=$(dirname $0)
LOG=$AGENT_HOME/log/git.log
mkdir -p $AGENT_HOME/log
rm -f $LOG

TO=cplus.shen@gmail.com
SUBJECT='[service-agent] Git Out of service'

exec &> >(tee -a "$LOG")
date
echo

docker ps | grep gitweb
if [ $? -ne 0 ]; then
  BODY="$(cat $LOG)"
  $AGENT_HOME/aws-ses-sendmail.sh $TO "${SUBJECT}" "${BODY}"
fi
