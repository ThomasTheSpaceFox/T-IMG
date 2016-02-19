#!/bin/bash
WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI
TCOL=$WHEREAMI/T-COL.sh
PALETTABLE="RBG10CYPOgvVpcbydlxQzZXAqrFfKkEes_MmIiuUWwHh23456789Sn"
PALETTABLE="qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM_1023456789"
echo "RGB!" | $TCOL
echo -n "hello world"
echo "BGR!" | $TCOL
echo ""
echo "P!" | $TCOL
echo -n "T-COL.sh TEST script"
echo "P!" | $TCOL
echo ""
echo "${PALETTABLE}!" | $TCOL
echo ""
# dynamic colors :D
echo "dynamic colors test. view test script's code in editor for more info."
BL="1"
PIC1="RRRRRRRRRRRRRRR${BL}RRRRRRRRRRR!"
echo "${PIC1}!" | $TCOL
echo ""
BL="2"
PIC1="RRRRRRRRRRRRRRR${BL}RRRRRRRRRRR!"
echo "${PIC1}!" | $TCOL
echo ""
BL="3"
PIC1="RRRRRRRRRRRRRRR${BL}RRRRRRRRRRR!"
echo "${PIC1}!" | $TCOL
echo ""
echo "${PIC1}!" | $TCOL
echo ""
echo "RRRRPPPPBBBBGGGGYYYYOOOO!" | $TCOL
echo "
formatting tests"
echo "newline:"
echo "RRRRR>^BBBBB>^GGGGG>^!"
echo "RRRRR>^BBBBB>^GGGGG>^!" | $TCOL
echo hello.