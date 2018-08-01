; Princess Engine
; Copyright (C) 2014-2018 NovaSquirrel
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
.ifdef NMI_MUSIC
  LagFrame:     .res 1 ; used to detect lag frames
  RealPRGBank:  .res 1 ; set even if _SetPRG is used
.ifdef NeedNMIInterrupted
  NMIInterrupted: .res 1
.endif
.endif

  slowtimer:        .res 1 ; incremented every 4 frames
  keydown:	        .res 2 ; currently pressed buttons
  keylast: 	        .res 2 ; buttons that were pressed last frame
  keynew:           .res 2 ; buttons that were not pressed last frame but are now

  random1:          .res 2 ; \ two separate random states
  random2:          .res 2 ; / combined to get a 2147385345 period randomizer

  ScrollX:          .res 2  ; Current X scroll value, using 12.4 coordinates for easy math with object coordinates
  ScrollSpeed:      .res 2  ; unused?

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
  MaxNumBlockUpdates = 4
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
  CutsceneRenderRow  = TempSpace                ; Current VWF render row
  CutsceneRenderCol  = CutsceneRenderRow+1      ; Current VWF render column (pixels)
  CutsceneCharacter  = CutsceneRenderCol+1 ;4   ; The four character IDs present
  CutsceneCharPos    = CutsceneCharacter+4 ;4   ; Position (0-3) of the four characters
  CutsceneCurSpeaker = CutsceneCharPos+4        ; Index of the current speaker (uses CutsceneCharPos to look up actual position)
  CutsceneBufIndex   = CutsceneCurSpeaker+1     ; Index into current row's string buffer (text)
  CutsceneScriptBank = CutsceneBufIndex+1       ; Unused? Same bank is always used
  CutsceneCurFace    = CutsceneScriptBank+1     ; Current name and face
  CutsceneNoSkip     = CutsceneCurFace+1        ; Disallow skipping the cutscene. Unused but functional.

  LevelNumber:           .res 1 ; Current level number (actual map number from the game)
  StartedLevelNumber:    .res 1 ; Level number that was picked from the level select (level select number)
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
.ifdef REAL_COLLISION_TEST ; high bytes
  TouchWidthA2:    .res 1
  TouchWidthB2:    .res 1
  TouchHeightA2:   .res 1
  TouchHeightB2:   .res 1
.endif

  ; Pointer for cutscenes.
  ; Not reusable because many things set the pointer and trigger a cutscene later.
  ScriptPtr: .res 2

  ScriptPageEnded = TouchTemp ; page is already ended, don't prompt the user for a key press

  SpriteTileSlots:    .res 4   ; \ keep together
  LevelDecodePointer: .res 2   ;  \ in this order
  LevelSpritePointer: .res 2   ;  /
  LevelBackgroundColor: .res 1 ; /
  ; LevelDecodePointer and LevelSpritePointer aren't used elsewhere and can be reused.
  ; The reason they're not already in one of the temporary space buffers is that they're
  ; written as a group, and LevelBackgroundColor and SpriteTileSlots *are* used elsewhere

  CompressedTextPointer = LevelDecodePointer

  LevelHeaderPointer = TouchTemp ; pointer to the level header, for reading it
  LevelDecodeXPos = TouchTemp+2  ; current X position

  tvSystem: .res 1
  periodTableLo: .res 2 ; pointer
  periodTableHi: .res 2 ; pointer

.segment "BSS"
  .res 12 ; buffer

  UploadTileAddress: .res 2 ; little endian

  ; big scratch space, can be used for uploading tiles, for strings in cutscenes, or for building attributes of the screen
  BigTempSpace:
  UploadTileSpace:
  StringBuffer:
                   .res 64
  Attributes:      .res 64
  ; bigger temp space!!
  ScratchPage = $700

  LevelVariable:     .res 1 ; cleared to zero on level start, free for whatever
  LevelVariable2:    .res 1

  NeedAbilityChange: .res 1
  NeedAbilityChangeNoSound: .res 1
  NeedLevelRerender: .res 1
  JustTeleported:    .res 1 ; if 0, don't redo sprites
  NeedDialog:        .res 1
  InventoryCursorY:   .res 1
  InventoryCursorYSwap: .res 1
  PlayerRidingSomething: .res 1 ; if 1, player is treated to be standing on a solid and can jump
  SwitchCooldownTimer: .res 1
  ToggleSwitchCooldownTimer: .res 1

  CutsceneOldBank: .res 1   ; Old bank, so it can restore to it
  CutsceneOldSP:   .res 1   ; Old stack pointer
  IntroShownAlready: .res 1 ; prevents the cutscene from being shown twice
  CutscenesEnabled:  .res 1 ; if 0, don't show them

; when an intro cutscene happens, this is set to the level number
; and if it's the same level as the previous one, it's skipped

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

  ; Set to 1 if a collectible was touched by something other than the player
  CollectedByProjectile: .res 1
  PlayerLeftRightLock:   .res 1

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
  TapRunTimer: .res 1           ; timer for determining if it's a double tap
  TapRunKey:   .res 1           ; which d-pad button the run was started right (left/right)

