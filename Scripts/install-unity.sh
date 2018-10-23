#! /bin/sh

# See $BASE_URL/$HASH/unity-$VERSION-$PLATFORM.ini for complete list
# of available packages, where PLATFORM is `osx` or `win`
BASE_URL=https://beta.unity3d.com/download
HASH=4cb482063d12
VERSION=2018.1.7f1

UNITY_LINUX_TARGET_PACKAGE="MacEditorTargetInstaller/UnitySetup-Linux-Support-for-Editor-$VERSION.pkg"
UNITY_OSX_PACKAGE="MacEditorInstaller/Unity-$VERSION.pkg"
UNITY_WINDOWS_TARGET_PACKAGE="MacEditorTargetInstaller/UnitySetup-Windows-Mono-Support-for-Editor-$VERSION.pkg"

UNITY_DOWNLOAD_CACHE="unity_download_cache"

download() {
  FILE=$1
  URL="$BASE_URL/$HASH/$FILE"

  #download package if it does not already exist in cache
  if [ ! -e $UNITY_DOWNLOAD_CACHE/`basename "$FILE"` ] ; then
    echo "Cached copy of $FILE does not exist. Downloading from $URL: "
    curl -o $UNITY_DOWNLOAD_CACHE/`basename "$FILE"` "$URL"
  else
    echo "Cached copy of $FILE Exists. Skipping download."
  fi
}

install() {
  PACKAGE=$1
  download "$PACKAGE"

  echo "Installing "`basename "$PACKAGE"`
  sudo installer -dumplog -package $UNITY_DOWNLOAD_CACHE/`basename "$PACKAGE"` -target /
}

echo "Contents of Unity Download Cache:"
ls "$UNITY_DOWNLOAD_CACHE"

echo "Installing Unity..."
install "$UNITY_OSX_PACKAGE"
install "$UNITY_WINDOWS_TARGET_PACKAGE"
install "$UNITY_LINUX_TARGET_PACKAGE"
