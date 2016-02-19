#!/bin/bash
#T-COL  - T-IMG inline color codes script.
#V1.1
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

#formating & commands:
#> escape sequences.
#>^ =new line.

#how to pipe codes to T-COL.sh
#where $TCOL is set to the path of T-COL.sh
#echo "RRRR>^BBBB>^GGGG>^!" | $TCOL

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
DRAW=" "
MIX='▒'
MIX2='░'
# drawing mechanism
until [ "$ENTRY" = "!" ]; do
  read -n 1 ENTRY
    if [ "$ENTRY" = "R" ]; then
      echo -e -n "${RED}$DRAW"
    fi
    if [ "$ENTRY" = "B" ]; then
      echo -e -n "${BLUE}$DRAW"
    fi
    if [ "$ENTRY" = "G" ]; then
      echo -e -n "${GREEN}$DRAW"
    fi
    if [ "$ENTRY" = "1" ]; then
      echo -e -n "${WH}$DRAW"
    fi
    if [ "$ENTRY" = "0" ]; then
      echo -e -n "${BL}$DRAW"
    fi
    if [ "$ENTRY" = "Y" ]; then
      echo -e -n "${YELLOW}$DRAW"
    fi
    if [ "$ENTRY" = "C" ]; then
      echo -e -n "${CYAN}$DRAW"
    fi
    if [ "$ENTRY" = "P" ]; then
      echo -e -n "${PURPLE}$DRAW"
    fi
    if [ "$ENTRY" = "O" ]; then
      echo -e -n "${ORANGE}${MIX}"
    fi
    if [ "$ENTRY" = "g" ]; then
      echo -e -n "${GREY}${MIX}"
    fi
    if [ "$ENTRY" = "v" ]; then
      echo -e -n "${bv}${MIX}"
    fi
    if [ "$ENTRY" = "V" ]; then
      echo -e -n "${rv}${MIX}"
    fi
    if [ "$ENTRY" = "p" ]; then
      echo -e -n "${PINK}${MIX}"
    fi
    if [ "$ENTRY" = "c" ]; then
      echo -e -n "${CG}${MIX}"
    fi
    if [ "$ENTRY" = "y" ]; then
      echo -e -n "${YG}${MIX}"
    fi
    if [ "$ENTRY" = "b" ]; then
      echo -e -n "${BG}${MIX}"
    fi
    if [ "$ENTRY" = "d" ]; then
      echo -e -n "${DG}${MIX}"
    fi
    if [ "$ENTRY" = "l" ]; then
      echo -e -n "${LG}${MIX}"
    fi
    if [ "$ENTRY" = "z" ]; then
      echo -e -n "${DC}${MIX}"
    fi
    if [ "$ENTRY" = "x" ]; then
      echo -e -n "${BC}${MIX}"
    fi
    if [ "$ENTRY" = "Z" ]; then
      echo -e -n "${DB}${MIX}"
    fi
  if [ "$ENTRY" = "X" ]; then
    echo -e -n "${LB}${MIX}"
  fi
  if [ "$ENTRY" = "A" ]; then
    echo -e -n "${LY}${MIX}"
  fi
  if [ "$ENTRY" = "Q" ]; then
    echo -e -n "${LC}${MIX}"
  fi
  if [ "$ENTRY" = "q" ]; then
    echo -e -n "${DY}${MIX}"
  fi
  if [ "$ENTRY" = "r" ]; then
    echo -e -n "${DR}${MIX}"
  fi
  if [ "$ENTRY" = "F" ]; then
    echo -e -n "${BROWN}${MIX2}"
  fi
  if [ "$ENTRY" = "f" ]; then
    echo -e -n "${TAN}${MIX}"
  fi
  if [ "$ENTRY" = "k" ]; then
    echo -e -n "${DGREY}${MIX2}"
  fi
  if [ "$ENTRY" = "K" ]; then
    echo -e -n "${LGREY}${MIX2}"
  fi
  if [ "$ENTRY" = "E" ]; then
    echo -e -n "${OR}${MIX2}"
  fi
  if [ "$ENTRY" = "e" ]; then
    echo -e -n "${OY}${MIX2}"
  fi
  if [ "$ENTRY" = "s" ]; then
    echo -e -n "${SWH}${DRAW}"
  fi
  if [ "$ENTRY" = '_' ]; then
    echo -e -n "${RESET}${DRAW}"
  fi
  if [ "$ENTRY" = "M" ]; then
    echo -e -n "${SRED}${DRAW}"
  fi
  if [ "$ENTRY" = "m" ]; then
    echo -e -n "${SBLUE}${DRAW}"
  fi
  if [ "$ENTRY" = "I" ]; then
    echo -e -n "${SGREEN}${DRAW}"
  fi
  if [ "$ENTRY" = "i" ]; then
    echo -e -n "${SORANGE}${MIX}"
  fi
  if [ "$ENTRY" = "u" ]; then
    echo -e -n "${SCYAN}${DRAW}"
  fi
  if [ "$ENTRY" = "U" ]; then
    echo -e -n "${SPURPLE}${DRAW}"
  fi
  if [ "$ENTRY" = "W" ]; then
    echo -e -n "${SYELLOW}${DRAW}"
  fi
  if [ "$ENTRY" = "w" ]; then
    echo -e -n "${URED}${MIX2}"
  fi
  if [ "$ENTRY" = "H" ]; then
    echo -e -n "${UBLUE}${MIX2}"
  fi
  if [ "$ENTRY" = "h" ]; then
    echo -e -n "${UGREEN}${MIX2}"
  fi
  if [ "$ENTRY" = "2" ]; then
    echo -e -n "${UCYAN}${MIX2}"
  fi
  if [ "$ENTRY" = "3" ]; then
    echo -e -n "${UPURPLE}${MIX2}"
  fi
  if [ "$ENTRY" = "4" ]; then
    echo -e -n "${UYELLOW}${MIX2}"
  fi
  if [ "$ENTRY" = "5" ]; then
    echo -e -n "${MRED}${MIX2}"
  fi
  if [ "$ENTRY" = "6" ]; then
    echo -e -n "${MBLUE}${MIX2}"
  fi
  if [ "$ENTRY" = "7" ]; then
    echo -e -n "${MGREEN}${MIX2}"
  fi
  if [ "$ENTRY" = "8" ]; then
    echo -e -n "${MCYAN}${MIX2}"
  fi
  if [ "$ENTRY" = "9" ]; then
    echo -e -n "${MPURPLE}${MIX2}"
  fi
  if [ "$ENTRY" = "S" ]; then
    echo -e -n "${MYELLOW}${MIX2}"
  fi
  if [ "$ENTRY" = "n" ]; then
    echo -e -n "${LPURPLE}${MIX}"
  fi
  if [ "$ENTRY" = "t" ]; then
    echo -e -n "${TRED}${MIX}"
  fi
  if [ "$ENTRY" = "o" ]; then
    echo -e -n "${TBLUE}${MIX}"
  fi
  if [ "$ENTRY" = "a" ]; then
    echo -e -n "${TGREEN}${MIX}"
  fi
  if [ "$ENTRY" = "T" ]; then
    echo -e -n "${TBL}${MIX}"
  fi
  if [ "$ENTRY" = "j" ]; then
    echo -e -n "${TWH}${MIX}"
  fi
  if [ "$ENTRY" = "D" ]; then
    echo -e -n "${TCYAN}${MIX}"
  fi
  if [ "$ENTRY" = "J" ]; then
    echo -e -n "${TPURPLE}${MIX}"
  fi
  if [ "$ENTRY" = "N" ]; then
    echo -e -n "${TYELLOW}${MIX}"
  fi
  if [ "$ENTRY" = "L" ]; then
    echo -e -n "${LBL}${DRAW}"
  fi
  if [ "$ENTRY" = ">" ]; then
    read -n 1 ESCENTRY
    if [ "$ESCENTRY" = "^" ]; then
      echo ""
    fi
  fi
  echo -e -n "${RESET}"
done
echo -e -n "${RESET}"
