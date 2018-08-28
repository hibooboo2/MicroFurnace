#!/bin/sh
name=$(jq -r ".name" info.json)
version=$(jq -r ".version" info.json)
target_filename="${name}_${version}.zip"

rm -f $target_filename
zip -9 -r -x *.git* .gitignore build.sh .gitlab-ci.yml @ $target_filename .
