#!/bin/bash

git clone https://github.com/FabioLolix/distroware.gitlab.io/
pushd distroware.gitlab.io/docs/os/Linux
for dir in $(ls) ;
do
    ls "$dir" | awk -F "." '{print $1}'
done
popd
rm -rf distroware.gitlab.io
