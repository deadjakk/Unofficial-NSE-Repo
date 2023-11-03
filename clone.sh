#!/bin/bash
set -e
if [ -z $1 ] ;then
    echo "usage: $0 <github repo url> [preferred dir name]"
    exit
fi
rootname=$(basename "$1")
DIRNAME=${2:-$rootname}
cd scripts
git clone $1 $DIRNAME
echo "$1" > $DIRNAME/FROM.md
git add $DIRNAME/*.md
git add $DIRNAME/*.nse
cd ..
rm -rf scripts/**/.git
find . -name \*.nse | xargs -I '{}' bash -c "git add {}"
find . -name \*.md | xargs -I '{}' bash -c "git add {}"
git commit -m "added $1"
