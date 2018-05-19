Intro:
.byt SCR::RUN_ASM
jsr LoadExpositionGraphics
lda #' '
jsr ClearNameCustom
brk
.byt SCR::GROUND
.byt SCR::IMAGE, $a6, $21, <$22ae, >$22ae
.byt SCR::MONO_TEXT, <ExpositionText1, >ExpositionText1
.byt SCR::GROUND
.byt SCR::IMAGE, $8d, $22, <$226a, >$226a ; bill
.byt SCR::IMAGE, $82, $11, <$22cd, >$22cd
.byt SCR::IMAGE, $82, $11, <$22cf, >$22cf
.byt SCR::IMAGE, $82, $11, <$22d1, >$22d1
.byt SCR::IMAGE, $82, $11, <$22d3, >$22d3
.byt SCR::MONO_TEXT, <ExpositionText2, >ExpositionText2
.byt SCR::GROUND
.byt SCR::IMAGE, $88, $11, <$22c9, >$22c9
.byt SCR::IMAGE, $86, $11, <$22cb, >$22cb
.byt SCR::IMAGE, $80, $11, <$22d0, >$22d0
.byt SCR::IMAGE, $80, $11, <$22d2, >$22d2
.byt SCR::IMAGE, $80, $11, <$22d4, >$22d4
.byt SCR::IMAGE, $80, $11, <$22d6, >$22d6
.byt SCR::MONO_TEXT, <ExpositionText3, >ExpositionText3
.byt SCR::GROUND
.byt SCR::MONO_TEXT, <ExpositionText4, >ExpositionText4
.byt SCR::IMAGE, $a9, $32, <$228d, >$228d
.byt SCR::IMAGE, $d0, $22, <$2290, >$2290
.byt SCR::MONO_TEXT, <ExpositionText5, >ExpositionText5
.byt SCR::IMAGE, $a9, $32, <$228d, >$228d
.byt SCR::IMAGE, $d0, $22, <$2290, >$2290
.byt SCR::MONO_TEXT, <ExpositionText6, >ExpositionText6
.byt SCR::IMAGE, $a9, $32, <$228d, >$228d
.byt SCR::IMAGE, $d3, $22, <$2290, >$2290
.byt SCR::MONO_TEXT, <ExpositionText7, >ExpositionText7
.byt SCR::IMAGE, $a9, $32, <$228d, >$228d
.byt SCR::IMAGE, $d0, $22, <$2290, >$2290
.byt SCR::MONO_TEXT, <ExpositionText8, >ExpositionText8
.byt SCR::IMAGE, $a9, $32, <$228d, >$228d
.byt SCR::IMAGE, $d0, $22, <$2290, >$2290
.byt SCR::MONO_TEXT, <ExpositionText9, >ExpositionText9
.byt SCR::GROUND
.byt SCR::MONO_TEXT, <ExpositionText10, >ExpositionText10
.byt SCR::GROUND
.byt SCR::MONO_TEXT, <ExpositionText11, >ExpositionText11
.byt SCR::IMAGE, $a0, $23, <$228d, >$228d
.byt SCR::MONO_TEXT, <ExpositionText12, >ExpositionText12
.byt SCR::MONO_TEXT, <ExpositionText13, >ExpositionText13
.byt SCR::IMAGE, $a9, $32, <$228d, >$228d
.byt SCR::IMAGE, $d6, $22, <$2290, >$2290
.byt SCR::MONO_TEXT, <ExpositionText14, >ExpositionText14
.byt SCR::IMAGE, $a9, $32, <$228d, >$228d
.byt SCR::IMAGE, $d0, $22, <$2290, >$2290
.byt SCR::MONO_TEXT, <ExpositionText15, >ExpositionText15
.byt SCR::GROUND
.byt SCR::IMAGE, $a4, $21, <$22af, >$22af
.byt SCR::MONO_TEXT, <ExpositionText16, >ExpositionText16
.byt SCR::END_SCRIPT
Tutorial1:
.byt SCR::SCENE, SCENES::NOVA_SIGN_KEE
; <1 SIGN>Hold B to run, or press B to attack. From the pause menu you can choose to run with a double-tap instead, allowing you to attack while moving.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "H", "o", $ee, " ", "B", " ", $ba, "r", $f1, $f4, $c8, " ", "p", $fa, $f0, " ", "B", " ", $bb, SCR::NEWLINE, $c5, "t", "a", $f2, $f5, "F", "r", "o", "m", " ", $a1, " ", "p", "a", "u", $e4, " ", $cf, "n", "u", SCR::NEWLINE, $a5, " ", $af, " ", $e1, $e3, $e4, " ", $ba, "r", $f1, " ", $9c, " ", "a", SCR::NEWLINE, $c4, "u", "b", "l", "e", "-", "t", "a", "p", " ", $d7, $dd, $eb, "d", $f4, $ac, "o", "w", $b0, SCR::NEWLINE, $a5, " ", $ba, $c5, "t", "a", $f2, " ", $d9, $db, $e6, "m", "o", "v", $b0, "."
; <2 KEE>Okay Nova, I have no idea where we are. Everything's so weird, and WE'RE so different now...
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::KEE, "O", "k", "a", $fe, $a0, $f4, $bf, $9a, $d0, " ", "i", "d", $eb, SCR::NEWLINE, $d9, $ec, $e6, $c7, " ", "a", $fa, $f5, "E", "v", $ec, "y", $df, $b0, $e8, $cb, SCR::NEWLINE, $c7, "i", "r", "d", $f4, $a3, "W", "E", "'", "R", "E", " ", $cb, " ", "d", $cd, "f", $ec, $e5, "t", SCR::NEWLINE, $b3, ".", ".", "."
; <0 NOVA>We'll figure it out. There's bound to be other people here who can get us home, at least? I hope.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "W", "e", "'", "l", "l", " ", "f", "i", "g", "u", $fa, " ", $c0, $ad, $f5, $f7, $ec, "e", "'", "s", SCR::NEWLINE, "b", $f3, $ef, " ", $ba, $b9, "o", $a1, $e9, "p", "e", "o", "p", "l", "e", SCR::NEWLINE, $a8, $e6, $d9, "o", " ", $af, " ", $ae, " ", "u", $fb, "h", "o", $cf, $f4, $c5, SCR::NEWLINE, "l", $eb, $dd, "?", " ", $bf, "h", "o", "p", "e", "."
.byt SCR::END_SCRIPT
Tutorial2:
.byt SCR::SCENE, SCENES::NOVA_SIGN_KEE
; <1 SIGN>Some enemies can have their abilities copied. Try stunning this enemy with B and then press Up+B while facing it to copy its ability.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "S", "o", $cf, " ", $e5, "e", "m", $e2, $fb, $af, " ", $9a, $a1, "i", "r", SCR::NEWLINE, "a", "b", $db, "i", "t", $e2, $fb, "c", "o", "p", $e2, "d", $f5, "T", "r", $fe, $dd, $f1, "n", $b0, SCR::NEWLINE, $98, " ", $e5, "e", $ca, " ", $9c, " ", "B", " ", $a3, $93, SCR::NEWLINE, "p", $fa, $f0, " ", "U", "p", "+", "B", " ", $d9, $db, $e6, "f", "a", "c", $b0, " ", $c0, $bb, SCR::NEWLINE, "c", "o", "p", $fe, "i", "t", $fb, "a", "b", $db, "i", "t", "y", "."
; <1 SIGN>Hold Select to get rid of the ability you have. If an enemy throws projectiles, it is usually copyable.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "H", "o", $ee, " ", "S", "e", "l", "e", $c6, " ", $ba, $ae, " ", $fc, $ff, $bc, $a1, SCR::NEWLINE, "a", "b", $db, "i", "t", $fe, $a5, " ", "h", "a", "v", "e", $f5, "I", "f", " ", $c9, " ", $e5, "e", $ca, SCR::NEWLINE, $df, "r", "o", "w", $fb, "p", "r", "o", "j", "e", $c6, $db, "e", "s", $f4, $c0, $b8, SCR::NEWLINE, "u", "s", "u", $ac, $fe, "c", "o", "p", "y", "a", "b", "l", "e", "."
; <0 NOVA_YAY>Oooo, I should see if copying this enemy (to the right) will let me shoot fireballs!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_YAY, "O", $e3, "o", $f4, $bf, $de, $9f, " ", $b2, " ", $cd, " ", "c", "o", "p", "y", $b0, SCR::NEWLINE, $98, " ", $e5, "e", $ca, " ", "(", $ba, $a1, " ", $fc, $da, "t", ")", " ", $9d, SCR::NEWLINE, $a7, " ", $cf, " ", $de, $e3, $d2, "f", "i", $fa, "b", $ac, "s", "!"
.byt SCR::END_SCRIPT
Tutorial3:
.byt SCR::SCENE, SCENES::NOVA_SIGN_KEE
; <1 SIGN>You can jump down from this white colored platform. Stand on it and then hold Down.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "Y", $f3, " ", $af, " ", "j", "u", "m", "p", " ", $c4, "w", "n", " ", $96, $98, SCR::NEWLINE, $d9, "i", $ea, " ", "c", "o", "l", $c8, $d5, "p", "l", $c5, $a4, "m", $f5, "S", "t", $c9, "d", SCR::NEWLINE, $c1, " ", $c0, $a3, $93, " ", "h", "o", $ee, " ", "D", "o", "w", "n", "."
; <0 NOVA>White platform? Like in the third Super M-
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "W", "h", "i", $ea, " ", "p", "l", $c5, $a4, "m", "?", " ", "L", "i", "k", $e6, $be, $a1, SCR::NEWLINE, $df, "i", "r", $ff, "S", $cc, $ec, " ", "M", "-"
; <2 KEE>Yes. Shhhh.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::KEE, "Y", "e", "s", $f5, "S", "h", "h", "h", "h", "."
.byt SCR::END_SCRIPT
Tutorial4:
.byt SCR::SCENE, SCENES::NOVA_SIGN_KEE
; <1 SIGN>Use Up to grab onto a ladder or Down to drop down onto it from the top.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "U", $e4, " ", "U", "p", " ", $ba, "g", "r", "a", "b", " ", $c1, $ba, $bd, "l", $f6, "d", $ec, SCR::NEWLINE, $c8, " ", "D", "o", "w", "n", " ", $ba, "d", "r", "o", "p", " ", $c4, "w", "n", " ", $c1, $ba, "i", "t", SCR::NEWLINE, $96, $a1, " ", $bb, "p", "."
; <2 KEE>Yeah Nova, show off your rad climbing skills.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::KEE, "Y", $eb, "h", " ", $a0, $f4, $de, "o", "w", " ", "o", "f", "f", " ", $90, " ", "r", $f6, SCR::NEWLINE, "c", "l", "i", "m", "b", $b0, " ", "s", "k", $db, "l", "s", "."
.byt SCR::END_SCRIPT
Tutorial5:
.byt SCR::SCENE, SCENES::NOVA_SIGN_KEE
; <1 SIGN>Many abilities have altered behavior if you hold Up or Down while you press B. Try holding up while shooting a fireball and see if you can hit this enemy.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "M", $aa, " ", "a", "b", $db, "i", "t", $e2, $fb, $9a, "a", "l", $ea, $fa, "d", SCR::NEWLINE, "b", "e", "h", "a", "v", "i", $c8, " ", $cd, " ", $a5, " ", "h", "o", $ee, " ", "U", "p", " ", $c8, SCR::NEWLINE, "D", "o", "w", "n", " ", $d9, $db, $e6, $a5, " ", "p", $fa, $f0, " ", "B", $f5, "T", "r", "y", SCR::NEWLINE, "h", "o", $ee, $b0, " ", $cc, " ", $d9, $db, $e6, $de, $e3, "t", $b0, " ", "a", SCR::NEWLINE, "f", "i", $fa, "b", $ac, " ", $a3, $b2, " ", $cd, " ", $a5, " ", $af, " ", "h", "i", "t", SCR::NEWLINE, $98, " ", $e5, "e", $ca, "."
; <0 NOVA>Still no idea what we're doing here, but I guess I'll find out if I press on? Eventually?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "S", "t", $db, "l", " ", $d0, " ", "i", "d", $eb, " ", $8a, " ", $c7, "'", $fa, " ", $c4, $b0, SCR::NEWLINE, $a8, "e", $f4, $a6, " ", $bf, "g", "u", "e", $f0, " ", $d4, " ", "f", $d7, $ff, $ad, SCR::NEWLINE, $cd, " ", $bf, "p", $fa, $f0, " ", $c1, "?", " ", "E", "v", $e5, "t", "u", $ac, "y", "?"
; <2 KEE>Alright, while you're doing that I'm going to try and figure things out on my own.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::KEE, "A", "l", $fc, $da, "t", $f4, $d9, $db, $e6, $a5, "'", $fa, " ", $c4, $b0, SCR::NEWLINE, $99, $d3, $ce, $b0, " ", $ba, $f9, $fe, $c9, "d", SCR::NEWLINE, "f", "i", "g", "u", $fa, " ", $df, $b0, $fb, $ad, " ", $c1, " ", $ca, " ", "o", "w", "n", "."
.byt SCR::END_SCRIPT
FirstSchemeTeamEncounter:
.byt SCR::SCENE, SCENES::NOVA_AND_BAD_GUYS_AND_IKE
; <0 NOVA>Oh, finally some other people! Could you tell me where I am?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "O", "h", $f4, "f", $d7, $ac, $fe, $9b, " ", "o", $a1, $e9, "p", "e", "o", "p", "l", "e", "!", SCR::NEWLINE, "C", $9f, " ", $a5, " ", $ea, "l", "l", " ", $cf, " ", $d9, $ec, $e6, $bf, "a", "m", "?"
; <1 S_TEAM>No, but you'd make great target practice before we take off with this cat here.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::S_TEAM, "N", "o", $f4, $a6, " ", $a5, "'", $ff, "m", "a", "k", $e6, "g", $fa, $c5, SCR::NEWLINE, "t", "a", "r", $ae, " ", "p", "r", "a", $c6, "i", "c", $e6, "b", "e", $a4, $e6, $c7, SCR::NEWLINE, $8f, " ", "o", "f", "f", " ", $9c, " ", $98, " ", "c", $c5, " ", $a8, "e", "."
; <3 IKE>Actually, you're going to leave this cat right here. I need to get back to my shop!
.byt SCR::SAY, SCR::SPEAKER_3|CHAR::IKE, "A", $c6, "u", $ac, "y", $f4, $a5, "'", $fa, " ", $ce, $b0, " ", $bb, SCR::NEWLINE, "l", $eb, "v", $e6, $98, " ", "c", $c5, " ", $fc, $da, $d2, $a8, "e", $f5, "I", SCR::NEWLINE, $f8, $d5, $ba, $ae, " ", "b", "a", $f2, " ", $ba, $ca, " ", $de, "o", "p", "!"
; >0 NOVA_AW<I'd better help him!
.byt SCR::THINK, SCR::SPEAKER_0|CHAR::NOVA_AW, "I", "'", $ff, "b", "e", "t", $ea, $e9, $c2, "l", "p", " ", $b1, "!"
.byt SCR::END_SCRIPT
FirstSchemeTeamEncounterAfter:
.byt SCR::SCENE, SCENES::TWO_BAD_GUYS
; []The Scheme Team members flee.
.byt SCR::NARRATE, CHAR::NONE, $f7, $e6, "S", $e1, "e", $cf, " ", "T", $eb, "m", " ", $cf, "m", "b", $ec, "s", SCR::NEWLINE, "f", "l", $d6, "."
; <0 S_TEAM>Ouch. That squirrel isn't as weak as she seemed. We need to tell the boss so we can take care of this.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::S_TEAM, "O", "u", $e1, $f5, $f7, $c5, " ", $80, " ", $b8, "n", $e7, $c3, SCR::NEWLINE, $c7, "a", "k", " ", $c3, " ", $a9, " ", $b2, $cf, "d", $f5, "W", $e6, $f8, "e", "d", SCR::NEWLINE, $ba, $ea, "l", "l", " ", $a1, " ", "b", "o", $f0, " ", $cb, " ", $c7, " ", $af, SCR::NEWLINE, $8f, " ", "c", "a", $fa, " ", $bc, $98, "."
.byt SCR::SCENE, SCENES::BAD_GUYS_AND_LEADER
; <0 S_TEAM>Hey William???
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::S_TEAM, "H", "e", $fe, "W", $db, "l", "i", "a", "m", "?", "?", "?"
; <2 BILL>What? Why do you guys look beat-up?
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::BILL, "W", "h", $c5, "?", " ", "W", "h", $fe, $c4, " ", $a5, " ", "g", "u", "y", $fb, $94, SCR::NEWLINE, "b", $eb, "t", "-", $cc, "?"
; <0 S_TEAM>There's this weird green squirrel that totally kicked our butts, without even having a gun. Is that going to pose a threat to the plans?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::S_TEAM, $f7, $ec, "e", $e8, $98, " ", $c7, "i", "r", $ff, "g", $fa, $e5, SCR::NEWLINE, $80, " ", $99, $bb, "t", $ac, $fe, "k", "i", $f2, "e", "d", SCR::NEWLINE, $b5, " ", $a6, "t", "s", $f4, $9c, $ad, " ", $9e, SCR::NEWLINE, "h", "a", "v", $b0, " ", $bd, "g", $f1, $f5, "I", $fb, $99, $ce, $b0, " ", $bb, SCR::NEWLINE, "p", "o", $e4, " ", $bd, $df, $fa, $c5, " ", $ba, $a1, " ", "p", "l", $c9, "s", "?"
; <2 BILL>No, probably not. We'll just send the Smiloids after her if it becomes a problem.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::BILL, "N", "o", $f4, "p", "r", "o", "b", "a", "b", $d1, $a2, $f5, "W", "e", "'", "l", "l", " ", "j", "u", $dd, SCR::NEWLINE, $e4, $ef, " ", $a1, " ", "S", "m", $db, "o", "i", "d", $fb, $83, " ", $a8, " ", $cd, SCR::NEWLINE, $c0, "b", "e", $95, $fb, $bd, $81, "."
.byt SCR::SCENE, SCENES::NOVA_AND_IKE
; <0 NOVA>There. Are you okay?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, $f7, $ec, "e", $f5, "A", $fa, " ", $a5, " ", "o", "k", "a", "y", "?"
; <1 IKE>I'm fine, thank you. My name's Ike, and I run the item shop. The Scheme Team was trying to kidnap me so I couldn't sell items to any heroes.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::IKE, $d3, "f", $d7, "e", $f4, $92, "k", " ", $a5, $f5, "M", $fe, "n", "a", $cf, "'", "s", SCR::NEWLINE, "I", "k", "e", $f4, $a3, $bf, "r", $f1, " ", $a1, " ", "i", $ea, "m", " ", $de, "o", "p", ".", SCR::NEWLINE, $f7, $e6, "S", $e1, "e", $cf, " ", "T", $eb, "m", " ", "w", $c3, " ", $f9, "y", $b0, SCR::NEWLINE, $ba, "k", "i", "d", "n", "a", "p", " ", $cf, " ", $cb, " ", $bf, "c", $9f, "n", $e7, $e4, "l", "l", SCR::NEWLINE, "i", $ea, "m", $fb, $ba, $aa, " ", $a8, "o", "e", "s", "."
; <0 NOVA>The Scheme Team? Are there more of those guys?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, $f7, $e6, "S", $e1, "e", $cf, " ", "T", $eb, "m", "?", " ", "A", $fa, " ", $87, SCR::NEWLINE, "m", $c8, $e6, $bc, $df, "o", $e4, " ", "g", "u", "y", "s", "?"
; <1 IKE>Yeah, tons. They recently broke out of prison and everyone's in a panic.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::IKE, "Y", $eb, "h", $f4, $bb, "n", "s", $f5, $f7, "e", $fe, $fa, "c", $e5, "t", "l", "y", SCR::NEWLINE, "b", "r", "o", "k", $e6, $ad, " ", $bc, "p", $fc, $cb, "n", " ", $c9, "d", SCR::NEWLINE, "e", "v", $ec, "y", $ab, $e8, $be, $bd, "p", $c9, "i", "c", "."
; <0 NOVA>I'll see what I can do to help. By the way, how do I get to your shop?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, $d4, " ", $b2, " ", $8a, " ", $bf, $af, " ", $c4, " ", $ba, $c2, "l", "p", ".", SCR::NEWLINE, "B", $fe, $a1, " ", $b6, $f4, $b4, " ", $c4, " ", $bf, $ae, " ", $bb, SCR::NEWLINE, $90, " ", $de, "o", "p", "?"
; <1 IKE>It's a menu option on the screen between levels.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::IKE, "I", "t", $e8, $bd, $cf, "n", "u", " ", "o", "p", "t", "i", $c1, " ", $c1, " ", $a1, SCR::NEWLINE, "s", "c", $fa, $e5, " ", "b", "e", "t", $c7, $e5, " ", "l", "e", "v", "e", "l", "s", "."
; <1 IKE>By the way, since you asked, this place is named Latte. Good luck, dude.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::IKE, "B", $fe, $a1, " ", $b6, $f4, "s", $d7, "c", $e6, $a5, " ", $c3, "k", "e", "d", ",", SCR::NEWLINE, $98, " ", "p", "l", "a", "c", $e6, $b7, "n", "a", $cf, $ff, $84, ".", SCR::NEWLINE, "G", $e3, $ff, "l", "u", $f2, $f4, "d", "u", "d", "e", "."
; []Completing this level will open up world 2. Press up/down on the level select screen to swap between worlds.
.byt SCR::NARRATE, CHAR::NONE, "C", "o", "m", "p", $a7, $b0, " ", $98, " ", "l", "e", "v", "e", "l", " ", $9d, SCR::NEWLINE, "o", "p", $e5, " ", $cc, " ", "w", $c8, $ee, " ", "2", $f5, "P", $fa, $f0, SCR::NEWLINE, $cc, "/", $c4, "w", "n", " ", $c1, " ", $a1, " ", "l", "e", "v", "e", "l", " ", $e4, "l", "e", $c6, SCR::NEWLINE, "s", "c", $fa, $e5, " ", $ba, "s", "w", "a", "p", " ", "b", "e", "t", $c7, $e5, SCR::NEWLINE, "w", $c8, $ee, "s", "."
.byt SCR::END_SCRIPT
AfterFirstBattle:
.byt SCR::SCENE, SCENES::FORUMS
; []-halp I've been taken-
.byt SCR::NARRATE, CHAR::NONE, $86
; [SHERWIN]Let's make the best of my situation. I'm stuck here, so how about I leak out information on what the Scheme Team is doing?
.byt SCR::NARRATE, CHAR::SHERWIN, "L", "e", "t", $e8, "m", "a", "k", $e6, $a1, " ", "b", "e", $dd, " ", $bc, $ca, SCR::NEWLINE, "s", "i", "t", "u", $c5, "i", $c1, $f5, $d3, $dd, "u", $f2, " ", $a8, "e", $f4, $cb, SCR::NEWLINE, $b4, " ", $89, $bf, "l", $eb, "k", " ", $ad, SCR::NEWLINE, $d7, $a4, "m", $c5, "i", $c1, " ", $c1, " ", $8a, " ", $a1, SCR::NEWLINE, "S", $e1, "e", $cf, " ", "T", $eb, "m", " ", $b7, $c4, $b0, "?"
; [KOREY]That could help. Are you saying you've got something to share?
.byt SCR::NARRATE, CHAR::KOREY, $f7, $c5, " ", "c", $9f, " ", $c2, "l", "p", $f5, "A", $fa, " ", $a5, SCR::NEWLINE, "s", "a", "y", $b0, " ", $a5, "'", "v", $e6, $ce, $d2, $9b, $df, $b0, SCR::NEWLINE, $ba, $de, "a", $fa, "?"
; [SHERWIN]Yes! I heard there was a fight with some weird green squirrel? She totally kicked some Scheme Team members' butts.
.byt SCR::NARRATE, CHAR::SHERWIN, "Y", "e", "s", $fd, $bf, $c2, "a", "r", $ff, $87, " ", "w", $c3, " ", $bd, "f", "i", $da, "t", SCR::NEWLINE, $9c, " ", $9b, " ", $c7, "i", "r", $ff, "g", $fa, $e5, SCR::NEWLINE, $80, "?", " ", "S", $c2, " ", $bb, "t", $ac, $fe, "k", "i", $f2, "e", "d", SCR::NEWLINE, $9b, " ", "S", $e1, "e", $cf, " ", "T", $eb, "m", " ", $cf, "m", "b", $ec, "s", "'", SCR::NEWLINE, $a6, "t", "s", "."
; [KOREY]Oh good! Do you know where she is? Or where -you- are?
.byt SCR::NARRATE, CHAR::KOREY, "O", "h", " ", $ce, "o", "d", $fd, "D", "o", " ", $a5, " ", $8e, " ", $d9, $ec, "e", SCR::NEWLINE, $a9, " ", $b8, "?", " ", "O", $e9, $d9, $ec, $e6, "-", $a5, "-", " ", "a", $fa, "?"
; [SHERWIN]I got taken to Atomic Videoclip Zone so I'll assume that's their base. The squirrel's near the end of the forest.
.byt SCR::NARRATE, CHAR::SHERWIN, $bf, $ce, $d2, $8f, "n", " ", $ba, "A", $bb, "m", "i", "c", SCR::NEWLINE, "V", "i", "d", "e", "o", "c", "l", "i", "p", " ", "Z", $ab, " ", $cb, " ", $d4, " ", $c3, "s", "u", $cf, SCR::NEWLINE, $df, $c5, $e8, $a1, "i", $e9, "b", $c3, "e", $f5, $f7, "e", SCR::NEWLINE, $80, $e8, $f8, "a", $e9, $a1, " ", $e5, $ff, $bc, $a1, SCR::NEWLINE, $a4, "e", $dd, "."
; [KOREY]I'll meet up with her there.
.byt SCR::NARRATE, CHAR::KOREY, $d4, " ", $cf, "e", $d2, $cc, " ", $9c, " ", $a8, " ", $87, "."
.byt SCR::SCENE, SCENES::NOVA_AND_KOREY
; []Korey rushes to the scene, introduces himself and explains Latte's situation to Nova. They chat a bit.
.byt SCR::NARRATE, CHAR::NONE, "K", $c8, "e", $fe, "r", "u", $a9, $fb, $ba, $a1, " ", "s", "c", $e5, "e", ",", SCR::NEWLINE, $d7, $f9, "o", "d", "u", "c", "e", $fb, $b1, $e4, "l", "f", " ", $c9, "d", SCR::NEWLINE, "e", "x", "p", "l", "a", $d7, $fb, $84, $e8, "s", "i", "t", "u", $c5, "i", $c1, " ", $bb, SCR::NEWLINE, $a0, $f5, $f7, "e", $fe, $e1, $c5, " ", $bd, "b", "i", "t", "."
; <1 KOREY>... and this is the Scheme Team's second try at taking over, but this time they're prepared for anything any Latte residents can throw at them.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::KOREY, ".", ".", $f5, $a3, $98, " ", $b7, $a1, " ", "S", $e1, "e", $cf, SCR::NEWLINE, "T", $eb, "m", $e8, $e4, "c", $c1, $ff, $f9, $fe, $c5, " ", "t", "a", "k", $b0, SCR::NEWLINE, $8b, $f4, $a6, " ", $98, " ", "t", "i", $cf, " ", $97, "'", $fa, SCR::NEWLINE, "p", $fa, "p", "a", $fa, $ff, $a4, " ", $aa, $df, $b0, " ", $aa, SCR::NEWLINE, $84, " ", $fa, "s", "i", "d", $e5, "t", $fb, $af, " ", $df, "r", "o", "w", " ", $c5, SCR::NEWLINE, $91, "."
; <0 NOVA>Point being that I have a chance because I'm not from here?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "P", "o", $d7, $d2, "b", "e", $b0, " ", $99, $bf, $9a, "a", SCR::NEWLINE, $e1, $c9, "c", $e6, "b", "e", "c", "a", "u", $e4, " ", $d3, $a2, " ", "f", "r", "o", "m", SCR::NEWLINE, $a8, "e", "?"
; <1 KOREY>Exactly. I know it's dangerous, but are you willing to help us? I don't know how you and Kee got here, but once this is over I'll try and get you two home.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::KOREY, "E", "x", "a", $c6, "l", "y", $f5, $bf, $8e, " ", "i", "t", "'", "s", SCR::NEWLINE, "d", $c9, "g", $ec, $f3, "s", $f4, $a6, " ", "a", $fa, " ", $a5, " ", $9d, $b0, SCR::NEWLINE, $ba, $c2, "l", "p", " ", "u", "s", "?", " ", $bf, $c4, "n", $e7, $8e, " ", $b4, SCR::NEWLINE, $a5, " ", $a3, "K", $d6, " ", $ce, $d2, $a8, "e", $f4, $a6, SCR::NEWLINE, $c1, "c", $e6, $98, " ", $b7, $8b, " ", $d4, " ", $f9, $fe, $c9, "d", SCR::NEWLINE, $ae, " ", $a5, " ", "t", "w", "o", " ", "h", "o", $cf, "."
; <0 NOVA_AW>Well I can't just let the bad guys win if I'm the one who can stop them!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_AW, "W", "e", "l", "l", " ", $bf, $af, $e7, $8d, $a7, " ", $a1, " ", "b", $f6, SCR::NEWLINE, "g", "u", "y", $fb, "w", $be, $cd, " ", $d3, $a1, " ", $ab, " ", $d9, "o", SCR::NEWLINE, $af, " ", $dd, "o", "p", " ", $91, "!"
; <1 KOREY>Great. Latte has its own forum, and we've been keeping track of the situation on it. You should look at it.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::KOREY, "G", $fa, $c5, $f5, $84, " ", "h", $c3, " ", "i", "t", $fb, "o", "w", "n", SCR::NEWLINE, $a4, "u", "m", $f4, $a3, $c7, "'", "v", $e6, "b", $d6, "n", SCR::NEWLINE, "k", $d6, "p", $b0, " ", $f9, "a", $f2, " ", $bc, $a1, " ", "s", "i", "t", "u", $c5, "i", $c1, SCR::NEWLINE, $c1, " ", "i", "t", $f5, "Y", $f3, " ", $de, $9f, " ", $94, " ", $c5, " ", "i", "t", "."
; <0 NOVA>Alright. What should I do next?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "A", "l", $fc, $da, "t", $f5, "W", "h", $c5, " ", $de, $9f, " ", $bf, $c4, SCR::NEWLINE, $f8, "x", "t", "?"
; <1 KOREY>You should go through this clubhouse up ahead. It's named Bummer Club, and it's got a prize locked up at the very end.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::KOREY, "Y", $f3, " ", $de, $9f, " ", $ce, " ", $df, "r", $f3, $da, " ", $98, SCR::NEWLINE, "c", "l", "u", "b", "h", $f3, $e4, " ", $cc, " ", "a", $c2, $f6, $f5, "I", "t", "'", "s", SCR::NEWLINE, "n", "a", $cf, $ff, "B", "u", "m", $cf, $e9, "C", "l", "u", "b", $f4, $a3, "i", "t", "'", "s", SCR::NEWLINE, $ce, $d2, $bd, "p", $fc, "z", $e6, "l", "o", $f2, $d5, $cc, " ", $c5, " ", $a1, SCR::NEWLINE, "v", $ec, $fe, $e5, "d", "."
.byt SCR::END_SCRIPT
MeetLia:
.byt SCR::SCENE, SCENES::NOVA_AND_LIA
; <0 NOVA_WOW>Oh it's Lia! I haven't seen you in forever.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_WOW, "O", "h", " ", "i", "t", $e8, "L", "i", "a", $fd, $bf, "h", "a", "v", $e5, $e7, $b2, "n", " ", $a5, SCR::NEWLINE, $be, $a4, "e", "v", $ec, "."
; <1 LIA>Das me! I was teleported here while looking for yous.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "D", $c3, " ", $cf, $fd, $bf, "w", $c3, " ", $ea, "l", "e", "p", $c8, $ea, $ff, $a8, "e", SCR::NEWLINE, $d9, $db, $e6, $94, $b0, " ", $a4, " ", $a5, "s", "."
; <0 NOVA_YAY>Maybe you can help me out on these puzzles.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_YAY, "M", "a", "y", $b9, $a5, " ", $af, " ", $c2, "l", "p", " ", $cf, " ", $ad, SCR::NEWLINE, $c1, " ", $88, "p", "u", "z", "z", "l", "e", "s", "."
; <1 LIA>Okies! I'd be happy to!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "O", "k", $e2, "s", $fd, "I", "'", $ff, $b9, "h", "a", "p", "p", $fe, $bb, "!"
.byt SCR::END_SCRIPT
LiaChat2:
.byt SCR::SCENE, SCENES::NOVA_AND_LIA
; <1 LIA>I fink you need to build a pathway up to those computer chips, and get all of 'em to progress.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, $bf, "f", $d7, "k", " ", $a5, " ", $f8, $d5, $ba, "b", "u", $db, $ff, "a", SCR::NEWLINE, "p", $c5, "h", $b6, " ", $cc, " ", $ba, $df, "o", $e4, SCR::NEWLINE, "c", "o", "m", "p", "u", $ea, $e9, $e1, "i", "p", "s", $f4, $a3, $ae, " ", $ac, " ", "o", "f", SCR::NEWLINE, "'", "e", "m", " ", $ba, "p", "r", "o", "g", $fa, $f0, "."
; <0 NOVA>Build? With what?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "B", "u", $db, "d", "?", " ", "W", "i", $df, " ", $8a, "?"
; <1 LIA>Springs! For dis level you've got a bunch of 'em in your inventory. Blocks too, but springs are betters! They're on a second page in yer inventory!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "S", "p", $fc, "n", "g", "s", $fd, "F", $c8, " ", "d", $b7, "l", "e", "v", "e", "l", " ", $a5, "'", "v", "e", SCR::NEWLINE, $ce, $d2, $bd, "b", $f1, $e1, " ", $bc, "'", "e", "m", " ", $be, $90, SCR::NEWLINE, $d7, "v", $e5, $bb, "r", "y", $f5, "B", "l", "o", $f2, $fb, $bb, "o", $f4, $a6, SCR::NEWLINE, $dc, $fc, "n", "g", $fb, "a", $fa, " ", "b", "e", "t", $ea, "r", "s", $fd, $f7, "e", "y", "'", $fa, SCR::NEWLINE, $c1, " ", $bd, $e4, "c", $c1, $ff, "p", "a", "g", $e6, $be, "y", $ec, SCR::NEWLINE, $d7, "v", $e5, $bb, "r", "y", "!"
.byt SCR::END_SCRIPT
LiaChat3:
.byt SCR::SCENE, SCENES::NOVA_AND_LIA
; <0 NOVA>Do you think we'll ever get home?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "D", "o", " ", $a5, " ", $82, " ", $c7, "'", "l", "l", " ", "e", "v", $ec, " ", $ae, SCR::NEWLINE, "h", "o", $cf, "?"
; <1 LIA>I fink so! We'll figure it outs. I dunno about yous but but I fink this is pretty fun!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, $bf, "f", $d7, "k", " ", $cb, $fd, "W", "e", "'", "l", "l", " ", "f", "i", "g", "u", $fa, " ", $c0, $ad, "s", $f5, "I", SCR::NEWLINE, "d", $f1, $d0, " ", $89, $a5, $fb, $a6, " ", $a6, " ", "I", SCR::NEWLINE, "f", $d7, "k", " ", $98, " ", $b7, "p", $fa, "t", "t", $fe, "f", $f1, "!"
; <0 NOVA_YAY>I suppose it is! Maybe we should stick around anyway...
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_YAY, $bf, "s", $cc, "p", "o", $e4, " ", $c0, $b8, $fd, "M", "a", "y", $b9, $c7, SCR::NEWLINE, $de, $9f, " ", $dd, "i", $f2, " ", "a", "r", $f3, $ef, " ", $aa, $b6, ".", ".", "."
.byt SCR::END_SCRIPT
FHBGAtBummerClub:
.byt SCR::SCENE, SCENES::NOVA_AND_SMILOID
; <2 S_TEAM>Hey squirrel! Your adventure stops here!
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::S_TEAM, "H", "e", $fe, $80, $fd, "Y", $b5, " ", $f6, "v", $e5, "t", "u", $fa, SCR::NEWLINE, $dd, "o", "p", $fb, $a8, "e", "!"
; <1 SMILOID>Have a nice day!!!!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SMILOID, "H", "a", "v", $e6, $bd, "n", "i", "c", $e6, "d", "a", "y", "!", "!", "!", "!"
; <0 NOVA_WOW>Lia, run!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_WOW, "L", "i", "a", $f4, "r", $f1, "!"
; [LIA]Aaa, way ahead of you there, Nova!
.byt SCR::NARRATE, CHAR::LIA, "A", "a", "a", $f4, $b6, " ", "a", $c2, $f6, " ", $bc, $a5, " ", $87, ",", SCR::NEWLINE, $a0, "!"
; <2 S_TEAM>Oh this Smiloid won't be fighting you. Instead we've hired the very best, Forehead Block Guy!
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::S_TEAM, "O", "h", " ", $98, " ", "S", "m", $db, "o", "i", $ff, "w", $c1, $e7, "b", "e", SCR::NEWLINE, "f", "i", $da, "t", $b0, " ", $a5, $f5, "I", "n", $dd, $eb, $ff, $c7, "'", "v", "e", SCR::NEWLINE, "h", "i", $fa, $ff, $a1, " ", "v", $ec, $fe, "b", "e", $dd, $f4, "F", $c8, "e", $c2, $f6, SCR::NEWLINE, "B", "l", "o", $f2, " ", "G", "u", "y", "!"
; [LIA]Hmm, I fink he's actually safe to touch, only his blocks aren't. Good luck Nova!
.byt SCR::NARRATE, CHAR::LIA, "H", "m", "m", $f4, $bf, "f", $d7, "k", " ", $c2, $e8, "a", $c6, "u", $ac, $fe, "s", "a", "f", "e", SCR::NEWLINE, $ba, $bb, "u", $e1, $f4, $c1, $d1, "h", $b7, "b", "l", "o", $f2, "s", SCR::NEWLINE, "a", $fa, "n", "'", "t", $f5, "G", $e3, $ff, "l", "u", $f2, " ", $a0, "!"
.byt SCR::END_SCRIPT
AfterFHBGAtBummerClub:
.byt SCR::SCENE, SCENES::NOVA_AND_SMILOID
; <2 S_TEAM>Oh, you got past him? W-we'll figure out how to take you down, just you wait!
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::S_TEAM, "O", "h", $f4, $a5, " ", $ce, $d2, "p", $c3, $d2, $b1, "?", " ", "W", "-", $c7, "'", "l", "l", SCR::NEWLINE, "f", "i", "g", "u", $fa, " ", $ad, " ", $b4, " ", $ba, $8f, " ", $a5, SCR::NEWLINE, $c4, "w", "n", $f4, $8d, $a5, " ", "w", "a", "i", "t", "!"
; <0 NOVA_SILLY>Yeah, we'll see about that.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_SILLY, "Y", $eb, "h", $f4, $c7, "'", "l", "l", " ", $b2, " ", $89, $df, $c5, "."
; <0 NOVA>Wonder where that prize is. I guess it's past that door?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "W", $c1, "d", $ec, " ", $d9, $ec, $e6, $99, "p", $fc, "z", $e6, $b8, $f5, "I", SCR::NEWLINE, "g", "u", "e", $f0, " ", "i", "t", $e8, "p", $c3, $d2, $99, $c4, $c8, "?"
.byt SCR::END_SCRIPT
JustGotMirror:
.byt SCR::SCENE, SCENES::NOVA_AND_ECLIPSE
; <0 NOVA_YAY>Wow, I didn't know I'd be running into Eclipse here too!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_YAY, "W", "o", "w", $f4, $bf, "d", "i", "d", "n", $e7, $8e, " ", "I", "'", $ff, "b", "e", SCR::NEWLINE, "r", $f1, "n", $b0, " ", $d7, $ba, "E", "c", "l", "i", "p", $e4, " ", $a8, $e6, $bb, "o", "!"
; <2 ECLIPSE>Mhm! I was asked to guard the prize for whoever gets through the puzzles, and it seems like you have?
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::ECLIPSE, "M", "h", "m", $fd, $bf, "w", $c3, " ", $c3, "k", $d5, $ba, "g", "u", "a", "r", "d", SCR::NEWLINE, $a1, " ", "p", $fc, "z", $e6, $a4, " ", $d9, "o", "e", "v", $ec, " ", $ae, "s", SCR::NEWLINE, $df, "r", $f3, $da, " ", $a1, " ", "p", "u", "z", "z", "l", "e", "s", $f4, $a3, "i", "t", SCR::NEWLINE, $b2, "m", $fb, $8c, " ", $a5, " ", "h", "a", "v", "e", "?"
; <0 NOVA_WOW>Yeah, what do I get?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_WOW, "Y", $eb, "h", $f4, $8a, " ", $c4, " ", $bf, $ae, "?"
; <1 LIA>It'll probably be like, some sort of cool pants or something.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "I", "t", "'", "l", "l", " ", "p", "r", "o", "b", "a", "b", $d1, $b9, $8c, $f4, $9b, SCR::NEWLINE, $cb, $ed, " ", $bc, "c", $e3, "l", " ", "p", $c9, "t", $fb, $c8, SCR::NEWLINE, $9b, $df, $b0, "."
; <0 NOVA>Or "essence of forehead block".
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "O", $e9, '"', "e", $f0, $e5, "c", $e6, $bc, $a4, "e", $c2, $f6, SCR::NEWLINE, "b", "l", "o", $f2, '"', "."
; <2 ECLIPSE>Uh, no! Actually I'm awarding you this mysterious Mirror Scepter.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::ECLIPSE, "U", "h", $f4, $d0, $fd, "A", $c6, "u", $ac, $fe, $d3, "a", "w", "a", "r", "d", $b0, SCR::NEWLINE, $a5, " ", $98, " ", $ca, $dd, $ec, "i", $f3, $fb, "M", "i", $d8, $c8, SCR::NEWLINE, "S", "c", "e", "p", $ea, "r", "."
; <0 NOVA_YAY>Whoa, what's it do?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_YAY, "W", "h", "o", "a", $f4, $8a, $e8, $c0, $c4, "?"
; <2 ECLIPSE>It can reflect things. I heard the leader of the Scheme Team was originally defeated by reflecting his own projectiles into himself!
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::ECLIPSE, "I", $d2, $af, " ", $fa, "f", "l", "e", $c6, " ", $df, $b0, "s", $f5, $bf, $c2, "a", "r", "d", SCR::NEWLINE, $a1, " ", "l", $eb, "d", $ec, " ", $bc, $a1, " ", "S", $e1, "e", $cf, SCR::NEWLINE, "T", $eb, "m", " ", "w", $c3, " ", $c8, "i", "g", $d7, $ac, $fe, "d", "e", "f", $eb, $ea, "d", SCR::NEWLINE, "b", $fe, $fa, "f", "l", "e", $c6, $b0, " ", "h", $b7, "o", "w", "n", SCR::NEWLINE, "p", "r", "o", "j", "e", $c6, $db, "e", $fb, $d7, $ba, $b1, $e4, "l", "f", "!"
; <0 NOVA>Alright, thank you, Eclipse.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "A", "l", $fc, $da, "t", $f4, $92, "k", " ", $a5, $f4, "E", "c", "l", "i", "p", $e4, "."
; <1 LIA>I'm gonna go off and work on some mad science... I've got some ideas. Seeya Nova!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, $d3, $ce, "n", "n", $bd, $ce, " ", "o", "f", "f", " ", $a3, "w", $c8, "k", " ", $c1, SCR::NEWLINE, $9b, " ", "m", $f6, " ", "s", "c", $e2, "n", "c", "e", ".", ".", $f5, "I", "'", "v", $e6, $ce, "t", SCR::NEWLINE, $9b, " ", "i", "d", $eb, "s", $f5, "S", $d6, "y", $bd, $a0, "!"
.byt SCR::SCENE, SCENES::FORUMS
; []-halp I've been taken-
.byt SCR::NARRATE, CHAR::NONE, $86
; [NOVA]Alright, I got through Bummer Club, what else should I get? I wanna make sure I've got as much of a chance as I can.
.byt SCR::NARRATE, CHAR::NOVA, "A", "l", $fc, $da, "t", $f4, $bf, $ce, $d2, $df, "r", $f3, $da, " ", "B", "u", "m", $cf, "r", SCR::NEWLINE, "C", "l", "u", "b", $f4, $8a, " ", "e", "l", $e4, " ", $de, $9f, " ", $bf, $ae, "?", SCR::NEWLINE, $bf, "w", $c9, "n", $bd, "m", "a", "k", $e6, "s", "u", $fa, " ", "I", "'", "v", $e6, $ce, $d2, $c3, SCR::NEWLINE, "m", "u", $e1, " ", $bc, $bd, $e1, $c9, "c", $e6, $c3, " ", $bf, $af, "."
; [SHERWIN]Probably the cola?
.byt SCR::NARRATE, CHAR::SHERWIN, "P", "r", "o", "b", "a", "b", $d1, $a1, " ", "c", "o", "l", "a", "?"
; [KOREY]Yeah, head over to Frozen Volcano. Just trust me on this - I think it's really important that you get some Fa-a-ancy cola.
.byt SCR::NARRATE, CHAR::KOREY, "Y", $eb, "h", $f4, $c2, $f6, " ", $8b, " ", $ba, "F", "r", "o", "z", $e5, SCR::NEWLINE, "V", "o", "l", $af, "o", $f5, "J", "u", $dd, " ", $f9, "u", $dd, " ", $cf, " ", $c1, " ", $98, SCR::NEWLINE, "-", " ", $bf, $82, " ", "i", "t", $e8, $fa, $ac, $fe, "i", "m", "p", $c8, "t", $c9, "t", SCR::NEWLINE, $99, $a5, " ", $ae, " ", $9b, " ", "F", "a", "-", "a", "-", $c9, "c", "y", SCR::NEWLINE, "c", "o", "l", "a", "."
; [NOVA]What's so fancy about it?
.byt SCR::NARRATE, CHAR::NOVA, "W", "h", $c5, $e8, $cb, " ", "f", $c9, "c", $fe, $89, "i", "t", "?"
; [KOREY]No, it's fa-a-ancy. Completely different. Anyway, in Frozen Volcano, there's this dude named MolSno, short for "Molten Snow". He has a real problem so he bought every single can of fa-a-ancy cola there is and you'll just have to get some from him.
.byt SCR::NARRATE, CHAR::KOREY, "N", "o", $f4, "i", "t", $e8, "f", "a", "-", "a", "-", $c9, "c", "y", ".", SCR::NEWLINE, "C", "o", "m", "p", $a7, "e", $d1, "d", $cd, "f", $ec, $e5, "t", $f5, "A", "n", "y", $b6, ",", SCR::NEWLINE, $be, "F", "r", "o", "z", $e5, " ", "V", "o", "l", $af, "o", $f4, $87, "'", "s", SCR::NEWLINE, $98, " ", "d", "u", "d", $e6, "n", "a", $cf, $ff, "M", "o", "l", "S", $d0, ",", SCR::NEWLINE, $de, $c8, $d2, $a4, " ", '"', "M", "o", "l", $ea, "n", " ", "S", $b3, '"', $f5, "H", "e", SCR::NEWLINE, "h", $c3, " ", $bd, $fa, "a", "l", " ", $81, " ", $cb, " ", $c2, SCR::NEWLINE, "b", $f3, $da, $d2, "e", "v", $ec, $fe, "s", $b0, "l", $e6, $af, " ", "o", "f", SCR::NEWLINE, "f", "a", "-", "a", "-", $c9, "c", $fe, "c", "o", "l", $bd, $87, " ", $b7, $c9, "d", SCR::NEWLINE, $a5, "'", "l", "l", " ", $8d, $9a, $ba, $ae, " ", $9b, SCR::NEWLINE, $96, $b1, "."
; [NOVA]Sure, I guess I'll try that. But why cola?
.byt SCR::NARRATE, CHAR::NOVA, "S", "u", $fa, $f4, $bf, "g", "u", "e", $f0, " ", $d4, " ", $f9, $fe, $df, $c5, $f5, "B", "u", "t", SCR::NEWLINE, $d9, $fe, "c", "o", "l", "a", "?"
; [KOREY]I'll let you in on a little secret - the name Latte comes from the latte caffeinated drink, and in this world caffeine is a really powerful thing, especially in the hands of a squirrel.
.byt SCR::NARRATE, CHAR::KOREY, $d4, " ", $a7, " ", $a5, " ", $be, $c1, " ", $bd, "l", "i", "t", "t", "l", "e", SCR::NEWLINE, $e4, "c", $fa, $d2, "-", " ", $a1, " ", "n", "a", $cf, " ", $84, SCR::NEWLINE, $95, $fb, $96, $a1, " ", "l", $c5, $ea, SCR::NEWLINE, "c", "a", "f", "f", "e", $d7, $c5, $d5, "d", $fc, "n", "k", $f4, $a3, $be, $98, SCR::NEWLINE, "w", $c8, $ee, " ", "c", "a", "f", "f", "e", $d7, $e6, $b7, $bd, $fa, $ac, "y", SCR::NEWLINE, "p", "o", $c7, "r", "f", "u", "l", " ", $df, $b0, $f4, "e", $dc, "e", "c", "i", $ac, $fe, $d7, SCR::NEWLINE, $a1, " ", "h", $c9, "d", $fb, $bc, $bd, $80, "."
; [SHERWIN]Haha yeah, squirrels already tend to be pretty hyper even without any help from coffee!
.byt SCR::NARRATE, CHAR::SHERWIN, "H", "a", "h", $bd, "y", $eb, "h", $f4, $80, $fb, "a", "l", $fa, $f6, "y", SCR::NEWLINE, $ea, $ef, " ", $ba, $b9, "p", $fa, "t", "t", $fe, "h", "y", "p", $ec, " ", $9e, SCR::NEWLINE, $9c, $ad, " ", $aa, " ", $c2, "l", "p", " ", $96, "c", "o", "f", "f", $d6, "!"
; []Nova travels to Frozen Volcano, the land of lava and ice.
.byt SCR::NARRATE, CHAR::NONE, $a0, " ", $f9, "a", "v", "e", "l", $fb, $ba, "F", "r", "o", "z", $e5, SCR::NEWLINE, "V", "o", "l", $af, "o", $f4, $a1, " ", "l", $a3, $bc, "l", "a", "v", $bd, $c9, "d", SCR::NEWLINE, "i", "c", "e", "."
.byt SCR::END_SCRIPT
ColaSigns:
.byt SCR::SCENE, SCENES::FORUMS
; []-halp I've been taken-
.byt SCR::NARRATE, CHAR::NONE, $86
; [NOVA_SILLY]You know maybe the reason MolSno went crazy and bought all the cola is because the volcano he lives in is covered with cola advertisements.
.byt SCR::NARRATE, CHAR::NOVA_SILLY, "Y", $f3, " ", $8e, " ", "m", "a", "y", $b9, $a1, " ", $fa, $c3, $c1, SCR::NEWLINE, "M", "o", "l", "S", $d0, " ", $c7, $e0, " ", "c", "r", "a", "z", $fe, $c9, "d", SCR::NEWLINE, "b", $f3, $da, $d2, $ac, " ", $a1, " ", "c", "o", "l", $bd, $b8, SCR::NEWLINE, "b", "e", "c", "a", "u", $e4, " ", $a1, " ", "v", "o", "l", $af, "o", " ", $c2, " ", "l", "i", "v", "e", "s", SCR::NEWLINE, $be, $b7, "c", $8b, $d5, $9c, " ", "c", "o", "l", "a", SCR::NEWLINE, $f6, "v", $ec, "t", $b8, "e", $cf, $e0, "s", "."
; [SHERWIN]You think so?
.byt SCR::NARRATE, CHAR::SHERWIN, "Y", $f3, " ", $82, " ", $cb, "?"
; [NOVA]I think I'm about to see him... hopefully he cooperates?
.byt SCR::NARRATE, CHAR::NOVA, $bf, $82, " ", $d3, $89, $ba, $b2, " ", $b1, ".", ".", ".", SCR::NEWLINE, "h", "o", "p", "e", "f", "u", "l", $d1, $c2, " ", "c", $e3, "p", $ec, $c5, "e", "s", "?"
; [SHERWIN]"Molten Snow", eh? That's just a fancy name for water isn't it?
.byt SCR::NARRATE, CHAR::SHERWIN, '"', "M", "o", "l", $ea, "n", " ", "S", $b3, '"', $f4, "e", "h", "?", " ", $f7, $c5, "'", "s", SCR::NEWLINE, $8d, $bd, "f", $c9, "c", $fe, "n", "a", $cf, " ", $a4, " ", "w", $c5, $ec, SCR::NEWLINE, $b8, "n", $e7, "i", "t", "?"
.byt SCR::END_SCRIPT
MolSnoMeet:
.byt SCR::SCENE, SCENES::NOVA_AND_MOLSNO
; <0 NOVA>Hey I assume you're MolSno? I need some of your fa-a-ancy cola so I can save the world. Surely you can spare some cans?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "H", "e", $fe, $bf, $c3, "s", "u", $cf, " ", $a5, "'", $fa, " ", "M", "o", "l", "S", $d0, "?", SCR::NEWLINE, $bf, $f8, $d5, $9b, " ", $bc, $90, SCR::NEWLINE, "f", "a", "-", "a", "-", $c9, "c", $fe, "c", "o", "l", $bd, $cb, " ", $bf, $af, " ", "s", "a", "v", "e", SCR::NEWLINE, $a1, " ", "w", $c8, $ee, $f5, "S", "u", $fa, $d1, $a5, " ", $af, SCR::NEWLINE, $dc, "a", $fa, " ", $9b, " ", $af, "s", "?"
; <1 MOLSNO>No way, I'm safe in this volcano. This cola is all mine, every last can.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::MOLSNO, "N", "o", " ", $b6, $f4, $d3, "s", "a", "f", $e6, $be, $98, SCR::NEWLINE, "v", "o", "l", $af, "o", $f5, $f7, $b7, "c", "o", "l", $bd, $b7, $ac, " ", "m", $d7, "e", ",", SCR::NEWLINE, "e", "v", $ec, $fe, "l", $c3, $d2, $af, "."
; <0 NOVA_AW>MolSno, do we really have to do this? I don't want to fight you.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_AW, "M", "o", "l", "S", $d0, $f4, $c4, " ", $c7, " ", $fa, $ac, $fe, $9a, $bb, SCR::NEWLINE, $c4, " ", $98, "?", " ", $bf, $c4, "n", $e7, "w", $c9, $d2, $ba, "f", "i", $da, "t", SCR::NEWLINE, $a5, "."
; <1 MOLSNO>You know what? You can have my cans... the empty ones!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::MOLSNO, "Y", $f3, " ", $8e, " ", $8a, "?", " ", "Y", $f3, " ", $af, SCR::NEWLINE, $9a, $ca, " ", $af, "s", ".", ".", $f5, $a1, " ", "e", "m", "p", "t", "y", SCR::NEWLINE, $ab, "s", "!"
.byt SCR::END_SCRIPT
MolSnoAfterFight:
.byt SCR::SCENE, SCENES::NOVA_AND_MOLSNO
; <1 MOLSNO>Okay, sure, I guess you can have some cola.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::MOLSNO, "O", "k", "a", "y", $f4, "s", "u", $fa, $f4, $bf, "g", "u", "e", $f0, " ", $a5, " ", $af, SCR::NEWLINE, $9a, $9b, " ", "c", "o", "l", "a", "."
; <0 NOVA>Thank you.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, $f7, $c9, "k", " ", $a5, "."
.byt SCR::SCENE, SCENES::FORUMS
; []-halp I've been taken-
.byt SCR::NARRATE, CHAR::NONE, $86
; [NOVA]Okay, so now I've got the cola and the sceptor. Am I all set?
.byt SCR::NARRATE, CHAR::NOVA, "O", "k", "a", "y", $f4, $cb, " ", $b3, " ", "I", "'", "v", $e6, $ce, $d2, $a1, " ", "c", "o", "l", "a", SCR::NEWLINE, $a3, $a1, " ", "s", "c", "e", "p", $bb, "r", $f5, "A", "m", " ", $bf, $ac, " ", $e4, "t", "?"
; [KOREY]Yeah, now you've just gotta figure out how to get to the Scheme Team headquarters.
.byt SCR::NARRATE, CHAR::KOREY, "Y", $eb, "h", $f4, $b3, " ", $a5, "'", "v", $e6, $8d, $ce, "t", "t", "a", SCR::NEWLINE, "f", "i", "g", "u", $fa, " ", $ad, " ", $b4, " ", $ba, $ae, " ", $ba, $a1, SCR::NEWLINE, "S", $e1, "e", $cf, " ", "T", $eb, "m", " ", $c2, $f6, "q", "u", "a", $ed, $ec, "s", "."
; [SHERWIN]I don't think you'll be able to JUST walk here. You'll need something better.
.byt SCR::NARRATE, CHAR::SHERWIN, $bf, $c4, "n", $e7, $82, " ", $a5, "'", "l", "l", " ", $b9, "a", "b", "l", $e6, $bb, SCR::NEWLINE, "J", "U", "S", "T", " ", "w", "a", "l", "k", " ", $a8, "e", $f5, "Y", $f3, "'", "l", "l", " ", $f8, "e", "d", SCR::NEWLINE, $9b, $df, $b0, " ", "b", "e", "t", $ea, "r", "."
; [LIA]Oh I know! I've got an idea and I'm gonna meet up with Nova and help her!
.byt SCR::NARRATE, CHAR::LIA, "O", "h", " ", $bf, $8e, $fd, "I", "'", "v", $e6, $ce, $d2, $c9, " ", "i", "d", $eb, " ", $c9, "d", SCR::NEWLINE, $d3, $ce, "n", "n", $bd, $cf, "e", $d2, $cc, " ", $9c, " ", $a0, SCR::NEWLINE, $a3, $c2, "l", "p", " ", $a8, "!"
; [KOREY]Er, well, okay, if you're sure!
.byt SCR::NARRATE, CHAR::KOREY, "E", "r", $f4, $c7, "l", "l", $f4, "o", "k", "a", "y", $f4, $cd, " ", $a5, "'", $fa, " ", "s", "u", $fa, "!"
.byt SCR::END_SCRIPT
JohnMeet:
.byt SCR::SCENE, SCENES::NOVA_AND_JOHN
; <1 JOHN>I'll be honest here, I just wanted to be a boss so badly that I didn't care WHICH team I was on.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::JOHN, $d4, " ", $b9, "h", $ab, $dd, " ", $a8, "e", $f4, $bf, "j", "u", $dd, SCR::NEWLINE, "w", $c9, $ea, $ff, $ba, $b9, $bd, "b", "o", $f0, " ", $cb, " ", "b", $f6, "l", "y", SCR::NEWLINE, $99, $bf, "d", "i", "d", "n", $e7, "c", "a", $fa, " ", "W", "H", "I", "C", "H", " ", $ea, "a", "m", SCR::NEWLINE, $bf, "w", $c3, " ", $c1, "."
; <0 NOVA_SILLY>Well congratulations, you're on the losing one.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_SILLY, "W", "e", "l", "l", " ", "c", $c1, "g", "r", $c5, "u", "l", $c5, "i", $c1, "s", $f4, $a5, "'", $fa, SCR::NEWLINE, $c1, " ", $a1, " ", "l", "o", "s", $b0, " ", $ab, "."
; <1 JOHN>Just give me this fight, okay?
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::JOHN, "J", "u", $dd, " ", "g", "i", "v", $e6, $cf, " ", $98, " ", "f", "i", $da, "t", $f4, "o", "k", "a", "y", "?"
; <0 NOVA>Ha, sure thing.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "H", "a", $f4, "s", "u", $fa, " ", $df, $b0, "."
.byt SCR::END_SCRIPT
JohnAfterFight:
.byt SCR::SCENE, SCENES::NOVA_AND_JOHN
; <0 NOVA>Where'd you learn to do THAT?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "W", $a8, "e", "'", $ff, $a5, " ", "l", $eb, "r", "n", " ", $ba, $c4, SCR::NEWLINE, "T", "H", "A", "T", "?"
; <1 JOHN>Oh, I have a whale friend who does something sort of like that.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::JOHN, "O", "h", $f4, $bf, $9a, $bd, $d9, "a", "l", $e6, "f", $fc, $e5, $ff, $d9, "o", SCR::NEWLINE, $c4, "e", $fb, $9b, $df, $b0, " ", $cb, $ed, " ", $bc, $8c, SCR::NEWLINE, $df, $c5, "."
.byt SCR::END_SCRIPT
NovaLiaLWSS:
.byt SCR::SCENE, SCENES::NOVA_AND_LIA
; <0 NOVA>Oh hey, it's Lia again!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "O", "h", " ", $c2, "y", $f4, "i", "t", $e8, "L", "i", $bd, "a", "g", "a", $d7, "!"
; <1 LIA>Heya Nova! Remember those weird pixelly things back in Bummer Club?
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "H", "e", "y", $bd, $a0, $fd, "R", "e", $cf, "m", "b", $ec, " ", $df, "o", $e4, SCR::NEWLINE, $c7, "i", "r", $ff, "p", "i", "x", "e", "l", $d1, $df, $b0, $fb, "b", "a", $f2, " ", $d7, SCR::NEWLINE, "B", "u", "m", $cf, $e9, "C", "l", "u", "b", "?"
; <0 NOVA>The gliders and lightweight spaceships?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, $f7, $e6, "g", "l", "i", "d", $ec, $fb, $a3, "l", "i", $da, "t", $c7, "i", $da, "t", SCR::NEWLINE, $dc, "a", "c", "e", $de, "i", "p", "s", "?"
; <1 LIA>Yeahs! Watch this, I've been experimenting with the gliders...
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "Y", $eb, "h", "s", $fd, "W", $c5, $e1, " ", $98, $f4, "I", "'", "v", $e6, "b", $d6, "n", SCR::NEWLINE, "e", "x", "p", $ec, "i", $cf, $e0, $b0, " ", $9c, " ", $a1, SCR::NEWLINE, "g", "l", "i", "d", $ec, "s", ".", ".", "."
; []Lia sets down three glider guns, setting them to fire into the same spot in exactly the right way... and a rideable lightweight spaceship appears.
.byt SCR::NARRATE, CHAR::NONE, "L", "i", $bd, $e4, "t", $fb, $c4, "w", "n", " ", $df, $fa, $e6, "g", "l", "i", "d", $ec, SCR::NEWLINE, "g", $f1, "s", $f4, $e4, "t", "t", $b0, " ", $91, " ", $ba, "f", "i", $fa, " ", $d7, $bb, SCR::NEWLINE, $a1, " ", "s", "a", $cf, " ", $dc, "o", $d2, $be, "e", "x", "a", $c6, $d1, $a1, SCR::NEWLINE, $fc, $da, $d2, $b6, ".", ".", $f5, $a3, $bd, $fc, "d", $eb, "b", "l", "e", SCR::NEWLINE, "l", "i", $da, "t", $c7, "i", $da, $d2, $dc, "a", "c", "e", $de, "i", "p", SCR::NEWLINE, "a", "p", "p", $eb, "r", "s", "."
; <1 LIA>Dere, you can ride this into the bad guys' headquarters.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "D", $ec, "e", $f4, $a5, " ", $af, " ", $fc, "d", $e6, $98, " ", $d7, $bb, SCR::NEWLINE, $a1, " ", "b", $f6, " ", "g", "u", "y", "s", "'", " ", $c2, $f6, "q", "u", "a", $ed, $ec, "s", "."
; <0 NOVA>Uhh, are you sure it's safe?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "U", "h", "h", $f4, "a", $fa, " ", $a5, " ", "s", "u", $fa, " ", "i", "t", $e8, "s", "a", "f", "e", "?"
; <1 LIA>Should be!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "S", "h", $9f, " ", "b", "e", "!"
.byt SCR::SCENE, SCENES::NOVA_ALONE
; []Nova hops onto the spaceship and it takes off! It flies a pretty long distance, seemingly without any problems...
.byt SCR::NARRATE, CHAR::NONE, $a0, " ", "h", "o", "p", $fb, $c1, $ba, $a1, SCR::NEWLINE, $dc, "a", "c", "e", $de, "i", "p", " ", $a3, $c0, $8f, $fb, "o", "f", "f", $fd, "I", "t", SCR::NEWLINE, "f", "l", $e2, $fb, $bd, "p", $fa, "t", "t", $fe, "l", $c1, "g", " ", "d", $b8, "t", $c9, "c", "e", ",", SCR::NEWLINE, $b2, "m", $b0, $d1, $9c, $ad, " ", $aa, SCR::NEWLINE, $81, "s", ".", ".", "."
; <0 NOVA_YAY>Weee, I'm going so fast. Wait, what's that?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_YAY, "W", $d6, "e", $f4, $d3, $ce, $b0, " ", $cb, " ", "f", $c3, "t", $f5, "W", "a", "i", "t", ",", SCR::NEWLINE, $8a, $e8, $df, $c5, "?"
; []... but eventually gets hit by a stray glider, causing the ship to disintegrate and causing the squirrel to fall into a rather strange place.
.byt SCR::NARRATE, CHAR::NONE, ".", ".", $f5, $a6, " ", $9e, "t", "u", $ac, $fe, $ae, $fb, "h", $c0, "b", "y", SCR::NEWLINE, $bd, $dd, "r", "a", $fe, "g", "l", "i", "d", $ec, $f4, "c", "a", "u", "s", $b0, " ", $a1, SCR::NEWLINE, $de, "i", "p", " ", $ba, "d", $b8, $d7, $ea, "g", "r", $c5, $e6, $c9, "d", SCR::NEWLINE, "c", "a", "u", "s", $b0, " ", $a1, " ", $80, " ", $ba, "f", $ac, SCR::NEWLINE, $d7, $ba, $bd, "r", $c5, $a8, " ", $dd, "r", $c9, "g", $e6, "p", "l", "a", "c", "e", "."
; >0 NOVA_WOW<Aaaaa, okay, I had no idea it was that fragile! I'll go see what the forums think I should do.
.byt SCR::THINK, SCR::SPEAKER_0|CHAR::NOVA_WOW, "A", "a", "a", "a", "a", $f4, "o", "k", "a", "y", $f4, $bf, "h", $f6, " ", $d0, " ", "i", "d", $eb, " ", "i", "t", SCR::NEWLINE, "w", $c3, " ", $99, "f", "r", "a", "g", $db, "e", $fd, $d4, " ", $ce, " ", $b2, SCR::NEWLINE, $8a, " ", $a1, " ", $a4, "u", "m", $fb, $82, " ", "I", SCR::NEWLINE, $de, $9f, " ", $c4, "."
.byt SCR::SCENE, SCENES::FORUMS
; []-halp I've been taken-
.byt SCR::NARRATE, CHAR::NONE, $86
; [NOVA]Er, the ship Lia made for me broke.
.byt SCR::NARRATE, CHAR::NOVA, "E", "r", $f4, $a1, " ", $de, "i", "p", " ", "L", "i", $bd, "m", $f6, $e6, $a4, " ", $cf, SCR::NEWLINE, "b", "r", "o", "k", "e", "."
; [KOREY]Made? Uh oh. Nova, those ships aren't very stable.
.byt SCR::NARRATE, CHAR::KOREY, "M", $f6, "e", "?", " ", "U", "h", " ", "o", "h", $f5, $a0, $f4, $df, "o", $e4, SCR::NEWLINE, $de, "i", "p", $fb, "a", $fa, "n", $e7, "v", $ec, $fe, $dd, "a", "b", "l", "e", "."
; [NOVA_SILLY]Well I can see that -now-. Guess I'll have to find another ride around here.
.byt SCR::NARRATE, CHAR::NOVA_SILLY, "W", "e", "l", "l", " ", $bf, $af, " ", $b2, " ", $99, "-", $b3, "-", ".", SCR::NEWLINE, "G", "u", "e", $f0, " ", $d4, " ", $9a, $ba, "f", $d7, "d", SCR::NEWLINE, $c9, "o", $a1, $e9, $fc, "d", $e6, "a", "r", $f3, $ef, " ", $a8, "e", "."
; [SHERWIN]Well, hopefully you can get to Atomic Videoclip Zone soon! The Scheme Team are doing some really strange things.
.byt SCR::NARRATE, CHAR::SHERWIN, "W", "e", "l", "l", $f4, "h", "o", "p", "e", "f", "u", "l", $d1, $a5, " ", $af, " ", $ae, SCR::NEWLINE, $ba, $85, SCR::NEWLINE, $cb, $c1, $fd, $f7, $e6, "S", $e1, "e", $cf, " ", "T", $eb, "m", " ", "a", $fa, SCR::NEWLINE, $c4, $b0, " ", $9b, " ", $fa, $ac, $fe, $dd, "r", $c9, "g", "e", SCR::NEWLINE, $df, $b0, "s", "."
; [SHERWIN]They have one of those spinner things that make animal noises, but I think it's some sort of secret doomsday device. OR maybe they're just trying to throw us off. That sounds likely too.
.byt SCR::NARRATE, CHAR::SHERWIN, $f7, "e", $fe, $9a, $ab, " ", $bc, $df, "o", $e4, SCR::NEWLINE, $dc, $d7, $f8, $e9, $df, $b0, $fb, $99, "m", "a", "k", "e", SCR::NEWLINE, $c9, "i", "m", "a", "l", " ", $d0, $b8, "e", "s", $f4, $a6, " ", $bf, $82, " ", "i", "t", "'", "s", SCR::NEWLINE, $9b, " ", $cb, $ed, " ", $bc, $e4, "c", $fa, "t", SCR::NEWLINE, $c4, "o", "m", "s", "d", "a", $fe, "d", "e", "v", "i", "c", "e", $f5, "O", "R", " ", "m", "a", "y", "b", "e", SCR::NEWLINE, $97, "'", $fa, " ", $8d, $f9, "y", $b0, " ", $ba, $df, "r", "o", "w", SCR::NEWLINE, "u", $fb, "o", "f", "f", $f5, $f7, $c5, " ", $cb, $f1, "d", $fb, $8c, "l", "y", SCR::NEWLINE, $bb, "o", "."
; [KOREY]Are you hurt from the fall, Nova?
.byt SCR::NARRATE, CHAR::KOREY, "A", $fa, " ", $a5, " ", "h", "u", $ed, " ", $96, $a1, " ", "f", $ac, ",", SCR::NEWLINE, $a0, "?"
; [NOVA]Nah, I don't take fall damage, but I've still gotta get to my destination! This place is pretty weird...
.byt SCR::NARRATE, CHAR::NOVA, "N", "a", "h", $f4, $bf, $c4, "n", $e7, $8f, " ", "f", $ac, " ", "d", "a", "m", "a", "g", "e", ",", SCR::NEWLINE, $a6, " ", "I", "'", "v", $e6, $dd, $db, "l", " ", $ce, "t", "t", $bd, $ae, " ", $ba, $ca, SCR::NEWLINE, "d", "e", $dd, $d7, $c5, "i", $c1, $fd, $f7, $b7, "p", "l", "a", "c", $e6, $b8, SCR::NEWLINE, "p", $fa, "t", "t", $fe, $c7, "i", "r", "d", ".", ".", "."
; [KOREY]Uh oh, that's probably the World of Insanity. Definitely try to find a ride out of there!
.byt SCR::NARRATE, CHAR::KOREY, "U", "h", " ", "o", "h", $f4, $df, $c5, $e8, "p", "r", "o", "b", "a", "b", $d1, $a1, SCR::NEWLINE, "W", $c8, $ee, " ", $bc, "I", "n", "s", $c9, "i", "t", "y", $f5, "D", "e", "f", $d7, "i", $ea, "l", "y", SCR::NEWLINE, $f9, $fe, $ba, "f", $d7, $ff, $bd, $fc, "d", $e6, $ad, " ", "o", "f", SCR::NEWLINE, $87, "!"
.byt SCR::END_SCRIPT
BeforeFighterMaker:
.byt SCR::SCENE, SCENES::BAD_GUYS_AND_LEADER
; <2 BILL>Okay we need to bring out the big guns if we want to stop this squirrel. Maybe this fighter I just made will do the trick?
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::BILL, "O", "k", "a", $fe, $c7, " ", $f8, $d5, $ba, "b", $fc, "n", "g", " ", $ad, SCR::NEWLINE, $a1, " ", "b", "i", "g", " ", "g", $f1, $fb, $cd, " ", $c7, " ", "w", $c9, $d2, $bb, SCR::NEWLINE, $dd, "o", "p", " ", $98, " ", $80, $f5, "M", "a", "y", $b9, $98, SCR::NEWLINE, "f", "i", $da, $ea, $e9, $bf, $8d, "m", $f6, $e6, $9d, " ", $c4, " ", $a1, SCR::NEWLINE, $f9, "i", $f2, "?"
; <0 S_TEAM>You just made a fighter out of thin air?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::S_TEAM, "Y", $f3, " ", $8d, "m", $f6, $e6, $bd, "f", "i", $da, $ea, $e9, $ad, SCR::NEWLINE, $bc, $df, $be, "a", "i", "r", "?"
; <2 BILL>Yes, thanks to this software I just found!
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::BILL, "Y", "e", "s", $f4, $92, "k", $fb, $ba, $98, " ", $cb, "f", "t", "w", "a", $fa, " ", "I", SCR::NEWLINE, $8d, "f", $f3, $ef, "!"
.byt SCR::SCENE, SCENES::NOVA_ALONE
; <0 NOVA_WOW>... What is that thing? Why's it coming after me? ... Oh, it must be another boss.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_WOW, ".", ".", $f5, "W", "h", $c5, " ", $b7, $99, $df, $b0, "?", " ", "W", "h", "y", $e8, "i", "t", SCR::NEWLINE, "c", "o", "m", $b0, " ", $83, " ", $cf, "?", " ", ".", ".", $f5, "O", "h", $f4, "i", "t", SCR::NEWLINE, "m", "u", $dd, " ", $b9, $c9, "o", $a1, $e9, "b", "o", $f0, "."
.byt SCR::END_SCRIPT
AfterFighterMaker:
.byt SCR::SCENE, SCENES::NOVA_ALONE
; <0 NOVA>That was a strange fight.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, $f7, $c5, " ", "w", $c3, " ", $bd, $dd, "r", $c9, "g", $e6, "f", "i", $da, "t", "."
; [BILL]Crap, she got past the freak! I remember what Jack told me, when there's a problem there IS a solution.
.byt SCR::NARRATE, CHAR::BILL, "C", "r", "a", "p", $f4, $a9, " ", $ce, $d2, "p", $c3, $d2, $a1, " ", "f", $fa, "a", "k", "!", SCR::NEWLINE, $bf, $fa, $cf, "m", "b", $ec, " ", $8a, " ", "J", "a", $f2, " ", $bb, $ee, " ", $cf, ",", SCR::NEWLINE, $d9, $e5, " ", $87, $e8, $bd, $81, " ", $87, SCR::NEWLINE, "I", "S", " ", $bd, $cb, "l", "u", "t", "i", $c1, "."
; [BILL]CAN DO, WILL DO!
.byt SCR::NARRATE, CHAR::BILL, "C", "A", "N", " ", "D", "O", $f4, "W", "I", "L", "L", " ", "D", "O", "!"
.byt SCR::END_SCRIPT
BeforeJack:
.byt SCR::SCENE, SCENES::NOVA_ALONE
; []A large plastic man appears, calling himself Jack. He raises himself and Nova into the air for a battle in the sky!
.byt SCR::NARRATE, CHAR::NONE, "A", " ", "l", "a", "r", "g", $e6, "p", "l", $c3, "t", "i", "c", " ", "m", $c9, " ", "a", "p", "p", $eb, "r", "s", ",", SCR::NEWLINE, "c", $ac, $b0, " ", $b1, $e4, "l", "f", " ", "J", "a", $f2, $f5, "H", $e6, "r", "a", $b8, "e", "s", SCR::NEWLINE, $b1, $e4, "l", "f", " ", $a3, $a0, " ", $d7, $ba, $a1, " ", "a", "i", "r", SCR::NEWLINE, $a4, " ", $bd, "b", $c5, "t", "l", $e6, $be, $a1, " ", "s", "k", "y", "!"
; <0 NOVA_AW>What the heck?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_AW, "W", "h", $c5, " ", $a1, " ", $c2, $f2, "?"
.byt SCR::END_SCRIPT
AfterJack:
.byt SCR::SCENE, SCENES::NOVA_ALONE
; <0 NOVA>Oof, I'm back on solid ground again.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "O", "o", "f", $f4, $d3, "b", "a", $f2, " ", $c1, " ", $cb, "l", "i", $ff, "g", "r", $f3, $ef, SCR::NEWLINE, "a", "g", "a", $d7, "."
; [BILL]Ugh, more like Can't Do, Won't Do.
.byt SCR::NARRATE, CHAR::BILL, "U", $da, $f4, "m", $c8, $e6, $8c, " ", "C", $c9, $e7, "D", "o", $f4, "W", $c1, "'", "t", SCR::NEWLINE, "D", "o", "."
.byt SCR::END_SCRIPT
MeetRemy:
.byt SCR::SCENE, SCENES::NOVA_AND_REMY
; <0 NOVA>Hi, I'm Nova. Whatcha doing here?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "H", "i", $f4, $d3, $a0, $f5, "W", "h", $c5, $e1, $bd, $c4, $b0, SCR::NEWLINE, $a8, "e", "?"
; <1 REMY>Ay, I'mma bounty huntin' space squirrel, an' I've been lookin' for work 'ere.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::REMY, "A", "y", $f4, "I", "'", "m", "m", $bd, "b", $f3, $e0, $fe, "h", $f1, "t", $d7, "'", SCR::NEWLINE, $dc, "a", "c", $e6, $80, $f4, $c9, "'", " ", "I", "'", "v", $e6, "b", $d6, "n", SCR::NEWLINE, $94, $d7, "'", " ", $a4, " ", "w", $c8, "k", " ", "'", $ec, "e", "."
; >0 NOVA_WOW<Four squirrels in one game? Amazing.
.byt SCR::THINK, SCR::SPEAKER_0|CHAR::NOVA_WOW, "F", $b5, " ", $80, $fb, $be, $ab, " ", "g", "a", $cf, "?", SCR::NEWLINE, "A", "m", "a", "z", $b0, "."
; <0 NOVA_WOW>SPACE squirrel? So I imagine you have a cool ship?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_WOW, "S", "P", "A", "C", "E", " ", $80, "?", " ", "S", "o", " ", $bf, "i", "m", "a", "g", $d7, "e", SCR::NEWLINE, $a5, " ", $9a, $bd, "c", $e3, "l", " ", $de, "i", "p", "?"
; <1 REMY>Ya, d'ya need ta' get somewhere?
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::REMY, "Y", "a", $f4, "d", "'", "y", $bd, $f8, $d5, "t", "a", "'", " ", $ae, SCR::NEWLINE, $9b, $d9, $ec, "e", "?"
; <0 NOVA>Yes actually. Do you think you could get me to Atomic Videoclip Zone?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "Y", "e", $fb, "a", $c6, "u", $ac, "y", $f5, "D", "o", " ", $a5, " ", $82, SCR::NEWLINE, $a5, " ", "c", $9f, " ", $ae, " ", $cf, " ", $ba, "A", $bb, "m", "i", "c", SCR::NEWLINE, "V", "i", "d", "e", "o", "c", "l", "i", "p", " ", "Z", $ab, "?"
; <1 REMY>Sure. Nothin' betta ta' do.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::REMY, "S", "u", $fa, $f5, "N", "o", $df, $d7, "'", " ", "b", "e", "t", "t", $bd, "t", "a", "'", " ", $c4, "."
; >0 NOVA<Fingers crossed!
.byt SCR::THINK, SCR::SPEAKER_0|CHAR::NOVA, "F", $b0, $ec, $fb, "c", "r", "o", $f0, "e", "d", "!"
; []The two of them get into Remy's spaceship, which is much more stable than a LWSS, and fly to Atomic Videoclip Zone safely. Remy slips off to do whatever once they arrive.
.byt SCR::NARRATE, CHAR::NONE, $f7, $e6, "t", "w", "o", " ", $bc, $91, " ", $ae, " ", $d7, $bb, SCR::NEWLINE, "R", "e", $ca, $e8, $dc, "a", "c", "e", $de, "i", "p", $f4, $d9, "i", $e1, " ", $b8, SCR::NEWLINE, "m", "u", $e1, " ", "m", $c8, $e6, $dd, "a", "b", "l", $e6, $92, " ", "a", SCR::NEWLINE, "L", "W", "S", "S", $f4, $a3, "f", $d1, $ba, "A", $bb, "m", "i", "c", SCR::NEWLINE, "V", "i", "d", "e", "o", "c", "l", "i", "p", " ", "Z", $ab, " ", "s", "a", "f", "e", "l", "y", $f5, "R", "e", $ca, SCR::NEWLINE, "s", "l", "i", "p", $fb, "o", "f", "f", " ", $ba, $c4, " ", $8a, "e", "v", $ec, " ", $c1, "c", "e", SCR::NEWLINE, $97, " ", "a", $d8, "i", "v", "e", "."
.byt SCR::SCENE, SCENES::NOVA_ALONE
; <0 NOVA>Hey, we made it! And I bet a cool bounty hunter squirrel could be a big help in saving this world.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "H", "e", "y", $f4, $c7, " ", "m", $f6, $e6, "i", "t", $fd, "A", $ef, " ", $bf, "b", "e", $d2, "a", SCR::NEWLINE, "c", $e3, "l", " ", "b", $f3, $e0, $fe, "h", $f1, $ea, $e9, $80, SCR::NEWLINE, "c", $9f, " ", $b9, $bd, "b", "i", "g", " ", $c2, "l", "p", " ", $be, "s", "a", "v", $b0, SCR::NEWLINE, $98, " ", "w", $c8, $ee, "."
; <0 NOVA_AW>... Remy?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_AW, ".", ".", $f5, "R", "e", $ca, "?"
.byt SCR::SCENE, SCENES::NOVA_REMY_JAFGUAR
; <1 REMY>Oh, my bad, I juss met dis genie guy, an' he sounds more fun than this 'saving the world' thing, so seeya.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::REMY, "O", "h", $f4, $ca, " ", "b", $f6, $f4, $bf, "j", "u", $f0, " ", $cf, $d2, "d", $b8, SCR::NEWLINE, "g", $e5, $e2, " ", "g", "u", "y", $f4, $c9, "'", " ", $c2, " ", $cb, $f1, "d", $fb, "m", $c8, "e", SCR::NEWLINE, "f", $f1, " ", $92, " ", $98, " ", "'", "s", "a", "v", $b0, " ", $a1, SCR::NEWLINE, "w", $c8, $ee, "'", " ", $df, $b0, $f4, $cb, " ", $b2, "y", "a", "."
; <2 JAFGUAR>Yeah who cares?
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::JAFGUAR, "Y", $eb, "h", " ", $d9, "o", " ", "c", "a", $fa, "s", "?"
; <0 NOVA>Well then, maybe I really am supposed to do it alone.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "W", "e", "l", "l", " ", $93, $f4, "m", "a", "y", $b9, $bf, $fa, $ac, $fe, "a", "m", SCR::NEWLINE, "s", $cc, "p", "o", $e4, $ff, $ba, $c4, " ", $c0, "a", "l", $ab, "."
; <0 NOVA>You know, for an evil headquarters, I was expecting something... darker? Aaaa, these enemies sure are shooty though!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "Y", $f3, " ", $8e, $f4, $a4, " ", $c9, " ", "e", "v", $db, SCR::NEWLINE, $c2, $f6, "q", "u", "a", $ed, $ec, "s", $f4, $bf, "w", $c3, " ", "e", "x", "p", "e", $c6, $b0, SCR::NEWLINE, $9b, $df, $b0, ".", ".", $f5, "d", "a", "r", "k", $ec, "?", " ", "A", "a", "a", "a", ",", SCR::NEWLINE, $88, $e5, "e", "m", $e2, $fb, "s", "u", $fa, " ", "a", $fa, SCR::NEWLINE, $de, $e3, "t", $fe, $df, $f3, $da, "!"
; [NOVA]Going in! Wish me luck!
.byt SCR::NARRATE, CHAR::NOVA, "G", "o", $b0, " ", $d7, $fd, "W", $b8, "h", " ", $cf, " ", "l", "u", $f2, "!"
.byt SCR::END_SCRIPT
BeforeBill:
.byt SCR::SCENE, SCENES::FORUMS
; [NOVA]Alright, I'm just about to face off with the final boss! When I take him down, this'll all be over, right?
.byt SCR::NARRATE, CHAR::NOVA, "A", "l", $fc, $da, "t", $f4, $d3, $8d, $89, $ba, "f", "a", "c", "e", SCR::NEWLINE, "o", "f", "f", " ", $9c, " ", $a1, " ", "f", $d7, "a", "l", " ", "b", "o", $f0, $fd, "W", $c2, "n", " ", "I", SCR::NEWLINE, $8f, " ", $b1, " ", $c4, "w", "n", $f4, $98, "'", "l", "l", " ", $ac, " ", "b", "e", SCR::NEWLINE, $8b, $f4, $fc, $da, "t", "?"
; [KOREY]Yup! And then I can take you home. Sorry for making you go through all of this for us...
.byt SCR::NARRATE, CHAR::KOREY, "Y", $cc, $fd, "A", $ef, " ", $93, " ", $bf, $af, " ", $8f, " ", $a5, SCR::NEWLINE, "h", "o", $cf, $f5, "S", $c8, "r", $fe, $a4, " ", "m", "a", "k", $b0, " ", $a5, SCR::NEWLINE, $ce, " ", $df, "r", $f3, $da, " ", $ac, " ", $bc, $98, " ", $a4, " ", "u", "s", ".", ".", "."
; [SHERWIN]You can do it! I wanna get out of here so badly!
.byt SCR::NARRATE, CHAR::SHERWIN, "Y", $f3, " ", $af, " ", $c4, " ", "i", "t", $fd, $bf, "w", $c9, "n", $bd, $ae, " ", $ad, SCR::NEWLINE, $bc, $a8, $e6, $cb, " ", "b", $f6, "l", "y", "!"
; [IKE]Good luck!
.byt SCR::NARRATE, CHAR::IKE, "G", $e3, $ff, "l", "u", $f2, "!"
; [NOVA]Thank you everyone! I'll do my best!
.byt SCR::NARRATE, CHAR::NOVA, $f7, $c9, "k", " ", $a5, " ", "e", "v", $ec, "y", $ab, $fd, $d4, " ", $c4, SCR::NEWLINE, $ca, " ", "b", "e", $dd, "!"
; [LIA]'kay Nova! I think he's gonna go all out, and he might be too strong... BUT remember the legend of how he was defeated last time?
.byt SCR::NARRATE, CHAR::LIA, "'", "k", "a", $fe, $a0, $fd, $bf, $82, " ", $c2, $e8, $ce, "n", "n", "a", SCR::NEWLINE, $ce, " ", $ac, " ", $ad, $f4, $a3, $c2, " ", "m", "i", $da, $d2, "b", "e", SCR::NEWLINE, $bb, "o", " ", $dd, "r", $c1, "g", ".", ".", $f5, "B", "U", "T", " ", $fa, $cf, "m", "b", $ec, SCR::NEWLINE, $a1, " ", "l", "e", "g", $e5, $ff, $bc, $b4, " ", $c2, " ", "w", $c3, SCR::NEWLINE, "d", "e", "f", $eb, $ea, $ff, "l", $c3, $d2, "t", "i", $cf, "?"
; [NOVA]By reflecting his projectiles back into himself?
.byt SCR::NARRATE, CHAR::NOVA, "B", $fe, $fa, "f", "l", "e", $c6, $b0, " ", "h", $b7, "p", "r", "o", "j", "e", $c6, $db, "e", "s", SCR::NEWLINE, "b", "a", $f2, " ", $d7, $ba, $b1, $e4, "l", "f", "?"
; [LIA]Yus! I fink dat's the key to victory. Take dat mirror scepter and show him not to mess with a squirrel!
.byt SCR::NARRATE, CHAR::LIA, "Y", "u", "s", $fd, $bf, "f", $d7, "k", " ", "d", $c5, $e8, $a1, " ", "k", "e", $fe, $bb, SCR::NEWLINE, "v", "i", $c6, $c8, "y", $f5, "T", "a", "k", $e6, "d", $c5, " ", "m", "i", $d8, $c8, SCR::NEWLINE, "s", "c", "e", "p", $ea, $e9, $a3, $de, "o", "w", " ", $b1, " ", $a2, " ", $bb, SCR::NEWLINE, $cf, $f0, " ", $9c, " ", $bd, $80, "!"
.byt SCR::SCENE, SCENES::NOVA_ALONE
; >0 NOVA_AW<Here it is, the final battle. I've gotta give my best shot.
.byt SCR::THINK, SCR::SPEAKER_0|CHAR::NOVA_AW, "H", $ec, $e6, $c0, $b8, $f4, $a1, " ", "f", $d7, "a", "l", " ", "b", $c5, "t", "l", "e", ".", SCR::NEWLINE, "I", "'", "v", $e6, $ce, "t", "t", $bd, "g", "i", "v", $e6, $ca, " ", "b", "e", $dd, " ", $de, "o", "t", "."
; []Nova drinks the F-a-ancy cola and equips the Mirror Scepter in preparation for the battle, then nervously walks through the door...
.byt SCR::NARRATE, CHAR::NONE, $a0, " ", "d", $fc, "n", "k", $fb, $a1, " ", "F", "-", "a", "-", $c9, "c", "y", SCR::NEWLINE, "c", "o", "l", $bd, $a3, "e", "q", "u", "i", "p", $fb, $a1, " ", "M", "i", $d8, $c8, SCR::NEWLINE, "S", "c", "e", "p", $ea, $e9, $be, "p", $fa, "p", "a", "r", $c5, "i", $c1, " ", $a4, SCR::NEWLINE, $a1, " ", "b", $c5, "t", "l", "e", $f4, $93, " ", $f8, "r", "v", $f3, "s", "l", "y", SCR::NEWLINE, "w", "a", "l", "k", $fb, $df, "r", $f3, $da, " ", $a1, " ", $c4, $c8, ".", ".", "."
.byt SCR::TRANSITION
.byt SCR::SCENE, SCENES::NOVA_AND_BILL
; <1 BILL>You know, you've become a real pain in the butt. I'm going to destroy you.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::BILL, "Y", $f3, " ", $8e, $f4, $a5, "'", "v", $e6, "b", "e", $95, " ", "a", SCR::NEWLINE, $fa, "a", "l", " ", "p", "a", $be, $be, $a1, " ", $a6, "t", $f5, $d3, $ce, $b0, SCR::NEWLINE, $ba, "d", "e", $dd, "r", "o", $fe, $a5, "."
; <0 NOVA_MAD>I care about the people here and I'm going to save their world. I'm not going to let you ruin it!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_MAD, $bf, "c", "a", $fa, " ", $89, $a1, " ", "p", "e", "o", "p", "l", $e6, $a8, "e", SCR::NEWLINE, $a3, $d3, $ce, $b0, " ", $ba, "s", "a", "v", $e6, $a1, "i", "r", SCR::NEWLINE, "w", $c8, $ee, $f5, $d3, $a2, " ", $ce, $b0, " ", $ba, $a7, " ", $a5, SCR::NEWLINE, "r", "u", $be, "i", "t", "!"
; <1 BILL>You're toast.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::BILL, "Y", $f3, "'", $fa, " ", $bb, $c3, "t", "."
.byt SCR::END_SCRIPT
AfterBill:
.byt SCR::SCENE, SCENES::NOVA_ALONE
; <0 NOVA_YAY>W-wow, did I really just win?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_YAY, "W", "-", "w", "o", "w", $f4, "d", "i", $ff, $bf, $fa, $ac, $fe, $8d, "w", $d7, "?"
.byt SCR::SCENE, SCENES::NOVA_AND_SHERWIN
; []Having defeated Bill and the Scheme Team, Nova then finally frees Sherwin.
.byt SCR::NARRATE, CHAR::NONE, "H", "a", "v", $b0, " ", "d", "e", "f", $eb, $ea, $ff, "B", $db, "l", " ", $a3, $a1, SCR::NEWLINE, "S", $e1, "e", $cf, " ", "T", $eb, "m", $f4, $a0, " ", $93, SCR::NEWLINE, "f", $d7, $ac, $fe, "f", $fa, "e", $fb, "S", $a8, "w", $d7, "."
; <1 SHERWIN>Thank you for rescuing me! I always believed in you, Nova.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SHERWIN, $f7, $c9, "k", " ", $a5, " ", $a4, " ", $fa, "s", "c", "u", $b0, " ", $cf, $fd, "I", SCR::NEWLINE, "a", "l", $b6, $fb, "b", "e", "l", $e2, "v", $d5, $be, $a5, $f4, $a0, "."
.byt SCR::SCENE, SCENES::NOVA_SHERWIN_KOREY
; []Korey also shows up.
.byt SCR::NARRATE, CHAR::NONE, "K", $c8, "e", $fe, "a", "l", $cb, " ", $de, "o", "w", $fb, $cc, "."
; <2 KOREY>Latte will be eternally grateful. Are you ready to go home?
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::KOREY, $84, " ", $9d, " ", $b9, "e", $ea, "r", "n", $ac, "y", SCR::NEWLINE, "g", "r", $c5, "e", "f", "u", "l", $f5, "A", $fa, " ", $a5, " ", $fa, $f6, $fe, $ba, $ce, SCR::NEWLINE, "h", "o", $cf, "?"
; <0 NOVA>Actually, I'm not. I want to keep having adventures, and all of my friends are here with me.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "A", $c6, "u", $ac, "y", $f4, $d3, $a2, $f5, $bf, "w", $c9, $d2, $bb, SCR::NEWLINE, "k", $d6, "p", " ", "h", "a", "v", $b0, " ", $f6, "v", $e5, "t", "u", $fa, "s", $f4, $c9, "d", SCR::NEWLINE, $ac, " ", $bc, $ca, " ", "f", $fc, $e5, "d", $fb, "a", $fa, " ", $a8, "e", SCR::NEWLINE, $9c, " ", $cf, "."
; <2 KOREY>I figured you'd say that. Well in that case I have something to show you~
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::KOREY, $bf, "f", "i", "g", "u", $fa, $ff, $a5, "'", $ff, "s", "a", $fe, $df, $c5, $f5, "W", "e", "l", "l", SCR::NEWLINE, $be, $99, "c", $c3, $e6, $bf, $9a, $9b, $df, $b0, SCR::NEWLINE, $ba, $de, "o", "w", " ", $a5, "~"
.byt SCR::SCENE, SCENES::NOTHING
; []Korey takes Nova to a room with a small space ship in the middle
.byt SCR::NARRATE, CHAR::NONE, "K", $c8, "e", $fe, $8f, $fb, $a0, " ", $ba, $bd, "r", $e3, "m", SCR::NEWLINE, $9c, " ", $bd, "s", "m", $ac, " ", $dc, "a", "c", $e6, $de, "i", "p", " ", $be, $a1, SCR::NEWLINE, "m", "i", "d", "d", "l", "e"
; [KOREY]Nova, this is the MV Explorer. It can take you to other worlds. You can forge your own destiny and decide what you want to do with your ability.
.byt SCR::NARRATE, CHAR::KOREY, $a0, $f4, $98, " ", $b7, $a1, " ", "M", "V", " ", "E", "x", "p", "l", $c8, $ec, ".", SCR::NEWLINE, "I", $d2, $af, " ", $8f, " ", $a5, " ", $ba, "o", $a1, "r", SCR::NEWLINE, "w", $c8, $ee, "s", $f5, "Y", $f3, " ", $af, " ", $a4, "g", $e6, $90, SCR::NEWLINE, "o", "w", "n", " ", "d", "e", $dd, $d7, $fe, $a3, "d", "e", "c", "i", "d", $e6, $8a, SCR::NEWLINE, $a5, " ", "w", $c9, $d2, $ba, $c4, " ", $9c, " ", $90, SCR::NEWLINE, "a", "b", $db, "i", "t", "y", "."
; [NOVA_WOW]Wow, was this what you were going to use to take me home?
.byt SCR::NARRATE, CHAR::NOVA_WOW, "W", "o", "w", $f4, "w", $c3, " ", $98, " ", $8a, " ", $a5, " ", $c7, $fa, SCR::NEWLINE, $ce, $b0, " ", $ba, "u", $e4, " ", $ba, $8f, " ", $cf, SCR::NEWLINE, "h", "o", $cf, "?"
; [KOREY]Yeah, but I'm giving it to you. There are a bunch of worlds in need of help.
.byt SCR::NARRATE, CHAR::KOREY, "Y", $eb, "h", $f4, $a6, " ", $d3, "g", "i", "v", $b0, " ", $c0, $ba, $a5, ".", SCR::NEWLINE, $f7, $ec, $e6, "a", $fa, " ", $bd, "b", $f1, $e1, " ", $bc, "w", $c8, $ee, "s", SCR::NEWLINE, $be, $f8, $d5, $bc, $c2, "l", "p", "."
; [NOVA]Well thank you Korey! I can't wait to see what kind of adventures I have in the future...
.byt SCR::NARRATE, CHAR::NOVA, "W", "e", "l", "l", " ", $92, "k", " ", $a5, " ", "K", $c8, "e", "y", $fd, $bf, $af, "'", "t", SCR::NEWLINE, "w", "a", $c0, $ba, $b2, " ", $8a, " ", "k", $d7, $ff, "o", "f", SCR::NEWLINE, $f6, "v", $e5, "t", "u", $fa, $fb, $bf, $9a, $be, $a1, SCR::NEWLINE, "f", "u", "t", "u", $fa, ".", ".", "."
; [NOVA]a
.byt SCR::NARRATE, CHAR::NOVA, "a"
.byt SCR::RUN_ASM
;dummy text above, never gets displayed
lda #DIALOG_BANK
jsr StartCredits
brk
.byt SCR::END_SCRIPT

