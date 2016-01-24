/*
 Princess Engine Tiled level converter
 Copyright (C) 2014-2016 NovaSquirrel

 This program is free software: you can redistribute it and/or
 modify it under the terms of the GNU General Public License as
 published by the Free Software Foundation; either version 3 of the
 License, or (at your option) any later version.

 This program is distributed in the hope that it will be useful, but
 WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define LEVEL_SCREEN_COUNT  16
#define LEVEL_SCREEN_WIDTH  16
#define LEVEL_SCREEN_HEIGHT 15

typedef struct LRect {
  int X, Y, W, H, Type, Rule;
} LRect;

typedef struct RectRule {
  int Input, MaxW, MaxH;
  const char *Template;
  // [X] = X offset, [Y] = Y, [W] = width - 1, [H] = height - 1
} RectRule;

RectRule RectRules[] = {
  {0x01, 1,   1,  "LObj  LO::S_GROUND,         [X], [Y]"},
  {0x01, 16,  16, "LObjN LO::R_GROUND,         [X], [Y], [W], [H]"},
  {0x01, 256, 16, "LObjN LO::RECT_1,           [X], [Y], [H], LN1::GROUND, [W]"},
  {0x02, 1,   1,  "LObj  LO::S_GROUND_CLIMB_L, [X], [Y]"},
  {0x03, 1,   1,  "LObj  LO::S_GROUND_CLIMB_R, [X], [Y]"},
  {0x04, 1,   1,  "LObj  LO::S_BRICK,          [X], [Y]"},
  {0x04, 16,  16, "LObjN LO::R_BRICK,          [X], [Y], [W], [H]"},
  {0x05, 1,   1,  "LObj  LO::S_SOLID_BLOCK,    [X], [Y]"},
  {0x05, 16,  16, "LObjN LO::R_SOLID_BLOCK,    [X], [Y], [W], [H]"},
  {0x06, 1,   1,  "LObj  LO::S_PRIZE,          [X], [Y]"},
  {0x06, 16,  1,  "LObjN LO::WIDE_1,           [X], [Y], [W], LN1::PRIZE"},
  {0x07, 16,  1,  "LObjN LO::WIDE_1,           [X], [Y], [W], LN1::USED_PRIZE"},
  {0x07, 1,   16, "LObjN LO::TALL_1,           [X], [Y], [W], LN1::USED_PRIZE"},
  {0x08, 1,   1,  "LObj  LO::S_COIN,           [X], [Y]"},
  {0x08, 16,  16, "LObjN LO::R_COIN,           [X], [Y], [W], [H]"},
  {0x09, 1,   1,  "LObj  LO::S_SPRING,         [X], [Y]"},
  {0x0a, 16,  16, "LObjN LO::R_ROCK,           [X], [Y], [W], [H]"},
  {0x0a, 256, 16, "LobjN LO::RECT_1,           [X], [Y], [H], LN1::ROCK, [W]"},
  {0x0b, 1,   1,  "LObj  LO::R_SOLID_ROCK,     [X], [Y]"},
  {0x0c, 16,  1,  "LObjN LO::WIDE_1,           [X], [Y], [W], LN1::SOLID_LEDGE"},
  {0x0d, 16,  1,  "LObjN LO::WIDE_1,           [X], [Y], [W], LN1::FALLTHROUGH_LEDGE"},
  {0x0e, 1,   1,  "LObj  LO::S_SIGNPOST,       [X], [Y]"},
  {0x0f, 16,  16, "LobjN LO::R_WATER,          [X], [Y], [W], [H]"},
  {0x0f, 256, 16, "LobjN LO::RECT_1,           [X], [Y], [H], LN1::WATER, [W]"},
  {0x11, 1,   16, "LObjN LO::TALL_1,           [X], [Y], [H], LN1::LADDER"},
  {0x12, 16,   1, "LObjN LO::WIDE_1,           [X], [Y], [W], LN1::SPIKES"},
  {-1}
};

int FromFile[LEVEL_SCREEN_COUNT*LEVEL_SCREEN_WIDTH][LEVEL_SCREEN_HEIGHT];
unsigned char Handled[LEVEL_SCREEN_COUNT*LEVEL_SCREEN_WIDTH][LEVEL_SCREEN_HEIGHT];
int CurRect;
LRect RectList[1024];

int ReadLine(char *Buffer, FILE *InputFile) {
  int i=0,j;
  while(1) {
    j = fgetc(InputFile);
    if(j == '\r') continue;
    Buffer[i++]=j;
    if(j == '\n' || j==EOF) {
      Buffer[i-1] = 0;
      if(j==EOF) return 1;
        break;
    }
  }
  return 0;
}

int FindRuleFor(int type, int w, int h) {
  int i;
  for(i=0;RectRules[i].Input > 0;i++)
    if(type == RectRules[i].Input && RectRules[i].MaxW >= w && RectRules[i].MaxH >= h)
     return i;
  printf("can't find %i %i %i\n", type, w, h);
  return -1;
}

LRect FindRect(int type, int x, int y) {
  LRect out = {x, y, 0, 0, type, 0};
  // find height
  while(1) {
    out.H++;
    if(FromFile[x][y+out.H] != type || Handled[x][y+out.H] || (y+out.H>=LEVEL_SCREEN_HEIGHT))
      break;
  }
  // find width
  int okay = 1, i, j;
  while(okay) {
    out.W++;
    for(i=0; i<out.H; i++) {
      if(FromFile[x+out.W][y+i] != type) {
        okay = 0;
        break;
      }
    }
  }
  // find rule to use
  int rule = FindRuleFor(type, out.W, out.H);
  if(rule < 0) {
    rule = FindRuleFor(type, 16, out.H);
    if(rule >= 0)
      out.W = 16;
  } else if(rule < 0) {
    rule = FindRuleFor(type, out.W, 1);
    if(rule >= 0)
      out.H = 1;
  } else if(rule < 0) {
    rule = FindRuleFor(type, 1, out.H);
    if(rule >= 0)
      out.W = 1;
  } else if(rule < 0){
    printf("Unable to find rule for %x %i %i\n", type, out.W, out.H);
  }
  out.Rule = rule;
  for(i=0; i<out.H; i++)
    for(j=0; j<out.W; j++)
      Handled[x+j][y+i] = 1;
  return out;
}

int RectCompare(const void *A, const void *B) {
  const LRect *AR = A, *BR = B;
  return AR->X - BR->X;
}

void MakeRects() {
  int x, y;

  for(x = 0; x<(LEVEL_SCREEN_COUNT*LEVEL_SCREEN_WIDTH); x++) {
    if(FromFile[x][0] == -1)
      break;
    for(y = 0; y<LEVEL_SCREEN_HEIGHT; y++) {
      int block = FromFile[x][y];
      if(block && !Handled[x][y]) {
        LRect rect = FindRect(block, x, y);
        //printf("%i %i %i %i %i\n", rect.X, rect.Y, rect.W, rect.H, rect.Rule);
        RectList[CurRect] = rect;
        CurRect++;
        if(CurRect > 1024) {
          puts("Too many rectangles");
          break;
        }
      }
    }
  }

  qsort(RectList, CurRect, sizeof(LRect), RectCompare);
}

void CompressLevel(const char *Name) {
  char Buffer[8192];
  memset(FromFile, 255, sizeof(FromFile));
  memset(Handled,  0,   sizeof(Handled));
  memset(RectList, 0,   sizeof(RectList));
  CurRect = 0;

  sprintf(Buffer, "%s.csv", Name);
  FILE *File = fopen(Buffer, "rb");
  if(!File) {
    printf("Can't open %s\n", Buffer);
    return;
  }

  int y;
  for(y = 0; y<LEVEL_SCREEN_HEIGHT ;y++) {
    ReadLine(Buffer, File);
    char *Peek = Buffer;
    int x = 0;
    while(1) {
      FromFile[x++][y] = strtol(Peek, &Peek, 10);
      if(*Peek != ',')
        break;
      Peek++;
    }
  }
  fclose(File);
  MakeRects();

  // now write to the file
  sprintf(Buffer, "%s.s", Name);
  File = fopen(Buffer, "w");
  if(!File) {
    printf("Can't open %s\n", Buffer);
    return;
  }
  int i, LastX = 0;
  for(i=0; i<CurRect ;i++) {
    LRect Rect = RectList[i];
    RectRule Rule = RectRules[Rect.Rule];
    char WriteText[strlen(Rule.Template)+1];
    char Format[10];
    strcpy(WriteText, Rule.Template);
    int XDifference = Rect.X - LastX;
    if(XDifference >= 16) {
      if(XDifference == 16)
        fprintf(File, "LXPlus16\n");
      else
        fprintf(File, "LSetX %i\n", Rect.X);
      XDifference = 0;
    }
    LastX = Rect.X;

    char *Poke;
    for(Poke = WriteText; *Poke; Poke++) {
      if(*Poke == '[')
        switch(Poke[1]) {
          case 'X':
            sprintf(Format, "%3i", XDifference);
            memcpy(Poke, Format, 3);
            break;
          case 'Y':
            sprintf(Format, "%3i", Rect.Y);
            memcpy(Poke, Format, 3);
            break;
          case 'W':
            sprintf(Format, "%3i", Rect.W - 1);
            memcpy(Poke, Format, 3);
            break;
          case 'H':
            sprintf(Format, "%3i", Rect.H - 1);
            memcpy(Poke, Format, 3);
            break;
        }
    }
    fprintf(File, "%s\n", WriteText);
  }
  fprintf(File, "LFinished\n");
  fclose(File);

}

int main(int argc, char *argv[]) {
  CompressLevel("level1");
}
