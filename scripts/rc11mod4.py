#!/usr/bin/python

import struct
import time
import sys
import subprocess

dev_path = "/dev/input/by-id/usb-MemsArt_MA144_RF_Controller-event-kbd"

# mod4
mod4_code = 58
mod4_switch = False 

#long int, long int, unsigned short, unsigned short, unsigned int
FORMAT = 'llHHI'
EVENT_SIZE = struct.calcsize(FORMAT)

#open file in binary mode
in_file = open(dev_path, "rb")

event = in_file.read(EVENT_SIZE)

while event:
	(tv_sec, tv_usec, type, code, value) = struct.unpack(FORMAT, event)
		
	if code == mod4_code and value == 1 and mod4_switch == False:
		subprocess.call(["xdotool", "keydown", "super"])
		subprocess.Popen(["mod4_osd", "on"])
		print("SUPER AKTIVIERT")
		mod4_switch = True
	elif code == mod4_code and value == 1 and mod4_switch == True:
		subprocess.call(["xdotool", "keyup", "super"])
		subprocess.Popen(["mod4_osd", "off"])
		print("SUPER DEAKTIVIERT")
		mod4_switch = False
		
	event = in_file.read(EVENT_SIZE)

in_file.close()
