#!/bin/bash

line="@reboot /home/pi/sonatype/nexus-*/bin/nexus start"
(crontab -u pi -l; echo "$line" ) | crontab -u pi -
