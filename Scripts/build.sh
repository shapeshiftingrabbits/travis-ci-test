#! /bin/sh

LINUX_LOG_FILE=$UNITY_BUILD_DIR/linux-build.log
OSX_LOG_FILE=$UNITY_BUILD_DIR/osx-build.log
WINDOWS_LOG_FILE=$UNITY_BUILD_DIR/windows-build.log

echo "Attempting to build for Windows"
/Applications/Unity/Unity.app/Contents/MacOS/Unity
  -batchmode
  -nographics
  -silent-crashes
  -logFile $(pwd)/unity.log
  -projectPath $(pwd)
  -buildWindowsPlayer "$(pwd)/Build/windows/$project.exe"
  -quit | tee "$WINDOWS_LOG_FILE"

echo "Attempting to build for OS X"
/Applications/Unity/Unity.app/Contents/MacOS/Unity
  -batchmode
  -nographics
  -silent-crashes
  -logFile $(pwd)/unity.log
  -projectPath $(pwd)
  -buildOSXUniversalPlayer "$(pwd)/Build/osx/$project.app"
  -quit | tee "$OSX_LOG_FILE"

echo "Attempting to build for Linux"
/Applications/Unity/Unity.app/Contents/MacOS/Unity
  -batchmode
  -nographics
  -silent-crashes
  -logFile $(pwd)/unity.log
  -projectPath $(pwd)
  -buildLinuxUniversalPlayer "$(pwd)/Build/linux/$project.exe"
  -quit | tee "$LINUX_LOG_FILE"
