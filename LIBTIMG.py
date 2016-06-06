#!/usr/bin/env python
# coding=utf-8
#(c) 2015-2016 Thomas Leathers
#T-IMG -Terminal Image System Python Library
#codeset v4.1
#T-IMG library v1.2

#__all__ = ["TIMGfiledraw"]

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

#import fileinput
import math


RED=('\033[0;41m')
URED=('\033[0;40m\033[1;31m')
MRED=('\033[0;41m\033[1;37m')
SRED=('\033[0;101m')
TRED=('\033[0;91m')
BLUE=('\033[0;44m')
UBLUE=('\033[0;40m\033[1;34m')
MBLUE=('\033[0;44m\033[1;37m')
SBLUE=('\033[0;104m')
TBLUE=('\033[0;94m')
GREEN=('\033[0;42m')
UGREEN=('\033[0;40m\033[1;32m')
MGREEN=('\033[0;42m\033[1;37m')
SGREEN=('\033[0;102m')
TGREEN=('\033[0;92m')
ORANGE=('\033[0;43m\033[1;31m')
SORANGE=('\033[0;103m\033[1;91m')   
GREY=('\033[0;47m\033[1;30m')
LGREY=('\033[0;47m\033[1;30m')
DGREY=('\033[0;40m\033[1;37m')
WH=('\033[0;47m')
TWH=('\033[0;97m')
SWH=('\033[0;107m')
BL=('\033[0;40m')
TBL=('\033[0;30m')
LBL=('\033[0;100m')
DY=('\033[0;40m\033[1;33m')
DR=('\033[0;40m\033[1;31m')
BROWN=('\033[0;41m\033[1;32m')
TAN=('\033[0;45m\033[1;33m')
bv=('\033[0;44m\033[1;35m')
rv=('\033[0;44m\033[1;31m')
DC=('\033[0;40m\033[1;36m')
DB=('\033[0;40m\033[1;34m')
LB=('\033[0;47m\033[1;34m')
LY=('\033[0;47m\033[1;33m')
BC=('\033[0;44m\033[1;36m')
PINK=('\033[0;47m\033[1;31m')
LC=('\033[0;47m\033[1;36m')
YELLOW=('\033[0;43m')
UYELLOW=('\033[0;40m\033[1;33m')
MYELLOW=('\033[0;43m\033[1;37m')
SYELLOW=('\033[0;103m')
TYELLOW=('\033[0;93m')
CYAN=('\033[0;46m')
UCYAN=('\033[0;40m\033[1;36m')
MCYAN=('\033[0;46m\033[1;37m')
SCYAN=('\033[0;106m')
TCYAN=('\033[0;96m')
OR=('\033[0;41m\033[1;33m')
OY=('\033[0;43m\033[1;31m')
CG=('\033[0;46m\033[1;32m')
BG=('\033[0;44m\033[1;32m')
YG=('\033[0;43m\033[1;32m')
DG=('\033[0;40m\033[1;32m')
LG=('\033[0;47m\033[1;32m')
PURPLE=('\033[0;45m')
UPURPLE=('\033[0;40m\033[1;35m')
MPURPLE=('\033[0;45m\033[1;37m')
LPURPLE=('\033[0;47m\033[1;35m')
SPURPLE=('\033[0;105m')
TPURPLE=('\033[0;95m')
RESET='\033[0m'


