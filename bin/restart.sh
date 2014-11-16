#!/bin/bash
pid=$(ps aux|grep "rails server\|rails s -d"|grep -v grep|awk {'print $2'})
for i in $pid; do kill -9 $i; done
cd /home/rails/storystreams
rails s -d
