#!/bin/sh
export LANG=zh_CN
export LC_MESSAGES=en_US
ulimit -HSn 65536

shut_down(){
    service nginx stop
    service php5-fpm stop
    pkill -P 1
    exit
}
trap "shut_down" TERM

#start nginx
service nginx start

#start fpm
service php5-fpm start

#run forever to keep nginx and php5-fpm running
while true
do
    sleep 1d& wait ${!}
done

