#!/bin/sh

cd ../plugins

# 批量执行 flutter pub get
for dir in $(ls -d */)
do
  if [ -d "$dir" ]; then
    echo "$dir"
    flutter clean
    flutter pub get
  fi
done
