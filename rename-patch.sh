#!/bin/sh
eval $(ls -1 | grep "\.patch$" | awk '{print "mv "$1" "substr($1,1,index($1,".patch"))"mypatch"}')
