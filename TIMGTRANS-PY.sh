#!/bin/bash
WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI
#T-IMG -Terminal Image System to Raw Escape code translator batch wrapper script.
#This is a simple batch converstion automation script that uses T-CODE-RAW.py

for f in *.TIMG
do
  BASENME=$(echo $f | cut -f1 -d.)
  echo $BASENME
  ./T-CODE-RAW.py $f
  cp -T output-raw.txt ${BASENME}.TCR
done
  
  