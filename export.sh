#!/bin/bash

test "$#" -eq 1 || { echo "Usage: $0 url"; exit 1 ;}

rm assets/*

wget -m -nH $1

# use relative paths
sed -E -i s,/assets,assets,g index.html

# remove csrf tokens
sed -i -E '/^<meta name="csrf/d' index.html
