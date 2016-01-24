#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char ColNames[32][50];
char ColInclude[32][512];
char RowNames[256][70];
char ColData[256][32][64];
char EnumName[70] = "";
int NumCols = 0;
int NumRows = 0;
int CurCol = 0;

int main(int argc, char *argv[]) {
  if(argc < 3) {
    puts("syntax: tblmake in.txt out.s");
    return 0;
  }

  char Buffer[700];

  int i,j,k;
  FILE *InputFile = fopen(argv[1],"rb");
  if(InputFile == NULL) {
    puts("input file not found");
    return 0;
  }

  for(i=0;i<32;i++)
    *ColInclude[i] = 0;

  for(k=0;!k;i=0) {
    i=0;
    while(1) { // I can just replace this with fgets...
      j = fgetc(InputFile);
      if(j == '\r') continue;
      Buffer[i++]=j;
      if(j == '\n' || j==EOF) {
        Buffer[i-1] = 0;
        if(j==EOF) k=1;
          break;
      }
    }
    // process line
    if(!*Buffer)
      continue;
    if(Buffer[0] == 'E') {
      strcpy(EnumName, Buffer+2);
    } else if(Buffer[0] == 'L') {
      strcpy(ColNames[NumCols], Buffer+2);
      NumCols++;
    } else if(Buffer[0] == 'R') {
      strcpy(RowNames[NumRows], Buffer+2);
      CurCol = 0;
      NumRows++;
    } else if(Buffer[0] == 'C') {
      strcpy(ColData[NumRows-1][CurCol], Buffer+2);
      CurCol++;
    } else if(Buffer[0] == 'I') {
      strcat(ColInclude[NumCols], Buffer+2);
      strcat(ColInclude[NumCols], "\n");
    }
  }
  fclose(InputFile); 

  // make output file
  FILE *OutputFile = fopen(argv[2],"wb");
  if(OutputFile == NULL) {
    puts("output file not created");
    return 0;
  }

  if(EnumName[0]) {
    fprintf(OutputFile, ".enum %s\r\n", EnumName);
    for(j=0; j<NumRows; j++) {
      fprintf(OutputFile, "  %s\r\n", RowNames[j]);
    }
    fprintf(OutputFile, ".endenum\r\n\r\n");
  }

  for(i=0; i<NumCols; i++) {
    fprintf(OutputFile, "%s", ColInclude[i]);
    fprintf(OutputFile, ".proc %s\r\n", ColNames[i]);
    for(j=0; j<NumRows; j++) {
      fprintf(OutputFile, "  %s ;%s\r\n", ColData[j][i], RowNames[j]);
    }
    fprintf(OutputFile, ".endproc\r\n\r\n");
  }
  fclose(OutputFile);

  printf("Rows: %i\n", NumRows);

  return 0;
}
