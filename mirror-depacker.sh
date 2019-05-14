#!/bin/bash
# recursively crawl through a dir containing mirrored deb and tar files
# if file is a deb, then extract it's data.tar.xz to a ~/tmp/name_of_deb folder
# can be improved with conditionals to handle the case of a deb vs tar file

function extract_deb () {
  echo -e "$dir"
  find "$dir" -iname "*.deb" | \
    while read -r file || [[ -n "${file}" ]]; do
      echo -e "$file"
      basename=$(basename "$file")
      echo -e "basename $basename"
      filename="unpack_$basename"
      echo -e "filename $filename"
      tmpdir="$tmproot/deb/$filename"
      echo -e "temp dir $tmpdir"
      mkdir -p $tmpdir
      cd $tmpdir
      ar x $file
      tar xf data.tar.xz
    done
}

function extract_tar_gz () {
  find "$dir" -iname "*.tar.*" | \
    while read -r file || [[ -n "${file}" ]]; do
      echo -e "$file"
      basename=$(basename "$file")
      echo -e "basename $basename"
      filename="unpack_$basename"
      echo -e "filename $filename"
      tmpdir="$tmproot/deb/$filename"
      echo -e "temp dir $tmpdir"
      mkdir -p $tmpdir
      cd $tmpdir
      tar zxf $file
    done
}

echo -e "This is a script for unpacking a debian / ubuntu mirror."
dir="/var/cache/apt/archives/"
tmproot="/root/bin/tmproot"
log="/home/ubuntu/bin/log.unpacker"
#get dir to crawl
#read -e -p "Please enter the root path containing the mirror: " dir
#get log file to write
#read -e -p "Please enter the location and name of the log file: " log
#get root of tmp directory for unpacking
#read -e -p "Please enter the location of the tmp dir for unpacking: " tmproot

extract_deb
extract_tar_gz
