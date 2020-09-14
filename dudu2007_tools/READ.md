cordova -v 
cordova create dudu2007_tools com.dudu2007.app
cd dudu2007_tools
cordova platform add android
cordova plugin add cordova-plugin-crosswalk-webview
cordova plugin add cordova-plugin-splashscreen
cordova serve


cordova build android

"C:\Program Files\nodejs\node_modules\npm\cordova" build android


启动图片必须是png格式