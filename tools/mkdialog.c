/*
 Princess Engine Dialog converter
 Copyright (C) 2016-2017 NovaSquirrel

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
  if(Text)
    *Text = 0;
  Text = strrchr(Buffer, '\r');
  if(Text)
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
  char Dictionary[128][32]; // actual text for each dictionary word
  int DictionaryUse[128];   // count for how many times each word was used
  int DictionaryLen = 0;    // number of words in the dictionary; will be 128

  int AutoWordWrap = 1;     // automatically wordwrap for dialog screens
  int MakeDictionaryTable = 1;

  // Read the dictionary
  FILE *InputFile = fopen(argv[1], "rb");
  if(!InputFile) {
    puts("dictionary not found");
    return 0;
  }
  // Set up the dictionary arrays
  while(fgets(Buffer, sizeof(Buffer), InputFile)) {
    RemoveLineEndings(Buffer);
    if(strlen(Buffer) > 31) {
      puts("Dictionary has a word that's too long");
      return -1;
    }
    DictionaryUse[DictionaryLen] = 0;
    strcpy(Dictionary[DictionaryLen], Buffer);
    DictionaryLen++;
  }

  // Open the dialog script
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

  // Read the dialog script a line at a time and compile it
  while(fgets(Buffer, sizeof(Buffer), InputFile)) {
    RemoveLineEndings(Buffer);

    int AlreadyStarted = 0; // Is anything from the script line in the output file yet?

    // Process the line
    if(!*Buffer)
      continue;
    if(Buffer[0] == ':')
      fprintf(OutputFile, "%s", Buffer+1);
    else if(Buffer[0] == '`' || Buffer[0] == '?') {
      // Is there a space after the command or just a command?
      char *Arg = strchr(Buffer, ' ');
      if(Arg) // If argument found, separate it from command
        *(Arg++) = 0;
      char *Command = Buffer+1;
      if(!strcmp(Command, "nl"))
        fprintf(OutputFile, ".byt SCR::NEWLINE");
      else if(!strcmp(Command, "end"))
        fprintf(OutputFile, ".byt SCR::END_SCRIPT");
      else if(!strcmp(Command, "poke"))
        fprintf(OutputFile, ".byt SCR::POKE, <%s, >%s", Arg, Arg);
      else if(!strcmp(Command, "asm"))
        fprintf(OutputFile, ".byt SCR::RUN_ASM");
      else if(!strcmp(Command, "p"))
        fprintf(OutputFile, ".byt SCR::END_PAGE");
      else if(!strcmp(Command, "goto"))
        fprintf(OutputFile, ".byt SCR::GOTO, <%s, >%s", Arg, Arg);
      else if(!strcmp(Command, "call"))
        fprintf(OutputFile, ".byt SCR::CALL, <%s, >%s", Arg, Arg);
      else if(!strcmp(Command, "return"))
        fprintf(OutputFile, ".byt SCR::RETURN");
      else if(!strcmp(Command, "choose"))
        fprintf(OutputFile, ".byt SCR::CHOICES, CHOICELIST::%s", Arg);
      else if(!strcmp(Command, "scene"))
        fprintf(OutputFile, ".byt SCR::SCENE, SCENES::%s", Arg);
      else if(!strcmp(Command, "transition"))
        fprintf(OutputFile, ".byt SCR::TRANSITION");
      else if(!strcmp(Command, "noskip"))
        fprintf(OutputFile, ".byt SCR::NO_SKIP");
      else if(!strcmp(Command, "manualwrap"))
        AutoWordWrap = 0;
      else if(!strcmp(Command, "autowrap"))
        AutoWordWrap = 1;
      else if(!strcmp(Command, "nodictionarytable"))
        MakeDictionaryTable = 0;
      else if(!strcmp(Command, "monotext"))
        fprintf(OutputFile, ".byt SCR::MONO_TEXT, <%s, >%s", Arg, Arg);
      else if(!strcmp(Command, "clear"))
        fprintf(OutputFile, ".byt SCR::CLEAR_ALL");
      else if(!strcmp(Command, "upload"))
        fprintf(OutputFile, ".byt SCR::UPLOAD, %s", Arg);
      else if(!strcmp(Command, "image"))
        fprintf(OutputFile, ".byt SCR::IMAGE, %s", Arg);
      else if(!strcmp(Command, "ground"))
        fprintf(OutputFile, ".byt SCR::GROUND");

      if(Buffer[0] == '?') {
        if(!strcmp(Command, "on"))
          fprintf(OutputFile, ".byt SCR::IF_FLAG_ON, EventFlags::%s", Arg);
        if(!strcmp(Command, "off"))
          fprintf(OutputFile, ".byt SCR::IF_FLAG_OFF, EventFlags::%s", Arg);
        if(!strcmp(Command, "item"))
          fprintf(OutputFile, ".byt SCR::IF_ITEM, InventoryItem::%s", Arg);
        if(!strcmp(Command, "notitem"))
          fprintf(OutputFile, ".byt SCR::IF_NOT_ITEM, InventoryItem::%s", Arg);
      } else {
        if(!strcmp(Command, "on"))
          fprintf(OutputFile, ".byt SCR::FLAG_ON, EventFlags::%s", Arg);
        if(!strcmp(Command, "off"))
          fprintf(OutputFile, ".byt SCR::FLAG_OFF, EventFlags::%s", Arg);
        if(!strcmp(Command, "toggle"))
          fprintf(OutputFile, ".byt SCR::FLAG_TOGGLE, EventFlags::%s", Arg);
      }
    } else {
      Text = Buffer;

      fprintf(OutputFile, "; %s\r\n", Text);
      switch(Buffer[0]) {
        case '<':
          Text = strchr(Buffer, '>')+1;
          Text[-1] = 0;
          fprintf(OutputFile, ".byt SCR::SAY, SCR::SPEAKER_%c|CHAR::%s", Buffer[1], Buffer+3);
          CommandSize += 2;
          AlreadyStarted = 1;
          break;
        case '>':
          Text = strchr(Buffer, '<')+1;
          Text[-1] = 0;
          fprintf(OutputFile, ".byt SCR::THINK, SCR::SPEAKER_%c|CHAR::%s", Buffer[1], Buffer+3);
          CommandSize += 2;
          AlreadyStarted = 1;
          break;
        case '[':
          Text = strchr(Buffer, ']')+1;
          Text[-1] = 0;
          fprintf(OutputFile, ".byt SCR::NARRATE, CHAR::%s", Buffer[1]?(Buffer+1):"NONE");
          CommandSize += 2;
          AlreadyStarted = 1;
          break;
      }

      // If there's text at the start of a line, assume a newline is needed
      if(AutoWordWrap && Text == Buffer) {
        fprintf(OutputFile, ".byt SCR::NEWLINE");
        AlreadyStarted = 1;
      }
      if(!AlreadyStarted) {
        // There's nothing, so put a .byt in there to start the line
        fprintf(OutputFile, ".byt ");        
      }

      // Insert new lines in where needed
      if(AutoWordWrap) {
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
      }

      Uncompressed += strlen(Text);
      while(*Text) {
        // First, attempt to find this text in the dictionary
        for(i=0; i<DictionaryLen; i++) {
          if(Match(Text, Dictionary[i])) {
            if(AlreadyStarted)
              fprintf(OutputFile, ", ");
            fprintf(OutputFile, "$%.2x", 0x80+i);
            AlreadyStarted = 1;

            printf("[%s]", Dictionary[i]);
            Text += strlen(Dictionary[i]);
            DictionaryUse[i]++;
            Size++;
            break;
          }
        }
        // If the text isn't in the dictionary, encode it directly
        if(i == DictionaryLen) {
          if(AlreadyStarted)
            fprintf(OutputFile, ", ");
          AlreadyStarted = 1;

          if(*Text == '"')
            fprintf(OutputFile, "'\"'", *Text);
          else if(*Text == '\n')
            fprintf(OutputFile, "SCR::NEWLINE");
          else
            fprintf(OutputFile, "\"%c\"", *Text);
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

  // Calculate savings from the compression
  int DictionarySize = 0, DictionarySavings = 0;

  fprintf(OutputFile, "\r\nCutsceneDictionary:\r\n");
  for(i=0;i<DictionaryLen;i++) {
    DictionarySize += strlen(Dictionary[i]);
    DictionarySavings += strlen(Dictionary[i])*(DictionaryUse[i]-1)-1;

    // Will be corrupting the dictionary for this, but it won't be needed afterwards.
    // Remove the last character from the dictionary and separate it into a char.
    char *Last = strrchr(Dictionary[i], 0);
    char LastChar = Last[-1];
    Last[-1] = 0;
    if(MakeDictionaryTable)
      fprintf(OutputFile, "DictionaryWord%i: ", i);
    fprintf(OutputFile, ".byt \"%s\", '%c'|128\r\n", Dictionary[i], LastChar);
    // -1 word length for space taken up in dictionary
    // -1 byte for the byte used to reference the dictionary word
  }

  if(MakeDictionaryTable) {
    fprintf(OutputFile, "\r\nCutsceneDictionaryTable:\r\n");
    for(i=0;i<DictionaryLen;i++) {
      fprintf(OutputFile, ".byt <DictionaryWord%i\r\n", i);
    }
    for(i=0;i<DictionaryLen;i++) {
      fprintf(OutputFile, ".byt >DictionaryWord%i\r\n", i);
    }
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
