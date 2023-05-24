#!/bin/sh

VALUE=1500

for PATH in /sys/class/net/*
do
echo $VALUE > $PATH/mtu
echo $PATH
cat  $PATH/mtu
done