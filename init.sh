#!/usr/bin/env sh

mkdir _tmp
cd _tmp
react-native HelloNative
mv HelloNative ..
rmdir _tmp
