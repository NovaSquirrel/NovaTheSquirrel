.enum InventoryItem
  NOTHING
  HEALTH_RESTORE
  RED_KEY
  GREEN_KEY
  BLUE_KEY
  FLIPPERS
  FIRE_BOOTS
  ICE_SKATES
  SUCTION_BOOTS
  BLOCK
  SPRING
  NUCLEAR_PANTS
  ALWAYS_JUMPING
  ABILITY_BLASTER
  ABILITY_GLIDER
  ABILITY_BOMB
  ABILITY_FIRE
  ABILITY_FIREWORK
  ABILITY_NICE
  ABILITY_BOOMERANG
  ABILITY_BALL
  ABILITY_WATER
  ABILITY_FAN
  ABILITY_BURGER
  LAMP_OIL
  ROPE
  BALLOON
  SMALL_HEALTH_RESTORE
  BIG_HEALTH_RESTORE
.endenum

.proc InventoryIIcon
  .byt InventoryIcon::NOTHING ;NOTHING
  .byt InventoryIcon::HEART ;HEALTH_RESTORE
  .byt InventoryIcon::KEY ;RED_KEY
  .byt InventoryIcon::KEY ;GREEN_KEY
  .byt InventoryIcon::KEY ;BLUE_KEY
  .byt InventoryIcon::SHIELD ;FLIPPERS
  .byt InventoryIcon::SHIELD ;FIRE_BOOTS
  .byt InventoryIcon::SHIELD ;ICE_SKATES
  .byt InventoryIcon::SHIELD ;SUCTION_BOOTS
  .byt InventoryIcon::PLACEABLE ;BLOCK
  .byt InventoryIcon::PLACEABLE ;SPRING
  .byt InventoryIcon::PANTS ;NUCLEAR_PANTS
  .byt InventoryIcon::EFFECT ;ALWAYS_JUMPING
  .byt InventoryIcon::ABILITY ;ABILITY_BLASTER
  .byt InventoryIcon::ABILITY ;ABILITY_GLIDER
  .byt InventoryIcon::ABILITY ;ABILITY_BOMB
  .byt InventoryIcon::ABILITY ;ABILITY_FIRE
  .byt InventoryIcon::ABILITY ;ABILITY_FIREWORK
  .byt InventoryIcon::ABILITY ;ABILITY_NICE
  .byt InventoryIcon::ABILITY ;ABILITY_BOOMERANG
  .byt InventoryIcon::ABILITY ;ABILITY_BALL
  .byt InventoryIcon::ABILITY ;ABILITY_WATER
  .byt InventoryIcon::ABILITY ;ABILITY_FAN
  .byt InventoryIcon::ABILITY ;ABILITY_BURGER
  .byt InventoryIcon::BULLET ;LAMP_OIL
  .byt InventoryIcon::PLACEABLE ;ROPE
  .byt InventoryIcon::BULLET ;BALLOON
  .byt InventoryIcon::HEART ;SMALL_HEALTH_RESTORE
  .byt InventoryIcon::HEART ;BIG_HEALTH_RESTORE
.endproc

.proc InventoryINameL
  .byt <NameEmpty ;NOTHING
  .byt <NameHealth ;HEALTH_RESTORE
  .byt <NameRedKey ;RED_KEY
  .byt <NameGreenKey ;GREEN_KEY
  .byt <NameBlueKey ;BLUE_KEY
  .byt <NameFlippers ;FLIPPERS
  .byt <NameFireBoots ;FIRE_BOOTS
  .byt <NameIceSkates ;ICE_SKATES
  .byt <NameSuctionBoots ;SUCTION_BOOTS
  .byt <NameBlock ;BLOCK
  .byt <NameSpring ;SPRING
  .byt <NameNuclearPowerPants ;NUCLEAR_PANTS
  .byt <NameAlwaysJumping ;ALWAYS_JUMPING
  .byt <NameBlaster ;ABILITY_BLASTER
  .byt <NameGlider ;ABILITY_GLIDER
  .byt <NameBomb ;ABILITY_BOMB
  .byt <NameFire ;ABILITY_FIRE
  .byt <NameFirework ;ABILITY_FIREWORK
  .byt <NameNice ;ABILITY_NICE
  .byt <NameBoomerang ;ABILITY_BOOMERANG
  .byt <NameBall ;ABILITY_BALL
  .byt <NameWater ;ABILITY_WATER
  .byt <NameFan ;ABILITY_FAN
  .byt <NameBurger ;ABILITY_BURGER
  .byt <NameLampOil ;LAMP_OIL
  .byt <NameRope ;ROPE
  .byt <NameBalloon ;BALLOON
  .byt <NameHealthSmall ;SMALL_HEALTH_RESTORE
  .byt <NameHealthBig ;BIG_HEALTH_RESTORE
.endproc

