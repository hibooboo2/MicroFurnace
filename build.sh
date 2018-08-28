#!/bin/sh
name=$(jq -r ".name" info.json)
version=$(jq -r ".version" info.json)
target_filename="${name}_${version}"

git archive HEAD --prefix="${name}_${version}/" --format=zip -o "${name}_${version}.zip" -9 
