#!/bin/bash

GPX_ASSETS_DIR=/home/vagrant/sites/doah/app/assets/gpx

#iterate over files in doah-gpx
for filename in doah-gpx/*.GPX; do
    #check if this file exists in the app's assets folder on server
    FILE_PATH_TO_CHECK="$GPX_ASSETS_DIR/${filename##*/}" #deletes longest match of '*/' from front of $filename.

    #q flag means quiet, suppresses warnings etc.
    ssh -q Vagrant [[ -f $FILE_PATH_TO_CHECK ]] && 
    (echo "$filename already on server") ||
    (echo "$filename not found on server, copying..."; 
    scp -r -i ~/Documents/bob/.vagrant/machines/default/virtualbox/private_key $filename vagrant@10.0.0.105:~/sites/doah/app/assets/gpx);
done




