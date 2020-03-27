import json, glob, os, sys

ColDataPointerTypes = ["SIGNPOST", "STORY_DIALOG_TRIGGER"]; # list of object types whose extra data is a pointer
PrizeContainingTypes = ["PRIZE", "BRICKPRIZE"]; # list of object types whose extra data is an inventory type
FGControlTypes = ["COLUMN_DATA", "COLUMN_POINTER", "BLOCK_CONTENTS", "TELEPORT"];

RectRules = [
  {"T":"EMPTY",          "W":16,  "H":16, "O": "LObjN LO::R_AIR,            &X, &Y, &W, &H"},
  {"T":"GROUND",         "W":1,   "H":1,  "O": "LObj  LO::S_GROUND,         &X, &Y"},
  {"T":"GROUND",         "W":16,  "H":16, "O": "LObjN LO::R_GROUND,         &X, &Y, &W, &H"},
  {"T":"GROUND",         "W":256, "H":16, "O": "LObjN LO::RECT_1,           &X, &Y, &H, LN1::GROUND, &W"},
  {"T":"GROUND_CLIMB_L", "W":1,   "H":1,  "O": "LObj  LO::S_GROUND_CLIMB_L, &X, &Y"},
  {"T":"GROUND_CLIMB_R", "W":1,   "H":1,  "O": "LObj  LO::S_GROUND_CLIMB_R, &X, &Y"},
  {"T":"BRICKS",         "W":1,   "H":1,  "O": "LObj  LO::S_BRICK,          &X, &Y"},
  {"T":"BRICKS",         "W":16,  "H":16, "O": "LObjN LO::R_BRICK,          &X, &Y, &W, &H"},
  {"T":"BRICKS",         "W":256, "H":16, "O": "LObjN LO::RECT_1,           &X, &Y, &H, LN1::BRICKS, &W"},
  {"T":"SOLID_BLOCK",    "W":1,   "H":1,  "O": "LObj  LO::S_SOLID_BLOCK,    &X, &Y"},
  {"T":"SOLID_BLOCK",    "W":16,  "H":16, "O": "LObjN LO::R_SOLID_BLOCK,    &X, &Y, &W, &H"},
  {"T":"SOLID_BLOCK",    "W":256, "H":16, "O": "LObjN LO::RECT_1,           &X, &Y, &H, LN1::SOLID_BLOCK, &W"},
  {"T":"BRICKPRIZE",     "W":1,   "H":1,  "O": "LObj  LO::S_BRICKPRIZE,     &X, &Y"},
  {"T":"BRICKPRIZE",     "W":16,  "H":1,  "O": "LObjN LO::WIDE_1,           &X, &Y, &W, LN1::BRICKPRIZE"},
  {"T":"PRIZE",          "W":1,   "H":1,  "O": "LObj  LO::S_PRIZE,          &X, &Y"},
  {"T":"PRIZE",          "W":16,  "H":1,  "O": "LObjN LO::WIDE_1,           &X, &Y, &W, LN1::PRIZE"},
  {"T":"USED_PRIZE",     "W":16,  "H":1,  "O": "LObjN LO::WIDE_1,           &X, &Y, &W, LN1::USED_PRIZE"},
  {"T":"USED_PRIZE",     "W":1,   "H":16, "O": "LObjN LO::TALL_1,           &X, &Y, &W, LN1::USED_PRIZE"},
  {"T":"COIN",           "W":1,   "H":1,  "O": "LObj  LO::S_COIN,           &X, &Y"},
  {"T":"COIN",           "W":16,  "H":16, "O": "LObjN LO::R_COIN,           &X, &Y, &W, &H"},
  {"T":"SPRING",         "W":1,   "H":1,  "O": "LObj  LO::S_SPRING,         &X, &Y"},
  {"T":"ROCK_GROUND",    "W":16,  "H":16, "O": "LObjN LO::R_ROCK,           &X, &Y, &W, &H"},
  {"T":"ROCK_GROUND",    "W":256, "H":16, "O": "LObjN LO::RECT_3,           &X, &Y, &H, LN3::ROCK, &W"},
  {"T":"SMALL_ROCK",     "W":1,   "H":1,  "O": "LObj  LO::S_SOLID_ROCK,     &X, &Y"},
  {"T":"SMALL_ROCK",     "W":16,  "H":16, "O": "LObjN LO::R_SOLID_ROCK,     &X, &Y, &W, &H"},
  {"T":"SMALL_ROCK",     "W":256, "H":1,  "O": "LObjN LO::RECT_3,           &X, &Y, &W, LN3::SOLID_ROCK, &W"},
  {"T":"SOLID_LEDGE",    "W":16,  "H":1,  "O": "LObjN LO::WIDE_1,           &X, &Y, &W, LN1::SOLID_LEDGE"},
  {"T":"SOLID_LEDGE",    "W":256, "H":1,  "O": "LObjN LO::RECT_1,           &X, &Y, &W, LN1::SOLID_LEDGE, &W"},
  {"T":"FALLTHROUGH_LEDGE", "W":16, "H":1,"O": "LObjN LO::WIDE_1,           &X, &Y, &W, LN1::FALLTHROUGH_LEDGE"},
  {"T":"FALLTHROUGH_LEDGE", "W":256,"H":1,"O": "LObjN LO::RECT_1,           &X, &Y, &W, LN1::FALLTHROUGH_LEDGE, &W"},
  {"T":"SIGNPOST",       "W":1,   "H":1,  "O": "LObj  LO::S_SIGNPOST,       &X, &Y"},
  {"T":"WATER",          "W":16,  "H":16, "O": "LObjN LO::R_WATER,          &X, &Y, &W, &H"},
  {"T":"WATER",          "W":256, "H":16, "O": "LObjN LO::RECT_1,           &X, &Y, &H, LN1::WATER, &W"},
  {"T":"LADDER",         "W":1,   "H":16, "O": "LObjN LO::TALL_1,           &X, &Y, &H, LN1::LADDER"},
  {"T":"SPIKES",         "W":16,  "H":1,  "O": "LObjN LO::WIDE_1,           &X, &Y, &W, LN1::SPIKES"},
  {"T":"DOOR",           "W":1,   "H":1,  "O": "LObj  LO::S_DOOR,           &X, &Y"},
  {"T":"EXIT_DOOR",      "W":1,   "H":1,  "O": "LObj  LO::S_EXIT_DOOR,      &X, &Y"},
  {"T":"BG_TALL_GRASS",  "W":1,   "H":1,  "O": "LObj  LO::S_TALL_GRASS,     &X, &Y"},
  {"T":"BG_FLOWER_1",    "W":1,   "H":1,  "O": "LObj  LO::S_FLOWER,         &X, &Y"},
  {"T":"BG_BUSH_BOT",    "W":1,   "H":1,  "O": "LObj  LO::S_BUSH,           &X, &Y"},
  {"T":"BG_FENCE",       "W":16,  "H":1,  "O": "LObjN LO::WIDE_1,           &X, &Y, &W, LN1::FENCE"},
  {"T":"BG_TALL_GRASS",  "W":16,  "H":1,  "O": "LObjN LO::WIDE_1,           &X, &Y, &W, LN1::TALLGRASS"},
  {"T":"BG_FLOWER_1",    "W":16,  "H":1,  "O": "LObjN LO::WIDE_2,           &X, &Y, &W, LN2::FLOWER"},
  {"T":"BG_BLACK",       "W":256, "H":16, "O": "LObjN LO::RECT_2,           &X, &Y, &H, LN2::BLACK, &W"},
  {"T":"BG_TRUNK",       "W":1,   "H":16, "O": "LObjN LO::TALL_2,           &X, &Y, &H, LN2::TRUNK"},
  {"T":"BG_TRUNK_L",     "W":1,   "H":16, "O": "LObjN LO::TALL_2,           &X, &Y, &H, LN2::TRUNK_L"},
  {"T":"BG_BUSH_BOT",    "W":16,  "H":1,  "O": "LObjN LO::WIDE_2,           &X, &Y, &W, LN2::BUSH"},
  {"T":"GRAY_BRICKS",    "W":16,  "H":1,  "O": "LObjN LO::WIDE_2,           &X, &Y, &W, LN2::GRAY_BRICKS"},
  {"T":"GRAY_BRICKS",    "W":1,   "H":16, "O": "LObjN LO::TALL_2,           &X, &Y, &H, LN2::GRAY_BRICKS"},
  {"T":"GRAY_BRICKS",    "W":16,  "H":16, "O": "LObjN LO::R_GRAYBRICKS,     &X, &Y, &W, &H"},
  {"T":"GRAY_BRICKS",    "W":256, "H":16, "O": "LObjN LO::RECT_2,           &X, &Y, &H, LN2::GRAY_BRICKS, &W"},
  {"T":"BIG_HEART",      "W":1,   "H":1,  "O": "LObj  LO::S_BIGHEART,       &X, &Y"},
  {"T":"HEART",          "W":1,   "H":1,  "O": "LObj  LO::S_HEART,          &X, &Y"},
  {"T":"STONE_BRIDGE",   "W":16,  "H":1,  "O": "LObjN LO::WIDE_2,           &X, &Y, &W, LN2::STONE_BRIDGE"},
  {"T":"PALM_TREE",      "W":1,   "H":16, "O": "LObjN LO::TALL_2,           &X, &Y, &H, LN2::PALM_TREE"},
  {"T":"SAND",           "W":16,  "H":16, "O": "LObjN LO::R_SAND,           &X, &Y, &W, &H"},
  {"T":"SAND",           "W":256, "H":16, "O": "LObjN LO::RECT_2,           &X, &Y, &H, LN2::SAND, &W"},
  {"T":"STRIPED_LOG_HORIZ", "W":16,"H":1, "O": "LObjN LO::WIDE_2,           &X, &Y, &W, LN2::STRIPED_LOG_HORIZ"},
  {"T":"MOAI_RIGHT",     "W":1,   "H":1,  "O": "LObj  LO::S_MOAI_RIGHT,     &X, &Y"},
  {"T":"MOAI_LEFT",      "W":1,   "H":1,  "O": "LObj  LO::S_MOAI_LEFT,      &X, &Y"},
  {"T":"TROPICAL_FLOWER",  "W":1, "H":1,  "O": "LObj  LO::S_TROPICAL_FLOWER,&X, &Y"},
  {"T":"TROPICAL_FLOWER_2","W":1, "H":1,  "O": "LObj  LO::S_TROPICAL_FLOWER_2, &X, &Y"},
  {"T":"LOG_HORIZ",      "W":16,  "H":1,  "O": "LObjN LO::WIDE_2,           &X, &Y, &W, LN2::LOG_HORIZ"},
  {"T":"BG_TREETOP_LL",  "W":1,   "H":1,  "O": "LObj  LO::S_BIG_BUSH, &X, &Y"},
  {"T":"BIG_SPIKY_BUSH", "W":1,   "H":1,  "O": "LObj  LO::S_BIG_SPIKY_BUSH, &X, &Y"},
  {"T":"WOOD_PLATFORM_TOP", "W":1, "H":1, "O": "LObj  LO::S_WOOD_PLATFORM_TOP, &X, &Y"},
  {"T":"WOOD_PLATFORM_TOP", "W":16,"H":1, "O": "LObjN LO::WIDE_2,           &X, &Y, &W, LN2::WOOD_PLATFORM_TOP"},
  {"T":"WOOD_PLATFORM",  "W":1,   "H":1,  "O": "LObj  LO::S_WOOD_PLATFORM,  &X, &Y"},
  {"T":"WOOD_PLATFORM",  "W":16,  "H":16, "O": "LObjN LO::R_WOOD_PLATFORM,  &X, &Y, &W, &H"},
  {"T":"PATH_LINE",      "W":16,  "H":1,  "O": "LObjN LO::WIDE_2,           &X, &Y, &W, LN2::PATH_LINE"},
  {"T":"PATH_LINE",      "W":1,   "H":16, "O": "LObjN LO::TALL_2,           &X, &Y, &H, LN2::PATH_LINE"},
  {"T":"SQUIRREL_BUSH",   "W":1,   "H":1, "O": "LObj  LO::S_SKWIRLBUSH,     &X, &Y"},
  {"T":"SQUIRREL_BUSH",   "W":16,  "H":16,"O": "LObjN LO::R_SKWIRLBUSH,     &X, &Y, &W, &H"},
  {"T":"K_STATUE_TOP",    "W":1,   "H":1, "O": "LObj  LO::S_STATUE,         &X, &Y"},
  {"T":"BRICKWALL_MIDDLE","W":16,  "H":16,"O": "LObjN LO::R_BRICKWALL,      &X, &Y, &W, &H"},
  {"T":"WHITEFENCE_MIDDLE","W":16,  "H":1,"O": "LObjN LO::WIDE_3,           &X, &Y, &W, LN3::WHITEFENCE"},
  {"T":"WOOD_ARROW_LEFT", "W":1,   "H":1, "O": "LObj  LO::S_W_ARROW_LEFT,   &X, &Y"},
  {"T":"WOOD_ARROW_DOWN", "W":1,   "H":1, "O": "LObj  LO::S_W_ARROW_DOWN,   &X, &Y"},
  {"T":"WOOD_ARROW_UP",   "W":1,   "H":1, "O": "LObj  LO::S_W_ARROW_UP,     &X, &Y"},
  {"T":"WOOD_ARROW_RIGHT","W":1,   "H":1, "O": "LObj  LO::S_W_ARROW_RIGHT,  &X, &Y"},
  {"T":"WOOD_BOMB",       "W":1,   "H":1, "O": "LObj  LO::S_W_BOMB,         &X, &Y"},
  {"T":"WOOD_CRATE",      "W":1,   "H":1, "O": "LObj  LO::S_W_CRATE,        &X, &Y"},
  {"T":"METAL_ARROW_LEFT", "W":1,  "H":1, "O": "LObj  LO::S_M_ARROW_LEFT,   &X, &Y"},
  {"T":"METAL_ARROW_DOWN", "W":1,  "H":1, "O": "LObj  LO::S_M_ARROW_DOWN,   &X, &Y"},
  {"T":"METAL_ARROW_UP",   "W":1,  "H":1, "O": "LObj  LO::S_M_ARROW_UP,     &X, &Y"},
  {"T":"METAL_ARROW_RIGHT","W":1,  "H":1, "O": "LObj  LO::S_M_ARROW_RIGHT,  &X, &Y"},
  {"T":"METAL_BOMB",       "W":1,  "H":1, "O": "LObj  LO::S_M_BOMB,         &X, &Y"},
  {"T":"METAL_CRATE",      "W":1,  "H":1, "O": "LObj  LO::S_M_CRATE,        &X, &Y"},
  {"T":"BG_GLASS_GREEN", "W":1,   "H":1,  "O": "LObj  LO::S_BG_GLASS_GREEN, &X, &Y"},
  {"T":"BG_GLASS_GRAY",  "W":1,   "H":1,  "O": "LObj  LO::S_BG_GLASS_GRAY,  &X, &Y"},
  {"T":"BG_GLASS_RED",   "W":1,   "H":1,  "O": "LObj  LO::S_BG_GLASS_RED,   &X, &Y"},
  {"T":"BG_GLASS_BLUE",  "W":1,   "H":1,  "O": "LObj  LO::S_BG_GLASS_BLUE,  &X, &Y"},
  {"T":"FG_GLASS_RED",   "W":1,   "H":1,  "O": "LObj  LO::S_FG_GLASS_RED,   &X, &Y"},
  {"T":"FG_GLASS_BLUE",  "W":1,   "H":1,  "O": "LObj  LO::S_FG_GLASS_BLUE,  &X, &Y"},
  {"T":"BG_GLASS_GREEN", "W":16,  "H":16, "O": "LObjN LO::R_BG_GLASS_GREEN, &X, &Y, &W, &H"},
  {"T":"BG_GLASS_GRAY",  "W":16,  "H":16, "O": "LObjN LO::R_BG_GLASS_GRAY,  &X, &Y, &W, &H"},
  {"T":"BG_GLASS_RED",   "W":16,  "H":16, "O": "LObjN LO::R_BG_GLASS_RED,   &X, &Y, &W, &H"},
  {"T":"BG_GLASS_BLUE",  "W":16,  "H":16, "O": "LObjN LO::R_BG_GLASS_BLUE,  &X, &Y, &W, &H"},
  {"T":"FG_GLASS_RED",   "W":16,  "H":16, "O": "LObjN LO::R_FG_GLASS_RED,   &X, &Y, &W, &H"},
  {"T":"FG_GLASS_BLUE",  "W":16,  "H":16, "O": "LObjN LO::R_FG_GLASS_BLUE,  &X, &Y, &W, &H"},
  {"T":"CEILING_BARRIER","W":1,   "H":1,  "O": "LObj  LO::S_CEILING_BARRIER,&X, &Y"},
  {"T":"CEILING_BARRIER","W":16,  "H":16, "O": "LObjN LO::R_CEILING_BARRIER,&X, &Y, &W, &H"},
  {"T":"STORY_DIALOG_TRIGGER", "W": 1, "H":1, "O": "LObj  LO::S_STORY_TRIGGER,         &X, &Y"},
  {"T":"GLIDER_BLOCK",   "W":1,   "H":1,  "O": "LObj  LO::S_GLIDER_BLOCK,   &X, &Y"},
  {"T":"MINE_TRACK",                    "W":1,   "H":1,  "O": "LObj  LO::S_MTRACK,         &X, &Y"},
  {"T":"MINE_TRACK",                    "W":16,  "H":1,  "O": "LObjN LO::WIDE_3,           &X, &Y, &W, LN3::MINE_TRACKS"},
  {"T":"MINE_TRACK_BRAKES",             "W":16,  "H":1,  "O": "LObjN LO::WIDE_3,           &X, &Y, &W, LN3::MINE_TRACKS_BRAKES"},
  {"T":"MINE_TRACK_UP",                 "W":1,   "H":1,  "O": "LObj  LO::S_MTRACK_UP,       &X, &Y"},
  {"T":"MINE_TRACK_UP_LEFT",            "W":1,   "H":1,  "O": "LObj  LO::S_MTRACK_UPLEFT,   &X, &Y"},
  {"T":"MINE_TRACK_UP_RIGHT",           "W":1,   "H":1,  "O": "LObj  LO::S_MTRACK_UPRIGHT,  &X, &Y"},
  {"T":"MINE_TRACK_BUMP",               "W":1,   "H":1,  "O": "LObj  LO::S_MTRACK_BUMP,     &X, &Y"},
  {"T":"MINE_TRACK_SPECIAL",            "W":1,   "H":1,  "O": "LObj  LO::S_MTRACK_SPECIAL,  &X, &Y"},
  {"T":"MINE_TRACK_STOP",               "W":1,   "H":1,  "O": "LObj  LO::S_MTRACK_STOP,     &X, &Y"},
  {"T":"MINE_TRACK_SUPPORTS",           "W":1,   "H":1,  "O": "LObj  LO::S_MTRACK_SUPPORTS, &X, &Y"},
  {"T":"MINE_TRACK_STEEP_LEFT_BOT",     "W":1,   "H":1,  "O": "LObj  LO::S_MTRACK_SSL,      &X, &Y"},
  {"T":"MINE_TRACK_STEEP_RIGHT_BOT",    "W":1,   "H":1,  "O": "LObj  LO::S_MTRACK_SSR,      &X, &Y"},
  {"T":"MINE_TRACK_GRADUAL_LEFT_L",     "W":1,   "H":1,  "O": "LObj  LO::S_MTRACK_SGL,      &X, &Y"},
  {"T":"MINE_TRACK_GRADUAL_RIGHT_R",    "W":1,   "H":1,  "O": "LObj  LO::S_MTRACK_SGR,      &X, &Y"},
  {"T":"MINE_TRACK_SUPPORTS_ONLY",      "W":16,  "H":16, "O": "LObjN LO::R_MTRACK_SUPPORTSONLY,  &X, &Y, &W, &H"},
  {"T":"ENEMY_BARRIER",                 "W":16,  "H":16, "O": "LObjN LO::R_ENEMY_BARRIER      ,  &X, &Y, &W, &H"},
  {"T":"SNOWMAN_TOP",                   "W":1,   "H":1,  "O": "LObj  LO::S_SNOWMAN,         &X, &Y"},
  {"T":"FROZEN_CRACK",                  "W":1,   "H":1,  "O": "LObj  LO::S_FROZENCRACK,     &X, &Y"},
  {"T":"FROZEN_CRACK",                  "W":1,   "H":16, "O": "LObjN LO::TALL_3,            &X, &Y, &H, LN3::FROZEN_CRACK"},
  {"T":"FROZEN_CRACK",                  "W":16,  "H":1,  "O": "LObjN LO::WIDE_3,            &X, &Y, &W, LN3::FROZEN_CRACK"},
  {"T":"ICE2",                          "W":16,  "H":16, "O": "LObjN LO::R_ICE2,            &X, &Y, &W, &H"},
  {"T":"",               "W":1,   "H":1,  "O": "LObj  LO::S_CUSTOM,         &X, &Y, Metatiles::&T"},
  {"T":"",               "W":16,  "H":16, "O": "LObj  LO::R_CUSTOM,         &X, &Y, Metatiles::&T, (&W<<4)|&H"},
]

