#!/bin/bash

#获取目录
CURRENT_DIR=$(cd $(dirname $0); pwd)
#名称修改
sed -i 's/TVBox/极影视/g' $CURRENT_DIR/TVBoxOSC/app/src/main/res/values/strings.xml
#图标修改
mv $CURRENT_DIR/DIY/app_icon.png $CURRENT_DIR/TVBoxOSC/app/src/main/res/drawable/app_icon.png
#背景修改
mv $CURRENT_DIR/DIY/app_bg.png $CURRENT_DIR/TVBoxOSC/app/src/main/res/drawable/app_bg.png
#缩略图清晰度修改
sed -i 's/mContext, 400/mContext, 500/g' $CURRENT_DIR/TVBoxOSC/app/src/main/java/com/github/tvbox/osc/ui/activity/DetailActivity.java
sed -i 's/mContext, 300/mContext, 400/g' $CURRENT_DIR/TVBoxOSC/app/src/main/java/com/github/tvbox/osc/ui/activity/DetailActivity.java
sed -i 's/mContext, 400/mContext, 500/g' $CURRENT_DIR/TVBoxOSC/app/src/main/java/com/github/tvbox/osc/ui/adapter/GridAdapter.java
sed -i 's/mContext, 300/mContext, 400/g' $CURRENT_DIR/TVBoxOSC/app/src/main/java/com/github/tvbox/osc/ui/adapter/GridAdapter.java
sed -i 's/mContext, 400/mContext, 500/g' $CURRENT_DIR/TVBoxOSC/app/src/main/java/com/github/tvbox/osc/ui/adapter/HistoryAdapter.java
sed -i 's/mContext, 300/mContext, 400/g' $CURRENT_DIR/TVBoxOSC/app/src/main/java/com/github/tvbox/osc/ui/adapter/HistoryAdapter.java
#删除详情页面语言
sed -i '/tvLang/d' $CURRENT_DIR/TVBoxOSC/app/src/main/java/com/github/tvbox/osc/ui/activity/DetailActivity.java
sed -i '/tvLang/d' $CURRENT_DIR/TVBoxOSC/app/src/main/java/com/github/tvbox/osc/ui/adapter/CollectAdapter.java
lg1=$(sed -n  '/R.id.tvLang/=' $CURRENT_DIR/TVBoxOSC/app/src/main/java/com/github/tvbox/osc/ui/adapter/GridAdapter.java)
lg0=$(sed -n  '/R.id.tvArea/=' $CURRENT_DIR/TVBoxOSC/app/src/main/java/com/github/tvbox/osc/ui/adapter/GridAdapter.java)
let lg2=$lg0-1
sed -i "${lg1},${lg2}d" $CURRENT_DIR/TVBoxOSC/app/src/main/java/com/github/tvbox/osc/ui/adapter/GridAdapter.java
lh1=$(sed -n  '/R.id.tvLang/=' $CURRENT_DIR/TVBoxOSC/app/src/main/java/com/github/tvbox/osc/ui/adapter/HistoryAdapter.java | head -n 1)
lh0=$(sed -n  '/R.id.tvArea/=' $CURRENT_DIR/TVBoxOSC/app/src/main/java/com/github/tvbox/osc/ui/adapter/HistoryAdapter.java | head -n 1)
let lh2=$lh0-1
sed -i "${lh1},${lh2}d" $CURRENT_DIR/TVBoxOSC/app/src/main/java/com/github/tvbox/osc/ui/adapter/HistoryAdapter.java
sed -i '/tvLang/d' $CURRENT_DIR/TVBoxOSC/app/src/main/java/com/github/tvbox/osc/ui/adapter/HistoryAdapter.java
sed -i 's/TextView tvArea/\/*TextView tvArea/g' $CURRENT_DIR/TVBoxOSC/app/src/main/java/com/github/tvbox/osc/ui/adapter/HistoryAdapter.java
la1=$(sed -n  '/@+id\/tvLang/=' $CURRENT_DIR/TVBoxOSC/app/src/main/res/layout/activity_detail.xml)
la0=$(sed -n  '/@+id\/tvType/=' $CURRENT_DIR/TVBoxOSC/app/src/main/res/layout/activity_detail.xml)
let la2=$la0-1
sed -i "${la1},${la2}d" $CURRENT_DIR/TVBoxOSC/app/src/main/res/layout/activity_detail.xml
li0=$(sed -n  '/@+id\/tvLang/=' $CURRENT_DIR/TVBoxOSC/app/src/main/res/layout/item_grid.xml)
let li1=$li0-1
li3=$(sed -n  '/\/LinearLayout/=' $CURRENT_DIR/TVBoxOSC/app/src/main/res/layout/item_grid.xml | head -n 1)
let li2=$li3-1
sed -i "${li1},${li2}d" $CURRENT_DIR/TVBoxOSC/app/src/main/res/layout/item_grid.xml

echo 'DIY end'
