#!/bin/bash
max_size=20480 #20MB
deleted_size=15360 #15MB
file_path='/root/test'
file_size=$(du -s $file_path | cut -f1)
if [ $file_size -gt $max_size ]; then
  while [ $file_size -gt $deleted_size ]; do
    echo "deleting file $s", $file_path/$(ls -t $file_path | tail -1)
    rm $file_path/$(ls -t $file_path | tail -1)
    file_size=$(du -s $file_path | cut -f1)
  done
fi
