#!/bin/bash

#Author: Lin F. Yang
#Email: lyang.thu __at__ gmail.com

#open the configure file, pull out the url
UPDATEURL="/mnt/us/extensions/FileSyncer/bin/tobeupdate.txt"
CONFFILE="/mnt/us/extensions/FileSyncer/bin/configure.ini"

#test
#UPDATEURL=./tobeupdate.txt
#CONFFILE=./configure.ini

url=`grep -v "^#" $CONFFILE | grep -v '^[[:space:]]*$'`

echo Retriving file list ...
curl -o $UPDATEURL $url

echo Start downloading ...

grep -v "^#" $UPDATEURL | grep -v '^[[:space:]]*$' | while read line;
do

src=`echo $line | cut -d " " -f 1`
des=`echo $line | cut -d " " -f 2`
ctr=`echo $line | cut -d " " -f 3`

echo Downloading $src to $des

if [ ! -z $ctr ]; then
    if [ $ctr != "-r" ]; then
        if [ ! -e $des ]; then
            curl -o $des $src
            echo "Downloaded."
        else
            echo "File exists, ignored!"
        fi
    else
        if [ -e $des ]; then
            outs="File exists, replaced!"
        else
            outs="Downloaded."
        fi
        curl -o $des $src
        echo $outs
    fi
else
    if [ ! -e $des ]; then
        curl -o $des $src
        echo "Downloaded."
    else
        echo "File exists, ignored!"
    fi
fi

done

echo Done.
