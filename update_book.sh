#!/bin/bash
message=

while getopts m: opt; do
  case $opt in
  m)
      message=$OPTARG
      ;;
  esac
done


echo "commit message:  $message "



gitbook build -o ../intro2UnixandSGE_book
cd ../intro2UnixandSGE_book
git init
git commit --allow-empty -m "$message"
git checkout -b gh-pages
git add .
git commit -am  "$message"
git push git@github.com:BIMSBbioinfo/intro2UnixandSGE  gh-pages --force