#!/bin/sh

TMP=/dev/var/tmp;
CACHEPATH=$TMP/cache;
CODE_CACHEPATH=$TMP/code_cache;

LISTPATH=/data/app.list
  if [ ! -f "$CODE_CACHE" ];then
  touch /data/app.list
  fi

for APKNAME in  $(cat $LISTPATH)
do
 DATAPATH=/data/data
 APKPATH=$DATAPATH/$APKNAME
 CACHE=$APKPATH/cache
 CODE_CACHE=$APKPATH/code_cache
 if [ -d "$APKPATH" ];then

  if [ ! -d "$CACHE" ];then
  mkdir $CACHE
  fi

  if [ ! -d "$CODE_CACHE" ];then
  mkdir $CODE_CACHE
  fi

  mountpoint -q $CACHE
  mountflag=$?

  if [ $mountflag != 0 ];then
   chmod 0777 $CACHE
   chmod 0777 $CODE_CACHE
   rm -rf $CACHE/*
   rm -rf $CODE_CACHE/*
   echo $(date) $APKNAME"未挂载,现在执行挂载"
   mount --bind $CACHEPATH $CACHE
   mount --bind $CODE_CACHEPATH $CODE_CACHE
   mountpoint -q $CACHE
   mountflag=$?

   if [ $mountflag != 0 ];then
    echo $(date) $APKNAME"挂载失败"
    #退出
    #exit 1
   fi

  else
   rm -rf $CACHE/*
   rm -rf $CODE_CACHE/*
   echo $(date) $APKNAME"已挂载"

  fi

 fi

done


