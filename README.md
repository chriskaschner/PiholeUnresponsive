# PiholeUnresponsive
What to do when SSH and Admin console die on Pihole

My RaspberryPi running pihole will continue working but the admin console and SSH will die after a few hours of uptime.

This is a simple script to check if that happens every 5 minutes using cron and reboots the Pi if it does.

## Installation
1. Create/ Copy UnresponsiveBoot.sh to /usr/local/bin/PiholeLogs/ (or wherever you prefer)
2. run `chmod +x /usr/local/bin/PiholeLogs/UnresponsiveBoot.sh` to make it executable
3. Edit cronjobs with `crontab -e`
4. Add the line `*/5 * * * * /usr/bin/sudo -H /usr/local/bin/PiholeLogs/UnresponsiveReboot.sh >> /dev/null 2>&1`
5. Check to see that cron is working by looking in syslog `nano /var/log/syslog`

## Further Links
* [Make .sh files executable](https://askubuntu.com/questions/38661/how-do-i-run-sh-files)
* [Read http response codes in shell scripts](https://stackoverflow.com/questions/2220301/how-to-evaluate-http-response-codes-from-bash-shell-script)
* [Finding syslogs on RaspberryPi](https://www.raspberrypi.org/forums/viewtopic.php?t=186833)
* [crontab editing and unresponsive shell script for wifi](http://weworkweplay.com/play/rebooting-the-raspberry-pi-when-it-loses-wireless-connection-wifi/)
* 