WaterAbout:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>You can swim in the water. Use Up/Down to change your height.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "Y", $f3, " ", $af, " ", "s", "w", "i", "m", " ", $be, $a1, " ", "w", $c5, $ec, ".", SCR::NEWLINE, "U", $e4, " ", "U", "p", "/", "D", "o", "w", "n", " ", $ba, $e1, $c9, "g", $e6, $90, SCR::NEWLINE, $c2, "i", $da, "t", "."
.byt SCR::END_SCRIPT
SignBummerAbout:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>Welcome to Bummer Club! These levels up ahead are all about puzzles.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "W", "e", "l", $95, " ", $ba, "B", "u", "m", $cf, $e9, "C", "l", "u", "b", "!", SCR::NEWLINE, $f7, "e", $e4, " ", "l", "e", "v", "e", "l", $fb, $cc, " ", "a", $c2, $f6, " ", "a", $fa, " ", $ac, SCR::NEWLINE, $89, "p", "u", "z", "z", "l", "e", "s", "."
.byt SCR::END_SCRIPT
SignBootsAbout:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>In puzzle levels, water is deadly, unless you get blue boots (flippers) first. Red boots protect you from fire, green boots let you get past green forcefields, and gray boots let you walk on ice without sliding.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "I", "n", " ", "p", "u", "z", "z", "l", $e6, "l", "e", "v", "e", "l", "s", $f4, "w", $c5, $ec, " ", $b8, SCR::NEWLINE, "d", $eb, "d", "l", "y", $f4, $f1, "l", "e", $f0, " ", $a5, " ", $ae, " ", "b", "l", "u", "e", SCR::NEWLINE, "b", $e3, "t", $fb, "(", "f", "l", "i", "p", "p", $ec, "s", ")", " ", "f", "i", "r", $dd, $f5, "R", "e", "d", SCR::NEWLINE, "b", $e3, "t", $fb, "p", "r", "o", $ea, $c6, " ", $a5, " ", $96, "f", "i", $fa, ",", SCR::NEWLINE, "g", $fa, $e5, " ", "b", $e3, "t", $fb, $a7, " ", $a5, " ", $ae, " ", "p", $c3, "t", SCR::NEWLINE, "g", $fa, $e5, " ", $a4, "c", "e", "f", $e2, $ee, "s", $f4, $a3, "g", "r", "a", "y", SCR::NEWLINE, "b", $e3, "t", $fb, $a7, " ", $a5, " ", "w", "a", "l", "k", " ", $c1, " ", "i", "c", "e", SCR::NEWLINE, $9c, $ad, " ", "s", "l", "i", "d", $b0, "."
.byt SCR::END_SCRIPT
SignMeltIceAbout:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>Try throwing a fireball at this ice. If you killed the fire enemy, walk away and come back so it will respawn.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "T", "r", $fe, $df, "r", "o", "w", $b0, " ", $bd, "f", "i", $fa, "b", $ac, " ", $c5, " ", $98, SCR::NEWLINE, "i", "c", "e", $f5, "I", "f", " ", $a5, " ", "k", $db, "l", $d5, $a1, " ", "f", "i", $fa, SCR::NEWLINE, $e5, "e", $ca, $f4, "w", "a", "l", "k", " ", "a", $b6, " ", $a3, $95, SCR::NEWLINE, "b", "a", $f2, " ", $cb, " ", $c0, $9d, " ", $fa, $dc, "a", "w", "n", "."
.byt SCR::END_SCRIPT
SignPushableAbout:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>This block ahead can be pushed forward, and will climb other blocks if pushed onto them. It treats anything that isn't air as solid.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, $f7, $b7, "b", "l", "o", $f2, " ", "a", $c2, $f6, " ", $af, " ", "b", "e", SCR::NEWLINE, "p", "u", $a9, $ff, $a4, "w", "a", "r", "d", $f4, $a3, $9d, " ", "c", "l", "i", "m", "b", SCR::NEWLINE, "o", $a1, $e9, "b", "l", "o", $f2, $fb, $cd, " ", "p", "u", $a9, $ff, $c1, $bb, SCR::NEWLINE, $91, $f5, "I", $d2, $f9, $eb, "t", $fb, $aa, $df, $b0, " ", $df, $c5, SCR::NEWLINE, $b8, "n", $e7, "a", "i", $e9, $c3, " ", $cb, "l", "i", "d", "."
.byt SCR::END_SCRIPT
LineFollowingAbout:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>This (to the right) is a line following platform. Wait for it to come around.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, $f7, $b7, "(", $ba, $a1, " ", $fc, $da, "t", ")", " ", $b7, $bd, "l", $d7, "e", SCR::NEWLINE, "f", "o", "l", "l", "o", "w", $b0, " ", "p", "l", $c5, $a4, "m", $f5, "W", "a", $c0, $a4, " ", "i", "t", SCR::NEWLINE, $ba, $95, " ", "a", "r", $f3, $ef, "."
.byt SCR::END_SCRIPT
SignPuzzleAbout:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>Look around before acting. The order you do things in puzzle-oriented stages matters.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "L", $e3, "k", " ", "a", "r", $f3, $ef, " ", "b", "e", $a4, $e6, "a", $c6, $b0, ".", SCR::NEWLINE, $f7, $e6, $c8, "d", $ec, " ", $a5, " ", $c4, " ", $df, $b0, $fb, $d7, SCR::NEWLINE, "p", "u", "z", "z", "l", "e", "-", $c8, $e2, $e0, $d5, $dd, "a", "g", "e", "s", SCR::NEWLINE, "m", $c5, $ea, "r", "s", "."
.byt SCR::END_SCRIPT
SignPickupAbout:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>You can pick up these blocks. Stand on them and press Down+A.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "Y", $f3, " ", $af, " ", "p", "i", $f2, " ", $cc, " ", $88, "b", "l", "o", $f2, "s", ".", SCR::NEWLINE, "S", "t", $a3, $c1, " ", $91, " ", $a3, "p", $fa, $f0, SCR::NEWLINE, "D", "o", "w", "n", "+", "A", "."
.byt SCR::END_SCRIPT
SignCollectibleAbout:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>These are collectibles. Each level has one, usually as a secret or reward for a challenge.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, $f7, "e", $e4, " ", "a", $fa, " ", "c", "o", "l", "l", "e", $c6, "i", "b", "l", "e", "s", $f5, "E", "a", $e1, SCR::NEWLINE, "l", "e", "v", "e", "l", " ", "h", $c3, " ", $ab, $f4, "u", "s", "u", $ac, $fe, $c3, " ", "a", SCR::NEWLINE, $e4, "c", $fa, $d2, $c8, " ", $fa, "w", "a", "r", $ff, $a4, " ", "a", SCR::NEWLINE, $e1, $ac, $e5, "g", "e", "."
.byt SCR::END_SCRIPT
SignWaterFire:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>PROTIP: Water puts out fire.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "P", "R", "O", "T", "I", "P", ":", " ", "W", $c5, $ec, " ", "p", "u", "t", $fb, $ad, " ", "f", "i", $fa, "."
.byt SCR::END_SCRIPT
SignPrize:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>Congratulations for completing the puzzle challenge! Your prize awaits in the next room.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "C", $c1, "g", "r", $c5, "u", "l", $c5, "i", $c1, $fb, $a4, SCR::NEWLINE, "c", "o", "m", "p", $a7, $b0, " ", $a1, " ", "p", "u", "z", "z", "l", "e", SCR::NEWLINE, $e1, $ac, $e5, "g", "e", $fd, "Y", $b5, " ", "p", $fc, "z", $e6, "a", "w", "a", "i", "t", "s", SCR::NEWLINE, $be, $a1, " ", $f8, "x", $d2, "r", $e3, "m", "."
.byt SCR::END_SCRIPT
AboutWarpArrows:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>Those arrows at the top of the screen indicate that there is another screen above this one. Downward pointing arrows serve the same kind of purpose.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, $f7, "o", $e4, " ", "a", $d8, "o", "w", $fb, $c5, " ", $a1, " ", $bb, "p", " ", "o", "f", SCR::NEWLINE, $a1, " ", "s", "c", $fa, $e5, " ", $d7, "d", "i", "c", $c5, $e6, $df, $c5, SCR::NEWLINE, $87, " ", $b7, $c9, "o", $a1, $e9, "s", "c", $fa, $e5, SCR::NEWLINE, "a", "b", "o", "v", $e6, $98, " ", $ab, $f5, "D", "o", "w", "n", "w", "a", "r", "d", SCR::NEWLINE, "p", "o", $d7, "t", $b0, " ", "a", $d8, "o", "w", $fb, $e4, "r", "v", $e6, $a1, SCR::NEWLINE, "s", "a", $cf, " ", "k", $d7, $ff, $bc, "p", "u", "r", "p", "o", $e4, "."
.byt SCR::END_SCRIPT
AboutBombs:
.byt SCR::SCENE, SCENES::NOVA_LIA_SIGN
; <2 SIGN>You can copy these bomb enemies, but be quick. Up+B throws and Down+B drops bombs, and B alone will put one in midair. Try standing on a placed bomb.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::SIGN, "Y", $f3, " ", $af, " ", "c", "o", "p", $fe, $88, "b", "o", "m", "b", SCR::NEWLINE, $e5, "e", "m", $e2, "s", $f4, $a6, " ", $b9, "q", "u", "i", $f2, $f5, "U", "p", "+", "B", SCR::NEWLINE, $df, "r", "o", "w", $fb, $a3, "D", "o", "w", "n", "+", "B", " ", "d", "r", "o", "p", "s", SCR::NEWLINE, "b", "o", "m", "b", "s", $f4, $a3, "B", " ", "a", "l", $ab, " ", $9d, " ", "p", "u", "t", SCR::NEWLINE, $ab, " ", $be, "m", "i", "d", "a", "i", "r", $f5, "T", "r", $fe, $dd, $c9, "d", $b0, " ", $c1, SCR::NEWLINE, $bd, "p", "l", "a", "c", $d5, "b", "o", "m", "b", "."
.byt SCR::END_SCRIPT
AboutBombs2:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>Explosions can destroy both colors of bricks, as well as ice. Remember that bombs can act as platforms.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "E", "x", "p", "l", "o", "s", "i", $c1, $fb, $af, " ", "d", "e", $dd, "r", "o", $fe, "b", "o", $df, SCR::NEWLINE, "c", "o", "l", $c8, $fb, $bc, "b", $fc, $f2, "s", $f4, $c3, " ", $c7, "l", "l", " ", $c3, SCR::NEWLINE, "i", "c", "e", $f5, "R", "e", $cf, "m", "b", $ec, " ", $99, "b", "o", "m", "b", $fb, $af, SCR::NEWLINE, "a", $c6, " ", $c3, " ", "p", "l", $c5, $a4, "m", "s", "."
; Up+B: Throw bomb
.byt SCR::NEWLINE, "U", "p", "+", "B", ":", " ", $f7, "r", "o", "w", " ", "b", "o", "m", "b"
; Down+B: Drop bomb
.byt SCR::NEWLINE, "D", "o", "w", "n", "+", "B", ":", " ", "D", "r", "o", "p", " ", "b", "o", "m", "b"
.byt SCR::END_SCRIPT
AboutMinecarts:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>Enjoy Frozen Volcano's really cool minecart rides. 
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "E", "n", "j", "o", $fe, "F", "r", "o", "z", $e5, " ", "V", "o", "l", $af, "o", "'", "s", SCR::NEWLINE, $fa, $ac, $fe, "c", $e3, "l", " ", "m", $d7, "e", "c", "a", $ed, " ", $fc, "d", "e", "s", $f5
.byt SCR::END_SCRIPT
AboutSpinnerEnemy:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>The spinner enemy homes in on your position. If you don't have a weapon to kill it with, run away. It will stop chasing you once it's off-screen.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, $f7, $e6, $dc, $d7, $f8, $e9, $e5, "e", $ca, " ", "h", "o", $cf, $fb, $d7, SCR::NEWLINE, $c1, " ", $90, " ", "p", "o", "s", "i", "t", "i", $c1, $f5, "I", "f", " ", $a5, " ", $c4, "n", "'", "t", SCR::NEWLINE, $9a, $bd, $c7, "a", "p", $c1, " ", $ba, "k", $db, "l", " ", $c0, $9c, ",", SCR::NEWLINE, "r", $f1, " ", "a", $b6, $f5, "I", $d2, $9d, " ", $dd, "o", "p", " ", $e1, $c3, $b0, SCR::NEWLINE, $a5, " ", $c1, "c", $e6, "i", "t", $e8, "o", "f", "f", "-", "s", "c", $fa, $e5, "."
.byt SCR::END_SCRIPT
ItiCameo:
.byt SCR::SCENE, SCENES::NOVA_AND_ITI
; <1 ITI>Hullo.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::ITI, "H", "u", "l", "l", "o", "."
.byt SCR::END_SCRIPT
AboutIceJump:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>With the ice enemy's ability, use Down+B to start sliding on ice, and hold Down for as long as you want to slide. You can abuse it to get another jump in mid-air.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "W", "i", $df, " ", $a1, " ", "i", "c", $e6, $e5, "e", $ca, $e8, "a", "b", $db, "i", "t", "y", ",", SCR::NEWLINE, "u", $e4, " ", "D", "o", "w", "n", "+", "B", " ", $ba, $dd, "a", $ed, " ", "s", "l", "i", "d", $b0, SCR::NEWLINE, $c1, " ", "i", "c", "e", $f4, $a3, "h", "o", $ee, " ", "D", "o", "w", "n", " ", $a4, " ", $c3, SCR::NEWLINE, "l", $c1, "g", " ", $c3, " ", $a5, " ", "w", $c9, $d2, $ba, "s", "l", "i", "d", "e", ".", SCR::NEWLINE, "Y", $f3, " ", $af, " ", "a", "b", "u", $e4, " ", $c0, $ba, $ae, SCR::NEWLINE, $c9, "o", $a1, $e9, "j", "u", "m", "p", " ", $be, "m", "i", "d", "-", "a", "i", "r", "."
.byt SCR::END_SCRIPT
AboutWaterFreeze:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>Ice can freeze water (or lava!) into a solid platform, that fire can thaw out. You WILL need the ice ability up ahead.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "I", "c", $e6, $af, " ", "f", $fa, "e", "z", $e6, "w", $c5, $ec, " ", "(", $c8, SCR::NEWLINE, "l", "a", "v", "a", "!", ")", " ", $d7, $ba, $bd, $cb, "l", "i", $ff, "p", "l", $c5, $a4, "m", ",", SCR::NEWLINE, $99, "f", "i", $fa, " ", $af, " ", $df, "a", "w", " ", $ad, $f5, "Y", $f3, SCR::NEWLINE, "W", "I", "L", "L", " ", $f8, $d5, $a1, " ", "i", "c", $e6, "a", "b", $db, "i", "t", $fe, $cc, SCR::NEWLINE, "a", $c2, $f6, "."
.byt SCR::END_SCRIPT
AboutAutoItem:
.byt SCR::SCENE, SCENES::NOVA_LIA_SIGN
; <2 SIGN>If an item bag has an exclamation point on it, the effect triggers automatically.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::SIGN, "I", "f", " ", $c9, " ", "i", $ea, "m", " ", "b", "a", "g", " ", "h", $c3, " ", $c9, SCR::NEWLINE, "e", "x", "c", "l", "a", "m", $c5, "i", $c1, " ", "p", "o", $d7, $d2, $c1, " ", "i", "t", $f4, $a1, SCR::NEWLINE, "e", "f", "f", "e", $c6, " ", $f9, "i", "g", "g", $ec, $fb, "a", "u", $bb, "m", $c5, "i", "c", $ac, "y", "."
; <2 SIGN>Also, try pressing Down+B with the burger ability to ride on a burger. It only works once until you have to touch the ground again.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::SIGN, "A", "l", $cb, $f4, $f9, $fe, "p", $fa, $f0, $b0, " ", "D", "o", "w", "n", "+", "B", SCR::NEWLINE, $9c, " ", $a1, " ", "b", "u", "r", "g", $ec, " ", "a", "b", $db, "i", "t", $fe, $ba, $fc, "d", "e", SCR::NEWLINE, $c1, " ", $bd, "b", "u", "r", "g", $ec, $f5, "I", $d2, $c1, $d1, "w", $c8, "k", "s", SCR::NEWLINE, $c1, "c", $e6, $f1, "t", $db, " ", $a5, " ", $9a, $ba, $bb, "u", $e1, SCR::NEWLINE, $a1, " ", "g", "r", $f3, $ef, " ", "a", "g", "a", $d7, "."
.byt SCR::END_SCRIPT
AboutPlaceable:
.byt SCR::SCENE, SCENES::NOVA_LIA_SIGN
; <2 SIGN>In these item boxes are items that allow you to place a block in the world. Use them to get across.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::SIGN, "I", "n", " ", $88, "i", $ea, "m", " ", "b", "o", "x", "e", $fb, "a", $fa, " ", "i", $ea, "m", "s", SCR::NEWLINE, $99, $ac, "o", "w", " ", $a5, " ", $ba, "p", "l", "a", "c", $e6, "a", SCR::NEWLINE, "b", "l", "o", $f2, " ", $be, $a1, " ", "w", $c8, $ee, $f5, "U", $e4, " ", $91, SCR::NEWLINE, $ba, $ae, " ", "a", "c", "r", "o", $f0, "."
; <1 LIA>You can't scroll the screen while placing the block, so be careful.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "Y", $f3, " ", $af, $e7, "s", "c", "r", "o", "l", "l", " ", $a1, " ", "s", "c", $fa, $e5, SCR::NEWLINE, $d9, $db, $e6, "p", "l", "a", "c", $b0, " ", $a1, " ", "b", "l", "o", $f2, $f4, $cb, " ", "b", "e", SCR::NEWLINE, "c", "a", $fa, "f", "u", "l", "."
.byt SCR::END_SCRIPT
AboutChipTall:
.byt SCR::SCENE, SCENES::NOVA_LIA_SIGN
; <2 SIGN>Beware the angry sunmask! Also collect all the chips so you can unlock the socket in the end.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::SIGN, "B", "e", "w", "a", $fa, " ", $a1, " ", $c9, "g", "r", $fe, "s", $f1, "m", $c3, "k", "!", SCR::NEWLINE, "A", "l", $cb, " ", "c", "o", "l", "l", "e", $c6, " ", $ac, " ", $a1, " ", $e1, "i", "p", $fb, $cb, SCR::NEWLINE, $a5, " ", $af, " ", $f1, "l", "o", $f2, " ", $a1, " ", $cb, $f2, "e", $d2, $d7, SCR::NEWLINE, $a1, " ", $e5, "d", "."
; <1 LIA>Looks like we haves... 99 blocks and 99 springs? A lil excessive.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "L", $e3, "k", $fb, $8c, " ", $c7, " ", "h", "a", "v", "e", "s", ".", ".", $f5, "9", "9", SCR::NEWLINE, "b", "l", "o", $f2, $fb, $a3, "9", "9", " ", $dc, $fc, "n", "g", "s", "?", " ", "A", " ", "l", $db, SCR::NEWLINE, "e", "x", "c", "e", $f0, "i", "v", "e", "."
.byt SCR::END_SCRIPT
AboutSunKey:
.byt SCR::SCENE, SCENES::NOVA_LIA_SIGN
; <2 SIGN>This key can fit into any color of lock. While touching it, press Up to pick it up or Down to set it down.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::SIGN, $f7, $b7, "k", "e", $fe, $af, " ", "f", $c0, $d7, $ba, $aa, SCR::NEWLINE, "c", "o", "l", $c8, " ", $bc, "l", "o", $f2, $f5, "W", "h", $db, $e6, $bb, "u", $e1, $b0, SCR::NEWLINE, "i", "t", $f4, "p", $fa, $f0, " ", "U", "p", " ", $ba, "p", "i", $f2, " ", $c0, $cc, " ", $c8, SCR::NEWLINE, "D", "o", "w", "n", " ", $ba, $e4, $d2, $c0, $c4, "w", "n", "."
; <1 LIA>There's something sinister about this key, I'd be careful with it.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, $f7, $ec, "e", $e8, $9b, $df, $b0, " ", "s", $d7, $b8, $ea, "r", SCR::NEWLINE, $89, $98, " ", "k", "e", "y", $f4, "I", "'", $ff, $b9, "c", "a", $fa, "f", "u", "l", SCR::NEWLINE, $9c, " ", "i", "t", "."
.byt SCR::END_SCRIPT
HintUpArrow:
.byt SCR::SCENE, SCENES::NOVA_LIA_SIGN
; <2 SIGN>You should have some up arrow blocks in your inventory. Use them wisely.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::SIGN, "Y", $f3, " ", $de, $9f, " ", $9a, $9b, " ", $cc, SCR::NEWLINE, "a", $d8, "o", "w", " ", "b", "l", "o", $f2, $fb, $be, $90, SCR::NEWLINE, $d7, "v", $e5, $bb, "r", "y", $f5, "U", $e4, " ", $91, " ", "w", $b8, "e", "l", "y", "."
.byt SCR::END_SCRIPT
AboutPickupBlock:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>Stand on these pickup blocks and press Up to pick them up. Press Down to set them down again. Oh, and definitely copy a glider for this level if you have no weapon.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "S", "t", $a3, $c1, " ", $88, "p", "i", $f2, $cc, " ", "b", "l", "o", $f2, "s", SCR::NEWLINE, $a3, "p", $fa, $f0, " ", "U", "p", " ", $ba, "p", "i", $f2, " ", $91, " ", $cc, ".", SCR::NEWLINE, "P", $fa, $f0, " ", "D", "o", "w", "n", " ", $ba, $e4, $d2, $91, " ", $c4, "w", "n", SCR::NEWLINE, "a", "g", "a", $d7, $f5, "O", "h", $f4, $a3, "d", "e", "f", $d7, "i", $ea, $d1, "c", "o", "p", "y", SCR::NEWLINE, $bd, "g", "l", "i", "d", $ec, " ", $a4, " ", $98, " ", "l", "e", "v", "e", "l", " ", $cd, " ", $a5, SCR::NEWLINE, $9a, $d0, " ", $c7, "a", "p", $c1, "."
.byt SCR::END_SCRIPT
AboutFireWind:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>Copy this fan to get a wind ability. What happens when you shoot wind at fire? (Hint: Up+B/Down+B control the angle.)
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "C", "o", "p", $fe, $98, " ", "f", $c9, " ", $ba, $ae, " ", $bd, "w", $d7, "d", SCR::NEWLINE, "a", "b", $db, "i", "t", "y", $f5, "W", "h", $c5, " ", "h", "a", "p", "p", $e5, $fb, $d9, $e5, SCR::NEWLINE, $a5, " ", $de, $e3, $d2, "w", $d7, $ff, $c5, " ", "f", "i", $fa, "?", " ", "(", "H", $d7, "t", ":", SCR::NEWLINE, "U", "p", "+", "B", "/", "D", "o", "w", "n", "+", "B", " ", "c", $c1, $f9, "o", "l", " ", $a1, SCR::NEWLINE, $c9, "g", "l", "e", ".", ")"
.byt SCR::END_SCRIPT
AboutGliderToggle:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>Gliders can trigger the green toggle switches, and destroy boxes with glider emblems on them as well as normal bricks. Up+B will shoot an upwards traveling glider.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "G", "l", "i", "d", $ec, $fb, $af, " ", $f9, "i", "g", "g", $ec, " ", $a1, " ", "g", $fa, $e5, SCR::NEWLINE, $bb, "g", "g", "l", $e6, "s", "w", "i", "t", $e1, "e", "s", $f4, $a3, "d", "e", $dd, "r", "o", "y", SCR::NEWLINE, "b", "o", "x", "e", $fb, $9c, " ", "g", "l", "i", "d", $ec, " ", "e", "m", "b", "l", "e", "m", $fb, $c1, SCR::NEWLINE, $91, " ", $c3, " ", $c7, "l", "l", " ", $c3, " ", $d0, "r", "m", "a", "l", SCR::NEWLINE, "b", $fc, $f2, "s", $f5, "U", "p", "+", "B", " ", $9d, " ", $de, $e3, $d2, $c9, SCR::NEWLINE, $cc, "w", "a", "r", "d", $fb, $f9, "a", "v", "e", "l", $b0, " ", "g", "l", "i", "d", $ec, "."
.byt SCR::END_SCRIPT
AboutCloner:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>Red switches activate cloners. This one creates a Buddy to help you out, which can pick up items and press toggles for you.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "R", $d5, "s", "w", "i", "t", $e1, "e", $fb, "a", $c6, "i", "v", $c5, "e", SCR::NEWLINE, "c", "l", $ab, "r", "s", $f5, $f7, $b7, $ab, " ", "c", $fa, $c5, "e", $fb, "a", SCR::NEWLINE, "B", "u", "d", "d", $fe, $ba, $c2, "l", "p", " ", $a5, " ", $ad, $f4, $d9, "i", $e1, SCR::NEWLINE, $af, " ", "p", "i", $f2, " ", $cc, " ", "i", $ea, "m", $fb, $a3, "p", $fa, $f0, SCR::NEWLINE, $bb, "g", "g", "l", "e", $fb, $a4, " ", $a5, "."
.byt SCR::END_SCRIPT
AboutGeorgeReminder:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>This volcano can be copied too. If you want to, hold Select to get rid of your Fire ability if you have it, then stun and copy the volcano.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, $f7, $b7, "v", "o", "l", $af, "o", " ", $af, " ", $b9, "c", "o", "p", $e2, "d", SCR::NEWLINE, $bb, "o", $f5, "I", "f", " ", $a5, " ", "w", $c9, $d2, $bb, $f4, "h", "o", $ee, SCR::NEWLINE, "S", "e", "l", "e", $c6, " ", $ba, $ae, " ", $fc, $ff, $bc, $90, " ", "F", "i", $fa, SCR::NEWLINE, "a", "b", $db, "i", "t", $fe, $cd, " ", $a5, " ", $9a, "i", "t", $f4, $93, SCR::NEWLINE, $dd, $f1, " ", $a3, "c", "o", "p", $fe, $a1, " ", "v", "o", "l", $af, "o", "."
.byt SCR::END_SCRIPT
AboutLaser:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>Squirrel defense lasers, guaranteed to keep squirrels out of your stuff!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "S", "q", "u", "i", $d8, "e", "l", " ", "d", "e", "f", $e5, $e4, " ", "l", $c3, $ec, "s", ",", SCR::NEWLINE, "g", "u", "a", "r", $c9, $ea, $d5, $ba, "k", $d6, "p", " ", $80, "s", SCR::NEWLINE, $ad, " ", $bc, $90, " ", $dd, "u", "f", "f", "!"
; >0 NOVA<Someone's going to be wanting their money back very soon.
.byt SCR::THINK, SCR::SPEAKER_0|CHAR::NOVA, "S", "o", $cf, $ab, $e8, $ce, $b0, " ", $ba, "b", "e", SCR::NEWLINE, "w", $c9, "t", $b0, " ", $a1, "i", $e9, "m", $ab, $fe, "b", "a", $f2, SCR::NEWLINE, "v", $ec, $fe, $cb, $c1, "."
.byt SCR::END_SCRIPT
SignAboutInsane2b:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>I, the sign, have loaded tons of placeable rails into your inventory. If the minecarts give you too much trouble, be a wimp and use blocks.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "I", $f4, $a1, " ", "s", "i", "g", "n", $f4, $9a, "l", "o", $f6, $d5, $bb, "n", "s", SCR::NEWLINE, $bc, "p", "l", "a", "c", $eb, "b", "l", $e6, "r", "a", $db, $fb, $d7, $ba, $90, SCR::NEWLINE, $d7, "v", $e5, $bb, "r", "y", $f5, "I", "f", " ", $a1, " ", "m", $d7, "e", "c", "a", $ed, "s", SCR::NEWLINE, "g", "i", "v", $e6, $a5, " ", $bb, "o", " ", "m", "u", $e1, " ", $f9, $f3, "b", "l", "e", $f4, "b", "e", SCR::NEWLINE, $bd, "w", "i", "m", "p", " ", $a3, "u", $e4, " ", "b", "l", "o", $f2, "s", "."
.byt SCR::RUN_ASM
lda #99
sta 0
:
lda #InventoryItem::BLOCK
jsr InventoryGiveItem
lda #InventoryItem::MINE_TRACK
jsr InventoryGiveItem
lda #InventoryItem::MINE_TRACK_JUMP
jsr InventoryGiveItem
lda #InventoryItem::MINE_TRACK_BUMP
jsr InventoryGiveItem
dec 0
bne :-
brk
.byt SCR::END_SCRIPT
SignAboutRun:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>GOTTA GO FAST!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "G", "O", "T", "T", "A", " ", "G", "O", " ", "F", "A", "S", "T", "!"
.byt SCR::END_SCRIPT
SignAboutEpilogue:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>There's an extra world after this for the epilogue!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, $f7, $ec, "e", $e8, $c9, " ", "e", "x", $f9, $bd, "w", $c8, $ee, " ", $83, SCR::NEWLINE, $98, " ", $a4, " ", $a1, " ", "e", "p", $db, "o", "g", "u", "e", "!"
.byt SCR::END_SCRIPT
MeetKeeAgain:
.byt SCR::SCENE, SCENES::NOVA_AND_KEE
; <1 KEE>Hey Nova, congrats! I went off on my own adventure while I was gone.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::KEE, "H", "e", $fe, $a0, $f4, "c", $c1, "g", "r", $c5, "s", $fd, $bf, $c7, $e0, SCR::NEWLINE, "o", "f", "f", " ", $c1, " ", $ca, " ", "o", "w", "n", " ", $f6, "v", $e5, "t", "u", $fa, SCR::NEWLINE, $d9, $db, $e6, $bf, "w", $c3, " ", $ce, $f8, "."
; <0 NOVA>Hi Kee! Nice to see you again. What's up?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "H", "i", " ", "K", $d6, $fd, "N", "i", "c", $e6, $ba, $b2, " ", $a5, " ", "a", "g", "a", $d7, ".", SCR::NEWLINE, "W", "h", $c5, $e8, $cc, "?"
; <1 KEE>Turns out I'd been gifted the ability to use fire magic, but after a lot of scorched fur and minor burns I realized I needed a teacher. I found a wizard in a broken-down hut.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::KEE, "T", "u", "r", "n", $fb, $ad, " ", "I", "'", $ff, "b", $d6, "n", " ", "g", $cd, $ea, $ff, $a1, SCR::NEWLINE, "a", "b", $db, "i", "t", $fe, $ba, "u", $e4, " ", "f", "i", $fa, " ", "m", "a", "g", "i", "c", $f4, $a6, SCR::NEWLINE, $83, " ", $bd, "l", "o", $d2, $bc, "s", "c", $c8, $e1, $d5, "f", "u", "r", SCR::NEWLINE, $a3, "m", $d7, $c8, " ", "b", "u", "r", "n", $fb, $bf, $fa, "a", "l", "i", "z", $d5, "I", SCR::NEWLINE, $f8, "e", "d", $d5, $bd, $ea, "a", $e1, $ec, $f5, $bf, "f", $f3, $ef, " ", "a", SCR::NEWLINE, "w", "i", "z", "a", "r", $ff, $be, $bd, "b", "r", "o", "k", $e5, "-", $c4, "w", "n", " ", "h", "u", "t", "."
; <0 NOVA>And he taught you?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "A", $ef, " ", $c2, " ", "t", "a", "u", $da, $d2, $a5, "?"
; <1 KEE>Yes, he helped me learn how to use my magic. He was very elderly and he passed away before he could finish, but he left me his books and supplies and I finished by myself.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::KEE, "Y", "e", "s", $f4, $c2, " ", $c2, "l", "p", $d5, $cf, " ", "l", $eb, "r", "n", " ", $b4, SCR::NEWLINE, $ba, "u", $e4, " ", $ca, " ", "m", "a", "g", "i", "c", $f5, "H", $e6, "w", $c3, " ", "v", $ec, "y", SCR::NEWLINE, "e", $ee, $ec, $d1, $a3, $c2, " ", "p", $c3, $e4, $ff, "a", $b6, SCR::NEWLINE, "b", "e", $a4, $e6, $c2, " ", "c", $9f, " ", "f", $d7, $b8, "h", $f4, $a6, " ", $c2, SCR::NEWLINE, "l", "e", "f", $d2, $cf, " ", "h", $b7, "b", $e3, "k", $fb, $c9, "d", SCR::NEWLINE, "s", $cc, "p", "l", $e2, $fb, $a3, $bf, "f", $d7, $b8, $c2, $ff, "b", "y", SCR::NEWLINE, $ca, $e4, "l", "f", "."
; <0 NOVA>Still eager to go home?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "S", "t", $db, "l", " ", $eb, "g", $ec, " ", $ba, $ce, " ", "h", "o", $cf, "?"
; <1 KEE>Eh, who cares at this point? Everything seems a lot more interesting here, but I'd love to go on an adventure with you later!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::KEE, "E", "h", $f4, $d9, "o", " ", "c", "a", $fa, $fb, $c5, " ", $98, " ", "p", "o", $d7, "t", "?", SCR::NEWLINE, "E", "v", $ec, "y", $df, $b0, " ", $b2, "m", $fb, $bd, "l", "o", $d2, "m", $c8, "e", SCR::NEWLINE, $d7, $ea, $fa, $dd, $b0, " ", $a8, "e", $f4, $a6, " ", "I", "'", $ff, "l", "o", "v", "e", SCR::NEWLINE, $ba, $ce, " ", $c1, " ", $c9, " ", $f6, "v", $e5, "t", "u", $fa, " ", $9c, SCR::NEWLINE, $a5, " ", "l", $c5, $ec, "!"
.byt SCR::END_SCRIPT

