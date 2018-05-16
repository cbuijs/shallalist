#!/bin/bash

cd /opt/shallalist

rm -f /tmp/shalla.tgz
wget -4 "http://www.shallalist.de/Downloads/shallalist.tar.gz" -O /tmp/shalla.tgz

git rm -r .
tar --strip-components=1 -zxvf /tmp/shalla.tgz -C /opt/shallalist
find -type l -delete

DATE=`date +%Y%m%d-%H%M%S`
echo "${DATE}" > last.updated
git add .
git commit -m "Update List ${DATE}"
git push origin master

exit 0