.proc InventoryINameH
  .byt >NameEmpty ;NOTHING
  .byt >NameHealth ;HEALTH_RESTORE
  .byt >NameRedKey ;RED_KEY
  .byt >NameGreenKey ;GREEN_KEY
  .byt >NameBlueKey ;BLUE_KEY
  .byt >NameFlippers ;FLIPPERS
  .byt >NameFireBoots ;FIRE_BOOTS
  .byt >NameIceSkates ;ICE_SKATES
  .byt >NameSuctionBoots ;SUCTION_BOOTS
  .byt >NameBlock ;BLOCK
  .byt >NameSpring ;SPRING
  .byt >NameNuclearPowerPants ;NUCLEAR_PANTS
  .byt >NameAlwaysJumping ;ALWAYS_JUMPING
  .byt >NameBlaster ;ABILITY_BLASTER
  .byt >NameGlider ;ABILITY_GLIDER
  .byt >NameBomb ;ABILITY_BOMB
  .byt >NameFire ;ABILITY_FIRE
  .byt >NameFirework ;ABILITY_FIREWORK
  .byt >NameNice ;ABILITY_NICE
  .byt >NameBoomerang ;ABILITY_BOOMERANG
  .byt >NameBall ;ABILITY_BALL
  .byt >NameWater ;ABILITY_WATER
  .byt >NameFan ;ABILITY_FAN
  .byt >NameBurger ;ABILITY_BURGER
  .byt >NameLampOil ;LAMP_OIL
  .byt >NameRope ;ROPE
  .byt >NameBalloon ;BALLOON
  .byt >NameHealthSmall ;SMALL_HEALTH_RESTORE
  .byt >NameHealthBig ;BIG_HEALTH_RESTORE
.endproc

.proc InventoryICodeL
  .byt <(DoNothing-1) ;NOTHING
  .byt <(DoHealthRestore-1) ;HEALTH_RESTORE
  .byt <(DoNothing-1) ;RED_KEY
  .byt <(DoNothing-1) ;GREEN_KEY
  .byt <(DoNothing-1) ;BLUE_KEY
  .byt <(DoNothing-1) ;FLIPPERS
  .byt <(DoNothing-1) ;FIRE_BOOTS
  .byt <(DoNothing-1) ;ICE_SKATES
  .byt <(DoNothing-1) ;SUCTION_BOOTS
  .byt <(DoPlaceBlock-1) ;BLOCK
  .byt <(DoPlaceSpring-1) ;SPRING
  .byt <(DoNothing-1) ;NUCLEAR_PANTS
  .byt <(DoNothing-1) ;ALWAYS_JUMPING
  .byt <(DoSwitchAbility-1) ;ABILITY_BLASTER
  .byt <(DoSwitchAbility-1) ;ABILITY_GLIDER
  .byt <(DoSwitchAbility-1) ;ABILITY_BOMB
  .byt <(DoSwitchAbility-1) ;ABILITY_FIRE
  .byt <(DoSwitchAbility-1) ;ABILITY_FIREWORK
  .byt <(DoSwitchAbility-1) ;ABILITY_NICE
  .byt <(DoSwitchAbility-1) ;ABILITY_BOOMERANG
  .byt <(DoSwitchAbility-1) ;ABILITY_BALL
  .byt <(DoSwitchAbility-1) ;ABILITY_WATER
  .byt <(DoSwitchAbility-1) ;ABILITY_FAN
  .byt <(DoSwitchAbility-1) ;ABILITY_BURGER
  .byt <(DoNothing-1) ;LAMP_OIL
  .byt <(DoPlaceRope-1) ;ROPE
  .byt <(DoNothing-1) ;BALLOON
  .byt <(DoHealthRestoreSmall-1) ;SMALL_HEALTH_RESTORE
  .byt <(DoHealthRestoreBig-1) ;BIG_HEALTH_RESTORE
.endproc

.proc InventoryICodeH
  .byt >(DoNothing-1) ;NOTHING
  .byt >(DoHealthRestore-1) ;HEALTH_RESTORE
  .byt >(DoNothing-1) ;RED_KEY
  .byt >(DoNothing-1) ;GREEN_KEY
  .byt >(DoNothing-1) ;BLUE_KEY
  .byt >(DoNothing-1) ;FLIPPERS
  .byt >(DoNothing-1) ;FIRE_BOOTS
  .byt >(DoNothing-1) ;ICE_SKATES
  .byt >(DoNothing-1) ;SUCTION_BOOTS
  .byt >(DoPlaceBlock-1) ;BLOCK
  .byt >(DoPlaceSpring-1) ;SPRING
  .byt >(DoNothing-1) ;NUCLEAR_PANTS
  .byt >(DoNothing-1) ;ALWAYS_JUMPING
  .byt >(DoSwitchAbility-1) ;ABILITY_BLASTER
  .byt >(DoSwitchAbility-1) ;ABILITY_GLIDER
  .byt >(DoSwitchAbility-1) ;ABILITY_BOMB
  .byt >(DoSwitchAbility-1) ;ABILITY_FIRE
  .byt >(DoSwitchAbility-1) ;ABILITY_FIREWORK
  .byt >(DoSwitchAbility-1) ;ABILITY_NICE
  .byt >(DoSwitchAbility-1) ;ABILITY_BOOMERANG
  .byt >(DoSwitchAbility-1) ;ABILITY_BALL
  .byt >(DoSwitchAbility-1) ;ABILITY_WATER
  .byt >(DoSwitchAbility-1) ;ABILITY_FAN
  .byt >(DoSwitchAbility-1) ;ABILITY_BURGER
  .byt >(DoNothing-1) ;LAMP_OIL
  .byt >(DoPlaceRope-1) ;ROPE
  .byt >(DoNothing-1) ;BALLOON
  .byt >(DoHealthRestoreSmall-1) ;SMALL_HEALTH_RESTORE
  .byt >(DoHealthRestoreBig-1) ;BIG_HEALTH_RESTORE
.endproc

