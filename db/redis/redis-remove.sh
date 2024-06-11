#!/bin/bash

#redis 源ip
src_ip=192.168.0.37
#redis 源port
src_port=6379

#redis 目的ip
dest_ip=192.168.0.38
#redis 目的port
dest_port=6378

#要迁移的key前缀
key_prefix=

i=1

redis-cli -h $src_ip -p $src_port -a password keys "${key_prefix}*" | while read key
do
  redis-cli -h $dest_ip -p $dest_port -a password del $key
  redis-cli -h $src_ip -p $src_port -a password --raw dump $key | perl -pe 'chomp if eof' | redis-cli -h $dest_ip -p $dest_port -a password -x restore $key 0
  echo "$i migrate key $key"
  ((i++))
done