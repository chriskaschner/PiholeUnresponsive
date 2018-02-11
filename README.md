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

## Example of syslog during issue
```
Feb 10 22:23:44 pihole systemd[432]: Listening on GnuPG cryptographic agent and passphrase cache.
Feb 10 22:23:44 pihole systemd[432]: Reached target Sockets.
Feb 10 22:23:44 pihole systemd[432]: Reached target Paths.
Feb 10 22:23:44 pihole systemd[432]: Reached target Basic System.
Feb 10 22:23:44 pihole systemd[432]: Reached target Default.
Feb 10 22:23:44 pihole systemd[432]: Startup finished in 1.064s.
Feb 10 22:23:44 pihole systemd[1]: Started User Manager for UID 999.
Feb 10 22:23:45 pihole pihole-FTL[227]: FTL started!
Feb 10 22:23:45 pihole systemd[1]: Started LSB: pihole-FTL daemon.
Feb 10 22:23:46 pihole systemd[1]: Started dnsmasq - A lightweight DHCP and caching DNS server.
Feb 10 22:23:46 pihole systemd[1]: Reached target Host and Network Name Lookups.
Feb 10 22:23:47 pihole systemd[1]: Started Lighttpd Daemon.
Feb 10 22:23:47 pihole dhcpcd[414]: enxb827eb224b53: no IPv6 Routers available
Feb 11 08:38:44 pihole systemd[432]: Time has been changed
Feb 11 08:38:44 pihole systemd[1]: Time has been changed
Feb 11 08:38:44 pihole systemd[1]: apt-daily.timer: Adding 4h 27min 52.572313s random time.
Feb 11 08:38:44 pihole systemd[1]: apt-daily-upgrade.timer: Adding 12min 35.889813s random time.
Feb 11 08:38:44 pihole systemd-timesyncd[203]: Synchronized to time server 45.33.84.208:123 (2.debian.pool.ntp.org).
Feb 11 08:38:44 pihole systemd[1]: Reached target Network is Online.
```
