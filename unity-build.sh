#!/bin/bash

get-unity-mono-path() {
  case $(uname) in
    Darwin)
      echo /Applications/Unity/Unity.app/Contents/Mono
      ;;
    Linux)
      echo /opt/Unity/Editor/Data/Mono
      ;;
  esac
}


rm -fr dist bin
export UNITY_MONO=${UNITY_MONO:-$(get-unity-mono-path)}
export PATH=$UNITY_MONO/bin:$PATH
export MONO_PATH=$UNITY_MONO/lib/mono/2.0

RestorePackages=false xbuild Clojure/build.proj /target:"Build" /p:Runtime="Mono" /p:Configuration="Release 3.5" /p:Platform="Any CPU"

