#!/bin/bash

#获取目录
CURRENT_DIR=$(cd $(dirname $0); pwd)
num=$(find $CURRENT_DIR -name gradlew  | awk -F"/" '{print NF-1}')
DIR=$(find $CURRENT_DIR -name gradlew  | cut -d \/ -f$num)
cd $CURRENT_DIR/$DIR
#名称修改
sed -i 's/TVBox/极影视/g' $CURRENT_DIR/$DIR/app/src/main/res/values-zh/strings.xml
sed -i 's/TVBox/极影视/g' $CURRENT_DIR/$DIR/app/src/main/res/values/strings.xml
#图标修改
mv $CURRENT_DIR/DIY/app_icon.png $CURRENT_DIR/$DIR/app/src/main/res/drawable/app_icon.png
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
#添加详情页播放列表宽度自适
sed -i '/import me.jessyan.autosize.utils.AutoSizeUtils;/a\import android.graphics.Paint;\nimport android.text.TextPaint;\nimport androidx.annotation.NonNull;\nimport android.graphics.Typeface;\nimport androidx.recyclerview.widget.RecyclerView;' $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/ui/activity/DetailActivity.java
sed -i '/private View seriesFlagFocus = null;/a\    private V7GridLayoutManager mGridViewLayoutMgr = null;' $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/ui/activity/DetailActivity.java
sed -i 's/mGridView.setLayoutManager(new V7GridLayoutManager(this.mContext, isBaseOnWidth() ? 6 : 7));/mGridView.setHasFixedSize(false);\n        this.mGridViewLayoutMgr = new V7GridLayoutManager(this.mContext, isBaseOnWidth() ? 6 : 7);\n        mGridView.setLayoutManager(this.mGridViewLayoutMgr);\n/g' $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/ui/activity/DetailActivity.java
sed -i '/seriesAdapter.setNewData(vodInfo.seriesMap.get(vodInfo.playFlag));/i\        Paint pFont = new Paint();\n        Rect rect = new Rect();\n        List<VodInfo.VodSeries> list = vodInfo.seriesMap.get(vodInfo.playFlag);\n        int w = 1;\n        for(int i =0; i < list.size(); ++i){\n            String name = list.get(i).name;\n            pFont.getTextBounds(name, 0, name.length(), rect);\n            if(w < rect.width()){\n                w = rect.width();\n            }\n        }\n        w += 32;\n        int screenWidth = getWindowManager().getDefaultDisplay().getWidth()\/3;\n        int offset = screenWidth\/w;\n        if(offset <=1) offset =1;\n        if(offset > 6) offset =6;\n        this.mGridViewLayoutMgr.setSpanCount(offset);\n' $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/ui/activity/DetailActivity.java
sed -i 's/FrameLayout/LinearLayout/g' $CURRENT_DIR/$DIR/app/src/main/res/layout/item_series.xml
sed -i 's/width=\"wrap_content\"/width=\"match_parent\"/g' $CURRENT_DIR/$DIR/app/src/main/res/layout/item_series.xml
sed -i 's/@dimen\/vs_190/match_parent/g' $CURRENT_DIR/$DIR/app/src/main/res/layout/item_series.xml
#添加PY支持
wget --no-check-certificate -qO- "https://raw.githubusercontent.com/UndCover/PyramidStore/main/aar/pyramid.aar" -O $CURRENT_DIR/$DIR/app/libs/pyramid.aar
sed -i "/thunder.jar/a\    implementation files('libs@pyramid.aar')" $CURRENT_DIR/$DIR/app/build.gradle
sed -i 's#@#\\#g' $CURRENT_DIR/$DIR/app/build.gradle
sed -i 's#pyramid#\\pyramid#g' $CURRENT_DIR/$DIR/app/build.gradle

