#!/bin/bash

#获取目录
CURRENT_DIR=$(cd $(dirname $0); pwd)
num=$(find $CURRENT_DIR -name gradlew | grep -v exo | awk -F"/" '{print NF-1}')
DIR=$(find $CURRENT_DIR -name gradlew | grep -v exo | cut -d \/ -f$num)
cd $CURRENT_DIR/$DIR
#删除release的APK
rm -rf $CURRENT_DIR/$DIR/release/*
#添加PY支持
#mkdir $CURRENT_DIR/$DIR/app/libs
#wget --no-check-certificate -qO- "https://raw.githubusercontent.com/UndCover/PyramidStore/main/aar/pyramid.aar" -O $CURRENT_DIR/$DIR/app/libs/pyramid.aar
#sed -i "/squareup/a\    implementation files('libs@pyramid.aar')" $CURRENT_DIR/$DIR/app/build.gradle
#sed -i 's#@#\\#g' $CURRENT_DIR/$DIR/app/build.gradle
#sed -i 's#pyramid#\\pyramid#g' $CURRENT_DIR/$DIR/app/build.gradle
#echo "" >>$CURRENT_DIR/$DIR/app/proguard-rules.pro
#echo "" >>$CURRENT_DIR/$DIR/app/proguard-rules.pro
#echo "#添加PY支持" >>$CURRENT_DIR/$DIR/app/proguard-rules.pro
#echo "-keep public class com.undcover.freedom.pyramid.** { *; }" >>$CURRENT_DIR/$DIR/app/proguard-rules.pro
#echo "-dontwarn com.undcover.freedom.pyramid.**" >>$CURRENT_DIR/$DIR/app/proguard-rules.pro
#echo "-keep public class com.chaquo.python.** { *; }" >>$CURRENT_DIR/$DIR/app/proguard-rules.pro
#echo "-dontwarn com.chaquo.python.**" >>$CURRENT_DIR/$DIR/app/proguard-rules.pro
#sed -i '/public class App extends Application/i\import com.undcover.freedom.pyramid.PythonLoader;\n' $CURRENT_DIR/$DIR/app/src/main/java/com/fongmi/android/tv/App.java
#sed -i '/public class App extends Application/i\import com.github.catvod.crawler.SpiderNull;\n' $CURRENT_DIR/$DIR/app/src/main/java/com/fongmi/android/tv/App.java
#sed -i '/void onCreate/a\        PythonLoader.getInstance().setApplication(this);' $CURRENT_DIR/$DIR/app/src/main/java/com/fongmi/android/tv/App.java
#sed -i '/public class ApiConfig/i\import com.github.catvod.crawler.SpiderNull;' $CURRENT_DIR/$DIR/app/src/main/java/com/fongmi/android/tv/api/ApiConfig.java
#sed -i '/public class ApiConfig/i\import com.undcover.freedom.pyramid.PythonLoader;\n' $CURRENT_DIR/$DIR/app/src/main/java/com/fongmi/android/tv/api/ApiConfig.java                                          
#sed -i '/private void parseJson/a\        PythonLoader.getInstance().setConfig(object.toString());' $CURRENT_DIR/$DIR/app/src/main/java/com/fongmi/android/tv/api/ApiConfig.java
#sed -i '/public Spider getCSP/a\        if (site.getApi().startsWith(\"py_\")) {\n        try {\n            return PythonLoader.getInstance().getSpider(site.getKey(), site.getExt());\n        } catch (Exception e) {\n            e.printStackTrace();\n            return new SpiderNull();\n        }\n    }' $CURRENT_DIR/$DIR/app/src/main/java/com/fongmi/android/tv/api/ApiConfig.java
#sed -i 's/<?, ?>//g' $CURRENT_DIR/$DIR/app/src/main/java/com/fongmi/android/tv/api/ApiConfig.java
#sed -i '/public Object\[\] proxyLoca/a\        try {\n        if(param.containsKey(\"api\")){\n            String doStr = param.get(\"do\").toString();\n            if(doStr.equals(\"ck\"))\n                return PythonLoader.getInstance().proxyLocal(\"\",\"\",param);\n            Site site = getSite(doStr);\n            return PythonLoader.getInstance().proxyLocal(site.getKey(), site.getExt(), param);\n        }else{\n            String doStr = param.get(\"do\").toString();\n            if(doStr.equals(\"live\")) return PythonLoader.getInstance().proxyLocal(\"\",\"\",param);\n        }\n    } catch (Exception e) {\n        e.printStackTrace();\n    }' $CURRENT_DIR/$DIR/app/src/main/java/com/fongmi/android/tv/api/ApiConfig.java

echo 'DIY end'