LevelZeroWhenLoad_Start:
  RunStartedWithTap:      .res 1 ; if 1, the current run started with a tap
  PlayerHasBalloon:       .res 1
  DelayedMetaEditIndexHi: .res MaxDelayedMetaEdits  ; high address in the level array, or 0 if unused
  IsScrollUpdate:         .res 1   ; nonzero = yes
  PlayerOnLadder:         .res 1   ; true if player is on a ladder
  NeedSFX:                .res 1
  PlayerInvincible:       .res 1   ; player invincibility timer, for when getting hurt or otherwise
  PreserveLevel:          .res 1   ; don't reset level when player dies

  ; LevelLinkUp/Down are offsets for what screen to move to if you go off the top or bottom
  LevelLinkUp:            .res 16
  LevelLinkDown:          .res 16
  ScreenFlags:            .res 16
  ScreenFlagsDummy:       .res 1
  ; ScreenFlags stores flags for each screen in the level; so far there's just one flag:
  SCREEN_BOUNDARY = 1 ; boundary on left side of screen
  ; Now more stuff...
  FallingBlockPointer:    .res 2
  FallingBlockY:          .res 1
  BackgroundMetatile:     .res 1
  CarryingSunKey:         .res 1
  CarryingPickupBlock:    .res 1
  LevelRoutine:           .res 2 ; called once a frame, very important that it doesn't cross a page boundary
                                 ; to do: actually verify that it doesn't?
  NeedCollectibleBitSet:  .res 1
.ifdef NEW_TOGGLE_BEHAVIOR
  ToggleBlockEnabled:     .res 1 ; 64 if enabled, 0 if not
  ToggleBlockUpload:      .res 1 ; 1 or 2 if it needs uploading
.endif
  PuzzleMode:             .res 1
  ChipCount:              .res 1
  ChipsNeeded:            .res 1

  BackgroundBoss:         .res 1
LevelZeroWhenLoad_End:
  IsNormalDoor:           .res 1 ; 1 if the level is loading due to a door

  LevelMap = $6000            ; lasts until $6fff

.segment "BSS2"  ; SRAM
.ifdef NEW_TOGGLE_BEHAVIOR
  MetatileFlags:      .res 256 ; RAM copy of MetatileFlags
.endif
  ColumnBytes:        .res 256 ; stores a byte for each column, for ? block contents and other things

  PlayerAbility:      .res 1     ; current ability, see the AbilityType enum

; Current game state (saved in checkpoints)
CurrentGameState:
  Coins:              .res 2     ; 2 digits, BCD
  InventoryLen = 10
  InventoryLenFull = 20          ; full inventory including second page
  InventoryType:           .res InventoryLen
  InventoryPerLevelType:   .res InventoryLen
  InventoryAmount:         .res InventoryLen
  InventoryPerLevelAmount: .res InventoryLen
  InventoryEnd:
  ; InventoryAmount is also used for flags when it's values above 99 (but it's unused):
INVENTORY_UNLIMITED = 255
INVENTORY_EQUIPPED  = 254
GameStateLen = 2+10*4 ; update if more stuff is added. Just coins and inventory.
  InventoryPage: .res 1 ; 0 normally, InventoryLen if second page

  PlayerAbilityVar: .res 1  ; used to keep track of ability-related things
  PlayerNeedsGround: .res 1 ; sets to zero when the player touches the ground
  PlayerRidingSomethingLast: .res 1 ; player was riding something last frame

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

; Pointer for IRQ, mostly only used for a very specific use of BRK in cutscenes
  IRQAddress:       .res 2

  CurWorld:         .res 1 ; current world for level select
  OptionsViaInventory: .res 1 ; if 1, accessing options via inventory screen

  ; the sprite list from the ROM has to be copied here so we can access it in gameplay banks
  SpriteListRAM:      .res 256
  ; For speeding up enemy spawning
  ; (keeps track of which sprite index is the first one on a particular screen)
  FirstSpriteOnScreen:     .res 16

  PlaceBlockInLevel:    .res 1 ; if nonzero, place a block in the level instead of running the engine
  PlaceBlockX:          .res 1
  PlaceBlockY:          .res 1
  PlaceBlockAutorepeat: .res 1 ; Autorepeat timer
  PlaceBlockItemIndex:  .res 1
  SNESController:       .res 1 ; 1 if SNES controller, 0 if NES

  BackgroundBossScrollX: .res 1
  BackgroundBossScrollY: .res 1

  AttackKeyDownSnapshot: .res 2 ; snapshot of what keys were down when the attack started

  LevelBackgroundColorSave: .res 1 ; for cutscenes
  InfiniteProjectileCheat: .res 1
  DownLockFromRideable: .res 1 ; set to 1 when riding on a burger or ice. unset when it's unpressed

  SandboxMode:         .res 1
  SandboxTerrain:      .res 1
  SandboxExtra:        .res 1
  SandboxDecoration:   .res 1
  SandboxSpPalette:    .res 1
  SandboxSpSlot1:      .res 1
  SandboxSpSlot2:      .res 1
  SandboxSpSlot3:      .res 1
  SandboxSpSlot4:      .res 1
  SandboxCursorX:      .res 1
  SandboxBrushes:      .res 7
  SandboxCurrentBlock: .res 1

  FinalBossScreenX:   .res 1 ; pixel position of final boss
  FinalBossScreenY:   .res 1
  MusicMute:          .res 1
  InMusicCode:        .res 1
  JumpGracePeriod:    .res 1
  DontStartNewSong:   .res 1
.segment "SAVE"
SaveStart:
  SaveTag:            .res 9
SavedGameState_Start: ; apparently this isn't actually used in one chunk?
  SavedCoins:         .res 2
  InventorySavedType:   .res InventoryLen
  InventorySavedAmount: .res InventoryLen
  LevelCleared:       .res 8   ; 64 levels, bit = enabled
  LevelAvailable:     .res 8   ; 64 levels, bit = enabled
  CollectibleBits:    .res 8   ; 64 levels, bit = gotten
SavedOptions:
  SavedAcceleration:  .res 1
  SavedRunSpeed:      .res 1
  SavedRunStyle:      .res 1    ; if 1, can double-tap to run
  SavedShootWhileWalking: .res 1
  DeleteSavePlaceholder: .res 1 ; "delete file" placeholder
SaveEnd:
.code
