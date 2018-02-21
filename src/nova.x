MEMORY {
  ZP:     start = $10, size = $f0, type = rw;
  # use first $10 zeropage locations as locals
  RAM:    start = $0300, size = $0400, type = rw; #7xx reserved
  WRAM:   start = $7000, size = $1000, type = rw;
  HEADER: start = $7f00, size = $0010, type = ro, file = %O, fill=yes, fillval=$00;
  ROM0:   start = $8000, size = $4000, type = ro, file = %O, fill=yes, fillval=$00;
  ROM1:   start = $8000, size = $4000, type = ro, file = %O, fill=yes, fillval=$00;
  ROM2:   start = $8000, size = $4000, type = ro, file = %O, fill=yes, fillval=$00;
  ROM3:   start = $8000, size = $4000, type = ro, file = %O, fill=yes, fillval=$00;
  ROM4:   start = $8000, size = $4000, type = ro, file = %O, fill=yes, fillval=$00;
  ROM5:   start = $8000, size = $4000, type = ro, file = %O, fill=yes, fillval=$00;
  ROM6:   start = $8000, size = $4000, type = ro, file = %O, fill=yes, fillval=$00;
  ROM7:   start = $8000, size = $4000, type = ro, file = %O, fill=yes, fillval=$00;
  ROM8:   start = $8000, size = $4000, type = ro, file = %O, fill=yes, fillval=$00;
  ROM9:   start = $8000, size = $4000, type = ro, file = %O, fill=yes, fillval=$00;
  ROMa:   start = $8000, size = $4000, type = ro, file = %O, fill=yes, fillval=$00;
  ROMb:   start = $8000, size = $4000, type = ro, file = %O, fill=yes, fillval=$00;
  ROMc:   start = $8000, size = $4000, type = ro, file = %O, fill=yes, fillval=$00;
  ROMd:   start = $8000, size = $4000, type = ro, file = %O, fill=yes, fillval=$00;
  ROMe:   start = $8000, size = $4000, type = ro, file = %O, fill=yes, fillval=$00;
  ROMf:   start = $c000, size = $4000, type = ro, file = %O, fill=yes, fillval=$00;
}

SEGMENTS {
  INESHDR:  load = HEADER, type = ro, align = $10;
  ZEROPAGE: load = ZP, type = zp;
  BSS:      load = RAM, type = bss, define = yes, align = $100;
  BSS2:     load = WRAM, type = bss, define = yes, align = $100;
  SAVE:     load = WRAM, type = bss, define = yes, start = $7f00;
  DMC:      load = ROMf, type = ro, align = $40, optional = yes;
  PRG0:    load = ROM0, type = ro;
  PRG1:    load = ROM1, type = ro;
  PRG2:    load = ROM2, type = ro;
  PRG3:    load = ROM3, type = ro;
  PRG4:    load = ROM4, type = ro;
  PRG5:    load = ROM5, type = ro;
  PRG6:    load = ROM6, type = ro;
  PRG7:    load = ROM7, type = ro;
  PRG8:    load = ROM8, type = ro;
  PRG9:    load = ROM9, type = ro;
  PRGa:    load = ROMa, type = ro;
  PRGb:    load = ROMb, type = ro;
  PRGc:    load = ROMc, type = ro;
  PRGd:    load = ROMd, type = ro;
  PRGdSamp: load = ROMd, type = ro, align = $100;
  PRGeFont: load = ROMe, type = ro, align = $100;
  PRGe:    load = ROMe, type = ro;
  PRGf:    load = ROMf, type = ro;

  CODE:    load = ROMf, type = ro;
  VECTORS: load = ROMf, type = ro, start = $FFFA;
}

FILES {
  %O: format = bin;
}

