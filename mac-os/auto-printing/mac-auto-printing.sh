#!/bin/bash

last_date=$(head -n 1 last-printing.txt)
current_date=$(date "+%Y%m%d")
offset_date=$(date -v -3d +%Y%m%d)

if [ $offset_date -gt $last_date ];then
  lp ./sample.png
fi

echo $current_date > last-printing.txt
