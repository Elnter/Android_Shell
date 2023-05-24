#!/data/adb/magisk/busybox sh
set -o standalone

#
# mkdir Tmpfs cache
#

ENVPATH=/dev/var
MODDIR=${0%/*}

if [ ! -d "$ENVPATH" ];then
mkdir "$ENVPATH";
mkdir "$ENVPATH/run";
mkdir "$ENVPATH/log";
mkdir "$ENVPATH/cache";
mkdir "$ENVPATH/tmp";
fi;

TMP=$ENVPATH/tmp;
CACHEPATH=$TMP/cache;
CODE_CACHEPATH=$TMP/code_cache;

mkdir $CACHEPATH;
chcon -R u:object_r:app_data_file:s0 $CACHEPATH;
chmod -R 0777 $CACHEPATH

mkdir $CODE_CACHEPATH;
chcon -R u:object_r:app_data_file:s0 $CODE_CACHEPATH;
chmod -R 0777 $CODE_CACHEPATH;

chmod 0755 $MODDIR/system/bin/*