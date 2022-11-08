#!/bin/sh
eval $(ls -1 | awk '{print "mv "$1" "substr($1,1,index($1,".patch"))"mypatch"}')
