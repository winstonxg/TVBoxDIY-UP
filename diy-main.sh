#!/bin/bash

#获取目录
CURRENT_DIR=$(cd $(dirname $0); pwd)
#名称修改
sed -i 's/TVBox/极影视/g' $CURRENT_DIR/TVBoxOSC/app/src/main/res/values/strings.xml
#背景修改
mv $CURRENT_DIR/DIY/app_bg.png $CURRENT_DIR/TVBoxOSC/app/src/main/res/drawable/app_bg.png
#缩略图清晰度修改
sed -i 's/mContext, 400/mContext, 500/g' $CURRENT_DIR/TVBoxOSC/app/src/main/java/com/github/tvbox/osc/ui/activity/DetailActivity.java
sed -i 's/mContext, 300/mContext, 400/g' $CURRENT_DIR/TVBoxOSC/app/src/main/java/com/github/tvbox/osc/ui/activity/DetailActivity.java
sed -i 's/mContext, 400/mContext, 500/g' $CURRENT_DIR/TVBoxOSC/app/src/main/java/com/github/tvbox/osc/ui/adapter/GridAdapter.java
sed -i 's/mContext, 300/mContext, 400/g' $CURRENT_DIR/TVBoxOSC/app/src/main/java/com/github/tvbox/osc/ui/adapter/GridAdapter.java
sed -i 's/mContext, 400/mContext, 500/g' $CURRENT_DIR/TVBoxOSC/app/src/main/java/com/github/tvbox/osc/ui/adapter/HistoryAdapter.java
sed -i 's/mContext, 300/mContext, 400/g' $CURRENT_DIR/TVBoxOSC/app/src/main/java/com/github/tvbox/osc/ui/adapter/HistoryAdapter.java

echo 'DIY end'
