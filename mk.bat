@echo off
ca65 src/adventure.s -o src/adventure.o -l adventure.lst
ld65 -C src/adventure.x src/adventure.o -o adventure.nes -m map.txt
pause
