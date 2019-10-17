#!/usr/bin/env bash
# More ice core datasets can be found here:
# https://www.ncdc.noaa.gov/paleo-search/?dataTypeId=7

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "$DIR"
if ! command -v wget > /dev/null; then
  echo "Please install wget on this system, or download the files manually"
  exit 1
fi

mkdir -p "$DIR"/raw

wget https://www1.ncdc.noaa.gov/pub/data/paleo/icecore/greenland/summit/gisp2/isotopes/gisp2_temp_accum_alley2000.txt \
    -O "$DIR"/raw/gisp2_temp_accum_alley2000.txt
[ $? != 0 ] && echo "Problem downloading Alley dataset"
exit 0