echo "" >>$CURRENT_DIR/$DIR/app/proguard-rules.pro
echo "" >>$CURRENT_DIR/$DIR/app/proguard-rules.pro
echo "#添加PY支持" >>$CURRENT_DIR/$DIR/app/proguard-rules.pro
echo "-keep public class com.undcover.freedom.pyramid.** { *; }" >>$CURRENT_DIR/$DIR/app/proguard-rules.pro
echo "-dontwarn com.undcover.freedom.pyramid.**" >>$CURRENT_DIR/$DIR/app/proguard-rules.pro
echo "-keep public class com.chaquo.python.** { *; }" >>$CURRENT_DIR/$DIR/app/proguard-rules.pro
echo "-dontwarn com.chaquo.python.**" >>$CURRENT_DIR/$DIR/app/proguard-rules.pro
sed -i '/import com.orhanobut.hawk.Hawk;/a\import com.undcover.freedom.pyramid.PythonLoader;' $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/base/App.java
sed -i '/import com.orhanobut.hawk.Hawk;/a\import com.github.catvod.crawler.SpiderNull;' $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/base/App.java
sed -i '/PlayerHelper.init/a\        PythonLoader.getInstance().setApplication(this);' $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/base/App.java
sed -i '/import android.util.Base64;/a\import com.github.catvod.crawler.SpiderNull;' $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/api/ApiConfig.java
sed -i '/import android.util.Base64;/a\import com.undcover.freedom.pyramid.PythonLoader;' $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/api/ApiConfig.java
sed -i '/private void parseJson(String apiUrl, String jsonStr)/a\        PythonLoader.getInstance().setConfig(jsonStr);' $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/api/ApiConfig.java
sed -i '/public Spider getCSP(SourceBean sourceBean)/a\        if (sourceBean.getApi().startsWith(\"py_\")) {\n        try {\n            return PythonLoader.getInstance().getSpider(sourceBean.getKey(), sourceBean.getExt());\n        } catch (Exception e) {\n            e.printStackTrace();\n            return new SpiderNull();\n        }\n    }' $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/api/ApiConfig.java
sed -i '/public Object\[\] proxyLocal(Map param)/a\        try {\n        if(param.containsKey(\"api\")){\n            String doStr = param.get(\"do\").toString();\n            if(doStr.equals(\"ck\"))\n                return PythonLoader.getInstance().proxyLocal(\"\",\"\",param);\n            SourceBean sourceBean = ApiConfig.get().getSource(doStr);\n            return PythonLoader.getInstance().proxyLocal(sourceBean.getKey(),sourceBean.getExt(),param);\n        }\n    } catch (Exception e) {\n        e.printStackTrace();\n    }' $CURRENT_DIR/$DIR/app/src/main/java/com/github/tvbox/osc/api/ApiConfig.java
#添加新IJK解码
#影魔版IJK库
#wget --no-check-certificate -qO- "https://raw.githubusercontent.com/lm317379829/TVBoxOSC-J/main/player/src/main/jniLibs/armeabi-v7a/libijkffmpeg.so" -O $CURRENT_DIR/$DIR/player/src/main/jniLibs/armeabi-v7a/libijkffmpeg.so
#wget --no-check-certificate -qO- "https://raw.githubusercontent.com/lm317379829/TVBoxOSC-J/main/player/src/main/jniLibs/armeabi-v7a/libijksdl.so" -O $CURRENT_DIR/$DIR/player/src/main/jniLibs/armeabi-v7a/libijksdl.so
#wget --no-check-certificate -qO- "https://raw.githubusercontent.com/lm317379829/TVBoxOSC-J/main/player/src/main/jniLibs/armeabi-v7a/libplayer.so" -O $CURRENT_DIR/$DIR/player/src/main/jniLibs/armeabi-v7a/libplayer.so
#Anod版IJK库
#mv $CURRENT_DIR/DIY/libijkffmpeg.so $CURRENT_DIR/$DIR/player/src/main/jniLibs/armeabi-v7a/libijkffmpeg.so
#mv $CURRENT_DIR/DIY/libijksdl.so $CURRENT_DIR/$DIR/player/src/main/jniLibs/armeabi-v7a/libijksdl.so
#mv $CURRENT_DIR/DIY/libplayer.so $CURRENT_DIR/$DIR/player/src/main/jniLibs/armeabi-v7a/libplayer.so
#sed -i '/libLoader.loadLibrary(\"player\");                /i\try {\n                    libLoader.loadLibrary(\"ijkffmpeg\");\n                    libLoader.loadLibrary(\"ijksdl\");\n                } catch (Throwable throwable) {\n\n                }' $CURRENT_DIR/$DIR/player/src/main/java/tv/danmaku/ijk/media/player/IjkMediaPlayer.java

echo 'DIY end'
