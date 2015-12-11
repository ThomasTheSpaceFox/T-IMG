#!/bin/bash
WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI
#T-IMG -Terminal Image System.
#V3.0
#(c) 2015 Thomas Leathers
#
#
# first color chart
#R=red
#B=blue
#G=green
#1=white
#0=black
#C=cyan
#Y=yellow
#P=purple
# second "mixed" color table 
#O=orange
#g=grey
#v=blue-violet
#V=red-violet
#p=pink
#c=cyan-green
#b=blue-green
#y=yellow-green
#d=dark-green
#l=light-green
#x=blue-cyan
#Q=light-cyan
#z=dark-cyan
#Z=dark-blue
#X=light-blue
#A=Light-Yellow
#q=dark-yellow
#r=dark-red
#F=brown
#f=tan
#K=light-grey
#k=dark-grey
#E=red-orange
#e=orange-yellow
#s=SUPER-white
#_=blank
#M=SUPER-red
#m=SUPER-blue
#I=SUPER-green
#i=SUPER-orange
#u=SUPER-Cyan
#U=SUPER-purple
#W=SUPER-yellow
#w=SUB-red
#H=SUB-blue
#h=SUB-green
#2=SUB-Cyan
#3=SUB-purple
#4=SUB-yellow
#5=MEDHIGH-red
#6=MEDHIGH-blue
#7=MEDHIGH-green
#8=MEDHIGH-Cyan
#9=MEDHIGH-purple
#S=MEDHIGH-yellow
#n=light-purple


