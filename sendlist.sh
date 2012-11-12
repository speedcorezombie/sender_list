#!/bin/bash


if [ "$1" == "queue" ]
then
        echo "------------------------------------------"
        echo "|       Current queue top senders:       |"
        echo "------------------------------------------"
        /usr/sbin/exiqgrep -b| awk '{print $3}'| grep -v "<>" |awk -F"<" '{print $2}' | awk -F">" '{print $1}'| sort | uniq -c | sort -nr | head -n20
else
        echo "------------------------------------------"
        echo "|           Today top senders:           |"
        echo "------------------------------------------"
        grep "<=" /var/log/exim_mainlog | grep `date +%F`  | awk '{print $5}'| grep -v "<>" | sort | uniq -c | sort -rn| head -n20
fi

