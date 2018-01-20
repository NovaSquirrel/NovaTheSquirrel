;TTTTTTTT XXXXYYYY [SSSSSSSS]
.enum
  CUSTOM_BLOCK_SINGLE     ; TT XY mm
  CUSTOM_BLOCK_RECTANGLE  ; TT XY mm WH
  BLOCK_SINGLE            ; TT XY
  BLOCK_RECTANGLE         ; TT XY WH
;  BLOCK_EXTRA_WIDE        ; TT XY WW \ useless
;  BLOCK_EXTRA_TALL        ; TT XY HH /
  BLOCK_WIDE_FROM_LIST    ; TT XY Wm
  BLOCK_TALL_FROM_LIST    ; TT XY Hm
  BLOCK_RECT_FROM_LIST    ; TT XY Hm WW
  BLOCK_RECTANGLE_SERIES  ; TT XY [WH] ... FF
.endenum

.proc DecodeObjectTypesAddressesL
  .byt <(DO_CustomBlockSingle-1)
  .byt <(DO_CustomBlockRectangle-1)
  .byt <(DO_BlockSingle-1)
  .byt <(DO_BlockRectangle-1)
  .byt <(DO_BlockWideList-1)
  .byt <(DO_BlockTallList-1)
  .byt <(DO_BlockRectList-1)
  .byt <(DO_RectangleSeries-1)
.endproc

.proc DecodeObjectTypesAddressesH
  .byt >(DO_CustomBlockSingle-1)
  .byt >(DO_CustomBlockRectangle-1)
  .byt >(DO_BlockSingle-1)
  .byt >(DO_BlockRectangle-1)
  .byt >(DO_BlockWideList-1)
  .byt >(DO_BlockTallList-1)
  .byt >(DO_BlockRectList-1)
  .byt >(DO_RectangleSeries-1)
.endproc

