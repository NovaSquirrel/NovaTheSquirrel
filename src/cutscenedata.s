; Princess Engine
; Copyright (C) 2016 NovaSquirrel
;
; This program is free software: you can redistribute it and/or
; modify it under the terms of the GNU General Public License as
; published by the Free Software Foundation; either version 3 of the
; License, or (at your option) any later version.
;
; This program is distributed in the hope that it will be useful, but
; WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
; General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;

.proc ChoiceList
YesNo:
  .byt 2, "Yes",0, "No",0
.endproc

.enum CHOICELIST
  YES_OR_NO
.endenum

.proc CharacterNameData
Sign:     .byt "-SIGN-"
None:     .byt 0
Nova:     .byt "Nova",0
Kee:      .byt "Kee",0
Sherwin:  .byt "Sherwin",0
Luvi:     .byt "Luvi",0
Kieran:   .byt "Kieran",0
Remy:     .byt "Remy D.",0
Eclipse:  .byt "Eclipse",0
MolSno:   .byt "MolSno",0
S_Team:   .byt "S.Team",0
Smiloid:  .byt "Smiloid",0
Ike:      .byt "Ike",0
Raoul:    .byt "Raoul",0
Jafguar:  .byt "Jafguar",0
Lia:      .byt "Lia",0
Iti:      .byt "Itimar",0
NekoEd:   .byt "NekoEd",0
Bill:     .byt "Bill",0
.endproc

.proc CharacterInfoTable
  .byt CharacterNameData::None - CharacterNameData,    $00, $00, $00
  .byt CharacterNameData::Sign - CharacterNameData,    $17, $27, $37
  .byt CharacterNameData::Nova - CharacterNameData,    $12, $2a, $30
  .byt CharacterNameData::Kee - CharacterNameData,     $17, $27, $38
  .byt CharacterNameData::Sherwin - CharacterNameData, $17, $27, $37
  .byt CharacterNameData::Luvi - CharacterNameData,    $13, $21, $37
  .byt CharacterNameData::Kieran - CharacterNameData,  $12, $21, $31
  .byt CharacterNameData::Remy - CharacterNameData,    $0f, $2a, $30
  .byt CharacterNameData::Eclipse - CharacterNameData, $15, $25, $38
  .byt CharacterNameData::MolSno - CharacterNameData,  $0f, $16, $30
  .byt CharacterNameData::S_Team - CharacterNameData,  $0f, $16, $30
  .byt CharacterNameData::Smiloid - CharacterNameData, $0f, $16, $30
  .byt CharacterNameData::Ike - CharacterNameData,     $17, $26, $30
  .byt CharacterNameData::Raoul - CharacterNameData,   $0f, $10, $30
  .byt CharacterNameData::Jafguar - CharacterNameData, $17, $27, $38
  .byt CharacterNameData::Lia - CharacterNameData,     $00, $10, $30
  .byt CharacterNameData::Iti - CharacterNameData,     $0f, $21, $30
  .byt CharacterNameData::NekoEd - CharacterNameData,  $0f, $27, $30
  .byt CharacterNameData::NekoEd - CharacterNameData,  $31, $17, $16
  .byt CharacterNameData::Bill - CharacterNameData,    $0f, $16, $30
  .byt CharacterNameData::None - CharacterNameData,    $00, $00, $00
  .byt CharacterNameData::None - CharacterNameData,    $00, $00, $00
  .byt CharacterNameData::Nova - CharacterNameData,    $12, $2a, $30
  .byt CharacterNameData::Nova - CharacterNameData,    $12, $2a, $30
  .byt CharacterNameData::Nova - CharacterNameData,    $12, $2a, $30
  .byt CharacterNameData::Nova - CharacterNameData,    $12, $2a, $30
  .byt CharacterNameData::Nova - CharacterNameData,    $12, $2a, $30
.endproc

