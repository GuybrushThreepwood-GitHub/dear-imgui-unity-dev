
REM export JAVA_HOME=UnityEditors\version\Editor\Data\PlaybackEngines\AndroidPlayer\OpenJDK
REM export ANDROID_HOME="UnityEditors\version\Editor\Data\PlaybackEngines\AndroidPlayer\SDK"
REM ANDROID_NDK_HOME=UnityEditors\version\Editor\Data\PlaybackEngines\AndroidPlayer\NDK

REM To accept the SDK manager licenses
REM $ANDROID_HOME/tools/bin/sdkmanager --licenses

cd ./AndroidBuildProject/
mkdir ..\..\dear-imgui-project\Packages\dear-imgui-unity\Plugins\android

REM call gradlew.bat assembleDebug
REM copy .\app\build\outputs\aar\app-universal-debug.aar ..\..\dear-imgui-project\Packages\dear-imgui-unity\Plugins\android\dearimgui-unity-debug.aar
call gradlew.bat assembleRelease
copy .\app\build\outputs\aar\app-universal-release.aar ..\..\dear-imgui-project\Packages\dear-imgui-unity\Plugins\android\dearimgui-unity.aar

cd ..
