#!/bin/bash

mkdir -p data/final
cd data/raw
[ $? != 0 ] && echo "Please run ./download.sh first" && exit 1
head -n 1707 gisp2_temp_accum_alley2000.txt | tail -n +76 > tmp
# convert K-years to years
# translate temperature to temperature difference from first measurement
cat tmp | awk -v factor=1000 -v factor2=31.5913 \
  '{printf "%d %2.4f\n", $1 * factor, $2 + factor2}' \
  | perl -pe "s/ /,/" > ../final/alley.csv