def Hex(n):
	return '$%x' % n

def FindRuleFor(Type, W, H):
	for i in range(len(RectRules)):
		r = RectRules[i]
		if (r["T"] == Type or r["T"] == "") and (r["W"] >= W and r["H"] >= H):
			return i
	return -1

# Return an array containing all rectangles in a layer, matching a given list of types
def FindType(Array, Types):
	return [x for x in Array if x.type in Types]

class Rect(object):
	def __init__(self, j, z=None):
		self.type = j['Id']
		self.x = j['X']
		self.y = j['Y']
		self.z = z
		if 'W' in j:
			self.w = j['W']
		else:
			self.w = 1
		if 'H' in j:
			self.h = j['H']
		else:
			self.h = 1
		self.xflip = 'XFlip' in j
		self.yflip = 'YFlip' in j
		self.extra = ''
		if 'Extra' in j:
			self.extra = j['Extra']

	def __repr__(self):
		return '%s %d,%d %dx%d' % (self.type, self.x, self.y, self.w, self.h)

	def overlaps(self, other):
		if self.x > (other.x+other.w-1):
			return False
		if (self.x+self.w-1) < other.x:
			return False
		if self.y > (other.y+other.h-1):
			return False
		if (self.y+self.h-1) < other.y:
			return False
		return True

