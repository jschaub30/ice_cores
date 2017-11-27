#!/bin/bash

# More ice core datasets can be found here:
# https://www.ncdc.noaa.gov/paleo-search/?dataTypeId=7
which wget
if [ $? != 0 ]; then
  echo "Please install wget on this system, or download the files manually"
  exit 1
fi

mkdir -p data/raw
cd data/raw

wget https://www1.ncdc.noaa.gov/pub/data/paleo/icecore/greenland/summit/gisp2/isotopes/gisp2_temp_accum_alley2000.txt
[ $? != 0 ] && echo "Problem downloading Alley dataset"