def TIMGfiledraw(filetodraw):
	#draw (it will be *PRINTED*) the specified TIMG file.
	#If you want to load the TIMG data for later interpetation / modification,
	#see the "charcodedump" function, and the "inline" function.
	datacnt = 1
	n = open(filetodraw)
	for datalst in n:
		if datacnt==1:
			PICTITLE = datalst.replace("\n", "")
			#print ("maze title:" + datalst.replace("\n", ""))
		if datacnt==2:
			CHARMODE = (datalst.replace("\n", ""))
			#print ('.MOD.txt file: \n' + "./MAZE/" + datalst.replace("\n", ""))
		datacnt += 1
	#comment this line if you dont want timg to print the title:
	#print (PICTITLE)
	
	if CHARMODE==('1'):
		DRAW=(" ")
		MIX=('▒')
		MIX2=('░')
	elif CHARMODE==('2'):
		DRAW=("  ")
		MIX=('▒▒')
		MIX2=('░░')
	
	LINENO=1
	n = open(filetodraw)
	for culine in n:
		curline = culine.replace("\n", "")
		if (LINENO > 2 and curline!=('!')):
			#print curline
			LINEBLOCK=('')
			for CHARCODE in curline:
				if CHARCODE==('R'):
					LINEBLOCK=(LINEBLOCK + RED + DRAW + RESET)
				if CHARCODE==('B'):
					LINEBLOCK=(LINEBLOCK + BLUE + DRAW + RESET)
				if CHARCODE==('G'):
					LINEBLOCK=(LINEBLOCK + GREEN + DRAW + RESET)
				if CHARCODE==('1'):
					LINEBLOCK=(LINEBLOCK + WH + DRAW + RESET)
				if CHARCODE==('0'):
					LINEBLOCK=(LINEBLOCK + BL + DRAW + RESET)
				if CHARCODE==('Y'):
					LINEBLOCK=(LINEBLOCK + YELLOW + DRAW + RESET)
				if CHARCODE==('C'):
					LINEBLOCK=(LINEBLOCK + CYAN + DRAW + RESET)
				if CHARCODE==('P'):
					LINEBLOCK=(LINEBLOCK + PURPLE + DRAW + RESET)
				if CHARCODE==('O'):
					LINEBLOCK=(LINEBLOCK + ORANGE + MIX + RESET)
				if CHARCODE==('g'):
					LINEBLOCK=(LINEBLOCK + GREY + MIX + RESET)
				if CHARCODE==('v'):
					LINEBLOCK=(LINEBLOCK + bv + MIX + RESET)
				if CHARCODE==('V'):
					LINEBLOCK=(LINEBLOCK + rv + MIX + RESET)
				if CHARCODE==('p'):
					LINEBLOCK=(LINEBLOCK + PINK + MIX + RESET)
				if CHARCODE==('c'):
					LINEBLOCK=(LINEBLOCK + CG + MIX + RESET)
				if CHARCODE==('y'):
					LINEBLOCK=(LINEBLOCK + YG + MIX + RESET)
				if CHARCODE==('b'):
					LINEBLOCK=(LINEBLOCK + BG + MIX + RESET)
				if CHARCODE==('d'):
					LINEBLOCK=(LINEBLOCK + DG + MIX + RESET)
				if CHARCODE==('l'):
					LINEBLOCK=(LINEBLOCK + LG + MIX + RESET)
				if CHARCODE==('z'):
					LINEBLOCK=(LINEBLOCK + DC + MIX + RESET)
				if CHARCODE==('x'):
					LINEBLOCK=(LINEBLOCK + BC + MIX + RESET)
				if CHARCODE==('Z'):
					LINEBLOCK=(LINEBLOCK + DB + MIX + RESET)
				if CHARCODE==('X'):
					LINEBLOCK=(LINEBLOCK + LB + MIX + RESET)
				if CHARCODE==('A'):
					LINEBLOCK=(LINEBLOCK + LY + MIX + RESET)
				if CHARCODE==('Q'):
					LINEBLOCK=(LINEBLOCK + LC + MIX + RESET)
				if CHARCODE==('q'):
					LINEBLOCK=(LINEBLOCK + DY + MIX + RESET)
				if CHARCODE==('r'):
					LINEBLOCK=(LINEBLOCK + DR + MIX + RESET)
				if CHARCODE==('F'):
					LINEBLOCK=(LINEBLOCK + BROWN + MIX2 + RESET)
				if CHARCODE==('f'):
					LINEBLOCK=(LINEBLOCK + TAN + MIX + RESET)
				if CHARCODE==('k'):
					LINEBLOCK=(LINEBLOCK + DGREY + MIX2 + RESET)
				if CHARCODE==('K'):
					LINEBLOCK=(LINEBLOCK + LGREY + MIX2 + RESET)
				if CHARCODE==('E'):
					LINEBLOCK=(LINEBLOCK + OR + MIX2 + RESET)
				if CHARCODE==('e'):
					LINEBLOCK=(LINEBLOCK + OY + MIX2 + RESET)
				if CHARCODE==('s'):
					LINEBLOCK=(LINEBLOCK + SWH + DRAW + RESET)
				if CHARCODE==('_'):
					LINEBLOCK=(LINEBLOCK + RESET + DRAW + RESET)
				if CHARCODE==('M'):
					LINEBLOCK=(LINEBLOCK + SRED + DRAW + RESET)
				if CHARCODE==('m'):
					LINEBLOCK=(LINEBLOCK + SBLUE + DRAW + RESET)
				if CHARCODE==('I'):
					LINEBLOCK=(LINEBLOCK + SGREEN + DRAW + RESET)
				if CHARCODE==('i'):
					LINEBLOCK=(LINEBLOCK + SORANGE + MIX + RESET)
				if CHARCODE==('u'):
					LINEBLOCK=(LINEBLOCK + SCYAN + DRAW + RESET)
				if CHARCODE==('U'):
					LINEBLOCK=(LINEBLOCK + SPURPLE + DRAW + RESET)
				if CHARCODE==('W'):
					LINEBLOCK=(LINEBLOCK + SYELLOW + DRAW + RESET)
				if CHARCODE==('w'):
					LINEBLOCK=(LINEBLOCK + URED + MIX2 + RESET)
				if CHARCODE==('H'):
					LINEBLOCK=(LINEBLOCK + UBLUE + MIX2 + RESET)
				if CHARCODE==('h'):
					LINEBLOCK=(LINEBLOCK + UGREEN + MIX2 + RESET)
				if CHARCODE==('2'):
					LINEBLOCK=(LINEBLOCK + UCYAN + MIX2 + RESET)
				if CHARCODE==('3'):
					LINEBLOCK=(LINEBLOCK + UPURPLE + MIX2 + RESET)
				if CHARCODE==('4'):
					LINEBLOCK=(LINEBLOCK + UYELLOW + MIX2 + RESET)
				if CHARCODE==('5'):
					LINEBLOCK=(LINEBLOCK + MRED + MIX2 + RESET)
				if CHARCODE==('6'):
					LINEBLOCK=(LINEBLOCK + MBLUE + MIX2 + RESET)
				if CHARCODE==('7'):
					LINEBLOCK=(LINEBLOCK + MGREEN + MIX2 + RESET)
				if CHARCODE==('8'):
					LINEBLOCK=(LINEBLOCK + MCYAN + MIX2 + RESET)
				if CHARCODE==('9'):
					LINEBLOCK=(LINEBLOCK + MPURPLE + MIX2 + RESET)
				if CHARCODE==('S'):
					LINEBLOCK=(LINEBLOCK + MYELLOW + MIX2 + RESET)
				if CHARCODE==('n'):
					LINEBLOCK=(LINEBLOCK + LPURPLE + MIX + RESET)
				if CHARCODE==('t'):
					LINEBLOCK=(LINEBLOCK + TRED + MIX + RESET)
				if CHARCODE==('o'):
					LINEBLOCK=(LINEBLOCK + TBLUE + MIX + RESET)
				if CHARCODE==('a'):
					LINEBLOCK=(LINEBLOCK + TGREEN + MIX + RESET)
				if CHARCODE==('T'):
					LINEBLOCK=(LINEBLOCK + TBL + MIX + RESET)
				if CHARCODE==('j'):
					LINEBLOCK=(LINEBLOCK + TWH + MIX + RESET)
				if CHARCODE==('D'):
					LINEBLOCK=(LINEBLOCK + TCYAN + MIX + RESET)
				if CHARCODE==('J'):
					LINEBLOCK=(LINEBLOCK + TPURPLE + MIX + RESET)
				if CHARCODE==('N'):
					LINEBLOCK=(LINEBLOCK + TYELLOW + MIX + RESET)
				if CHARCODE==('L'):
					LINEBLOCK=(LINEBLOCK + LBL + DRAW + RESET)
			print (LINEBLOCK)
		LINENO += 1

