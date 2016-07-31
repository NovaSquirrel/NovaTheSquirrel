.enum Enemy
  NONE
  GOOMBA
  SNEAKER
  SPINNER
  OWL
  KING
  TOASTBOT
  BALL
  POTION
  GEORGE
  BIG_GEORGE
  ALAN
  GLIDER
  ICE_1
  ICE_2
  BALL_GUY
  THWOMP
  CANNON_1
  CANNON_2
  BURGER
  FIRE_WALK
  FIRE_JUMP
  MINE
  ROCKET
  ROCKET_LAUNCHER
  FIREWORK_SHOOTER
  TORNADO
  ELECTRIC_FAN
  CLOUD
  BOUNCER
  GREMLIN
  BOMB_GUY
  POOF
  PLAYER_PROJECTILE
  BLASTER_SHOT
  SMALL_GLIDER
  BOOMERANG
  FIREBALL
  FLAMES
  WATER_BOTTLE
  ICE_BLOCK
  RONALD
  RONALD_BURGER
  FRIES
  FRY
  SUN
  SUNKEY
  MOVING_PLATFORM_HORIZ
  MOVING_PLATFORM_LINE
  FIREBAR
  BOSS_FIGHT
.endenum

.proc ObjGraphics
  .byt 0 ;NONE
  .byt GraphicsUpload::SP_WALKER ;GOOMBA
  .byt GraphicsUpload::SP_WALKER ;SNEAKER
  .byt GraphicsUpload::SP_WALKER ;SPINNER
  .byt GraphicsUpload::SP_WALKER ;OWL
  .byt GraphicsUpload::SP_KING ;KING
  .byt GraphicsUpload::SP_KING ;TOASTBOT
  .byt GraphicsUpload::SP_CANNON ;BALL
  .byt GraphicsUpload::SP_KING ;POTION
  .byt GraphicsUpload::SP_KING ;GEORGE
  .byt GraphicsUpload::SP_GEORGE ;BIG_GEORGE
  .byt GraphicsUpload::SP_GEORGE ;ALAN
  .byt 0 ;GLIDER
  .byt 0 ;ICE_1
  .byt 0 ;ICE_2
  .byt GraphicsUpload::SP_CANNON ;BALL_GUY
  .byt GraphicsUpload::SP_CANNON ;THWOMP
  .byt GraphicsUpload::SP_CANNON ;CANNON_1
  .byt GraphicsUpload::SP_CANNON ;CANNON_2
  .byt GraphicsUpload::SP_CANNON ;BURGER
  .byt GraphicsUpload::SP_FIRE ;FIRE_WALK
  .byt GraphicsUpload::SP_FIRE ;FIRE_JUMP
  .byt GraphicsUpload::SP_CANNON ;MINE
  .byt GraphicsUpload::SP_EXPLODE ;ROCKET
  .byt GraphicsUpload::SP_EXPLODE ;ROCKET_LAUNCHER
  .byt GraphicsUpload::SP_EXPLODE ;FIREWORK_SHOOTER
  .byt 0 ;TORNADO
  .byt 0 ;ELECTRIC_FAN
  .byt 0 ;CLOUD
  .byt 0 ;BOUNCER
  .byt 0 ;GREMLIN
  .byt GraphicsUpload::SP_EXPLODE ;BOMB_GUY
  .byt 0 ;POOF
  .byt 0 ;PLAYER_PROJECTILE
  .byt 0 ;BLASTER_SHOT
  .byt 0 ;SMALL_GLIDER
  .byt 0 ;BOOMERANG
  .byt GraphicsUpload::SP_FIRE ;FIREBALL
  .byt GraphicsUpload::SP_FIRE ;FLAMES
  .byt GraphicsUpload::SP_KING ;WATER_BOTTLE
  .byt 0 ;ICE_BLOCK
  .byt GraphicsUpload::SP_RONALD ;RONALD
  .byt GraphicsUpload::SP_RONALD ;RONALD_BURGER
  .byt GraphicsUpload::SP_RONALD ;FRIES
  .byt GraphicsUpload::SP_RONALD ;FRY
  .byt GraphicsUpload::SP_SUN ;SUN
  .byt GraphicsUpload::SP_SUN ;SUNKEY
  .byt 0 ;MOVING_PLATFORM_HORIZ
  .byt 0 ;MOVING_PLATFORM_LINE
  .byt GraphicsUpload::SP_FIRE ;FIREBAR
  .byt 0 ;BOSS_FIGHT
.endproc