.proc SceneInfoTable
  FLIP = 128
  ; [hppccccc]*4
  ;  |||+++++- character graphic
  ;  |++------ position (0-3)
  ;  +-------- horizontally flipped?
  .byt 0, 0, 0, 0
  .byt CHAR::NOVA|(1<<5), CHAR::SIGN|(2<<5), 0, 0
  .byt 0, 0, 0, 0
  .byt CHAR::NOVA|(1<<5), CHAR::LUVI|(2<<5)|FLIP, 0, 0
  .byt CHAR::NOVA|(1<<5), CHAR::KEE|(2<<5)|FLIP, 0, 0
  .byt CHAR::NOVA|(1<<5), CHAR::KEE|(2<<5), CHAR::LUVI|(3<<5)|FLIP, 0
  .byt CHAR::NOVA|(1<<5), CHAR::LUVI|(2<<5)|FLIP, CHAR::KEE|(3<<5)|FLIP, 0
  .byt CHAR::S_TEAM|(1<<5), CHAR::S_TEAM|(2<<5)|FLIP, 0, 0
  .byt CHAR::SHERWIN|(1<<5), CHAR::S_TEAM|(0<<5), CHAR::S_TEAM|(3<<5)|FLIP, 0
  .byt CHAR::SHERWIN|(1<<5), 0, 0, 0
  .byt CHAR::S_TEAM|(1<<5), CHAR::S_TEAM|(2<<5), CHAR::BILL|(3<<5)|FLIP, 0
  .byt CHAR::NOVA|(1<<5), CHAR::ECLIPSE|(2<<5)|FLIP, 0, 0
  .byt CHAR::NOVA|(1<<5), CHAR::MOLSNO|(2<<5)|FLIP, 0, 0
  .byt CHAR::NOVA|(1<<5), CHAR::REMY|(2<<5)|FLIP, 0, 0
  .byt CHAR::NOVA|(1<<5), CHAR::REMY|(2<<5)|FLIP, CHAR::JAFGUAR|(3<<5)|FLIP, 0
  .byt CHAR::NOVA|(1<<5), CHAR::RAOUL|(2<<5)|FLIP, 0, 0
  .byt CHAR::NOVA|(1<<5), CHAR::NEKOED|(2<<5)|FLIP, 0, 0
  .byt CHAR::NOVA|(1<<5), 0, 0, 0
  .byt CHAR::NOVA|(1<<5), CHAR::S_TEAM|(0<<5), CHAR::S_TEAM|(3<<5)|FLIP, 0
  .byt CHAR::NOVA|(1<<5), CHAR::KIERAN|(2<<5)|FLIP, 0, 0
  .byt CHAR::NOVA|(1<<5), CHAR::BILL|(2<<5)|FLIP, 0, 0
  .byt CHAR::NOVA|(1<<5), CHAR::SHERWIN|(2<<5)|FLIP, 0, 0
  .byt CHAR::NOVA|(1<<5), CHAR::SHERWIN|(2<<5)|FLIP, CHAR::KIERAN|(3<<5)|FLIP, 0
  .byt CHAR::NOVA|(1<<5), CHAR::LIA|(2<<5)|FLIP, 0, 0
  .byt CHAR::NOVA|(1<<5), CHAR::ITI|(2<<5)|FLIP, 0, 0
.endproc

.enum SCENES
  NOTHING
  NOVA_AND_SIGN
  FORUMS
  NOVA_AND_LUVI
  NOVA_AND_KEE
  NOVA_KEE_LUVI
  NOVA_LUVI_KEE
  TWO_BAD_GUYS
  SHERWIN_WITH_BAD_GUYS_AS_POLICE
  SHERWIN_ALONE
  BAD_GUYS_AND_LEADER
  NOVA_AND_ECLIPSE
  NOVA_AND_MOLSNO
  NOVA_AND_REMY
  NOVA_REMY_JAFGUAR
  NOVA_AND_RAOUL
  NOVA_AND_NEKOED
  NOVA_ALONE
  NOVA_AND_BAD_GUYS
  NOVA_AND_KIERAN
  NOVA_AND_BILL
  NOVA_AND_SHERWIN
  NOVA_SHERWIN_KIERAN
  NOVA_AND_LIA
  NOVA_AND_ITI
.endenum

FaceData:
  .incbin "../chr/faces2.chr"
