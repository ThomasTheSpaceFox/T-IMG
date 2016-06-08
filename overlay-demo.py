#!/usr/bin/env python
import LIBTIMG

#print ("timg-draw v1.0")
#first, lets get ouselves a nice plain base image. 15 lines by 40 columns 
#with color "w" ought to do it!
initaldata=LIBTIMG.imggen("w", 18, 40)
#how about a nice plain base for our sky!
overlayskybase=LIBTIMG.imggen("Q", 6, 40)
#some predefined timg data. note how the underscores are interperted 
#by the overlay function
initaldata2=('''
AAAAA
AsssA
AAAAA
''')
# these are some text block graphics. 
#"over"
initaldata3=('''mmm_m_m_mmm_mmm_
m_m_m_m_m___m_m_
m_m_m_m_mm__mmm_
m_m_m_m_m___mm__
mmm__m__mmm_m_m_
''')
#"lay"
initaldata4=('''s____s__s_s
s___s_s__s_
s___sss__s_
sss_s_s__s_
''')
#first lets create our composite data set from the data in "initaldata"
composite1=initaldata
#now we will overlay that sky. 
composite1=LIBTIMG.overlay(composite1, overlayskybase, 1, 1)
#add a sun
composite1=LIBTIMG.overlay(composite1, initaldata2, 3, 3)
#lets add a "top" to the wall.
composite1=LIBTIMG.linedraw(composite1, "r", 6, 1, 6, 40)
#and now lets add that cool block graphics text!
composite1=LIBTIMG.overlay(composite1, initaldata3, 10, 2)
composite1=LIBTIMG.overlay(composite1, initaldata4, 7, 12)
#print(composite1)
print(LIBTIMG.inline(composite1))
print(chr(27) + "[2A")
print("LIBTIMG overlay, linedraw, and imggen demo")
nullstuff = raw_input(':')



