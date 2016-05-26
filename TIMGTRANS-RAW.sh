#!/bin/bash
WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI
#T-IMG -Terminal Image System to Raw Escape code translator batch wrapper script.

for f in *.TIMG
do
  BASENME=$(echo $f | cut -f1 -d.)
  echo $BASENME
  ./T-CODE-RAW.sh $f
  cp -T output-raw.txt ${BASENME}.TCR
done
  
  