#!/bin/sh
set -e
cd $(dirname $0)

if [ -d skia-with-history ]
then
    (cd skia-with-history && git fetch origin && git reset --hard origin/master)
else
    git clone https://github.com/servo/skia skia-with-history
fi

rsync -a --del skia-with-history/ skia/
git add .
git commit -m "Update to $(cd skia-with-history && git rev-parse HEAD) from https://github.com/servo/skia"
