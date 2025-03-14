#!/bin/bash -x
# Date: Mar 13, 2025
# Author: cplus.shen@gmail.com
# Description: Sendmail via AWS SES
#
# Usage: aws-ses-sendmail.sh <email> <subject> <body>


TO=$1
FROM=${TO}
SUBJECT=$2
BODY=$3

if [ $# -ne 3 ]; then
  echo "Usage: $0 <email> <subject> <body>"
  exit 1
fi
aws ses send-email \
    --from ${FROM} \
    --destination "ToAddresses=${TO}" \
    --message "Subject={Data='${SUBJECT}'},Body={Text={Data=This mail was sent with Amazon SES}}"

