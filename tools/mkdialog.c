/*
 Princess Engine Dialog converter
 Copyright (C) 2016 NovaSquirrel

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

const int CharWidths[] = {
  3,  2,  4,  6,  5,  5,  6,  2,  4,  4,  6,  5,  2,  5,  2,  5,
  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  2,  2,  5,  5,  5,  5,
  8,  6,  6,  6,  6,  6,  6,  6,  6,  2,  3,  6,  6,  7,  6,  6,
  6,  6,  6,  6,  6,  6,  6,  7,  6,  6,  6,  4,  5,  4,  6,  5,
  3,  5,  5,  5,  5,  5,  4,  5,  5,  2,  3,  5,  3,  6,  5,  5,
  5,  5,  4,  5,  4,  5,  5,  6,  5,  5,  5,  5,  2,  5,  5,  6,
  8,  8,  8,  5,  6,  6,  6,  6
};

int CharWidth(char C) {
  return CharWidths[C-32];
}

void RemoveLineEndings(char *Buffer) {
  char *Text;
  Text = strrchr(Buffer, '\n');
  if(*Text)
    *Text = 0;
  Text = strrchr(Buffer, '\r');
  if(*Text)
    *Text = 0;
}

int Match(char *Pointer, const char *MatchWith) {
  return !memcmp(Pointer, MatchWith, strlen(MatchWith));
}

int main(int argc, char *argv[]) {
  if(argc < 4) {
    puts("syntax: mkdialog dictionary.txt in.txt out.s");
    return 0;
  }

  char Buffer[700];

  char *Text;
  int Size = 0, Uncompressed = 0, CommandSize = 0;
  int i;
  char Dictionary[128][32];
  int DictionaryUse[128];
  int DictionaryLen = 0;

  FILE *InputFile = fopen(argv[1], "rb");
  if(!InputFile) {
    puts("dictionary not found");
    return 0;
  }
  while(fgets(Buffer, sizeof(Buffer), InputFile)) {
    RemoveLineEndings(Buffer);
    if(strlen(Buffer) > 31) return -1;
    DictionaryUse[DictionaryLen] = 0;
    strcpy(Dictionary[DictionaryLen], Buffer);
    DictionaryLen++;
  }
  InputFile = fopen(argv[2],"rb");
  if(!InputFile) {
    puts("input file not found");
    return 0;
  }
  FILE *OutputFile = fopen(argv[3], "wb");
  if(!OutputFile) {
    fclose(InputFile);
    puts("output file couldn't be opened");
    return 0;
  }

  while(fgets(Buffer, sizeof(Buffer), InputFile)) {
    RemoveLineEndings(Buffer);

    // process line
    if(!*Buffer)
      continue;
    if(Buffer[0] == ':')
      fprintf(OutputFile, "%s\r\n", Buffer+1);
    else if(Buffer[0] == '`' || Buffer[0] == '?') {
      char *Arg = strchr(Buffer, ' ');
      if(Arg) // If argument found, separate it from command
        *(Arg++) = 0;
      char *Command = Buffer+1;
      if(!strcmp(Command, "end"))
        fprintf(OutputFile, ".byt SCR::END_SCRIPT\r\n");
      if(!strcmp(Command, "poke"))
        fprintf(OutputFile, ".byt SCR::POKE, <%s, >%s\r\n", Arg, Arg);
      if(!strcmp(Command, "asm"))
        fprintf(OutputFile, ".byt SCR::RUN_ASM\r\n");
      if(!strcmp(Command, "p"))
        fprintf(OutputFile, ".byt SCR::END_PAGE\r\n");
      if(!strcmp(Command, "goto"))
        fprintf(OutputFile, ".byt SCR::GOTO %s\r\n", Arg);
      if(!strcmp(Command, "call"))
        fprintf(OutputFile, ".byt SCR::CALL %s\r\n", Arg);
      if(!strcmp(Command, "return"))
        fprintf(OutputFile, ".byt SCR::RETURN\r\n");
      if(!strcmp(Command, "choose"))
        fprintf(OutputFile, ".byt SCR::CHOICES CHOICELIST::%s\r\n", Arg);
      if(!strcmp(Command, "scene"))
        fprintf(OutputFile, ".byt SCR::SCENE, SCENES::%s\r\n", Arg);
      if(!strcmp(Command, "transition"))
        fprintf(OutputFile, ".byt SCR::TRANSITION\r\n", Arg);
      if(Buffer[0] == '?') {
        if(!strcmp(Command, "on"))
          fprintf(OutputFile, ".byt SCR::IF_FLAG_ON, EventFlags::%s\r\n", Arg);
        if(!strcmp(Command, "off"))
          fprintf(OutputFile, ".byt SCR::IF_FLAG_OFF, EventFlags::%s\r\n", Arg);
        if(!strcmp(Command, "item"))
          fprintf(OutputFile, ".byt SCR::IF_ITEM, InventoryItem::%s\r\n", Arg);
        if(!strcmp(Command, "notitem"))
          fprintf(OutputFile, ".byt SCR::IF_NOT_ITEM, InventoryItem::%s\r\n", Arg);
      } else {
        if(!strcmp(Command, "on"))
          fprintf(OutputFile, ".byt SCR::FLAG_ON, EventFlags::%s\r\n", Arg);
        if(!strcmp(Command, "off"))
          fprintf(OutputFile, ".byt SCR::FLAG_OFF, EventFlags::%s\r\n", Arg);
        if(!strcmp(Command, "toggle"))
          fprintf(OutputFile, ".byt SCR::FLAG_TOGGLE, EventFlags::%s\r\n", Arg);
      }
    } else {
      Text = Buffer;
      switch(Buffer[0]) {
        case '<':
          Text = strchr(Buffer, '>')+1;
          Text[-1] = 0;
          fprintf(OutputFile, ".byt SCR::SAY, SCR::SPEAKER_%c|CHAR::%s", Buffer[1], Buffer+3);
          CommandSize += 2;
          break;
        case '>':
          Text = strchr(Buffer, '<')+1;
          Text[-1] = 0;
          fprintf(OutputFile, ".byt SCR::THINK, SCR::SPEAKER_%c|CHAR::%s", Buffer[1], Buffer+3);
          CommandSize += 2;
          break;
        case '[':
          Text = strchr(Buffer, ']')+1;
          Text[-1] = 0;
          fprintf(OutputFile, ".byt SCR::NARRATE, CHAR::%s", Buffer[1]?(Buffer+1):"NONE");
          CommandSize += 2;
          break;
      }
      if(Text == Buffer) {
        fprintf(OutputFile, ".byt SCR::NEWLINE");
      }

      // Insert new lines in where needed
      char *Peek;
      int CurXPos = 0;
      for(Peek = Text; *Peek; Peek++) {
        if(*Peek == ' ') {
          int WordLength = 0;

          // find word length
          char *Word = Peek+1;
          for(;*Word != ' ' && *Word;Word++)
            WordLength += CharWidth(*Word);
          if(CurXPos + CharWidth(' ') + WordLength >= 128) {
            *Peek = '\n';
            CurXPos = 0;
          }
        }
        if(*Peek != '\n')
          CurXPos += CharWidth(*Peek);
      }

      Uncompressed += strlen(Text);
      while(*Text) {
        // Find in dictionary
        for(i=0; i<DictionaryLen; i++) {
          if(Match(Text, Dictionary[i])) {
            fprintf(OutputFile, ", $%.2x", 0x80+i);
            printf("[%s]", Dictionary[i]);
            Text += strlen(Dictionary[i]);
            DictionaryUse[i]++;
            Size++;
            break;
          }
        }
        // Not found?
        if(i == DictionaryLen) {
          if(*Text == '"')
            fprintf(OutputFile, ", '\"'", *Text);
          else if(*Text == '\n')
            fprintf(OutputFile, ", SCR::NEWLINE");
          else
            fprintf(OutputFile, ", \"%c\"", *Text);
          putchar(*Text);
          Text++;
        }
        Size++;
      }
      putchar('\n');
    }
    if(*Buffer)
      fprintf(OutputFile, "\r\n");
  }
  fclose(InputFile); 

  // Calculate savings
  int DictionarySize = 0, DictionarySavings = 0;

  fprintf(OutputFile, "\r\nCutsceneDictionary:\r\n");
  for(i=0;i<DictionaryLen;i++) {
    DictionarySize += strlen(Dictionary[i]);
    DictionarySavings += strlen(Dictionary[i])*(DictionaryUse[i]-1)-1;

    char *Last = strrchr(Dictionary[i], 0);
    char LastChar = Last[-1];
    Last[-1] = 0;
    fprintf(OutputFile, ".byt \"%s\", '%c'|128\r\n", Dictionary[i], LastChar);
    // -1 word length for space taken up in dictionary
    // -1 byte for the byte used to reference the dictionary word
  }
  fclose(OutputFile);

  float Saving = Uncompressed-DictionarySavings;
  Saving = Saving / Uncompressed * 100;
  printf("Dictionary entries: %i (size %i, %i saved by dictionary)\n", DictionaryLen, DictionarySize, DictionarySavings);
  printf("Script size: %i ---> %i (%.2f%%)\n", Uncompressed, Uncompressed-DictionarySavings, Saving);
  printf("Commands: %i\n", CommandSize);
  for(i=0;i<DictionaryLen;i++)
    printf("%s%i,",Dictionary[i],DictionaryUse[i]);
  putchar('\n');

  return 0;
}