def gettitle(imagetoload):
	datacnt = 1
	n = open(imagetoload)
	for datalst in n:
		if datacnt==1:
			PICTITLE = datalst.replace("\n", "")
			return (PICTITLE)
			#print ("maze title:" + datalst.replace("\n", ""))
			break
		datacnt += 1

def getcharmode(imagetoload):
	#returns character mode  (either 1 or 2. 1 is most common. and is recommended.
	# as it will give you a greater level of detail.)
	#(how many block chars are printed per TIMG charater code)
	datacnt = 1
	n = open(imagetoload)
	for datalst in n:
		if datacnt==2:
			CHARMODE = datalst.replace("\n", "")
			return (CHARMODE)
			#print ("maze title:" + datalst.replace("\n", ""))
			break
		datacnt += 1


def inline(charcodestring):
	#interpert TIMG graphics, in-line, straight from your python program!
	#no .TIMG files needed. it does honor real newlines as well as newlines specified by a "-"
	#note that this function returns the interpeted form of the data. it does *NOT* print it.
	DRAW=(" ")
	MIX=('▒')
	MIX2=('░')
	
	
	curline = charcodestring.replace("\n", "-")
	#print curline
	LINEBLOCK=('')
	for CHARCODE in curline:
		if CHARCODE==('R'):
			LINEBLOCK=(LINEBLOCK + RED + DRAW + RESET)
		if CHARCODE==('B'):
			LINEBLOCK=(LINEBLOCK + BLUE + DRAW + RESET)
		if CHARCODE==('G'):
			LINEBLOCK=(LINEBLOCK + GREEN + DRAW + RESET)
		if CHARCODE==('1'):
			LINEBLOCK=(LINEBLOCK + WH + DRAW + RESET)
		if CHARCODE==('0'):
			LINEBLOCK=(LINEBLOCK + BL + DRAW + RESET)
		if CHARCODE==('Y'):
			LINEBLOCK=(LINEBLOCK + YELLOW + DRAW + RESET)
		if CHARCODE==('C'):
			LINEBLOCK=(LINEBLOCK + CYAN + DRAW + RESET)
		if CHARCODE==('P'):
			LINEBLOCK=(LINEBLOCK + PURPLE + DRAW + RESET)
		if CHARCODE==('O'):
			LINEBLOCK=(LINEBLOCK + ORANGE + MIX + RESET)
		if CHARCODE==('g'):
			LINEBLOCK=(LINEBLOCK + GREY + MIX + RESET)
		if CHARCODE==('v'):
			LINEBLOCK=(LINEBLOCK + bv + MIX + RESET)
		if CHARCODE==('V'):
			LINEBLOCK=(LINEBLOCK + rv + MIX + RESET)
		if CHARCODE==('p'):
			LINEBLOCK=(LINEBLOCK + PINK + MIX + RESET)
		if CHARCODE==('c'):
			LINEBLOCK=(LINEBLOCK + CG + MIX + RESET)
		if CHARCODE==('y'):
			LINEBLOCK=(LINEBLOCK + YG + MIX + RESET)
		if CHARCODE==('b'):
			LINEBLOCK=(LINEBLOCK + BG + MIX + RESET)
		if CHARCODE==('d'):
			LINEBLOCK=(LINEBLOCK + DG + MIX + RESET)
		if CHARCODE==('l'):
			LINEBLOCK=(LINEBLOCK + LG + MIX + RESET)
		if CHARCODE==('z'):
			LINEBLOCK=(LINEBLOCK + DC + MIX + RESET)
		if CHARCODE==('x'):
			LINEBLOCK=(LINEBLOCK + BC + MIX + RESET)
		if CHARCODE==('Z'):
			LINEBLOCK=(LINEBLOCK + DB + MIX + RESET)
		if CHARCODE==('X'):
			LINEBLOCK=(LINEBLOCK + LB + MIX + RESET)
		if CHARCODE==('A'):
			LINEBLOCK=(LINEBLOCK + LY + MIX + RESET)
		if CHARCODE==('Q'):
			LINEBLOCK=(LINEBLOCK + LC + MIX + RESET)
		if CHARCODE==('q'):
			LINEBLOCK=(LINEBLOCK + DY + MIX + RESET)
		if CHARCODE==('r'):
			LINEBLOCK=(LINEBLOCK + DR + MIX + RESET)
		if CHARCODE==('F'):
			LINEBLOCK=(LINEBLOCK + BROWN + MIX2 + RESET)
		if CHARCODE==('f'):
			LINEBLOCK=(LINEBLOCK + TAN + MIX + RESET)
		if CHARCODE==('k'):
			LINEBLOCK=(LINEBLOCK + DGREY + MIX2 + RESET)
		if CHARCODE==('K'):
			LINEBLOCK=(LINEBLOCK + LGREY + MIX2 + RESET)
		if CHARCODE==('E'):
			LINEBLOCK=(LINEBLOCK + OR + MIX2 + RESET)
		if CHARCODE==('e'):
			LINEBLOCK=(LINEBLOCK + OY + MIX2 + RESET)
		if CHARCODE==('s'):
			LINEBLOCK=(LINEBLOCK + SWH + DRAW + RESET)
		if CHARCODE==('_'):
			LINEBLOCK=(LINEBLOCK + RESET + DRAW + RESET)
		if CHARCODE==('M'):
			LINEBLOCK=(LINEBLOCK + SRED + DRAW + RESET)
		if CHARCODE==('m'):
			LINEBLOCK=(LINEBLOCK + SBLUE + DRAW + RESET)
		if CHARCODE==('I'):
			LINEBLOCK=(LINEBLOCK + SGREEN + DRAW + RESET)
		if CHARCODE==('i'):
			LINEBLOCK=(LINEBLOCK + SORANGE + MIX + RESET)
		if CHARCODE==('u'):
			LINEBLOCK=(LINEBLOCK + SCYAN + DRAW + RESET)
		if CHARCODE==('U'):
			LINEBLOCK=(LINEBLOCK + SPURPLE + DRAW + RESET)
		if CHARCODE==('W'):
			LINEBLOCK=(LINEBLOCK + SYELLOW + DRAW + RESET)
		if CHARCODE==('w'):
			LINEBLOCK=(LINEBLOCK + URED + MIX2 + RESET)
		if CHARCODE==('H'):
			LINEBLOCK=(LINEBLOCK + UBLUE + MIX2 + RESET)
		if CHARCODE==('h'):
			LINEBLOCK=(LINEBLOCK + UGREEN + MIX2 + RESET)
		if CHARCODE==('2'):
			LINEBLOCK=(LINEBLOCK + UCYAN + MIX2 + RESET)
		if CHARCODE==('3'):
			LINEBLOCK=(LINEBLOCK + UPURPLE + MIX2 + RESET)
		if CHARCODE==('4'):
			LINEBLOCK=(LINEBLOCK + UYELLOW + MIX2 + RESET)
		if CHARCODE==('5'):
			LINEBLOCK=(LINEBLOCK + MRED + MIX2 + RESET)
		if CHARCODE==('6'):
			LINEBLOCK=(LINEBLOCK + MBLUE + MIX2 + RESET)
		if CHARCODE==('7'):
			LINEBLOCK=(LINEBLOCK + MGREEN + MIX2 + RESET)
		if CHARCODE==('8'):
			LINEBLOCK=(LINEBLOCK + MCYAN + MIX2 + RESET)
		if CHARCODE==('9'):
			LINEBLOCK=(LINEBLOCK + MPURPLE + MIX2 + RESET)
		if CHARCODE==('S'):
			LINEBLOCK=(LINEBLOCK + MYELLOW + MIX2 + RESET)
		if CHARCODE==('n'):
			LINEBLOCK=(LINEBLOCK + LPURPLE + MIX + RESET)
		if CHARCODE==('t'):
			LINEBLOCK=(LINEBLOCK + TRED + MIX + RESET)
		if CHARCODE==('o'):
			LINEBLOCK=(LINEBLOCK + TBLUE + MIX + RESET)
		if CHARCODE==('a'):
			LINEBLOCK=(LINEBLOCK + TGREEN + MIX + RESET)
		if CHARCODE==('T'):
			LINEBLOCK=(LINEBLOCK + TBL + MIX + RESET)
		if CHARCODE==('j'):
			LINEBLOCK=(LINEBLOCK + TWH + MIX + RESET)
		if CHARCODE==('D'):
			LINEBLOCK=(LINEBLOCK + TCYAN + MIX + RESET)
		if CHARCODE==('J'):
			LINEBLOCK=(LINEBLOCK + TPURPLE + MIX + RESET)
		if CHARCODE==('N'):
			LINEBLOCK=(LINEBLOCK + TYELLOW + MIX + RESET)
		if CHARCODE==('L'):
			LINEBLOCK=(LINEBLOCK + LBL + DRAW + RESET)
		if CHARCODE==('-'):
			LINEBLOCK=(LINEBLOCK + "\n")
	return (LINEBLOCK)

