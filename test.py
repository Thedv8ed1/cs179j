from pynq import BaseOverlay
from pynq import MMIO
base=BaseOverlay("base.bit")
base.download()

input("finished base")

from pynq.lib.video import *
hdmi_in = base.video.hdmi_in
hdmi_out = base.video.hdmi_out

hdmi_in.configure(PIXEL_RGB)
hdmi_out.configure(hdmi_in.mode)
input("finished hdmi config")
hdmi_in.start()
hdmi_out.start()
input("started hdmi")
colorspace_in = base.video.hdmi_in.color_convert
colorspace_out = base.video.hdmi_out.color_convert

bgr2rgb = [0, 0, 1,
           0, 1, 0, 
           1, 0, 0,
           0, 0, 0]

out =     [0, 0, 1,
           0, 1, 0, 
           1, 0, 0,
           0, 0, 0]



colorspace_in.colorspace = bgr2rgb
colorspace_out.colorspace = out
input("finished coloring")
hdmi_in.tie(hdmi_out)
input("finished tieing")
split=MMIO(0x40010000,10000)
split.write(0x10,1)
input("set filter")
split=MMIO(0x40010000,10000)
split.write(0x10,0)
input("cleared filter ")


hdmi_out.close()
hdmi_in.close()
quit() 
import traceback
import math
import pynq
from pynq.overlays.base import BaseOverlay
from pynq.lib.video import *
import numpy as np
import cv2
import time

base = BaseOverlay('base.bit')
base.download()

hdmi_in=base.video.hdmi_in
hdmi_out=base.video.hdmi_out
hdmi_in.configure(PIXEL_RGB)
hdmi_out.configure(hdmi_in.mode,PIXEL_RGB)
frame=None
h=hdmi_in.mode.height
w=hdmi_in.mode.width
gcd=math.gcd(h,w)
print("h: ",h," w: ",w," GCD: ",gcd)
gcd=64
hdmi_in.start()
hdmi_out.start()
run =True
hframe=None
vframe=None
g=[1,0,0,
1,0,0,
1,0,0,
0,0,0]
radius=100
t=time.monotonic()
def circle(im, centre_x, centre_y, radius):
    grid_x, grid_y = np.mgrid[0:im.shape[0],0:im.shape[1]]
    return (grid_x-centre_x)**2 + (grid_y-centre_y)**2 < radius**2
centre_x, centre_y, radius = 150, 200, 100
x_slice = slice(centre_x - radius, centre_x + radius)
y_slice = slice(centre_y - radius, centre_y + radius)

try:
    while run:
        frame=hdmi_in.readframe()
        rotated_square = np.rot90(frame[x_slice,y_slice].copy())
        outframe=frame#hdmi_out.newframe()
        outframe[circle(frame, centre_x, centre_y,radius)] = rotated_square[circle(rotated_square,radius, radius, radius)]
        #print("0",frame[0])
        #print("1",frame[1])
        #print("2",frame[2])
        #print(frame)
        '''if(time.monotonic()-t<10):
            print("no flip")
            outframe=frame
        elif(time.monotonic()-t<20):#reflect along y
            print("flip along y")
            outframe[:,:]=frame[:,::-1]
        elif(time.monotonic()-t<30):
            print("flip along x")
            outframe[:,:]=frame[::-1,:]
        elif(time.monotonic()-t<40):
            print("flip xy")
            outframe[:,:]=frame[::-1,::-1]
        else:
            t=time.monotonic()'''
            
        hdmi_out.writeframe(outframe)
        #frame.freebuffer()
        #outframe.freebuffer()
except (SyntaxError,TypeError,KeyboardInterrupt,ValueError,RuntimeError,NameError,LookupError,AttributeError) as e:
    traceback.print_exc()
    print("Custom Error type: ", e.__class__.__name__)
    hdmi_out.close()
    hdmi_in.close()
        
hdmi_out.close()
hdmi_in.close()
        
