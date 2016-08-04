; Princess Engine
; Copyright (C) 2014-2016 NovaSquirrel
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

; Format for 16-bit X and Y positions and speeds:
; HHHHHHHH LLLLSSSS
; |||||||| ||||++++ - subpixels
; ++++++++ ++++------ actual pixels

.segment "ZEROPAGE"
  retraces:	        .res 1 ; incremented every frame
  slowtimer:        .res 1 ; incremented every 4 frames
  keydown:	        .res 1 ; currently pressed buttons
  keylast: 	        .res 1 ; buttons that were pressed last frame
  keynew:           .res 1 ; buttons that were not pressed last frame but are now

  random1:          .res 2 ; \ two separate random states
  random2:          .res 2 ; / combined to get a 2147385345 period randomizer

  ScrollX:          .res 2  ; Current X scroll value, using 12.4 coordinates for easy math with object coordinates
  ScrollSpeed:      .res 2

  LevelBlockPtr:    .res 2  ; written to by GetLevelColumnPtr

  ; player state stuff
  PlayerPXL:        .res 1 ; \ player X and Y positions
  PlayerPXH:        .res 1 ;  \
  PlayerPYH:        .res 1 ;  /
  PlayerPYL:        .res 1 ; /
  PlayerVXH:        .res 1 ; \ player X and Y speeds
  PlayerVXL:        .res 1 ;  \
  PlayerVYH:        .res 1 ;  /
  PlayerVYL:        .res 1 ; /

  ObjectLen = 16
  ObjectF1:         .res ObjectLen ; TTTTTTTD, Type, Direction
  EnemyRightEdge:   .res 1     ; Usually $f0 but can be $70 for 8 pixel wide enemies

  ; The most recent position the player was in where they were not colliding with any solid blocks at all.
  ; Used to return the player to this position if all four points are colliding.
  PlayerNonSolidPXL: .res 1
  PlayerNonSolidPXH: .res 1
  PlayerNonSolidPYL: .res 1
  PlayerNonSolidPYH: .res 1
 
  PlayerWasRunning: .res 1     ; was the player running when they jumped?
  PlayerDir:        .res 1     ; currently facing left?
  PlayerDirForScroll: .res 1   ; similar but for scrolling purposes
  PlayerJumping:    .res 1     ; true if jumping (not falling)
  PlayerOnGround:   .res 1     ; true if on ground
  PlayerJumpCancelLock: .res 1 ; timer for the player being unable to cancel a jump
  PlayerWalkLock:   .res 1     ; timer for the player being unable to move left/right
  PlayerDownTimer:  .res 1     ; timer for how long the player has been holding down
                               ; (used for fallthrough platforms)
  PlayerSelectTimer:  .res 1   ; timer for how long the player has been holding select
  PlayerHealth:     .res 1     ; current health, measured in half hearts
  PlayerTailAttack: .res 1     ; timer for tail attack animation
  PlayerAnimationFrame: .res 1 ; base frame of the player's animations to use
  PlayerTiles:      .res 7     ; tiles to use while drawing the player
  SoundDebounce:    .res 1     ; timer, while nonzero no new sounds effects start
  ForceControllerBits:  .res 1
  ForceControllerTime:  .res 1

  ScrollUpdateChunk:  .res 1   ; current 32 pixel chunk we're updating

  ; the NES CPU can't access VRAM outside of vblank, so this is a queue
  ; of metatile and byte updates that wait until vblank to trigger
  MaxNumBlockUpdates = 3
  MaxNumTileUpdates  = 4
  BlockUpdateA1:   .res MaxNumBlockUpdates ; \ address of the top two tiles
  BlockUpdateA2:   .res MaxNumBlockUpdates ; /
  BlockUpdateB1:   .res MaxNumBlockUpdates ; \ address of the bottom two tiles
  BlockUpdateB2:   .res MaxNumBlockUpdates ; /
  BlockUpdateT1:   .res MaxNumBlockUpdates ; \ top two tiles to write
  BlockUpdateT2:   .res MaxNumBlockUpdates ;  \
  BlockUpdateT3:   .res MaxNumBlockUpdates ;  / bottom two tiles to write
  BlockUpdateT4:   .res MaxNumBlockUpdates ; /

  TileUpdateA1:    .res MaxNumTileUpdates ; \ address
  TileUpdateA2:    .res MaxNumTileUpdates ; /
  TileUpdateT:     .res MaxNumTileUpdates ; new byte

  ; Scrolling makes use of a buffer that holds 30 tiles that are then written vertically
  ThirtyUpdateAddr: .res 2      ; PPU address to write the buffer to
  ThirtyUpdateTile: .res 30     ; 30 tiles to write

  TempSpace = ThirtyUpdateTile  ; The buffer is also used by non-gameplay stuff, so give it another name
  ScrollLevelPointer: .res 2    ; Pointer to level data, used while scrolling in new tiles

  ; variables for decoding objects during level decompression
  DecodeObjectType   = TempSpace+0 ; object type ID
  DecodeObjectXY     = TempSpace+1 ; X and Y position of the block
  DecodeObjectBlock  = TempSpace+2 ; block ID to rectangle fill with
  DecodeObjectWidth  = TempSpace+3 ; width to rectangle fill with
  DecodeObjectHeight = TempSpace+4 ; height to rectangle fill with

  ; variables for controlling cutscenes
  ; (safe because cutscenes discard the scrolling buffer anyway)
  ; also see ScriptPtr and such
  CutsceneRenderRow  = TempSpace
  CutsceneRenderCol  = CutsceneRenderRow+1
  CutsceneCharacter  = CutsceneRenderCol+1 ;4
  CutsceneCharPos    = CutsceneCharacter+4 ;4
  CutsceneCurSpeaker = CutsceneCharPos+4
  CutsceneBufIndex   = CutsceneCurSpeaker+1
  CutsceneScriptBank = CutsceneBufIndex+1
  CutsceneCurFace    = CutsceneScriptBank+1
  CutsceneNoSkip     = CutsceneCurFace+1
  CutsceneIsBlank    = CutsceneNoSkip+1

  LevelNumber:           .res 1 ; Current level number
  StartedLevelNumber:    .res 1 ; Level number that was picked from the level select
  NeedLevelReload:       .res 1 ; If set, decode LevelNumber again

  BlockMiddle: .res 1 ; what block the middle of the player is overlapping

  OamPtr:      .res 1 ; Index the next OAM entry goes in

  ; temporary spots for saving something and then loading it afterwards
  TempVal:     .res 4
  TempX:       .res 1 ; for saving the X register
  TempY:       .res 1 ; for saving the Y register
  TempXSwitch: .res 1 ; SetPRG needs X on UNROM and MMC3, so provide a place to save it
                      ; also general temporary variable for routines that don't switch

  ; Parameters for the collision routine. ChkTouchGeneric uses screen pixels.
  ; Usable as 10 free RAM bytes.
  TouchTemp:       .res 1
  TouchTemp2:      .res 1
  TouchTopA:       .res 1
  TouchTopB:       .res 1
  TouchLeftA:      .res 1
  TouchLeftB:      .res 1
  TouchWidthA:     .res 1
  TouchWidthB:     .res 1
  TouchHeightA:    .res 1
  TouchHeightB:    .res 1

  ; Pointer for cutscenes.
  ; Not reusable because many things set the pointer and trigger a cutscene later.
  ScriptPtr: .res 2

  ScriptIf = TouchTemp ; 0 (normal), 2 (enable), 3 (disable)
  ScriptReturn = ScriptIf+1
  ScriptChoice = ScriptReturn+2
  ScriptPageEnded = ScriptChoice+1 ; page is already ended, don't prompt the user for a key press

  SpriteTileSlots:    .res 4   ; \ keep together
  LevelDecodePointer: .res 2   ;  \ in this order
  LevelSpritePointer: .res 2   ;  /
  LevelBackgroundColor: .res 1 ; /
  ; LevelDecodePointer and LevelSpritePointer aren't used elsewhere and can be reused.
  ; The reason they're not already in one of the temporary space buffers is that they're
  ; written as a group, and LevelBackgroundColor and SpriteTileSlots *are* used elsewhere

  LevelHeaderPointer = TouchTemp ; pointer to the level header, for reading it
  LevelDecodeXPos = TouchTemp+2  ; current X position
  CollectedBitsIndex: .res 1 ; 0 or 128, for alternate or current collectedbits

