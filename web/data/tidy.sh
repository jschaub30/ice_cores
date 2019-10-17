#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
SOURCE="$DIR"/raw/gisp2_temp_accum_alley2000.txt
TARGET="$DIR"/final/alley.csv
mkdir -p "$DIR"/final

if [ ! -e "$SOURCE" ]; then
    echo "ERROR: raw data not found. Please run ./download.sh first"
    exit 1
fi
head -n 1707 "$SOURCE" | tail -n +76 > tmp

# convert K-years to years
# translate temperature to temperature difference from first measurement
cat tmp | awk -v factor=1000 -v factor2=31.5913 \
  '{printf "%d %2.4f\n", $1 * factor, $2 + factor2}' \
  | perl -pe "s/ /,/"  > "$TARGET"
rm tmp
echo Cleaned data written to "$TARGET"