RED='\033[0;41m'
URED='\033[0;40m\033[1;31m'
MRED='\033[0;41m\033[1;37m'
SRED='\033[0;101m'
BLUE='\033[0;44m'
UBLUE='\033[0;40m\033[1;34m'
MBLUE='\033[0;44m\033[1;37m'
SBLUE='\033[0;104m'
GREEN='\033[0;42m'
UGREEN='\033[0;40m\033[1;32m'
MGREEN='\033[0;42m\033[1;37m'
SGREEN='\033[0;102m'
ORANGE='\033[0;43m\033[1;31m'
SORANGE='\033[0;103m\033[1;91m'   
GREY='\033[0;47m\033[1;30m'
LGREY='\033[0;47m\033[1;30m'
DGREY='\033[0;40m\033[1;37m'
WH='\033[0;47m'
SWH='\033[0;107m'
BL='\033[0;40m'
DY='\033[0;40m\033[1;33m'
DR='\033[0;40m\033[1;31m'
BROWN='\033[0;41m\033[1;32m'
TAN='\033[0;45m\033[1;33m'
bv='\033[0;44m\033[1;35m'
rv='\033[0;44m\033[1;31m'
DC='\033[0;40m\033[1;36m'
DB='\033[0;40m\033[1;34m'
LB='\033[0;47m\033[1;34m'
LY='\033[0;47m\033[1;33m'
BC='\033[0;44m\033[1;36m'
PINK='\033[0;47m\033[1;31m'
LC='\033[0;47m\033[1;36m'
YELLOW='\033[0;43m'
UYELLOW='\033[0;40m\033[1;33m'
MYELLOW='\033[0;43m\033[1;37m'
SYELLOW='\033[0;103m'
CYAN='\033[0;46m'
UCYAN='\033[0;40m\033[1;36m'
MCYAN='\033[0;46m\033[1;37m'
SCYAN='\033[0;106m'
OR='\033[0;41m\033[1;33m'
OY='\033[0;43m\033[1;31m'
CG='\033[0;46m\033[1;32m'
BG='\033[0;44m\033[1;32m'
YG='\033[0;43m\033[1;32m'
DG='\033[0;40m\033[1;32m'
LG='\033[0;47m\033[1;32m'
PURPLE='\033[0;45m'
UPURPLE='\033[0;40m\033[1;35m'
MPURPLE='\033[0;45m\033[1;37m'
LPURPLE='\033[0;47m\033[1;35m'
SPURPLE='\033[0;105m'
# reset command (used at end of script to return to normal teminal colors)
RESET='\033[0m'
# file to draw
# BE SURE TO CONFIGURE THIS SECTION CORRECTLY!
#
#uncomment this line, and point it to the T-IMG image you wish to draw,
#such as testing to see how a T-IMG image looks:
file="$WHEREAMI/palet.TIMG"
#or uncomment this line to call T-IMG.sh from within another script/terminal:
#file="$1"
# character-pixel strings used:
echo "$(sed ''1'q;d' $file)"
CHARMODE=$(sed ''2'q;d' $file)
if [ "$CHARMODE" = "2" ]; then
DRAW="  "
MIX='▒▒'
MIX2='░░'
else
DRAW=" "
MIX='▒'
MIX2='░'
fi
line=3
# drawing mechanism
until [ "$current" = "!" ]; do
  current=$(sed ''$line'q;d' $file)
  LINESET=$(echo $current | grep -o .)
  for f in $LINESET
  do
    if [ "$f" = "R" ]; then
      echo -e -n "${RED}$DRAW"
    fi
    if [ "$f" = "B" ]; then
      echo -e -n "${BLUE}$DRAW"
    fi
    if [ "$f" = "G" ]; then
      echo -e -n "${GREEN}$DRAW"
    fi
    if [ "$f" = "1" ]; then
      echo -e -n "${WH}$DRAW"
    fi
    if [ "$f" = "0" ]; then
      echo -e -n "${BL}$DRAW"
    fi
    if [ "$f" = "Y" ]; then
      echo -e -n "${YELLOW}$DRAW"
    fi
    if [ "$f" = "C" ]; then
      echo -e -n "${CYAN}$DRAW"
    fi
    if [ "$f" = "P" ]; then
      echo -e -n "${PURPLE}$DRAW"
    fi
    if [ "$f" = "O" ]; then
      echo -e -n "${ORANGE}${MIX}"
    fi
    if [ "$f" = "g" ]; then
      echo -e -n "${GREY}${MIX}"
    fi
    if [ "$f" = "v" ]; then
      echo -e -n "${bv}${MIX}"
    fi
    if [ "$f" = "V" ]; then
      echo -e -n "${rv}${MIX}"
    fi
    if [ "$f" = "p" ]; then
      echo -e -n "${PINK}${MIX}"
    fi
    if [ "$f" = "c" ]; then
      echo -e -n "${CG}${MIX}"
    fi
    if [ "$f" = "y" ]; then
      echo -e -n "${YG}${MIX}"
    fi
    if [ "$f" = "b" ]; then
      echo -e -n "${BG}${MIX}"
    fi
    if [ "$f" = "d" ]; then
      echo -e -n "${DG}${MIX}"
    fi
    if [ "$f" = "l" ]; then
      echo -e -n "${LG}${MIX}"
    fi
    if [ "$f" = "z" ]; then
      echo -e -n "${DC}${MIX}"
    fi
    if [ "$f" = "x" ]; then
      echo -e -n "${BC}${MIX}"
    fi
    if [ "$f" = "Z" ]; then
      echo -e -n "${DB}${MIX}"
    fi
    if [ "$f" = "X" ]; then
      echo -e -n "${LB}${MIX}"
    fi
    if [ "$f" = "A" ]; then
      echo -e -n "${LY}${MIX}"
    fi
    if [ "$f" = "Q" ]; then
      echo -e -n "${LC}${MIX}"
    fi
    if [ "$f" = "q" ]; then
      echo -e -n "${DY}${MIX}"
    fi
    if [ "$f" = "r" ]; then
      echo -e -n "${DR}${MIX}"
    fi
    if [ "$f" = "F" ]; then
      echo -e -n "${BROWN}${MIX2}"
    fi
    if [ "$f" = "f" ]; then
      echo -e -n "${TAN}${MIX}"
    fi
    if [ "$f" = "k" ]; then
      echo -e -n "${DGREY}${MIX2}"
    fi
    if [ "$f" = "K" ]; then
      echo -e -n "${LGREY}${MIX2}"
    fi
    if [ "$f" = "E" ]; then
      echo -e -n "${OR}${MIX2}"
    fi
    if [ "$f" = "e" ]; then
      echo -e -n "${OY}${MIX2}"
    fi
    if [ "$f" = "s" ]; then
      echo -e -n "${SWH}${DRAW}"
    fi
    if [ "$f" = '_' ]; then
      echo -e -n "${RESET}${DRAW}"
    fi
    if [ "$f" = "M" ]; then
      echo -e -n "${SRED}${DRAW}"
    fi
    if [ "$f" = "m" ]; then
      echo -e -n "${SBLUE}${DRAW}"
    fi
    if [ "$f" = "I" ]; then
      echo -e -n "${SGREEN}${DRAW}"
    fi
    if [ "$f" = "i" ]; then
      echo -e -n "${SORANGE}${MIX}"
    fi
    if [ "$f" = "u" ]; then
      echo -e -n "${SCYAN}${DRAW}"
    fi
    if [ "$f" = "U" ]; then
      echo -e -n "${SPURPLE}${DRAW}"
    fi
    if [ "$f" = "W" ]; then
      echo -e -n "${SYELLOW}${DRAW}"
    fi
    if [ "$f" = "w" ]; then
      echo -e -n "${URED}${MIX2}"
    fi
    if [ "$f" = "H" ]; then
      echo -e -n "${UBLUE}${MIX2}"
    fi
    if [ "$f" = "h" ]; then
      echo -e -n "${UGREEN}${MIX2}"
    fi
    if [ "$f" = "2" ]; then
      echo -e -n "${UCYAN}${MIX2}"
    fi
    if [ "$f" = "3" ]; then
      echo -e -n "${UPURPLE}${MIX2}"
    fi
    if [ "$f" = "4" ]; then
      echo -e -n "${UYELLOW}${MIX2}"
    fi
    if [ "$f" = "5" ]; then
      echo -e -n "${MRED}${MIX2}"
    fi
    if [ "$f" = "6" ]; then
      echo -e -n "${MBLUE}${MIX2}"
    fi
    if [ "$f" = "7" ]; then
      echo -e -n "${MGREEN}${MIX2}"
    fi
    if [ "$f" = "8" ]; then
      echo -e -n "${MCYAN}${MIX2}"
    fi
    if [ "$f" = "9" ]; then
      echo -e -n "${MPURPLE}${MIX2}"
    fi
    if [ "$f" = "S" ]; then
      echo -e -n "${MYELLOW}${MIX2}"
    fi
    if [ "$f" = "n" ]; then
      echo -e -n "${LPURPLE}${MIX}"
    fi
    echo -e -n "${RESET}"
  done
  CNT1=$(echo "$line+1" | BC_LINE_LENGTH=0 bc)
  line=$CNT1
  if [ "$(sed ''$line'q;d' $file)" = "!" ]; then
    echo -n ""
  else
    echo ""
  fi
done
echo -e -n "${RESET}"
