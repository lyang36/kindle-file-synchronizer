#!/bin/bash

#Author: Lin F. Yang
#Email: lyang.thu __at__ gmail.com

#open the configure file, pull out the url
url=`grep -v "^#" /mnt/us/extensions/FileSyncer/bin/configure.ini | grep -v '^[[:space:]]*$'`

echo Retriving file list ...
curl -o /mnt/us/extensions/FileSyncer/bin/tobeupdate.txt $url

echo Start downloading ...


grep -v "^#" /mnt/us/extensions/FileSyncer/bin/tobeupdate.txt | grep -v '^[[:space:]]*$' | while read line;
do

src=`echo $line | cut -d " " -f 1`
des=`echo $line | cut -d " " -f 2`
ctr=`echo $line | cut -d " " -f 3`

echo Downloading $src to $des

if [ ! -z $ctr ]; then
if [ $ctr != "-r" ]; then
if [ ! -a $des ]; then
curl -o $des $src
fi
fi
else
curl -o $des $src
fi

done

echo Done.
