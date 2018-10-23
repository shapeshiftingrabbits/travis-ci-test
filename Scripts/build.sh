#! /bin/sh

echo "Attempting to build for Windows"
/Applications/Unity/Unity.app/Contents/MacOS/Unity
  -batchmode
  -nographics
  -silent-crashes
  -logFile $(pwd)/unity.log
  -projectPath $(pwd)
  -buildWindowsPlayer "$(pwd)/Build/windows/$project.exe"
  -quit

echo "Attempting to build for OS X"
/Applications/Unity/Unity.app/Contents/MacOS/Unity
  -batchmode
  -nographics
  -silent-crashes
  -logFile $(pwd)/unity.log
  -projectPath $(pwd)
  -buildOSXUniversalPlayer "$(pwd)/Build/osx/$project.app"
  -quit

echo "Attempting to build for Linux"
/Applications/Unity/Unity.app/Contents/MacOS/Unity
  -batchmode
  -nographics
  -silent-crashes
  -logFile $(pwd)/unity.log
  -projectPath $(pwd)
  -buildLinuxUniversalPlayer "$(pwd)/Build/linux/$project.exe"
  -quit

echo 'Logs from build'
cat $(pwd)/unity.log