.ifdef NMI_MUSIC
  LagFrame:     .res 1 ; used to detect lag frames
  RealPRGBank:  .res 1 ; set even if _SetPRG is used
.ifdef NeedNMIInterrupted
  NMIInterrupted: .res 1
.endif
.endif

.segment "BSS"
  UploadTileAddress: .res 2

  ; big scratch space, can be used for uploading tiles, for strings in cutscenes, or for building attributes of the screen
  BigTempSpace:
  UploadTileSpace:
  StringBuffer:
  Attributes:      .res 64
                   .res 64
  ; bigger temp space!!
  ScratchPage = $700

  IntroShownAlready: .res 1
  NeedAbilityChange: .res 1
  NeedLevelRerender: .res 1
  JustTeleported:    .res 1 ; if 0, don't redo sprites
  NeedDialog:        .res 1
  InventoryCursorY:   .res 1
  InventoryCursorYSwap: .res 1
  PlayerRidingSomething: .res 1 ; if 1, player is treated to be standing on a solid and can jump
  DisplayLevelNumber: .res 1    ; a timer for showing the current level editor on the screen

  PRGBank:         .res 1  ; current program bank
  CoinShowTimer:   .res 1  ; timer for how long to show the current coin value

  LevelUploadList: .res 20 ; list of graphics resources to upload while the level loads
                           ; must be preserved because it's needed after level load too

  ; queue for attribute table updates for scrolling
  AttributeWriteA1: .res 1 ; high address, always the same for the four writes
  AttributeWriteA2: .res 4 ; low address; only four are used because I use the increment by 32 mode
  AttributeWriteD:  .res 8 ; data to write in the eight attributes

  ; PlayerLocationLast/Now contain the low byte of the player's position in the level
  ; and are for detecting when entering a new block
  PlayerLocationLast: .res 1
  PlayerLocationNow:  .res 1

  ; DelayedMetaEdits set a timer for when a block in the level should be replaced with something else
  MaxDelayedMetaEdits = 10
