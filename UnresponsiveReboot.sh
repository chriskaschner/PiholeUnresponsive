#!/bin/bash

# check if admin console is responsive
response=$(curl --write-out %{http_code} --silent --output /dev/null pihole.local)
# if it isn't, log it & reboot Pi
if [ $response != 200 ]
then
  echo "$(date "+%m%d%Y %T")" >> /usr/local/bin/PiholeLogs/UnresponsiveReboot.txt
  sudo /sbin/shutdown -r now
fi
