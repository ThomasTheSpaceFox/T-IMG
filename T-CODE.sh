#!/bin/bash
WHEREAMI="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd && echo)"
cd $WHEREAMI
#T-IMG -Terminal Image System to Raw Escape code translator.
#V1.0
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
#third translucency color chart
#t=T-Red
#o=T-Blue
#a=T-Green
#j=T-white
#T=T-black
#D=T-Cyan
#J=T-Purple
#N=T-Yellow
#L=Light Black

RED='\033[0;41m'
URED='\033[0;40m\033[1;31m'
MRED='\033[0;41m\033[1;37m'
SRED='\033[0;101m'
TRED='\033[0;91m'
BLUE='\033[0;44m'
UBLUE='\033[0;40m\033[1;34m'
MBLUE='\033[0;44m\033[1;37m'
SBLUE='\033[0;104m'
TBLUE='\033[0;94m'
GREEN='\033[0;42m'
UGREEN='\033[0;40m\033[1;32m'
MGREEN='\033[0;42m\033[1;37m'
SGREEN='\033[0;102m'
TGREEN='\033[0;92m'
ORANGE='\033[0;43m\033[1;31m'
SORANGE='\033[0;103m\033[1;91m'   
GREY='\033[0;47m\033[1;30m'
LGREY='\033[0;47m\033[1;30m'
DGREY='\033[0;40m\033[1;37m'
WH='\033[0;47m'
TWH='\033[0;97m'
SWH='\033[0;107m'
BL='\033[0;40m'
TBL='\033[0;30m'
LBL='\033[0;100m'
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
TYELLOW='\033[0;93m'
CYAN='\033[0;46m'
UCYAN='\033[0;40m\033[1;36m'
MCYAN='\033[0;46m\033[1;37m'
SCYAN='\033[0;106m'
TCYAN='\033[0;96m'
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
TPURPLE='\033[0;95m'
# reset command (used at end of script to return to normal teminal colors)
RESET='\033[0m'
# file to translate
# BE SURE TO CONFIGURE THIS SECTION CORRECTLY!
#
#uncomment this line, and point it to the T-IMG image you wish to translate:
#file="$WHEREAMI/DEVTRAN.TIMG"
#or uncomment this line to call T-CODE.sh from within another script/terminal
#such as the included wrapper script, TIMGTRANS.sh :
file="$1"
#comment out this line to prevent T-IMG from printing the title.
echo "$(sed ''1'q;d' $file)"
# character-pixel strings used:
CHARMODE=$(sed ''2'q;d' $file)
echo "CHARMODE $CHARMODE"
if [ "$CHARMODE" = "2" ]; then
  DRAW='__'
  MIX='▒▒'
  MIX2='░░'
else
  DRAW='_'
  MIX='▒'
  MIX2='░'
