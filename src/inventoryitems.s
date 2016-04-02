.include "../tools/inventorylist.s"

NameHealth: .byt "Health restore"
NameEmpty: .byt 0
NameLampOil: .byt "Lamp oil",0
NameRope: .byt "Rope",0
NameBlaster: .byt "Blaster Gun",0
NameGlider: .byt "Glider Gun",0
NameBomb: .byt "Bombs",0
NameFire: .byt "Fireballs",0
NameFirework: .byt "Fireworks",0
NameNice: .byt "Ice blocks",0
NameBoomerang: .byt "Boomerang",0
NameBall: .byt "Bouncy ball",0
NameWater: .byt "Water bottle",0
NameFan: .byt "Tornadoes",0
NameBurger: .byt "Dinner Blaster",0
NameFancyCola: .byt "Fa-a-ancy cola",0
NameRedKey: .byt "Red key",0
NameGreenKey: .byt "Green key",0
NameBlueKey: .byt "Blue key",0
NameFlippers: .byt "Flippers",0
NameFireBoots: .byt "Fire boots",0
NameIceSkates: .byt "Iceskates",0
NameSuctionBoots: .byt "Suction boots",0
NameBlock: .byt "Block",0
NameSpring: .byt "Spring",0
NameNuclearPowerPants: .byt "Nuclear Power Pants",0
NameAlwaysJumping: .byt "Always jumping",0

.proc DoHealthRestore
  lda #4
  sta PlayerHealth
  rts
.endproc
.proc DoPlaceBlock
  rts
.endproc
.proc DoPlaceSpring
  rts
.endproc
.proc DoPlaceRope
  rts
.endproc
.proc DoSwitchAbility
  sub #InventoryItem::ABILITY_BLASTER-1
  jmp ChangePlayerAbility
.endproc
