py -2 savtool.py --palette=300f2a12300f2a26300f122232000000 title3.png title.sav
py -2 savtool.py title.sav title.chr
py -2 savtool.py title.sav title.nam
py -2 pb53.py -i title.chr -o title.pb53 --raw
py -2 pb53.py -i title.nam -o titlenam.pb53 --raw
pause