; DelayedMetaEditIndexHi
  DelayedMetaEditIndexLo: .res MaxDelayedMetaEdits  ; low address in the level array
  DelayedMetaEditTime:    .res MaxDelayedMetaEdits  ; amount of time
  DelayedMetaEditType:    .res MaxDelayedMetaEdits  ; new block type

  ObjectPXH:   .res ObjectLen ; \ horizontal and vertical positions
  ObjectPXL:   .res ObjectLen ;  \
  ObjectPYH:   .res ObjectLen ;  /
  ObjectPYL:   .res ObjectLen ; /
  ObjectVXH:   .res ObjectLen ; \ horizontal and vertical speeds
  ObjectVXL:   .res ObjectLen ;  \
  ObjectVYH:   .res ObjectLen ;  /
  ObjectVYL:   .res ObjectLen ; /
; ObjectF1
  ObjectF2:    .res ObjectLen ; 1SSSSSSS, State
                              ; 0------- free to use
  ObjectF3:    .res ObjectLen ; -------- ;\ free to use. initialized with object variant
  ObjectF4:    .res ObjectLen ; -------- ;/
  ObjectIndexInLevel: .res ObjectLen ; object's index in level list, prevents object from being respawned until it's despawned
  ObjectTimer: .res ObjectLen ; when timer reaches 0, reset state

  PlayerLadderMoveFrame:  .res 1

  ; Physics variables that are translated from the saved options
  NovaAccelSpeed: .res 1
  NovaDecelSpeed: .res 1
  NovaRunSpeedL:  .res 1
  NovaRunSpeedR:  .res 1
  TapRunTimer: .res 1
  TapRunKey:   .res 1