def charcodedump(filetodraw):
	#returns raw TIMG character codes, no fuss.
	LINENO=1
	n = open(filetodraw)
	CHARCODEDUMP=('')
	for culine in n:
		curline = culine.replace("\n", "")
		if (LINENO > 2 and curline!=('!')):
			#print curline
			LINEBLOCK=('')
			for CHARCODE in curline:
				LINEBLOCK=(LINEBLOCK + CHARCODE)
			CHARCODEDUMP=(CHARCODEDUMP + LINEBLOCK + "\n")
		LINENO += 1
	return (CHARCODEDUMP)

def TIMGprep(charcodedata, charmode, pictitle):
	#prepares the specified (character code data, character mode, and title)
	#as a .TIMG file structure. ready to be saved.
	LINENO=1
	CHARCODEDUMP=(pictitle + "\n" + charmode + "\n")
	arndata = (charcodedata.replace("\n", "-"))
	for culine in (arndata):
		curline = culine.replace("\n", "")
		if (LINENO > 0 and culine!=('!')):
			#print curline
			LINEBLOCK=('')
			for CHARCODE in curline:
				LINEBLOCK=(LINEBLOCK + CHARCODE)
			CHARCODEDUMP=(CHARCODEDUMP + LINEBLOCK)
		LINENO += 1
	CHARCODEDUMP=(CHARCODEDUMP.replace("-", "\n") + "!")
	return (CHARCODEDUMP)

