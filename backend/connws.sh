#!/bin/bash
while (true) do
/root/fw1/fw1-loggrabber -c /root/fw1/screendump.conf -l /root/fw1/leanew.conf 2>/dev/nul | uniq -w6|awk '{print $1"\n"$2}' | xargs -n1 'geoiplookup' | awk -F", " '{print $7,$8}' | xargs -n2 | awk '{ print $1,$2 }' | xargs -n 4| awk '{print "{\"src\": [\""$1"\", \""$2"\"],\"dst\": [\""$3"\", \""$4"\"]}"}'
done