fi
echo "${DRAW}l"
line=3
# drawing mechanism
TCODEBATCH () {
echo "# Translated into raw escape codes from T-IMG format by T-CODE v1.0"
until [ "$current" = "!" ]; do
  current=$(sed ''$line'q;d' $file)
  LINESET=$(echo $current | grep -o .)
  echo -n "echo -e -n "'"'
  for f in $LINESET
  do
    if [ "$f" = "R" ]; then
      echo -n ${RED}${DRAW}
    fi
    if [ "$f" = "B" ]; then
      echo -n ${BLUE}${DRAW}
    fi
    if [ "$f" = "G" ]; then
      echo -n ${GREEN}${DRAW}
    fi
    if [ "$f" = "1" ]; then
      echo -n ${WH}${DRAW}
    fi
    if [ "$f" = "0" ]; then
      echo -n ${BL}${DRAW}
    fi
    if [ "$f" = "Y" ]; then
      echo -n ${YELLOW}${DRAW}
    fi
    if [ "$f" = "C" ]; then
      echo -n ${CYAN}${DRAW}
    fi
    if [ "$f" = "P" ]; then
      echo -n ${PURPLE}${DRAW}
    fi
    if [ "$f" = "O" ]; then
      echo -n ${ORANGE}${MIX}
    fi
    if [ "$f" = "g" ]; then
      echo -n ${GREY}${MIX}
    fi
    if [ "$f" = "v" ]; then
      echo -n ${bv}${MIX}
    fi
    if [ "$f" = "V" ]; then
      echo -n ${rv}${MIX}
    fi
    if [ "$f" = "p" ]; then
      echo -n ${PINK}${MIX}
    fi
    if [ "$f" = "c" ]; then
      echo -n ${CG}${MIX}
    fi
    if [ "$f" = "y" ]; then
      echo -n ${YG}${MIX}
    fi
    if [ "$f" = "b" ]; then
      echo -n ${BG}${MIX}
    fi
    if [ "$f" = "d" ]; then
      echo -n ${DG}${MIX}
    fi
    if [ "$f" = "l" ]; then
      echo -n ${LG}${MIX}
    fi
    if [ "$f" = "z" ]; then
      echo -n ${DC}${MIX}
    fi
    if [ "$f" = "x" ]; then
      echo -n ${BC}${MIX}
    fi
    if [ "$f" = "Z" ]; then
      echo -n ${DB}${MIX}
    fi
    if [ "$f" = "X" ]; then
      echo -n ${LB}${MIX}
    fi
    if [ "$f" = "A" ]; then
      echo -n ${LY}${MIX}
    fi
    if [ "$f" = "Q" ]; then
      echo -n ${LC}${MIX}
    fi
    if [ "$f" = "q" ]; then
      echo -n ${DY}${MIX}
    fi
    if [ "$f" = "r" ]; then
      echo -n ${DR}${MIX}
    fi
    if [ "$f" = "F" ]; then
      echo -n ${BROWN}${MIX2}
    fi
    if [ "$f" = "f" ]; then
      echo -n ${TAN}${MIX}
    fi
    if [ "$f" = "k" ]; then
      echo -n ${DGREY}${MIX2}
    fi
    if [ "$f" = "K" ]; then
      echo -n ${LGREY}${MIX2}
    fi
    if [ "$f" = "E" ]; then
      echo -n ${OR}${MIX2}
    fi
    if [ "$f" = "e" ]; then
      echo -n ${OY}${MIX2}
    fi
    if [ "$f" = "s" ]; then
      echo -n ${SWH}${DRAW}
    fi
    if [ "$f" = '_' ]; then
      echo -n ${RESET}${DRAW}
    fi
    if [ "$f" = "M" ]; then
      echo -n ${SRED}${DRAW}
    fi
    if [ "$f" = "m" ]; then
      echo -n ${SBLUE}${DRAW}
    fi
    if [ "$f" = "I" ]; then
      echo -n ${SGREEN}${DRAW}
    fi
    if [ "$f" = "i" ]; then
      echo -n ${SORANGE}${MIX}
    fi
    if [ "$f" = "u" ]; then
      echo -n ${SCYAN}${DRAW}
    fi
    if [ "$f" = "U" ]; then
      echo -n ${SPURPLE}${DRAW}
    fi
    if [ "$f" = "W" ]; then
      echo -n ${SYELLOW}${DRAW}
    fi
    if [ "$f" = "w" ]; then
      echo -n ${URED}${MIX2}
    fi
    if [ "$f" = "H" ]; then
      echo -n ${UBLUE}${MIX2}
    fi
    if [ "$f" = "h" ]; then
      echo -n ${UGREEN}${MIX2}
    fi
    if [ "$f" = "2" ]; then
      echo -n ${UCYAN}${MIX2}
    fi
    if [ "$f" = "3" ]; then
      echo -n ${UPURPLE}${MIX2}
    fi
    if [ "$f" = "4" ]; then
      echo -n ${UYELLOW}${MIX2}
    fi
    if [ "$f" = "5" ]; then
      echo -n ${MRED}${MIX2}
    fi
    if [ "$f" = "6" ]; then
      echo -n ${MBLUE}${MIX2}
    fi
    if [ "$f" = "7" ]; then
      echo -n ${MGREEN}${MIX2}
    fi
    if [ "$f" = "8" ]; then
      echo -n ${MCYAN}${MIX2}
    fi
    if [ "$f" = "9" ]; then
      echo -n ${MPURPLE}${MIX2}
    fi
    if [ "$f" = "S" ]; then
      echo -n ${MYELLOW}${MIX2}
    fi
    if [ "$f" = "n" ]; then
      echo -n ${LPURPLE}${MIX}
    fi
    if [ "$f" = "t" ]; then
      echo -n ${TRED}${MIX}
    fi
    if [ "$f" = "o" ]; then
      echo -n ${TBLUE}${MIX}
    fi
    if [ "$f" = "a" ]; then
      echo -n ${TGREEN}${MIX}
    fi
    if [ "$f" = "T" ]; then
      echo -n ${TBL}${MIX}
    fi
    if [ "$f" = "j" ]; then
      echo -n ${TWH}${MIX}
    fi
    if [ "$f" = "D" ]; then
      echo -n ${TCYAN}${MIX}
    fi
    if [ "$f" = "J" ]; then
      echo -n ${TPURPLE}${MIX}
    fi
    if [ "$f" = "N" ]; then
      echo -n ${TYELLOW}${MIX}
    fi
    if [ "$f" = "L" ]; then
    echo -n ${LBL}${DRAW}
    fi
    echo -n ${RESET}
  done
  echo -n '"'
  CNT1=$(($line+1))
  line=$CNT1
  if [ "$(sed ''$line'q;d' $file)" = "!" ]; then
    echo ""
  else
    echo "
echo '"' '"'"
  fi
done
echo -n "echo -e -n "'"'
echo -n ${RESET}
echo -n '"'

}
echo $line
if [ "$CHARMODE" = "2" ]; then
  TCODEBATCH | sed -r 's/[_]+/  /g' > output.txt
else
  TCODEBATCH | sed -r 's/[_]+/ /g' > output.txt
fi
echo $line