PreLevelIntro:
;  Nova sets off on her new
.byt " ", $a0, " ", $e4, "t", $fb, "o", "f", "f", " ", $c1, " ", $a8, " ", $f8, "w"
.byt SCR::NEWLINE
;  adventure and learns how
.byt " ", $f6, "v", $e5, "t", "u", $fa, " ", $a3, "l", $eb, "r", "n", $fb, $b4
.byt SCR::NEWLINE
;  to play in this new world.
.byt " ", $ba, "p", "l", "a", $fe, $be, $98, " ", $f8, "w", " ", "w", $c8, $ee, "."
.byt SCR::NEWLINE
;  (Press Up to read signs)
.byt " ", "(", "P", $fa, $f0, " ", "U", "p", " ", $ba, $fa, $f6, " ", "s", "i", "g", "n", "s", ")"
.byt SCR::END_SCRIPT
PreLevelUnderground:
; A familiar underground cave
.byt "A", " ", "f", "a", "m", $db, "i", "a", $e9, $f1, "d", $ec, "g", "r", $f3, $ef, " ", "c", "a", "v", "e"
.byt SCR::NEWLINE
; made of bricks. Except it's
.byt "m", $f6, $e6, $bc, "b", $fc, $f2, "s", $f5, "E", "x", "c", "e", "p", $d2, "i", "t", "'", "s"
.byt SCR::NEWLINE
; above ground this time?
.byt "a", "b", "o", "v", $e6, "g", "r", $f3, $ef, " ", $98, " ", "t", "i", $cf, "?"
.byt SCR::END_SCRIPT
PreLevelSky:
; A level set high up in the
.byt "A", " ", "l", "e", "v", "e", "l", " ", $e4, $d2, "h", "i", $da, " ", $cc, " ", $be, $a1
.byt SCR::NEWLINE
; sky. Be careful not to fall.
.byt "s", "k", "y", $f5, "B", $e6, "c", "a", $fa, "f", "u", "l", " ", $a2, " ", $ba, "f", $ac, "."
.byt SCR::END_SCRIPT
PreLevelWater:
; A nice tropical beach area.
.byt "A", " ", "n", "i", "c", $e6, $f9, "o", "p", "i", "c", "a", "l", " ", "b", $eb, $e1, " ", "a", $fa, "a", "."
.byt SCR::END_SCRIPT
PreLevelBoss1:
; Nova's first encounter with
.byt $a0, $e8, "f", "i", "r", $dd, " ", $e5, "c", $f3, $e0, $ec, " ", $9c
.byt SCR::NEWLINE
; the evil Scheme Team. Shoot
.byt $a1, " ", "e", "v", $db, " ", "S", $e1, "e", $cf, " ", "T", $eb, "m", $f5, "S", "h", $e3, "t"
.byt SCR::NEWLINE
; them then touch them to win.
.byt $91, " ", $93, " ", $bb, "u", $e1, " ", $91, " ", $ba, "w", $d7, "."
.byt SCR::END_SCRIPT
PreLevelGlassIntro:
;  Nova travels to a glassy
.byt " ", $a0, " ", $f9, "a", "v", "e", "l", $fb, $ba, $bd, "g", "l", $c3, "s", "y"
.byt SCR::NEWLINE
;  neon world (Bummer Club),
.byt " ", $f8, $c1, " ", "w", $c8, $ee, " ", "(", "B", "u", "m", $cf, $e9, "C", "l", "u", "b", ")", ","
.byt SCR::NEWLINE
;  full of puzzles.
.byt " ", "f", "u", "l", "l", " ", $bc, "p", "u", "z", "z", "l", "e", "s", "."
.byt SCR::END_SCRIPT
PreLevelBurgers:
;  Nova is joined by a friend
.byt " ", $a0, " ", $b7, "j", "o", $d7, $d5, "b", $fe, $bd, "f", $fc, $e5, "d"
.byt SCR::NEWLINE
;  and fights against burger
.byt " ", $a3, "f", "i", $da, "t", $fb, "a", "g", "a", $d7, $dd, " ", "b", "u", "r", "g", $ec
.byt SCR::NEWLINE
;  themed enemies.
.byt " ", $91, $d5, $e5, "e", "m", $e2, "s", "."
.byt SCR::END_SCRIPT
PreLevelChipTall:
; Collect all of the chips by
.byt "C", "o", "l", "l", "e", $c6, " ", $ac, " ", $bc, $a1, " ", $e1, "i", "p", $fb, "b", "y"
.byt SCR::NEWLINE
; building platforms to them.
.byt "b", "u", $db, "d", $b0, " ", "p", "l", $c5, $a4, "m", $fb, $ba, $91, "."
.byt SCR::NEWLINE
;   (Check your inventory)
.byt " ", " ", "(", "C", $c2, $f2, " ", $90, " ", $d7, "v", $e5, $bb, "r", "y", ")"
.byt SCR::END_SCRIPT
PreLevelTall:
;   A large puzzle tower!
.byt " ", " ", "A", " ", "l", "a", "r", "g", $e6, "p", "u", "z", "z", "l", $e6, $bb, $c7, "r", "!"
.byt SCR::END_SCRIPT
PreLevelGlassFinale:
;   Some more tricky puzzles!
.byt " ", " ", "S", "o", $cf, " ", "m", $c8, $e6, $f9, "i", $f2, $fe, "p", "u", "z", "z", "l", "e", "s", "!"
.byt SCR::NEWLINE
;   (Check your inventory)
.byt " ", " ", "(", "C", $c2, $f2, " ", $90, " ", $d7, "v", $e5, $bb, "r", "y", ")"
.byt SCR::END_SCRIPT
PreLevelBoss2:
;  Nova runs into the Scheme
.byt " ", $a0, " ", "r", $f1, $fb, $d7, $ba, $a1, " ", "S", $e1, "e", $cf
.byt SCR::NEWLINE
;  Team again and has her
.byt " ", "T", $eb, "m", " ", "a", "g", "a", $be, $a3, "h", $c3, " ", $a8
.byt SCR::NEWLINE
;  fight Forehead Block Guy.
.byt " ", "f", "i", $da, $d2, "F", $c8, "e", $c2, $f6, " ", "B", "l", "o", $f2, " ", "G", "u", "y", "."
.byt SCR::END_SCRIPT
PreLevelBoss3:
; Nova fights against MolSno
.byt $a0, " ", "f", "i", $da, "t", $fb, "a", "g", "a", $d7, $dd, " ", "M", "o", "l", "S", $d0
.byt SCR::NEWLINE
; for access to the F-a-ancy
.byt $a4, " ", "a", "c", "c", "e", $f0, " ", $ba, $a1, " ", "F", "-", "a", "-", $c9, "c", "y"
.byt SCR::NEWLINE
; Cola.
.byt "C", "o", "l", "a", "."
.byt SCR::END_SCRIPT
PreLevelBoss4a:
; It's Nova against a new foe
.byt "I", "t", $e8, $a0, " ", "a", "g", "a", $d7, $dd, " ", $bd, $f8, "w", " ", "f", "o", "e"
.byt SCR::NEWLINE
; with a rather strange
.byt $9c, " ", $bd, "r", $c5, $a8, " ", $dd, "r", $c9, "g", "e"
.byt SCR::NEWLINE
; fighting style!
.byt "f", "i", $da, "t", $b0, " ", $dd, "y", "l", "e", "!"
.byt SCR::END_SCRIPT
PreLevelBoss4b:
;  A fight in the sky atop 
.byt " ", "A", " ", "f", "i", $da, $d2, $be, $a1, " ", "s", "k", $fe, $c5, "o", "p", " "
.byt SCR::NEWLINE
;  changing platforms. Don't
.byt " ", $e1, $c9, "g", $b0, " ", "p", "l", $c5, $a4, "m", "s", $f5, "D", $c1, "'", "t"
.byt SCR::NEWLINE
;  fall off!
.byt " ", "f", $ac, " ", "o", "f", "f", "!"
.byt SCR::END_SCRIPT
PreLevelBoss5a:
; A panda challenges Nova to
.byt "A", " ", "p", $c9, "d", $bd, $e1, $ac, $e5, "g", "e", $fb, $a0, " ", $bb
.byt SCR::NEWLINE
; a fight! (Remember, toss
.byt $bd, "f", "i", $da, "t", $fd, "(", "R", "e", $cf, "m", "b", $ec, $f4, $bb, $f0
.byt SCR::NEWLINE
; fireballs with Up+B!)
.byt "f", "i", $fa, "b", $ac, $fb, $9c, " ", "U", "p", "+", "B", "!", ")"
.byt SCR::END_SCRIPT
PreLevelBoss5b:
;  The final battle against
.byt " ", $f7, $e6, "f", $d7, "a", "l", " ", "b", $c5, "t", "l", $e6, "a", "g", "a", $d7, $dd
.byt SCR::NEWLINE
;  the leader of the Scheme
.byt " ", $a1, " ", "l", $eb, "d", $ec, " ", $bc, $a1, " ", "S", $e1, "e", $cf
.byt SCR::NEWLINE
;  Team. Good luck!
.byt " ", "T", $eb, "m", $f5, "G", $e3, $ff, "l", "u", $f2, "!"
.byt SCR::END_SCRIPT
PreLevelSandbox:
; Make your own level!
.byt "M", "a", "k", $e6, $90, " ", "o", "w", "n", " ", "l", "e", "v", "e", "l", "!"
.byt SCR::END_SCRIPT
PreLevelFrozen:
; Nova enters the icy and
.byt $a0, " ", $e5, $ea, "r", $fb, $a1, " ", "i", "c", $fe, $c9, "d"
.byt SCR::NEWLINE
; lava filled Frozen Volcano.
.byt "l", "a", "v", $bd, "f", $db, "l", $d5, "F", "r", "o", "z", $e5, " ", "V", "o", "l", $af, "o", "."
.byt SCR::END_SCRIPT
PreLevelFrozen2:
; More minecart shenanigans.
.byt "M", $c8, $e6, "m", $d7, "e", "c", "a", $ed, " ", $a9, "n", $c9, "i", "g", $c9, "s", "."
.byt SCR::END_SCRIPT
PreLevelFrozen3:
; A boomerang and Life filled
.byt "A", " ", "b", $e3, $cf, "r", $c9, "g", " ", $a3, "L", $cd, $e6, "f", $db, "l", "e", "d"
.byt SCR::NEWLINE
; cave.
.byt "c", "a", "v", "e", "."
.byt SCR::END_SCRIPT
PreLevelFrozen5:
; Cave of the Strife Clouds.
.byt "C", "a", "v", $e6, $bc, $a1, " ", "S", $f9, $cd, $e6, "C", "l", $f3, "d", "s", "."
.byt SCR::END_SCRIPT
PreLevelFrozen6:
; Ronald is back for revenge.
.byt "R", $c1, "a", $ee, " ", $b7, "b", "a", $f2, " ", $a4, " ", $fa, "v", $e5, "g", "e", "."
.byt SCR::END_SCRIPT
PreLevelFrozen7:
; Watch out for a new ice
.byt "W", $c5, $e1, " ", $ad, " ", $a4, " ", $bd, $f8, "w", " ", "i", "c", "e"
.byt SCR::NEWLINE
; enemy that can summon
.byt $e5, "e", $ca, " ", $99, $af, " ", "s", "u", "m", "m", $c1
.byt SCR::NEWLINE
; deadly spikes!
.byt "d", $eb, "d", $d1, $dc, "i", "k", "e", "s", "!"
.byt SCR::END_SCRIPT
PreLevelInsane1:
; Nova finds herself in the
.byt $a0, " ", "f", $d7, "d", $fb, $a8, $e4, "l", "f", " ", $be, $a1
.byt SCR::NEWLINE
; wacky World Of Insanity.
.byt "w", "a", $f2, $fe, "W", $c8, $ee, " ", "O", "f", " ", "I", "n", "s", $c9, "i", "t", "y", "."
.byt SCR::END_SCRIPT
PreLevelInsane2:
; The fan enemy returns for
.byt $f7, $e6, "f", $c9, " ", $e5, "e", $ca, " ", $fa, "t", "u", "r", "n", $fb, $a4
.byt SCR::NEWLINE
; some tricky puzzles.
.byt $9b, " ", $f9, "i", $f2, $fe, "p", "u", "z", "z", "l", "e", "s", "."
.byt SCR::END_SCRIPT
PreLevelInsane3:
; A wide open underground
.byt "A", " ", "w", "i", "d", $e6, "o", "p", $e5, " ", $f1, "d", $ec, "g", "r", $f3, $ef
.byt SCR::NEWLINE
; area! Where's the exit?
.byt "a", $fa, "a", $fd, "W", $a8, "e", $e8, $a1, " ", "e", "x", "i", "t", "?"
.byt SCR::END_SCRIPT
PreLevelInsane5:
; Puzzles with laser beams!
.byt "P", "u", "z", "z", "l", "e", $fb, $9c, " ", "l", $c3, $ec, " ", "b", $eb, "m", "s", "!"
.byt SCR::END_SCRIPT
PreLevelInsane6:
; Trees in the depths of the
.byt "T", $fa, "e", $fb, $be, $a1, " ", "d", "e", "p", $df, $fb, $bc, $a1
.byt SCR::NEWLINE
; earth. With minecarts!
.byt $eb, $ed, "h", $f5, "W", "i", $df, " ", "m", $d7, "e", "c", "a", $ed, "s", "!"
.byt SCR::END_SCRIPT
PreLevelFinal1:
; Nova enters the territory
.byt $a0, " ", $e5, $ea, "r", $fb, $a1, " ", $ea, $d8, "i", $bb, "r", "y"
.byt SCR::NEWLINE
; the Scheme Team, finding it
.byt $a1, " ", "S", $e1, "e", $cf, " ", "T", $eb, "m", $f4, "f", $d7, "d", $b0, " ", "i", "t"
.byt SCR::NEWLINE
; heavily guarded.
.byt $c2, "a", "v", $db, $fe, "g", "u", "a", "r", "d", "e", "d", "."
.byt SCR::END_SCRIPT
PreLevelFinal4:
; This level is da bomb.
.byt $f7, $b7, "l", "e", "v", "e", "l", " ", $b7, "d", $bd, "b", "o", "m", "b", "."
.byt SCR::END_SCRIPT
PreLevelFinal5:
; Run across a path of arrow
.byt "R", $f1, " ", "a", "c", "r", "o", $f0, " ", $bd, "p", $c5, "h", " ", $bc, "a", $d8, "o", "w"
.byt SCR::NEWLINE
; blocks!
.byt "b", "l", "o", $f2, "s", "!"
.byt SCR::END_SCRIPT
PreLevelFinal7:
; A pretty long final level,
.byt "A", " ", "p", $fa, "t", "t", $fe, "l", $c1, "g", " ", "f", $d7, "a", "l", " ", "l", "e", "v", "e", "l", ","
.byt SCR::NEWLINE
; using all of the themes.
.byt "u", "s", $b0, " ", $ac, " ", $bc, $a1, " ", $91, "e", "s", "."
.byt SCR::END_SCRIPT
; INTRO CUTSCENE TEXT
ExpositionText1:
; The world of Latte lived
.byt $f7, $e6, "w", $c8, $ee, " ", $bc, $84, " ", "l", "i", "v", "e", "d"
.byt SCR::NEWLINE
; in peace for many years.
.byt $be, "p", $eb, "c", $e6, $a4, " ", "m", $aa, " ", "y", $eb, "r", "s", "."
.byt SCR::NEWLINE
; It is a video game world,
.byt "I", $d2, $b7, $bd, "v", "i", "d", "e", "o", " ", "g", "a", $cf, " ", "w", $c8, $ee, ","
.byt SCR::NEWLINE
; ruled by a guy named Korey.
.byt "r", "u", "l", $d5, "b", $fe, $bd, "g", "u", $fe, "n", "a", $cf, $ff, "K", $c8, "e", "y", "."
.byt SCR::END_SCRIPT
ExpositionText2:
; One day, it was attacked by
.byt "O", $f8, " ", "d", "a", "y", $f4, $c0, "w", $c3, " ", $c5, "t", "a", $f2, $d5, "b", "y"
.byt SCR::NEWLINE
; the "Scheme Team," a robot
.byt $a1, " ", '"', "S", $e1, "e", $cf, " ", "T", $eb, "m", ",", '"', " ", $bd, "r", "o", "b", "o", "t"
.byt SCR::NEWLINE
; army with a thirst for
.byt "a", "r", $ca, " ", $9c, " ", $bd, $df, "i", "r", $dd, " ", $a4
.byt SCR::NEWLINE
; destruction and power.
.byt "d", "e", $dd, "r", "u", $c6, "i", $c1, " ", $a3, "p", "o", $c7, "r", "."
.byt SCR::END_SCRIPT
ExpositionText3:
; When it seemed hopeless,
.byt "W", $c2, "n", " ", $c0, $b2, $cf, $ff, "h", "o", "p", "e", "l", "e", $f0, ","
.byt SCR::NEWLINE
; the Double Action Blaster
.byt $a1, " ", "D", $f3, "b", "l", $e6, "A", $c6, "i", $c1, " ", "B", "l", $c3, $ea, "r"
.byt SCR::NEWLINE
; Guys showed up and blasted
.byt "G", "u", "y", $fb, $de, "o", $c7, $ff, $cc, " ", $a3, "b", "l", $c3, $ea, "d"
.byt SCR::NEWLINE
; their way to victory.
.byt $a1, "i", $e9, $b6, " ", $ba, "v", "i", $c6, $c8, "y", "."
.byt SCR::END_SCRIPT
ExpositionText4:
; The Scheme Team was stopped
.byt $f7, $e6, "S", $e1, "e", $cf, " ", "T", $eb, "m", " ", "w", $c3, " ", $dd, "o", "p", "p", "e", "d"
.byt SCR::NEWLINE
; and arrested, but the Guys
.byt $a3, "a", $d8, "e", $dd, "e", "d", $f4, $a6, " ", $a1, " ", "G", "u", "y", "s"
.byt SCR::NEWLINE
; disappeared shortly after.
.byt "d", $b8, "a", "p", "p", $eb, $fa, $ff, $de, $c8, "t", $d1, $83, "."
.byt SCR::NEWLINE
; Latte was now vulnerable.
.byt $84, " ", "w", $c3, " ", $b3, " ", "v", "u", "l", $f8, "r", "a", "b", "l", "e", "."
.byt SCR::END_SCRIPT
ExpositionText5:
; -Korey-
.byt "-", "K", $c8, "e", "y", "-"
.byt SCR::NEWLINE
; Henceforth, replying to any
.byt "H", $e5, "c", "e", $a4, $df, $f4, $fa, "p", "l", "y", $b0, " ", $ba, $aa
.byt SCR::NEWLINE
; post with nothing more than
.byt "p", "o", $dd, " ", $9c, " ", $a2, "h", $b0, " ", "m", $c8, $e6, $92
.byt SCR::NEWLINE
; the word "nice" will result
.byt $a1, " ", "w", $c8, $ff, '"', "n", "i", "c", "e", '"', " ", $9d, " ", $fa, "s", "u", "l", "t"
.byt SCR::NEWLINE
; in an immediate arrest.
.byt $be, $c9, " ", "i", "m", $cf, "d", "i", $c5, $e6, "a", $d8, "e", $dd, "."
.byt SCR::END_SCRIPT
ExpositionText6:
; -Korey-
.byt "-", "K", $c8, "e", "y", "-"
.byt SCR::NEWLINE
; Yes, this has seriously
.byt "Y", "e", "s", $f4, $98, " ", "h", $c3, " ", $e4, $fc, $f3, "s", "l", "y"
.byt SCR::NEWLINE
; become *this* large of a
.byt "b", "e", $95, " ", "*", $98, "*", " ", "l", "a", "r", "g", $e6, $bc, "a"
.byt SCR::NEWLINE
; problem and it's going to
.byt $81, " ", $a3, "i", "t", $e8, $ce, $b0, " ", $bb
.byt SCR::NEWLINE
; stop, before it's too late!
.byt $dd, "o", "p", $f4, "b", "e", $a4, $e6, "i", "t", $e8, $bb, "o", " ", "l", $c5, "e", "!"
.byt SCR::END_SCRIPT
ExpositionText7:
; -Ike-
.byt "-", "I", "k", "e", "-"
.byt SCR::NEWLINE
; Too late? What sort of harm
.byt "T", $e3, " ", "l", $c5, "e", "?", " ", "W", "h", $c5, " ", $cb, $ed, " ", $bc, "h", "a", "r", "m"
.byt SCR::NEWLINE
; could possibly come out of
.byt "c", $9f, " ", "p", "o", $f0, "i", "b", $d1, $95, " ", $ad, " ", "o", "f"
.byt SCR::NEWLINE
; that kind of harmless fun?
.byt $99, "k", $d7, $ff, $bc, "h", "a", "r", "m", "l", "e", $f0, " ", "f", $f1, "?"
.byt SCR::END_SCRIPT
ExpositionText8:
; -Korey-
.byt "-", "K", $c8, "e", "y", "-"
.byt SCR::NEWLINE
; Remember, the Scheme Team
.byt "R", "e", $cf, "m", "b", $ec, $f4, $a1, " ", "S", $e1, "e", $cf, " ", "T", $eb, "m"
.byt SCR::NEWLINE
; has Smiloids with them, and
.byt "h", $c3, " ", "S", "m", $db, "o", "i", "d", $fb, $9c, " ", $91, $f4, $c9, "d"
.byt SCR::NEWLINE
; these highly dangerous bots
.byt $88, "h", "i", $da, $d1, "d", $c9, "g", $ec, $f3, $fb, "b", "o", "t", "s"
.byt SCR::NEWLINE
; derive their power from
.byt "d", $ec, "i", "v", $e6, $a1, "i", $e9, "p", "o", $c7, $e9, "f", "r", "o", "m"
.byt SCR::NEWLINE
; that kind of behavior.
.byt $99, "k", $d7, $ff, $bc, "b", "e", "h", "a", "v", "i", $c8, "."
.byt SCR::END_SCRIPT
ExpositionText9:
; -Korey-
.byt "-", "K", $c8, "e", "y", "-"
.byt SCR::NEWLINE
; If they become too powerful
.byt "I", "f", " ", $97, " ", "b", "e", $95, " ", $bb, "o", " ", "p", "o", $c7, "r", "f", "u", "l"
.byt SCR::NEWLINE
; they will break out of jail
.byt $97, " ", $9d, " ", "b", $fa, "a", "k", " ", $ad, " ", $bc, "j", "a", $db
.byt SCR::NEWLINE
; and we would be totally
.byt $a3, $c7, " ", "w", $9f, " ", $b9, $bb, "t", $ac, "y"
.byt SCR::NEWLINE
; screwed!
.byt "s", "c", $fa, $c7, "d", "!"
.byt SCR::END_SCRIPT
ExpositionText10:
; (Meanwhile...)
.byt "(", "M", $eb, "n", $d9, $db, "e", ".", ".", ".", ")"
.byt SCR::NEWLINE
; "Well, my friends, it looks
.byt '"', "W", "e", "l", "l", $f4, $ca, " ", "f", $fc, $e5, "d", "s", $f4, $c0, $94, "s"
.byt SCR::NEWLINE
; like today will be a very
.byt $8c, " ", $bb, "d", "a", $fe, $9d, " ", $b9, $bd, "v", $ec, "y"
.byt SCR::NEWLINE
; "Nice" day for us. Let's
.byt '"', "N", "i", "c", "e", '"', " ", "d", "a", $fe, $a4, " ", "u", "s", $f5, "L", "e", "t", "'", "s"
.byt SCR::NEWLINE
; bust out of this place!"
.byt "b", "u", $dd, " ", $ad, " ", $bc, $98, " ", "p", "l", "a", "c", "e", "!", '"'
.byt SCR::END_SCRIPT
ExpositionText11:
; The Scheme Team constructs
.byt $f7, $e6, "S", $e1, "e", $cf, " ", "T", $eb, "m", " ", "c", $c1, $dd, "r", "u", $c6, "s"
.byt SCR::NEWLINE
; a fortress as well as a new
.byt $bd, $a4, $f9, "e", $f0, " ", $c3, " ", $c7, "l", "l", " ", $c3, " ", $bd, $f8, "w"
.byt SCR::NEWLINE
; master plan. This time they
.byt "m", $c3, $ea, $e9, "p", "l", $c9, $f5, $f7, $b7, "t", "i", $cf, " ", $97
.byt SCR::NEWLINE
; would be ready for anything
.byt "w", $9f, " ", $b9, $fa, $f6, $fe, $a4, " ", $aa, $df, $b0
.byt SCR::END_SCRIPT
ExpositionText12:
; However, in doing so they
.byt "H", "o", $c7, "v", $ec, $f4, $be, $c4, $b0, " ", $cb, " ", $97
.byt SCR::NEWLINE
; kidnap a man named Sherwin
.byt "k", "i", "d", "n", "a", "p", " ", $bd, "m", $c9, " ", "n", "a", $cf, $ff, "S", $a8, "w", $d7
.byt SCR::NEWLINE
; when they confuse him for
.byt $d9, $e5, " ", $97, " ", "c", $c1, "f", "u", $e4, " ", $b1, " ", $a4
.byt SCR::NEWLINE
; a Blaster Guy due to looks.
.byt $bd, "B", "l", $c3, $ea, $e9, "G", "u", $fe, "d", "u", $e6, $ba, $94, "s", "."
.byt SCR::END_SCRIPT
ExpositionText13:
; Sherwin decides the proper
.byt "S", $a8, "w", $be, "d", "e", "c", "i", "d", "e", $fb, $a1, " ", "p", "r", "o", "p", $ec
.byt SCR::NEWLINE
; course of action is to go
.byt "c", $b5, $e4, " ", $bc, "a", $c6, "i", $c1, " ", $b7, $ba, $ce
.byt SCR::NEWLINE
; make a thread on the Latte
.byt "m", "a", "k", $e6, $bd, $df, $fa, $f6, " ", $c1, " ", $a1, " ", $84
.byt SCR::NEWLINE
; forums about the incident.
.byt $a4, "u", "m", $fb, $89, $a1, " ", $d7, "c", "i", "d", $e5, "t", "."
.byt SCR::END_SCRIPT
ExpositionText14:
; -Sherwin-
.byt "-", "S", $a8, "w", $d7, "-"
.byt SCR::NEWLINE
; These robot guys with guns
.byt $f7, "e", $e4, " ", "r", "o", "b", "o", $d2, "g", "u", "y", $fb, $9c, " ", "g", $f1, "s"
.byt SCR::NEWLINE
; just went and kidnapped me.
.byt $8d, $c7, $e0, " ", $a3, "k", "i", "d", "n", "a", "p", "p", $d5, $cf, "."
.byt SCR::NEWLINE
; This is illegal, you know!
.byt $f7, $b7, $b7, $db, "l", "e", "g", "a", "l", $f4, $a5, " ", $8e, "!"
.byt SCR::END_SCRIPT
ExpositionText15:
; -Korey-
.byt "-", "K", $c8, "e", "y", "-"
.byt SCR::NEWLINE
; Robot guys with guns? Uh...
.byt "R", "o", "b", "o", $d2, "g", "u", "y", $fb, $9c, " ", "g", $f1, "s", "?", " ", "U", "h", ".", ".", "."
.byt SCR::NEWLINE
; Oh no. I think we might be
.byt "O", "h", " ", $d0, $f5, $bf, $82, " ", $c7, " ", "m", "i", $da, $d2, "b", "e"
.byt SCR::NEWLINE
; screwed after all.
.byt "s", "c", $fa, $c7, $ff, $83, " ", $ac, "."
.byt SCR::END_SCRIPT
ExpositionText16:
; Fortunately, through random
.byt "F", $c8, "t", $f1, $c5, "e", "l", "y", $f4, $df, "r", $f3, $da, " ", "r", $c9, $c4, "m"
.byt SCR::NEWLINE
; luck a squirrel appears in
.byt "l", "u", $f2, " ", $bd, $80, " ", "a", "p", "p", $eb, "r", $fb, $d7
.byt SCR::NEWLINE
; Latte. Can she fix things?
.byt $84, $f5, "C", $c9, " ", $a9, " ", "f", "i", "x", " ", $df, $b0, "s", "?"
.byt SCR::END_SCRIPT

