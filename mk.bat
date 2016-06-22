@echo off
ca65 src/nova.s -o src/nova.o -l nova.lst
ld65 -C src/nova.x src/nova.o -o nova.nes -m map.txt
pause