def TIMGmode2expand(charcodedata):
	#expands charmode 2 TIMG data into charmode 1 TIMG data.
	LINENO=1
	CHARCODEDUMP=('')
	arndata = (charcodedata.replace("-", "+"))
	arndata = (arndata.replace("\n", "-"))
	for culine in (arndata):
		curline = culine.replace("\n", "")
		if (LINENO > 0 and culine!=('!')):
			#print curline
			LINEBLOCK=('')
			for CHARCODE in curline:
				if (CHARCODE==("-") or CHARCODE==("+")):
					LINEBLOCK=(LINEBLOCK + CHARCODE)
				elif (CHARCODE!=("-") or CHARCODE!=("+")):
					LINEBLOCK=(LINEBLOCK + CHARCODE + CHARCODE)
			CHARCODEDUMP=(CHARCODEDUMP + LINEBLOCK)
		LINENO += 1
	CHARCODEDUMP=(CHARCODEDUMP.replace("-", "\n").replace("+", "-"))
	return (CHARCODEDUMP)

def coderep(charcodedata, codetorep, codetorepwith):
	#replaces the specified character code (codetorep) with the spcified 
	#character (codetorepwith), in the provided character code data 
	#(charcodedata) , and returns the result.)
	return(charcodedata.replace(codetorep, codetorepwith))

