#!/bin/bash

#获取目录
CURRENT_DIR=$(cd $(dirname $0); pwd)
num=$(find $CURRENT_DIR -name gradlew  | awk -F"/" '{print NF-1}')
DIR=$(find $CURRENT_DIR -name gradlew  | cut -d \/ -f$num)
cd $DIR
#名称修改
sed -i 's/TVBox/极影视/g' $CURRENT_DIR/$DIR/app/src/main/res/values/strings.xml
#背景修改
mv $CURRENT_DIR/DIY/app_bg.png $CURRENT_DIR/$DIR/app/src/main/res/drawable/app_bg.png
#取消选集全屏
sed -i 's/if (showPreview \&\& !fullWindows) toggleFullPreview/\/\/if (showPreview \&\& !fullWindows) toggleFullPreview/g' $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/ui/activity/DetailActivity.java
#缩略图清晰度修改
sed -i 's/mContext, 400/mContext, 500/g' $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/ui/activity/DetailActivity.java
sed -i 's/mContext, 300/mContext, 400/g' $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/ui/activity/DetailActivity.java
sed -i 's/mContext, 400/mContext, 500/g' $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/ui/adapter/GridAdapter.java
sed -i 's/mContext, 300/mContext, 400/g' $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/ui/adapter/GridAdapter.java
sed -i 's/mContext, 400/mContext, 500/g' $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/ui/adapter/HistoryAdapter.java
sed -i 's/mContext, 300/mContext, 400/g' $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/ui/adapter/HistoryAdapter.java
#添加网速显示
#mv $CURRENT_DIR/DIY/BaseController.java $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/player/controller/BaseController.java
#mv $CURRENT_DIR/DIY/player_vod_control_view.xml $CURRENT_DIR/$DIR//app/src/main/res/layout/player_vod_control_view.xml
#mv $CURRENT_DIR/DIY/player_live_control_view.xml $CURRENT_DIR/$DIR//app/src/main/res/layout/player_live_control_view.xml

echo 'DIY end'
