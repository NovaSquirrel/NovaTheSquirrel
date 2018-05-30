/*
C bindings for Pently

Copyright 2018 Damian Yerrick

This software is provided 'as-is', without any express or implied
warranty.  In no event will the authors be held liable for any damages
arising from the use of this software.

Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it
freely, subject to the following restrictions:

1. The origin of this software must not be misrepresented; you must not
   claim that you wrote the original software. If you use this software
   in a product, an acknowledgment in the product documentation would be
   appreciated but is not required.
2. Altered source versions must be plainly marked as such, and must not be
   misrepresented as being the original software.
3. This notice may not be removed or altered from any source distribution.

*/
#ifndef PENTLY_H
#define PENTLY_H

void __fastcall__ pently_init(void);
void __fastcall__ pently_start_sound(unsigned char effect);
void __fastcall__ pently_start_music(unsigned char song);
void __fastcall__ pently_update(void);
void __fastcall__ pently_stop_music(void);
void __fastcall__ pently_resume_music(void);
void __fastcall__ pently_skip_to_row(unsigned short row);

/* pently_play_note() not yet bound because multiple arguments */

#endif