def ExportLevel(filename):
	print("Converting %s" % filename)
	level_file = open(filename+'.json')
	level_text = level_file.read()
	level_file.close()
	level_json = json.loads(level_text)

	FG = []
	for z in range(len(level_json["Layers"][0]["Data"])):
		FG.append(Rect(level_json["Layers"][0]["Data"][z], z))
	SP = [Rect(x) for x in level_json["Layers"][1]["Data"]]
	CT = [Rect(x) for x in level_json["Layers"][2]["Data"]]

	Header = level_json['Header']
	Config = None
	if 'Config' in level_json:
		Config = level_json['Config']

	if len(SP) > 84:
		print("Too many sprites! You have "+(len(SP)-84)+" too many.")
		return False

	Width = level_json['Meta']['Width']
	Height = level_json['Meta']['Height']

	# Find boundaries
	# a b c d e f g h i j k l m n o L
	# 0|1|2|3|4|5|6|7|8|9|A|B|C|D|E|F
	Boundaries = 0;
	def SetBoundaryAt(Screen):
		if Screen < 1 or Screen > 16:
			return
		Bit = 1 << (16-Screen)
		return Boundaries | Bit

	HScreens = Width//16
	VScreens = Height//15
	UseLinks = VScreens > 1

	ManualScreenLinks = FindType(CT, ["SCREEN_LINK"]);
	ManualScreenList = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
	UseManualScreenLinks = len(ManualScreenLinks) > 0;

	for R in ManualScreenLinks:
		Args = R.extra.split(',')
		Top = Args[1]
		Bottom = Args[2]
		ThisScreen = R.x // 16
		TopScreen = 0
		BottomScreen = 0

		# Search for links
		for R2 in ManualScreenLinks:
			Name = R2.extra.split(',')[0]
			if Name == Top:
				TopScreen = ((R2.x//16) - ThisScreen) & 15
			if Name == Bottom:
				BottomScreen = ((R2.x//16) - ThisScreen) & 15
		ManualScreenList[ThisScreen] = (TopScreen<<4) | BottomScreen

	# Find all scroll locks
	for R in CT:
		if R.type == "SCROLL_LOCK":
			Screen = (R.x//16) + (R.y//15)*HScreens
			if (R.x&15) == 15:
				Boundaries = SetBoundaryAt(Screen+1)
			else:
				Boundaries = SetBoundaryAt(Screen)

	# Rearrange level into a big horizontal strip
	# To do: allow the user to skip certain screens
	if VScreens > 1:
		for List in [FG, SP, CT]:
			for R in List:
				V = R.y // 15
				R.x += V*Width
				R.y %= 15

	# Find player start position
	StartX = 0
	StartY = 0
	FacingLeft = 0
	PlayerPos = FindType(CT, ["PLAYER_START_L", "PLAYER_START_R"])
	if len(PlayerPos):
		StartX = PlayerPos[0].x
		StartY = PlayerPos[0].y
		if PlayerPos[0].type == "PLAYER_START_L":
			FacingLeft = 64

	# Merge FG control types into FG
	FG.extend(FindType(CT, FGControlTypes))

	# Sort by X position first
	FG = sorted(FG, key=lambda r: r.x)
	SP = sorted(SP, key=lambda r: r.x)
	CT = sorted(CT, key=lambda r: r.x)

	# Open the output file
	outfile = open(filename + ".s", "w")
	outfile.write(filename+":\n")

	# write music, start X, screens and Y position
	# .d.mmmmm
	#  | +++++- music
	#  +------- if 1, player starts facing left
	outfile.write("  .byt MusicTracks::"+Header['Music']+"|"+str(FacingLeft)+"\n");
	outfile.write("  .byt "+str(StartX)+"\n");
	outfile.write("  .byt "+Hex((((Width//16)-1)<<4) | (StartY-1))+"\n");

	# write sprite graphics slots
	for i in range(4):
		outfile.write("  .byt GraphicsUpload::"+Header['SpriteGFX'][i]+"\n");

	# write pointers to the foreground and sprite data
	outfile.write("  .addr "+filename+"Data\n");
	outfile.write("  .addr "+filename+"Sprite\n");
 
	# write background
	outfile.write("  .byt "+Hex(Header['BGColor'])+" ; background\n");

	# write graphics upload list
	for i in Header['GFXUpload']:
		outfile.write("  .byt GraphicsUpload::"+i+"\n");
	outfile.write("  .byt 255 ;end\n")

	# write boundaries
	if UseLinks or UseManualScreenLinks:
		Boundaries |= 1
	outfile.write("  .byt $%.2x, $%.2x ; boundaries\n" % (Boundaries>>8, Boundaries&255));

	# write links if used
	if UseManualScreenLinks:
		# to do, allow runs of the same link
		for i in range(16):
			outfile.write(format("  .byt $%.2x, $%.2x ; link\n" % (0, ManualScreenList[i])))
	elif UseLinks:
		for i in range(VScreens):
			Up = ((-HScreens)&15)<<4
			Down = HScreens
			if i == 0:
				Up = 0
			if i == VScreens-1:
				Down = 0
			outfile.write("  .byt $%.2x, $%.2x ; link\n" % ((HScreens-1)&15, Up|Down))
		if HScreens*VScreens != 16: # Fill out any unused screens
			outfile.write("  .byt $%.2x, $00\n" % (16-(HScreens*VScreens)-1)&15)

	# do the data section
	outfile.write('\n%sData:\n' % filename)

	# write any config stuff if present
	if Config:
		if "StartDialog" in Config:
			outfile.write("  .byt LSpecialCmd, LevelSpecialConfig::SET_START_DIALOG, <"+Config['StartDialog']+", >"+Config['StartDialog']+"\n")
		if "PuzzleMode" in Config:
			outfile.write("  .byt LSpecialCmd, LevelSpecialConfig::PUZZLE_MODE, "+Config['PuzzleMode']+", $00\n")

	# Rearrange foreground layer
	for i in range(len(FG)):
		r1 = FG[i]
		for j in range(i):
			r2 = FG[j]
			if r1.z and r2.z and r1.overlaps(r2) and r1.z < r2.z:
				FG[i], FG[j] = FG[j], FG[i]

	# Write all level FG commands
	LastX = 0
	for R in FG:
		Rule = FindRuleFor(R.type, R.w, R.h)
		if Rule == -1:
			print("No rule found for %s of size %i, %i" % (R[RTYPE], R[RW], R[RH]))

		# Adjust the X position
		XDifference = R.x - LastX;
		if XDifference == 16:
			outfile.write('  LXPlus16\n')
			XDifference = 0
		elif XDifference < 32 and XDifference >= 16:
			outfile.write('  LXPlus16\n')
			XDifference -= 16
		elif XDifference == -16:
			outfile.write('  LXMinus16\n')
			XDifference = 0
		elif XDifference >= 16 or XDifference < 0:
			outfile.write('  LSetX %d\n' % R.x)
			XDifference = 0
		LastX = R.x

		# Control layer types that got merged into the FG layer get written too
		if R.type in FGControlTypes:
			outfile.write('  LSetX %d\n' % R.x)
			XDifference = 0
			if R.type == "BLOCK_CONTENTS" or R.type == "COLUMN_DATA":
				outfile.write("  LWriteCol  %s\n" % R.extra)
			elif R.type == "COLUMN_POINTER":
				outfile.write("  LWriteCol  <%s, >%s\n" % (R.extra, R.extra))
		else:
			out_string = RectRules[Rule]['O']
			out_string = out_string.replace('&X', str(XDifference))
			out_string = out_string.replace('&Y', str(R.y))
			out_string = out_string.replace('&W', str(R.w-1))
			out_string = out_string.replace('&H', str(R.h-1))
			out_string = out_string.replace('&T', R.type)
			outfile.write("  "+out_string+"\n")

		# Add extra data
		if R.extra:
			Dashes = R.extra.split('-')
			Commas = R.extra.split(',')
			if R.type == "MINE_TRACK_BRAKES":
				outfile.write("  LWriteCol "+R.extra+"\n");
			elif R.type == "CLONER":
				outfile.write("  LWriteCol Enemy::"+R.extra+"\n");
			elif R.type == "CLONE_SWITCH":
				for R2 in CT:
					if R2.type == "TELEPORT_DESTINATION":
						if R2.extra == R.extra:
							outfile.write("  LWriteCol %d\n" % R2.x)
			elif R.type in PrizeContainingTypes:
				outfile.write("  LWriteCol InventoryItem::%s\n" % R.extra)
			elif R.type in ColDataPointerTypes:
				outfile.write("  LWriteCol <%s, >%s\n" % (R.extra, R.extra))

			elif R.type in ["TELEPORT", "DOOR", "TELEPORTER"]:
				if len(Dashes) == 2: # A-B, two paired doors
					Found = False
					for R2 in FG:
						IsTeleporter = R2.type == "TELEPORTER"
						if R2.type == "DOOR" or IsTeleporter:
							Dashes2 = R2.extra.split('-')
							if len(Dashes2) == 2 and Dashes2[0] == Dashes[1]:
								outfile.write("  LWriteCol "+str(R2.y-int(IsTeleporter))+", "+str(R2.x)+"\n")
								Found = True
					if not Found:
						for R2 in CT:
							if R2.type == "TELEPORT_DESTINATION":
								if R2.extra == Dashes[1]:
									outfile.write("  LWriteCol %d, %d\n" % (R2.y, R2.x))
									Found = True
					if not Found:
						print("Destination door %s not found" % Dashes[1])
				elif len(Commas) == 2: # X, Y
					outfile.write("  LWriteCol %s,%s\n" % (Commas[0], Commas[1]))
				elif len(Commas) == 3: # X, Y, Level
					outfile.write("  LWriteCol $10|"+Commas[0]+", "+Commas[1]+", LevelId::"+Commas[2]+"\n")
				elif R.extra[0] == "*": # script
					outfile.write("  LWriteCol $20, <"+R.extra[1:]+", >"+R.extra[1:]+"\n")
				elif len(Commas) == 1 and len(Dashes) == 1:
					outfile.write("  LWriteCol $21, LevelId::"+R.extra+"\n")
				else:
					print("Bad door data: "+R.extra)

	# Write background changes
	BGChanges = FindType(CT, ["BACKGROUND"])
	for i in range(len(BGChanges)):
		NextX = HScreens*VScreens
		ThisX = BGChanges[i].x//16
		if i != len(BGChanges)-1:
			NextX = BGChanges[i+1].x // 16
		if BGChanges[i].extra:
			outfile.write("  .byt LSpecialCmd, LevelSpecialConfig::MAKE_BACKGROUNDS, $%.2x, LevelBackgroundId::%s\n" % ((ThisX<<4)|(NextX-ThisX-1), BGChanges[i].extra))
	for R in FindType(CT, ["LEVEL_EFFECT"]):
		outfile.write("  .byt LSpecialCmd, LevelSpecialConfig::%s\n" % R.extra)
	outfile.write("  LFinished\n\n")

	# Write the list of sprites
	outfile.write("%sSprite:\n" % filename)

	for sprite in SP:
		if sprite.extra:
			outfile.write("  LSpr Enemy::%-20s %i, %3i, %3i, %s\n" % (sprite.type+",", int(sprite.xflip), sprite.x, sprite.y, sprite.extra))
		else:
			outfile.write("  LSpr Enemy::%-20s %i, %3i, %3i\n" % (sprite.type+",", int(sprite.xflip), sprite.x, sprite.y))
	outfile.write("  .byt 255 ; end\n")
	outfile.close()
	return True

if len(sys.argv) != 2:
	print("Do one of the following:")
	print("NtS1LevelConvert.py level.json")
	print("NtS1LevelConvert.py directory")
else:
	if os.path.isdir(sys.argv[1]):
		for f in glob.glob(sys.argv[1]+"/*.json"):
			basename = os.path.splitext(f)[0]
			need = False
			if not os.path.exists(basename+".s"):
				need = True
			else:
				src = os.path.getmtime(basename+".json")
				dst = os.path.getmtime(basename+".s")
				if src > dst:
					need = True
#				else:
#					print("Skipping "+basename)
			if need:
				ExportLevel(basename)
	elif os.path.isfile(sys.argv[1]):
		basename = os.path.splitext(sys.argv[1])[0]
		ExportLevel(basename)
	else:
		print("'%s' not a file or directory" % sys.argv[1])