.proc ObjectTypesTable
  .byt CUSTOM_BLOCK_SINGLE,    0
  .byt CUSTOM_BLOCK_RECTANGLE, 0
  .byt BLOCK_WIDE_FROM_LIST,   0
  .byt BLOCK_TALL_FROM_LIST,   0
  .byt BLOCK_RECT_FROM_LIST,   0
  .byt BLOCK_WIDE_FROM_LIST,   16
  .byt BLOCK_TALL_FROM_LIST,   16
  .byt BLOCK_RECT_FROM_LIST,   16
  .byt BLOCK_WIDE_FROM_LIST,   32
  .byt BLOCK_TALL_FROM_LIST,   32
  .byt BLOCK_RECT_FROM_LIST,   32
  .byt BLOCK_RECTANGLE,        Metatiles::EMPTY
  .byt BLOCK_RECTANGLE,        Metatiles::BRICKS
  .byt BLOCK_RECTANGLE,        Metatiles::SOLID_BLOCK
  .byt BLOCK_RECTANGLE,        Metatiles::COIN
  .byt BLOCK_RECTANGLE,        Metatiles::GROUND_MIDDLE_M
  .byt BLOCK_RECTANGLE,        Metatiles::ROCK_MID_M
  .byt BLOCK_RECTANGLE,        Metatiles::WATER_MAIN
  .byt BLOCK_SINGLE,           Metatiles::SOLID_BLOCK
  .byt BLOCK_SINGLE,           Metatiles::SPRING
  .byt BLOCK_SINGLE,           Metatiles::SIGNPOST
  .byt BLOCK_SINGLE,           Metatiles::BRICKS
  .byt BLOCK_SINGLE,           Metatiles::PRIZE
  .byt BLOCK_SINGLE,           Metatiles::BRICKPRIZE
  .byt BLOCK_SINGLE,           Metatiles::GROUND_CLIMB_L
  .byt BLOCK_SINGLE,           Metatiles::GROUND_CLIMB_R
  .byt BLOCK_SINGLE,           Metatiles::COIN
  .byt BLOCK_SINGLE,           Metatiles::GROUND_MIDDLE_M
  .byt BLOCK_SINGLE,           Metatiles::SOLID_ROCK
  .byt BLOCK_SINGLE,           Metatiles::DOOR_TOP
  .byt BLOCK_SINGLE,           Metatiles::EXIT_DOOR_TOP
  .byt BLOCK_RECTANGLE_SERIES, Metatiles::GROUND_MIDDLE_M
  .byt BLOCK_RECTANGLE_SERIES, Metatiles::ROCK_MID_M
  .byt BLOCK_SINGLE,           Metatiles::BG_TALL_GRASS
  .byt BLOCK_SINGLE,           Metatiles::BG_FLOWER_1
  .byt BLOCK_SINGLE,           Metatiles::BG_BUSH_BOT
  .byt BLOCK_SINGLE,           Metatiles::BIG_HEART
  .byt BLOCK_SINGLE,           Metatiles::HEART
  .byt BLOCK_RECTANGLE,        Metatiles::GRAY_BRICKS
  .byt BLOCK_SINGLE,           Metatiles::MOAI_RIGHT
  .byt BLOCK_SINGLE,           Metatiles::MOAI_LEFT
  .byt BLOCK_SINGLE,           Metatiles::TROPICAL_FLOWER
  .byt BLOCK_SINGLE,           Metatiles::TROPICAL_FLOWER_2
  .byt BLOCK_SINGLE,           Metatiles::BG_TREETOP_LL
  .byt BLOCK_SINGLE,           Metatiles::BIG_SPIKY_BUSH
  .byt BLOCK_SINGLE,           Metatiles::WOOD_PLATFORM_TOP
  .byt BLOCK_SINGLE,           Metatiles::WOOD_PLATFORM
  .byt BLOCK_RECTANGLE,        Metatiles::WOOD_PLATFORM
  .byt BLOCK_RECTANGLE_SERIES, Metatiles::SAND
  .byt BLOCK_RECTANGLE,        Metatiles::SAND
  .byt BLOCK_SINGLE,           Metatiles::SQUIRREL_BUSH
  .byt BLOCK_SINGLE,           Metatiles::K_STATUE_TOP
  .byt BLOCK_RECTANGLE,        Metatiles::BRICKWALL_MIDDLE
  .byt BLOCK_SINGLE,           Metatiles::WOOD_ARROW_LEFT
  .byt BLOCK_SINGLE,           Metatiles::WOOD_ARROW_DOWN
  .byt BLOCK_SINGLE,           Metatiles::WOOD_ARROW_UP
  .byt BLOCK_SINGLE,           Metatiles::WOOD_ARROW_RIGHT
  .byt BLOCK_SINGLE,           Metatiles::WOOD_BOMB
  .byt BLOCK_SINGLE,           Metatiles::WOOD_CRATE
  .byt BLOCK_SINGLE,           Metatiles::METAL_ARROW_LEFT
  .byt BLOCK_SINGLE,           Metatiles::METAL_ARROW_DOWN
  .byt BLOCK_SINGLE,           Metatiles::METAL_ARROW_UP
  .byt BLOCK_SINGLE,           Metatiles::METAL_ARROW_RIGHT
  .byt BLOCK_SINGLE,           Metatiles::METAL_BOMB
  .byt BLOCK_SINGLE,           Metatiles::METAL_CRATE
  .byt BLOCK_SINGLE,           Metatiles::BG_GLASS_GREEN
  .byt BLOCK_SINGLE,           Metatiles::BG_GLASS_GRAY
  .byt BLOCK_SINGLE,           Metatiles::BG_GLASS_RED
  .byt BLOCK_SINGLE,           Metatiles::BG_GLASS_BLUE
  .byt BLOCK_SINGLE,           Metatiles::FG_GLASS_RED
  .byt BLOCK_SINGLE,           Metatiles::FG_GLASS_BLUE
  .byt BLOCK_RECTANGLE,        Metatiles::BG_GLASS_GREEN
  .byt BLOCK_RECTANGLE,        Metatiles::BG_GLASS_GRAY
  .byt BLOCK_RECTANGLE,        Metatiles::BG_GLASS_RED
  .byt BLOCK_RECTANGLE,        Metatiles::BG_GLASS_BLUE
  .byt BLOCK_RECTANGLE,        Metatiles::FG_GLASS_RED
  .byt BLOCK_RECTANGLE,        Metatiles::FG_GLASS_BLUE
  .byt BLOCK_RECTANGLE,        Metatiles::SOLID_ROCK
  .byt BLOCK_RECTANGLE,        Metatiles::CEILING_BARRIER
  .byt BLOCK_SINGLE,           Metatiles::CEILING_BARRIER
  .byt BLOCK_SINGLE,           Metatiles::STORY_DIALOG_TRIGGER
  .byt BLOCK_SINGLE,           Metatiles::GLIDER_BLOCK
  .byt BLOCK_SINGLE,           Metatiles::MINE_TRACK
  .byt BLOCK_SINGLE,           Metatiles::MINE_TRACK_UP
  .byt BLOCK_SINGLE,           Metatiles::MINE_TRACK_UP_LEFT
  .byt BLOCK_SINGLE,           Metatiles::MINE_TRACK_UP_RIGHT
  .byt BLOCK_SINGLE,           Metatiles::MINE_TRACK_BUMP
  .byt BLOCK_SINGLE,           Metatiles::MINE_TRACK_SPECIAL
  .byt BLOCK_SINGLE,           Metatiles::MINE_TRACK_STOP
  .byt BLOCK_SINGLE,           Metatiles::MINE_TRACK_SUPPORTS
  .byt BLOCK_SINGLE,           Metatiles::MINE_TRACK_STEEP_LEFT_BOT
  .byt BLOCK_SINGLE,           Metatiles::MINE_TRACK_STEEP_RIGHT_BOT
  .byt BLOCK_SINGLE,           Metatiles::MINE_TRACK_GRADUAL_LEFT_L
  .byt BLOCK_SINGLE,           Metatiles::MINE_TRACK_GRADUAL_RIGHT_R
  .byt BLOCK_RECTANGLE,        Metatiles::MINE_TRACK_SUPPORTS_ONLY
  .byt BLOCK_RECTANGLE,        Metatiles::ENEMY_BARRIER
  .byt BLOCK_SINGLE,           Metatiles::SNOWMAN_TOP
  .byt BLOCK_SINGLE,           Metatiles::FROZEN_CRACK
  .byt BLOCK_RECTANGLE,        Metatiles::ICE2
  .byt BLOCK_RECTANGLE,        Metatiles::SQUIRREL_BUSH
