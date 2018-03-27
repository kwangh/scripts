#!/bin/bash
argc=$#
FILE=$1
function scp()
{
  echo "파일 전송 중..."
expect <<EOF
  spawn scp ${FILE} test@xxx.xxx.xxx.$1:/Data/
  expect {
    #If 'expect' sees '(yes/no )', then it will send 'yes'
    #and continue the 'expect' loop
    "(yes/no)" { send "yes\r";exp_continue}
    "ETA" {
#puts "파일 전송 중..."
      exp_continue;
    }
    "100%" {
      puts "전송 완료"
    }
    #If 'password' seen first, then proceed as such.
    "password" { send "password\r";exp_continue}
  }
EOF
}

if [ 1 -ne $argc ]
then
  echo "Usage : ./auto_send.sh file_name"
else
  scp 83
fi
