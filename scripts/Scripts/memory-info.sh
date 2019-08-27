#!/bin/sh
meminfo=`free -m | grep 'Mem:'`

used=`echo $meminfo | cut -d" " -f3`
total=`echo $meminfo | cut -d" " -f2`
cached=`echo $meminfo | cut -d" " -f6`

echo "Memory Usage: $used / $total (cached: $cached)"
