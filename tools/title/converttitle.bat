savtool.py --palette=300f2a12300f2a26300f122232000000 title.png title.sav
savtool.py title.sav title.chr
savtool.py title.sav title.nam
pb53.py -i title.chr -o title.pb53 --raw
pb53.py -i title.nam -o titlenam.pb53 --raw
pause