.proc ObjBehaviors
  .byt 0 ;NONE
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET | ObjBehavior::WAIT_UNTIL_NEAR ;GOOMBA
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;SNEAKER
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET | ObjBehavior::WAIT_UNTIL_NEAR ;SPINNER
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;OWL
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::AUTO_RESET | ObjBehavior::GET_SHOT ;KING
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT ;TOASTBOT
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;BALL
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;POTION
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;GEORGE
  .byt ObjBehavior::AUTO_REMOVE ;BIG_GEORGE
  .byt ObjBehavior::AUTO_REMOVE ;ALAN
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;GLIDER
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;ICE_1
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;ICE_2
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;BALL_GUY
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;THWOMP
  .byt ObjBehavior::AUTO_REMOVE ;CANNON_1
  .byt ObjBehavior::AUTO_REMOVE ;CANNON_2
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT ;BURGER
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;FIRE_WALK
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;FIRE_JUMP
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;MINE
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;ROCKET
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;ROCKET_LAUNCHER
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;FIREWORK_SHOOTER
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;TORNADO
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;ELECTRIC_FAN
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;CLOUD
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;BOUNCER
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;GREMLIN
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;BOMB_GUY
  .byt 0 ;POOF
  .byt 0 ;PLAYER_PROJECTILE
  .byt 0 ;BLASTER_SHOT
  .byt 0 ;SMALL_GLIDER
  .byt 0 ;BOOMERANG
  .byt 0 ;FIREBALL
  .byt 0 ;FLAMES
  .byt 0 ;WATER_BOTTLE
  .byt 0 ;ICE_BLOCK
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET | ObjBehavior::WAIT_UNTIL_NEAR ;RONALD
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::AUTO_RESET | ObjBehavior::WAIT_UNTIL_NEAR ;RONALD_BURGER
  .byt ObjBehavior::AUTO_REMOVE ;FRIES
  .byt ObjBehavior::AUTO_REMOVE ;FRY
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET | ObjBehavior::WAIT_UNTIL_NEAR ;SUN
  .byt 0 ;SUNKEY
  .byt 0 ;MOVING_PLATFORM_HORIZ
  .byt 0 ;MOVING_PLATFORM_LINE
  .byt ObjBehavior::AUTO_REMOVE ;FIREBAR
  .byt 0 ;BOSS_FIGHT
.endproc

.proc ObjFlags
  .byt ObjFlag::SECONDARY ;NONE
  .byt ObjFlag::PRIMARY ;GOOMBA
  .byt ObjFlag::PRIMARY ;SNEAKER
  .byt ObjFlag::PRIMARY ;SPINNER
  .byt ObjFlag::PRIMARY ;OWL
  .byt ObjFlag::PRIMARY ;KING
  .byt ObjFlag::PRIMARY ;TOASTBOT
  .byt ObjFlag::PRIMARY ;BALL
  .byt ObjFlag::PRIMARY ;POTION
  .byt ObjFlag::PRIMARY ;GEORGE
  .byt ObjFlag::ESSENTIAL ;BIG_GEORGE
  .byt ObjFlag::PRIMARY ;ALAN
  .byt ObjFlag::PRIMARY ;GLIDER
  .byt ObjFlag::PRIMARY ;ICE_1
  .byt ObjFlag::PRIMARY ;ICE_2
  .byt ObjFlag::PRIMARY ;BALL_GUY
  .byt ObjFlag::PRIMARY ;THWOMP
  .byt ObjFlag::PRIMARY ;CANNON_1
  .byt ObjFlag::PRIMARY ;CANNON_2
  .byt ObjFlag::PRIMARY ;BURGER
  .byt ObjFlag::PRIMARY ;FIRE_WALK
  .byt ObjFlag::PRIMARY ;FIRE_JUMP
  .byt ObjFlag::PRIMARY ;MINE
  .byt ObjFlag::PRIMARY ;ROCKET
  .byt ObjFlag::PRIMARY ;ROCKET_LAUNCHER
  .byt ObjFlag::PRIMARY ;FIREWORK_SHOOTER
  .byt ObjFlag::PRIMARY ;TORNADO
  .byt ObjFlag::PRIMARY ;ELECTRIC_FAN
  .byt ObjFlag::PRIMARY ;CLOUD
  .byt ObjFlag::PRIMARY ;BOUNCER
  .byt ObjFlag::PRIMARY ;GREMLIN
  .byt ObjFlag::PRIMARY ;BOMB_GUY
  .byt ObjFlag::SECONDARY ;POOF
  .byt ObjFlag::ESSENTIAL ;PLAYER_PROJECTILE
  .byt ObjFlag::SECONDARY ;BLASTER_SHOT
  .byt ObjFlag::SECONDARY ;SMALL_GLIDER
  .byt ObjFlag::SECONDARY ;BOOMERANG
  .byt ObjFlag::SECONDARY ;FIREBALL
  .byt ObjFlag::SECONDARY ;FLAMES
  .byt ObjFlag::SECONDARY ;WATER_BOTTLE
  .byt ObjFlag::SECONDARY ;ICE_BLOCK
  .byt ObjFlag::PRIMARY ;RONALD
  .byt ObjFlag::PRIMARY ;RONALD_BURGER
  .byt ObjFlag::SECONDARY ;FRIES
  .byt ObjFlag::SECONDARY ;FRY
  .byt ObjFlag::ESSENTIAL ;SUN
  .byt ObjFlag::ESSENTIAL ;SUNKEY
  .byt ObjFlag::ESSENTIAL ;MOVING_PLATFORM_HORIZ
  .byt ObjFlag::ESSENTIAL ;MOVING_PLATFORM_LINE
  .byt ObjFlag::PRIMARY ;FIREBAR
  .byt ObjFlag::ESSENTIAL ;BOSS_FIGHT
.endproc