def getpoint(charcodedata, liney, colx):
	#get character code from line: "liney" and column: "colx" 
	#in provided timg character code data: "charcodedata"
	#x and y start at 1 i.e. 1,1 is line 1 column 1.
	LINENO=1
	LINENOB=1
	LINEBOULDER=('')
	CHARCODEDUMP=('')
	referflag1=0
	CHARCODEIS=("")
	#arndata = (charcodedata.replace("-", "+"))
	arndata = (charcodedata.replace("\n", "+"))
	for culine in (arndata):
		
		if culine!=("+"):
			LINEBOULDER=(LINEBOULDER + culine)
		elif culine==("+"):
			LINEBOULDER=(LINEBOULDER)
			referflag1=1
		if (LINENO > 0 and culine!=('!') and referflag1==1):
			#print curline
			LINEBLOCK=('')
			COLNO=1
			for CHARCODE in LINEBOULDER:
				if (COLNO==colx and LINENOB==liney):
					CHARCODEIS=CHARCODE
				COLNO += 1
			CHARCODEDUMP=(CHARCODEDUMP + LINEBLOCK  + "+")
		if referflag1==1:
			LINENOB += 1
			LINEBOULDER=('')
		referflag1=0
		LINENO += 1
	#CHARCODEDUMP=(CHARCODEDUMP.replace("+", "\n"))
	return (CHARCODEIS)

