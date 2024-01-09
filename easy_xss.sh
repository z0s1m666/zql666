#!/bin/bash
# 测试初级脚本
# ./easy_xss.sh 根域名 厂商名（英文）
mkdir $2;cd $2;
waybackurls $1 | sort -u >> $2.urls.txt;
gau $1 | sort -u >> $2.urls.txt;
katana -u https://$1 | tee -a $2.urls.txt;
paramspider -d $1;
mv /root/$2/results/$1.txt /root/$2/;
cat $1.txt | sort -u >> $2.urls.txt;
cat $2.urls.txt | sort -u >> $2.url.txt;
rm $2.urls.txt;

cat $2.url.txt | grep '=' | kxss | tee easy_kxss.out;