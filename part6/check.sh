#!/bin/sh
# check.sh

old=`ls -l /etc/passwd`
new=`ls -l /etc/passwd`
while [ "$old" = "$new" ]
do
    new=`ls -l /etc/passwd`
    sleep 1
done

echo "STOP... The shadow file has been changed"