def hlinedraw(timgdata, chartouse, Y1, X1, X2):
	if X1>X2:
		XSTA=X2
		XEND=X1
	if X2>X1:
		XSTA=X1
		XEND=X2
	VIXEND=(XEND + 1)
	Xcnt=1
	while Xcnt!=VIXEND:
		if (Xcnt>=XSTA and Xcnt<=XEND):
			timgdata=(reppoint(timgdata, chartouse, Y1, Xcnt))
		Xcnt += 1
	return(timgdata)

def vlinedraw(timgdata, chartouse, Y1, Y2, X1):
	if Y1>Y2:
		YSTA=Y2
		YEND=Y1
	if Y2>Y1:
		YSTA=Y1
		YEND=Y2
	VIXEND=(YEND + 1)
	Ycnt=1
	while Ycnt!=VIXEND:
		if (Ycnt>=YSTA and Ycnt<=YEND):
			timgdata=(reppoint(timgdata, chartouse, Ycnt, X1))
		Ycnt += 1
	return(timgdata)



def linedraw(timgdata, codetouse, Y1, X1, Y2, X2):
	if X1==X2:
		timgdata = vlinedraw(timgdata, codetouse, Y1, Y2, X1)
	elif Y1==Y2:
		timgdata = hlinedraw(timgdata, codetouse, Y1, X1, X2)
	elif (Y1!=Y2 and X1!=X2):
		if X1>X2:
			YSTA=Y2
			YEND=Y1
			XSTA=X2
			XEND=X1
		if X2>X1:
			YSTA=Y1
			YEND=Y2
			XSTA=X1
			XEND=X2
		Ydiff=(YSTA - YEND)
		Xdiff=(XSTA - XEND)
		#print (str(Ydiff) + "/" + str(Xdiff))
		slope=(float(Ydiff) / Xdiff)
		#print (slope)
		curX=XSTA
		curY=YSTA
		curYfl=YSTA
		BARGEX=(XEND + 1)
		slopetank=0
		while (curX!=BARGEX and curYfl!=YEND and slope>0):
			slopeblob=math.floor(slopetank)
			if slopetank>=1:
				curY += float(slopetank)
				slopetank=0
			if slopetank<=-1:
				curY -= float(slopetank)
				slopetank=0
			curYfl=math.floor(curY)
			curXfl=math.floor(curX)
			timgdata=(reppoint(timgdata, codetouse, curYfl, curX))
			slopetank=(slopetank + float(slope))
			#print("calculating")
			curX +=1
		while (curX!=BARGEX and curYfl!=YEND and slope<0):
			slopeblob=math.floor(slopetank)
			if slopetank<=1:
				curY += float(slopetank)
				slopetank=0
			if slopetank>=-1:
				curY -= float(slopetank)
				slopetank=0
			curYfl=math.floor(curY)
			curXfl=math.floor(curX)
			timgdata=(reppoint(timgdata, codetouse, curYfl, curX))
			slopetank=(slopetank + float(slope))
			#print("calculating")
			curX +=1
	return(timgdata)





def reppoint(charcodedata, codetouse, liney, colx):
	#
	#x and y start at 1 i.e. 1,1 is line 1 column 1.
	LINENO=1
	LINENOB=1
	LINEBOULDER=('')
	CHARCODEDUMP=('')
	referflag1=0
	#arndata = (charcodedata.replace("-", "+"))
	arndata = (charcodedata.replace("\n", "+"))
	for culine in (arndata):
		
		if culine!=("+"):
			LINEBOULDER=(LINEBOULDER + culine)
		elif culine==("+"):
			LINEBOULDER=(LINEBOULDER)
			referflag1=1
		if (LINENO > 0 and culine!=('!') and referflag1==1):
			#print curline
			LINEBLOCK=('')
			COLNO=1
			for CHARCODE in LINEBOULDER:
				if (COLNO==colx and LINENOB==liney):
					LINEBLOCK=(LINEBLOCK + codetouse)
				elif (COLNO!=colx or LINENOB!=liney):
					LINEBLOCK=(LINEBLOCK + CHARCODE)
				COLNO += 1
			CHARCODEDUMP=(CHARCODEDUMP + LINEBLOCK + "+")
		if referflag1==1:
			LINENOB += 1
			LINEBOULDER=('')
		referflag1=0
		LINENO += 1
	CHARCODEDUMP=(CHARCODEDUMP.replace("+", "\n"))
	return (CHARCODEDUMP)