CutsceneDictionary:
DictionaryWord0: .byt "squirre", 'l'|128
DictionaryWord1: .byt "proble", 'm'|128
DictionaryWord2: .byt "thin", 'k'|128
DictionaryWord3: .byt "afte", 'r'|128
DictionaryWord4: .byt "Latt", 'e'|128
DictionaryWord5: .byt "Atomic Videoclip Zon", 'e'|128
DictionaryWord6: .byt "-halp I've been taken", '-'|128
DictionaryWord7: .byt "ther", 'e'|128
DictionaryWord8: .byt "these", ' '|128
DictionaryWord9: .byt "about", ' '|128
DictionaryWord10: .byt "wha", 't'|128
DictionaryWord11: .byt "ove", 'r'|128
DictionaryWord12: .byt "lik", 'e'|128
DictionaryWord13: .byt "just", ' '|128
DictionaryWord14: .byt "kno", 'w'|128
DictionaryWord15: .byt "tak", 'e'|128
DictionaryWord16: .byt "you", 'r'|128
DictionaryWord17: .byt "the", 'm'|128
DictionaryWord18: .byt "tha", 'n'|128
DictionaryWord19: .byt "the", 'n'|128
DictionaryWord20: .byt "loo", 'k'|128
DictionaryWord21: .byt "com", 'e'|128
DictionaryWord22: .byt "from", ' '|128
DictionaryWord23: .byt "the", 'y'|128
DictionaryWord24: .byt "thi", 's'|128
DictionaryWord25: .byt "that", ' '|128
DictionaryWord26: .byt "have", ' '|128
DictionaryWord27: .byt "som", 'e'|128
DictionaryWord28: .byt "wit", 'h'|128
DictionaryWord29: .byt "wil", 'l'|128
DictionaryWord30: .byt "eve", 'n'|128
DictionaryWord31: .byt "oul", 'd'|128
DictionaryWord32: .byt "Nov", 'a'|128
DictionaryWord33: .byt "th", 'e'|128
DictionaryWord34: .byt "no", 't'|128
DictionaryWord35: .byt "and", ' '|128
DictionaryWord36: .byt "fo", 'r'|128
DictionaryWord37: .byt "yo", 'u'|128
DictionaryWord38: .byt "bu", 't'|128
DictionaryWord39: .byt "le", 't'|128
DictionaryWord40: .byt "he", 'r'|128
DictionaryWord41: .byt "sh", 'e'|128
DictionaryWord42: .byt "an", 'y'|128
DictionaryWord43: .byt "on", 'e'|128
DictionaryWord44: .byt "al", 'l'|128
DictionaryWord45: .byt "ou", 't'|128
DictionaryWord46: .byt "ge", 't'|128
DictionaryWord47: .byt "ca", 'n'|128
DictionaryWord48: .byt "in", 'g'|128
DictionaryWord49: .byt "hi", 'm'|128
DictionaryWord50: .byt "se", 'e'|128
DictionaryWord51: .byt "no", 'w'|128
DictionaryWord52: .byt "ho", 'w'|128
DictionaryWord53: .byt "ou", 'r'|128
DictionaryWord54: .byt "wa", 'y'|128
DictionaryWord55: .byt "is", ' '|128
DictionaryWord56: .byt "i", 's'|128
DictionaryWord57: .byt "be", ' '|128
DictionaryWord58: .byt "to", ' '|128
DictionaryWord59: .byt "t", 'o'|128
DictionaryWord60: .byt "of", ' '|128
DictionaryWord61: .byt "a", ' '|128
DictionaryWord62: .byt "in", ' '|128
DictionaryWord63: .byt "I", ' '|128
DictionaryWord64: .byt "it", ' '|128
DictionaryWord65: .byt "o", 'n'|128
DictionaryWord66: .byt "h", 'e'|128
DictionaryWord67: .byt "a", 's'|128
DictionaryWord68: .byt "d", 'o'|128
DictionaryWord69: .byt "a", 't'|128
DictionaryWord70: .byt "c", 't'|128
DictionaryWord71: .byt "w", 'e'|128
DictionaryWord72: .byt "o", 'r'|128
DictionaryWord73: .byt "a", 'n'|128
DictionaryWord74: .byt "m", 'y'|128
DictionaryWord75: .byt "s", 'o'|128
DictionaryWord76: .byt "u", 'p'|128
DictionaryWord77: .byt "i", 'f'|128
DictionaryWord78: .byt "g", 'o'|128
DictionaryWord79: .byt "m", 'e'|128
DictionaryWord80: .byt "n", 'o'|128
DictionaryWord81: .byt "ly", ' '|128
DictionaryWord82: .byt "t", ' '|128
DictionaryWord83: .byt "I'm", ' '|128
DictionaryWord84: .byt "I'l", 'l'|128
DictionaryWord85: .byt "ed", ' '|128
DictionaryWord86: .byt "e", 'e'|128
DictionaryWord87: .byt "i", 'n'|128
DictionaryWord88: .byt "r", 'r'|128
DictionaryWord89: .byt "w", 'h'|128
DictionaryWord90: .byt "g", 'h'|128
DictionaryWord91: .byt "i", 'l'|128
DictionaryWord92: .byt "s", 'p'|128
DictionaryWord93: .byt "s", 't'|128
DictionaryWord94: .byt "s", 'h'|128
DictionaryWord95: .byt "t", 'h'|128
DictionaryWord96: .byt "n", 't'|128
DictionaryWord97: .byt "c", 'h'|128
DictionaryWord98: .byt "i", 'e'|128
DictionaryWord99: .byt "o", 'o'|128
DictionaryWord100: .byt "s", 'e'|128
DictionaryWord101: .byt "e", 'n'|128
DictionaryWord102: .byt "e", ' '|128
DictionaryWord103: .byt "'t", ' '|128
DictionaryWord104: .byt "'s", ' '|128
DictionaryWord105: .byt "r", ' '|128
DictionaryWord106: .byt "t", 'e'|128
DictionaryWord107: .byt "e", 'a'|128
DictionaryWord108: .byt "e", 'r'|128
DictionaryWord109: .byt "r", 't'|128
DictionaryWord110: .byt "l", 'd'|128
DictionaryWord111: .byt "n", 'd'|128
DictionaryWord112: .byt "s", 's'|128
DictionaryWord113: .byt "u", 'n'|128
DictionaryWord114: .byt "c", 'k'|128
DictionaryWord115: .byt "o", 'u'|128
DictionaryWord116: .byt ",", ' '|128
DictionaryWord117: .byt ".", ' '|128
DictionaryWord118: .byt "a", 'd'|128
DictionaryWord119: .byt "T", 'h'|128
DictionaryWord120: .byt "n", 'e'|128
DictionaryWord121: .byt "t", 'r'|128
DictionaryWord122: .byt "r", 'e'|128
DictionaryWord123: .byt "s", ' '|128
DictionaryWord124: .byt "r", 'i'|128
DictionaryWord125: .byt "!", ' '|128
DictionaryWord126: .byt "y", ' '|128
DictionaryWord127: .byt "d", ' '|128

