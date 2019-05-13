cordova -v 
cordova create dudu2007_tools com.dudu2007.app
cd dudu2007_tools
cordova platform add android
cordova plugin add cordova-plugin-crosswalk-webview
cordova plugin add cordova-plugin-splashscreen
cordova serve


cordova build android