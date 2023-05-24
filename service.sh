#!/data/adb/magisk/busybox sh
set -o standalone

#
# service init
# 
MODDIR=${0%/*}
sleep 30
. $MODDIR/system/bin/shell.daemon &