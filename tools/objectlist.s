.proc ObjGraphics1
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
  .byt GraphicsUpload::SP_GEORGE ;BIGGEORGE
  .byt GraphicsUpload::SP_GEORGE ;ALAN
  .byt 0 ;GLIDER
  .byt 0 ;ICE1
  .byt 0 ;ICE2
  .byt GraphicsUpload::SP_CANNON ;BALLGUY
  .byt GraphicsUpload::SP_CANNON ;THWOMP
  .byt GraphicsUpload::SP_CANNON ;CANNON1
  .byt GraphicsUpload::SP_CANNON ;CANNON2
  .byt GraphicsUpload::SP_CANNON ;BURGER
  .byt GraphicsUpload::SP_FIRE ;FIREWALK
  .byt GraphicsUpload::SP_FIRE ;FIREJUMP
  .byt GraphicsUpload::SP_CANNON ;MINE
  .byt GraphicsUpload::SP_EXPLODE ;ROCKET
  .byt GraphicsUpload::SP_EXPLODE ;ROCKETLAUNCHER
  .byt GraphicsUpload::SP_EXPLODE ;FIREWORKSHOOTER
  .byt 0 ;TORNADO
  .byt 0 ;ELECTRICFAN
  .byt 0 ;CLOUD
  .byt 0 ;BOUNCER
  .byt 0 ;GREMLIN
  .byt GraphicsUpload::SP_EXPLODE ;BOMBGUY
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
.endproc

.proc ObjGraphics2
  .byt 0 ;NONE
  .byt GraphicsUpload::SP_WALKER ;GOOMBA
  .byt GraphicsUpload::SP_WALKER ;SNEAKER
  .byt GraphicsUpload::SP_WALKER ;SPINNER
  .byt GraphicsUpload::SP_WALKER ;OWL
  .byt GraphicsUpload::SP_KING ;KING
  .byt GraphicsUpload::SP_KING ;TOASTBOT
  .byt GraphicsUpload::SP_CANNON ;BALL
  .byt GraphicsUpload::SP_KING ;POTION
  .byt GraphicsUpload::SP_GEORGE ;GEORGE
  .byt GraphicsUpload::SP_GEORGE ;BIGGEORGE
  .byt GraphicsUpload::SP_GEORGE ;ALAN
  .byt 0 ;GLIDER
  .byt 0 ;ICE1
  .byt 0 ;ICE2
  .byt GraphicsUpload::SP_CANNON ;BALLGUY
  .byt GraphicsUpload::SP_CANNON ;THWOMP
  .byt GraphicsUpload::SP_CANNON ;CANNON1
  .byt GraphicsUpload::SP_CANNON ;CANNON2
  .byt GraphicsUpload::SP_CANNON ;BURGER
  .byt GraphicsUpload::SP_FIRE ;FIREWALK
  .byt GraphicsUpload::SP_FIRE ;FIREJUMP
  .byt GraphicsUpload::SP_CANNON ;MINE
  .byt GraphicsUpload::SP_EXPLODE ;ROCKET
  .byt GraphicsUpload::SP_EXPLODE ;ROCKETLAUNCHER
  .byt GraphicsUpload::SP_EXPLODE ;FIREWORKSHOOTER
  .byt 0 ;TORNADO
  .byt 0 ;ELECTRICFAN
  .byt 0 ;CLOUD
  .byt 0 ;BOUNCER
  .byt 0 ;GREMLIN
  .byt GraphicsUpload::SP_EXPLODE ;BOMBGUY
  .byt 0 ;POOF
  .byt 0 ;PLAYER_PROJECTILE
  .byt 0 ;BLASTER_SHOT
  .byt 0 ;SMALL_GLIDER
  .byt 0 ;BOOMERANG
  .byt GraphicsUpload::SP_FIRE ;FIREBALL
  .byt GraphicsUpload::SP_FIRE ;FLAMES
  .byt GraphicsUpload::SP_GEORGE ;WATER_BOTTLE
  .byt 0 ;ICE_BLOCK
  .byt GraphicsUpload::SP_RONALD ;RONALD
  .byt GraphicsUpload::SP_RONALD ;RONALD_BURGER
  .byt GraphicsUpload::SP_RONALD ;FRIES
  .byt GraphicsUpload::SP_RONALD ;FRY
  .byt GraphicsUpload::SP_SUN ;SUN
  .byt GraphicsUpload::SP_SUN ;SUNKEY
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
  .byt ObjBehavior::AUTO_REMOVE ;BIGGEORGE
  .byt ObjBehavior::AUTO_REMOVE ;ALAN
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;GLIDER
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;ICE1
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;ICE2
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;BALLGUY
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;THWOMP
  .byt ObjBehavior::AUTO_REMOVE ;CANNON1
  .byt ObjBehavior::AUTO_REMOVE ;CANNON2
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT ;BURGER
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;FIREWALK
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;FIREJUMP
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;MINE
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;ROCKET
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;ROCKETLAUNCHER
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;FIREWORKSHOOTER
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;TORNADO
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;ELECTRICFAN
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;CLOUD
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;BOUNCER
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;GREMLIN
  .byt ObjBehavior::AUTO_REMOVE | ObjBehavior::GET_SHOT | ObjBehavior::AUTO_RESET ;BOMBGUY
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
.endproc

