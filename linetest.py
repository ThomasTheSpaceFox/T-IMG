#!/usr/bin/env python
import LIBTIMG

print ("timg-draw v1.0")
initaldata=('''s00000000000000000000000000000000000000s
0000000000000000000000000000000000000000
0000000000000000000000000000000000000000
0000000000000000000000000000000000000000
0000000000000000000000000000000000000000
0000000000000000000000000000000000000000
0000000000000000000000000000000000000000
0000000000000000000000000000000000000000
0000000000000000000000000000000000000000
0000000000000000000000000000000000000000
0000000000000000000000000000000000000000
0000000000000000000000000000000000000000
0000000000000000000000000000000000000000
0000000000000000000000000000000000000000
0000000000000000000000000000000000000000
0000000000000000000000000000000000000000
0000000000000000000000000000000000000000
0000000000000000000000000000000000000000
0000000000000000000000000000000000000000
s00000000000000000000000000000000000000s
''')





initaldata=(LIBTIMG.linedraw(initaldata, "U", 1, 1, 20, 40))
initaldata=(LIBTIMG.linedraw(initaldata, "m", 1, 1, 20, 20))
initaldata=(LIBTIMG.linedraw(initaldata, "u", 1, 1, 20, 10))
initaldata=(LIBTIMG.linedraw(initaldata, "I", 1, 1, 10, 40))
initaldata=(LIBTIMG.linedraw(initaldata, "W", 20, 1, 1, 40))
initaldata=(LIBTIMG.linedraw(initaldata, "i", 10, 1, 1, 40))
initaldata=(LIBTIMG.linedraw(initaldata, "M", 10, 1, 1, 20))
initaldata=(LIBTIMG.linedraw(initaldata, "s", 20, 1, 1, 20))
initaldata=(LIBTIMG.linedraw(initaldata, "s", 20, 1, 1, 10))
print(LIBTIMG.inline(LIBTIMG.linedraw(initaldata, "s", 20, 1, 1, 8)))