LevelZeroWhenLoad_Start:
  PlayerHasBalloon:       .res 1
  DelayedMetaEditIndexHi: .res MaxDelayedMetaEdits  ; high address in the level array, or 0 if unused
  IsNormalDoor:           .res 1 ; 1 if the level is loading due to a door
  IsScrollUpdate:         .res 1   ; nonzero = yes
  PlayerOnLadder:         .res 1  ; true if player is on a ladder
  NeedSFX:                .res 1
  PlayerInvincible:       .res 1     ; player invincibility timer, for when getting hurt or otherwise

  ; LevelLinkUp/Down are offsets for what screen to move to if you go off the top or bottom
  LevelLinkUp:        .res 16
  LevelLinkDown:      .res 16
  ScreenFlags:        .res 16
  ScreenFlagsDummy:   .res 1

  ; ScreenFlags stores flags for each screen in the level; so far there's just one flag:
  SCREEN_BOUNDARY = 1 ; boundary on left side of screen
LevelZeroWhenLoad_End:

  PuzzleMode:             .res 1
  
  LevelMap = $6000            ; lasts until $6fff

.segment "BSS2"  ; SRAM
  CollectedBits:      .res 128 ; stores bits for broken blocks and opened blocks, that sort of thing
  CollectedAlternate: .res 128 ; alternate buffer to allow going to a different level and back and having it still work
  ColumnBytes:        .res 256 ; stores a byte for each column, for ? block contents and other things

  ; Current game state
CurrentGameState:
  PlayerAbility:    .res 1     ; current ability, see the AbilityType enum
  Coins:            .res 2     ; 2 digits, BCD
  InventoryLen = 10
  InventoryType:      .res InventoryLen
  InventoryAmount:    .res InventoryLen
  InventoryEnd:
  ; InventoryAmount is also used for flags when it's values above 99:
INVENTORY_UNLIMITED = 255
INVENTORY_EQUIPPED  = 254
  ScriptFlags:        .res 32  ; flags for scripts. first two bytes reset when entering a level on the level select
GameStateLen = 1+2+10+10+2 ; update if more stuff is added
  PlayerAbilityVar: .res 1

; Checkpoint information
  CheckpointGameState:   .res GameStateLen
  CheckpointLevelNumber: .res 1
  CheckpointX:           .res 1
  CheckpointY:           .res 1
  MakeCheckpoint:        .res 1

  LevelSize:          .res 1  ; last screen number in the level
  LastSpriteIndex:    .res 1  ; the index of the end marker in the sprite list, not initialized correctly yet?
  LevelMusic:         .res 1  ; music number for levels

  PlayerDrawX:        .res 1  ; X position the player was drawn to
  PlayerDrawY:        .res 1  ; Y position the player was drawn to

  PlayerJumpCancel: .res 1
  PlayerSwimming:   .res 1

  IRQAddress:       .res 2

  CurWorld:         .res 1 ; current world for level select
  LevelSelectInventory: .res 1 ; flag, set to 1 if accessing the inventory via the level select

  ; the sprite list from the ROM has to be copied here so we can access it in gameplay banks
  SpriteListRAM:      .res 256
  ; For speeding up enemy spawning
  FirstSpriteOnScreen:     .res 16

.segment "SAVE"
SaveStart:
  SaveTag:            .res 8
SavedGameState_Start:
  SavedAbility:       .res 1
  SavedCoins:         .res 2
  InventorySaved:     .res InventoryLen*2
  ScriptFlagsSaved:   .res 32  ; version of the flags for scripts that are actually in the save file. 256 flags
  LevelCleared:       .res 8   ; 64 levels, bit = enabled
  LevelAvailable:     .res 8   ; 64 levels, bit = enabled
SavedOptions:
  SavedAcceleration:  .res 1
  SavedRunSpeed:      .res 1
  SavedRunStyle:      .res 1
  DeleteSavePlaceholder: .res 1 ; "delete file" placeholder
SaveEnd:
.code