CutsceneDictionaryTable:
.byt <DictionaryWord0
.byt <DictionaryWord1
.byt <DictionaryWord2
.byt <DictionaryWord3
.byt <DictionaryWord4
.byt <DictionaryWord5
.byt <DictionaryWord6
.byt <DictionaryWord7
.byt <DictionaryWord8
.byt <DictionaryWord9
.byt <DictionaryWord10
.byt <DictionaryWord11
.byt <DictionaryWord12
.byt <DictionaryWord13
.byt <DictionaryWord14
.byt <DictionaryWord15
.byt <DictionaryWord16
.byt <DictionaryWord17
.byt <DictionaryWord18
.byt <DictionaryWord19
.byt <DictionaryWord20
.byt <DictionaryWord21
.byt <DictionaryWord22
.byt <DictionaryWord23
.byt <DictionaryWord24
.byt <DictionaryWord25
.byt <DictionaryWord26
.byt <DictionaryWord27
.byt <DictionaryWord28
.byt <DictionaryWord29
.byt <DictionaryWord30
.byt <DictionaryWord31
.byt <DictionaryWord32
.byt <DictionaryWord33
.byt <DictionaryWord34
.byt <DictionaryWord35
.byt <DictionaryWord36
.byt <DictionaryWord37
.byt <DictionaryWord38
.byt <DictionaryWord39
.byt <DictionaryWord40
.byt <DictionaryWord41
.byt <DictionaryWord42
.byt <DictionaryWord43
.byt <DictionaryWord44
.byt <DictionaryWord45
.byt <DictionaryWord46
.byt <DictionaryWord47
.byt <DictionaryWord48
.byt <DictionaryWord49
.byt <DictionaryWord50
.byt <DictionaryWord51
.byt <DictionaryWord52
.byt <DictionaryWord53
.byt <DictionaryWord54
.byt <DictionaryWord55
.byt <DictionaryWord56
.byt <DictionaryWord57
.byt <DictionaryWord58
.byt <DictionaryWord59
.byt <DictionaryWord60
.byt <DictionaryWord61
.byt <DictionaryWord62
.byt <DictionaryWord63
.byt <DictionaryWord64
.byt <DictionaryWord65
.byt <DictionaryWord66
.byt <DictionaryWord67
.byt <DictionaryWord68
.byt <DictionaryWord69
.byt <DictionaryWord70
.byt <DictionaryWord71
.byt <DictionaryWord72
.byt <DictionaryWord73
.byt <DictionaryWord74
.byt <DictionaryWord75
.byt <DictionaryWord76
.byt <DictionaryWord77
.byt <DictionaryWord78
.byt <DictionaryWord79
.byt <DictionaryWord80
.byt <DictionaryWord81
.byt <DictionaryWord82
.byt <DictionaryWord83
.byt <DictionaryWord84
.byt <DictionaryWord85
.byt <DictionaryWord86
.byt <DictionaryWord87
.byt <DictionaryWord88
.byt <DictionaryWord89
.byt <DictionaryWord90
.byt <DictionaryWord91
.byt <DictionaryWord92
.byt <DictionaryWord93
.byt <DictionaryWord94
.byt <DictionaryWord95
.byt <DictionaryWord96
.byt <DictionaryWord97
.byt <DictionaryWord98
.byt <DictionaryWord99
.byt <DictionaryWord100
.byt <DictionaryWord101
.byt <DictionaryWord102
.byt <DictionaryWord103
.byt <DictionaryWord104
.byt <DictionaryWord105
.byt <DictionaryWord106
.byt <DictionaryWord107
.byt <DictionaryWord108
.byt <DictionaryWord109
.byt <DictionaryWord110
.byt <DictionaryWord111
.byt <DictionaryWord112
.byt <DictionaryWord113
.byt <DictionaryWord114
.byt <DictionaryWord115
.byt <DictionaryWord116
.byt <DictionaryWord117
.byt <DictionaryWord118
.byt <DictionaryWord119
.byt <DictionaryWord120
.byt <DictionaryWord121
.byt <DictionaryWord122
.byt <DictionaryWord123
.byt <DictionaryWord124
.byt <DictionaryWord125
.byt <DictionaryWord126
.byt <DictionaryWord127
.byt >DictionaryWord0
.byt >DictionaryWord1
.byt >DictionaryWord2
.byt >DictionaryWord3
.byt >DictionaryWord4
.byt >DictionaryWord5
.byt >DictionaryWord6
.byt >DictionaryWord7
.byt >DictionaryWord8
.byt >DictionaryWord9
.byt >DictionaryWord10
.byt >DictionaryWord11
.byt >DictionaryWord12
.byt >DictionaryWord13
.byt >DictionaryWord14
.byt >DictionaryWord15
.byt >DictionaryWord16
.byt >DictionaryWord17
.byt >DictionaryWord18
.byt >DictionaryWord19
.byt >DictionaryWord20
.byt >DictionaryWord21
.byt >DictionaryWord22
.byt >DictionaryWord23
.byt >DictionaryWord24
.byt >DictionaryWord25
.byt >DictionaryWord26
.byt >DictionaryWord27
.byt >DictionaryWord28
.byt >DictionaryWord29
.byt >DictionaryWord30
.byt >DictionaryWord31
.byt >DictionaryWord32
.byt >DictionaryWord33
.byt >DictionaryWord34
.byt >DictionaryWord35
.byt >DictionaryWord36
.byt >DictionaryWord37
.byt >DictionaryWord38
.byt >DictionaryWord39
.byt >DictionaryWord40
.byt >DictionaryWord41
.byt >DictionaryWord42
.byt >DictionaryWord43
.byt >DictionaryWord44
.byt >DictionaryWord45
.byt >DictionaryWord46
.byt >DictionaryWord47
.byt >DictionaryWord48
.byt >DictionaryWord49
.byt >DictionaryWord50
.byt >DictionaryWord51
.byt >DictionaryWord52
.byt >DictionaryWord53
.byt >DictionaryWord54
.byt >DictionaryWord55
.byt >DictionaryWord56
.byt >DictionaryWord57
.byt >DictionaryWord58
.byt >DictionaryWord59
.byt >DictionaryWord60
.byt >DictionaryWord61
.byt >DictionaryWord62
.byt >DictionaryWord63
.byt >DictionaryWord64
.byt >DictionaryWord65
.byt >DictionaryWord66
.byt >DictionaryWord67
.byt >DictionaryWord68
.byt >DictionaryWord69
.byt >DictionaryWord70
.byt >DictionaryWord71
.byt >DictionaryWord72
.byt >DictionaryWord73
.byt >DictionaryWord74
.byt >DictionaryWord75
.byt >DictionaryWord76
.byt >DictionaryWord77
.byt >DictionaryWord78
.byt >DictionaryWord79
.byt >DictionaryWord80
.byt >DictionaryWord81
.byt >DictionaryWord82
.byt >DictionaryWord83
.byt >DictionaryWord84
.byt >DictionaryWord85
.byt >DictionaryWord86
.byt >DictionaryWord87
.byt >DictionaryWord88
.byt >DictionaryWord89
.byt >DictionaryWord90
.byt >DictionaryWord91
.byt >DictionaryWord92
.byt >DictionaryWord93
.byt >DictionaryWord94
.byt >DictionaryWord95
.byt >DictionaryWord96
.byt >DictionaryWord97
.byt >DictionaryWord98
.byt >DictionaryWord99
.byt >DictionaryWord100
.byt >DictionaryWord101
.byt >DictionaryWord102
.byt >DictionaryWord103
.byt >DictionaryWord104
.byt >DictionaryWord105
.byt >DictionaryWord106
.byt >DictionaryWord107
.byt >DictionaryWord108
.byt >DictionaryWord109
.byt >DictionaryWord110
.byt >DictionaryWord111
.byt >DictionaryWord112
.byt >DictionaryWord113
.byt >DictionaryWord114
.byt >DictionaryWord115
.byt >DictionaryWord116
.byt >DictionaryWord117
.byt >DictionaryWord118
.byt >DictionaryWord119
.byt >DictionaryWord120
.byt >DictionaryWord121
.byt >DictionaryWord122
.byt >DictionaryWord123
.byt >DictionaryWord124
.byt >DictionaryWord125
.byt >DictionaryWord126
.byt >DictionaryWord127
