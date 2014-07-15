#!/bin/bash
### Change the date using yyyy-mm-dd to the day you want to count down to ###
echo $((($(date +%s -d "2013-06-22") - $(date +%s -d now ))/86400))
