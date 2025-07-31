#!/bin/bash

# 使い方: ./create_memos.sh 2025 8

YEAR=$1
MONTH=$2

BASE_DIR=$(pwd)
YEAR_DIR="$BASE_DIR/$YEAR"
MONTH_DIR="$YEAR_DIR/${MONTH}月"

mkdir -p "$MONTH_DIR"

DAYS=$(cal $MONTH $YEAR | awk 'NF {DAYS = $NF}; END {print DAYS}')

for DAY in $(seq 1 $DAYS); do
  FILENAME="$MONTH_DIR/${DAY}日.md"
  if [ ! -e "$FILENAME" ]; then
    echo "<!-- filepath: $FILENAME -->" > "$FILENAME"
    printf "# %04d年%d月%d日\n\n" "$YEAR" "$MONTH" "$DAY" >> "$FILENAME"
  fi
done
