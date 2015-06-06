#!/bin/sh
# this script updates configuration each time based on environment vars and
# ensure that all required folders are in place

j2 /root/btsync.conf.j2 > /etc/btsync.conf

cat /etc/btsync.conf

mkdir -p /btsync/.sync