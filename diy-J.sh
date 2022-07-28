#!/bin/bash

#获取目录
CURRENT_DIR=$(cd $(dirname $0); pwd)
#名称修改
sed -i 's/TVBox/极影视/g' $CURRENT_DIR/TVBoxOSC/app/src/main/res/values/strings.xml
#背景修改
mv $CURRENT_DIR/DIY/app_bg.png $CURRENT_DIR/TVBoxOSC/app/src/main/res/drawable/app_bg.png


#进入目录
num=$(find $CURRENT_DIR -name gradlew  | awk -F"/" '{print NF-1}')
DIR=$(find $CURRENT_DIR -name gradlew  | cut -d \/ -f$num)
cd $DIR

echo 'DIY end'
