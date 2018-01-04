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
  .byt GraphicsUpload::SP_MINES ;ICE_1
  .byt GraphicsUpload::SP_MINES ;ICE_2
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
  .byt GraphicsUpload::SP_WIND ;TORNADO
  .byt GraphicsUpload::SP_WIND ;ELECTRIC_FAN
  .byt GraphicsUpload::SP_WIND ;CLOUD
  .byt 0 ;BOUNCER
  .byt 0 ;GREMLIN
  .byt GraphicsUpload::SP_EXPLODE ;BOMB_GUY
  .byt 0 ;POOF
  .byt 0 ;PLAYER_PROJECTILE
  .byt GraphicsUpload::SP_SCHEME_TEAM ;BLASTER_SHOT
  .byt 0 ;SMALL_GLIDER
  .byt GraphicsUpload::SP_BOOMERANG ;BOOMERANG
  .byt GraphicsUpload::SP_FIRE ;FIREBALL
  .byt GraphicsUpload::SP_FIRE ;FLAMES
  .byt GraphicsUpload::SP_KING ;WATER_BOTTLE
  .byt 0 ;ICE_BLOCK
  .byt GraphicsUpload::SP_RONALD ;RONALD
  .byt GraphicsUpload::SP_RONALD ;RONALD_BURGER
  .byt GraphicsUpload::SP_RONALD ;FRIES
  .byt GraphicsUpload::SP_RONALD ;FRY
  .byt GraphicsUpload::SP_SUN ;SUN
  .byt GraphicsUpload::SP_SUN ;SUN_KEY
  .byt 0 ;MOVING_PLATFORM_HORIZ
  .byt 0 ;MOVING_PLATFORM_LINE
  .byt GraphicsUpload::SP_FIRE ;FIREBAR
  .byt 0 ;BOSS_FIGHT
  .byt GraphicsUpload::SP_SCHEME_TEAM ;SCHEME_TEAM
  .byt GraphicsUpload::SP_HANNAH ;FLYING_ARROW
  .byt GraphicsUpload::SP_HANNAH ;FALLING_BOMB
  .byt GraphicsUpload::SP_HANNAH ;BOULDER
  .byt 0 ;CHECKPOINT
  .byt GraphicsUpload::SP_LIFE ;BIG_GLIDER
  .byt GraphicsUpload::SP_LIFE ;BIG_LWSS
  .byt 0 ;EXPLOSION
  .byt GraphicsUpload::SP_MINES ;MINECART
  .byt GraphicsUpload::SP_BOOMERANG ;BOOMERANG_GUY
  .byt GraphicsUpload::SP_BOOMERANG ;GRABBY_HAND
  .byt GraphicsUpload::SP_MINES ;FALLING_SPIKE
  .byt GraphicsUpload::SP_WIND ;CLOUD_SWORD
  .byt GraphicsUpload::SP_EXPLODE ;FIREWORK_SHOT
  .byt 0 ;COLLECTIBLE
  .byt GraphicsUpload::SP_MOLSNO ;MOLSNO
  .byt GraphicsUpload::SP_MOLSNO ;MOLSNO_NOTE
  .byt GraphicsUpload::SP_BOOMERANG ;BUDDY
  .byt 0 ;BEAM_EMITTER
  .byt 0 ;LASER_BEAM
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
  .byt ObjBehavior::AUTO_REMOVE ;ROCKET_LAUNCHER
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT ;FIREWORK_SHOOTER
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::AUTO_RESET ;TORNADO
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;ELECTRIC_FAN
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;CLOUD
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;BOUNCER
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;GREMLIN
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;BOMB_GUY
  .byt 0 ;POOF
  .byt 0 ;PLAYER_PROJECTILE
  .byt 0 ;BLASTER_SHOT
  .byt 0 ;SMALL_GLIDER
  .byt ObjBehavior::AUTO_REMOVE ;BOOMERANG
  .byt 0 ;FIREBALL
  .byt 0 ;FLAMES
  .byt 0 ;WATER_BOTTLE
  .byt 0 ;ICE_BLOCK
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;RONALD
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::AUTO_RESET | ObjBehavior::WAIT_UNTIL_NEAR ;RONALD_BURGER
  .byt ObjBehavior::AUTO_REMOVE ;FRIES
  .byt ObjBehavior::AUTO_REMOVE ;FRY
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET | ObjBehavior::WAIT_UNTIL_NEAR ;SUN
  .byt 0 ;SUN_KEY
  .byt 0 ;MOVING_PLATFORM_HORIZ
  .byt 0 ;MOVING_PLATFORM_LINE
  .byt ObjBehavior::AUTO_REMOVE ;FIREBAR
  .byt 0 ;BOSS_FIGHT
  .byt ObjBehavior::AUTO_RESET ;SCHEME_TEAM
  .byt 0 ;FLYING_ARROW
  .byt 0 ;FALLING_BOMB
  .byt ObjBehavior::AUTO_REMOVE ;BOULDER
  .byt ObjBehavior::AUTO_REMOVE ;CHECKPOINT
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;BIG_GLIDER
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;BIG_LWSS
  .byt 0 ;EXPLOSION
  .byt ObjBehavior::AUTO_REMOVE ;MINECART
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;BOOMERANG_GUY
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;GRABBY_HAND
  .byt ObjBehavior::AUTO_REMOVE ;FALLING_SPIKE
  .byt ObjBehavior::AUTO_REMOVE ;CLOUD_SWORD
  .byt ObjBehavior::AUTO_REMOVE ;FIREWORK_SHOT
  .byt ObjBehavior::AUTO_REMOVE ;COLLECTIBLE
  .byt 0 ;MOLSNO
  .byt ObjBehavior::AUTO_REMOVE ;MOLSNO_NOTE
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;BUDDY
  .byt 0 ;BEAM_EMITTER
  .byt 0 ;LASER_BEAM
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
  .byt ObjFlag::ESSENTIAL ;SUN_KEY
  .byt ObjFlag::ESSENTIAL ;MOVING_PLATFORM_HORIZ
  .byt ObjFlag::ESSENTIAL ;MOVING_PLATFORM_LINE
  .byt ObjFlag::PRIMARY ;FIREBAR
  .byt ObjFlag::ESSENTIAL ;BOSS_FIGHT
  .byt ObjFlag::PRIMARY ;SCHEME_TEAM
  .byt ObjFlag::ESSENTIAL ;FLYING_ARROW
  .byt ObjFlag::ESSENTIAL ;FALLING_BOMB
  .byt ObjFlag::ESSENTIAL ;BOULDER
  .byt ObjFlag::ESSENTIAL ;CHECKPOINT
  .byt ObjFlag::PRIMARY ;BIG_GLIDER
  .byt ObjFlag::PRIMARY ;BIG_LWSS
  .byt ObjFlag::SECONDARY ;EXPLOSION
  .byt ObjFlag::ESSENTIAL ;MINECART
  .byt ObjFlag::PRIMARY ;BOOMERANG_GUY
  .byt ObjFlag::PRIMARY ;GRABBY_HAND
  .byt ObjFlag::PRIMARY ;FALLING_SPIKE
  .byt ObjFlag::SECONDARY ;CLOUD_SWORD
  .byt ObjFlag::SECONDARY ;FIREWORK_SHOT
  .byt ObjFlag::PRIMARY ;COLLECTIBLE
  .byt ObjFlag::ESSENTIAL ;MOLSNO
  .byt ObjFlag::PRIMARY ;MOLSNO_NOTE
  .byt ObjFlag::PRIMARY ;BUDDY
  .byt ObjFlag::PRIMARY ;BEAM_EMITTER
  .byt ObjFlag::SECONDARY ;LASER_BEAM
.endproc

