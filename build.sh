#!/bin/bash
archivePath=build/

branch=$(git rev-parse --abbrev-ref HEAD)
lastHash=$(git rev-parse --short HEAD)
manifest=$(cat manifest.json)
name=$( echo $manifest | jq .name )
version=$( echo $manifest | jq .version )

echo This plugign is called $name
echo You are on branch $branch
echo You are on version $version

archiveName="$( echo $manifest | jq -r .name | tr '[:upper:]' '[:lower:]' | tr ' ' '-')-v$(echo $manifest | jq -r .version)"

if [ $branch != 'master' ]
then
archiveName="$archiveName-$lastHash-$branch"
fi

archiveName="$archiveName.zip"
echo Archive name will be \"$archiveName\"

mkdir -p $archivePath

zip -r -FS $archivePath$archiveName * --exclude *.git* --exclude build/* --exclude build/ --exclude build.sh --exclude formatIcons.sh --exclude icons/icon-max*