.endproc

.proc ObjectTypesList
  .byt Metatiles::EMPTY
  .byt Metatiles::BRICKS
  .byt Metatiles::PRIZE
  .byt Metatiles::USED_PRIZE
  .byt Metatiles::SOLID_BLOCK
  .byt Metatiles::LADDER
  .byt Metatiles::SPIKES
  .byt Metatiles::COIN
  .byt Metatiles::SPRING
  .byt Metatiles::GROUND_MIDDLE_M
  .byt Metatiles::WATER_MAIN
  .byt Metatiles::SOLID_LEDGE_M
  .byt Metatiles::FALLTHROUGH_LEDGE_M
  .byt Metatiles::BRICKPRIZE
  .byt Metatiles::BG_FENCE
  .byt Metatiles::BG_TALL_GRASS
  ; list 2
  .byt Metatiles::BG_FLOWER_1
  .byt Metatiles::BG_BLACK
  .byt Metatiles::BG_BUSH_BOT
  .byt Metatiles::BG_TRUNK_L
  .byt Metatiles::BG_TRUNK
  .byt Metatiles::GRAY_BRICKS
  .byt Metatiles::STONE_BRIDGE
  .byt Metatiles::SAND
  .byt Metatiles::PALM_TREE
  .byt Metatiles::STRIPED_LOG_HORIZ
  .byt Metatiles::LOG_HORIZ
  .byt Metatiles::WOOD_PLATFORM_TOP
  .byt Metatiles::WOOD_PLATFORM
  .byt Metatiles::PATH_LINE
  .byt Metatiles::WOOD_CRATE
  .byt Metatiles::METAL_CRATE
  ; list 3
  .byt Metatiles::WHITEFENCE_MIDDLE
  .byt Metatiles::ROCK_MID_M
  .byt Metatiles::FG_GLASS_RED
  .byt Metatiles::FG_GLASS_BLUE
  .byt Metatiles::SOLID_ROCK
  .byt Metatiles::MINE_TRACK
  .byt Metatiles::MINE_TRACK_BRAKES
  .byt Metatiles::FROZEN_CRACK
  .byt Metatiles::EMPTY
  .byt Metatiles::EMPTY
  .byt Metatiles::EMPTY
  .byt Metatiles::EMPTY
  .byt Metatiles::EMPTY
  .byt Metatiles::EMPTY
  .byt Metatiles::EMPTY
  .byt Metatiles::EMPTY
.endproc
