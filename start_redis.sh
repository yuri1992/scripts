#!/bin/bash
echo "starting redis fileup servers..."
sudo systemctl stop redis.service
#sudo systemctl enable redis.service
#sudo systemctl start redis.service
sudo nohup redis-sentinel /etc/redis-sentinel.conf &> /dev/null &
sudo nohup redis-server --port 6379 &> /dev/null &
sudo nohup redis-server --port 6382 --slaveof 127.0.0.1 6379 &> /dev/null &
echo "all Needed servers been started..."
