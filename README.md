# Excallibur-64
A reimagining of the seminal Excalibur 64 Computer
This is version 3 - yet to be tested but fixed a few things from version 2. Currently there are still some components that rely on 3rd party libraries and don't need to be, so in the process of removing them to make it more portable. 
There is no video yet, that is a separate beast. 

Goal for this project
=====================
Design build a new version of the  Excalibur 64. First major goal is to get all but the video going. So need to write firmware to take input from the keyboard output text via the serial port. 
Final version will have video as per original design.

Design requirements
==================
1. Needs to have the same look and feel of a real Excalibur 64. So the circuit for the sound and, parallel and keyboard is the same but with CMOS where possible.
2. Same goes for the video but need to think about a work around for the 6331-1 PROM.
3. There are some differences for practically and cost. For example using a single SRAM and single Flash ROM instead of two ROMs. Burning ROMs is a pain maybe when I do a 'pitch perfect' PCB I'll use DRAM and PROMS. The power supply is also different. At $25 I'm not using a LM323 for a +5 reg and since we are using a RS232 line driver IC there is no need for -12v. The reset circuit is different, that was simply because I don't understand how the original reset circuit worked. Its great to be authentic but a different power circuit isn't going to change the experience.

Future plans
============
1. Build a Disk Drive controller based on the WD2793 as per the original.
2. Build a HI-RES board.
3. Build some of the other board featured in the Excalibur 64 users group.
4. All the parts used on the original are still available so would be great to build one as the founders intended. All hail the founders!!

Credits
=======
All the original schematics + more is available from https://www.microbee-mspp.org/repository/ . Info from here was what this design is based on.
