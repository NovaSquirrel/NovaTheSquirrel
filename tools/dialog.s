Intro:
.byt SCR::SCENE, SCENES::NOVA_AND_KEE
; []After some mishaps involving a teleporter and rays from a strange new device, a fox and squirrel end up transformed and in the strange world of Latte.
.byt SCR::NARRATE, CHAR::NONE, "A", "f", $eb, $ea, $9c, " ", "m", $b9, "h", "a", "p", $fb, $d8, "v", "o", "l", "v", $b1, SCR::NEWLINE, $be, $eb, "l", "e", "p", $c9, $eb, $ea, $a4, "r", "a", "y", $fb, $97, "a", SCR::NEWLINE, $de, "r", $ca, "g", $e7, $f9, "w", " ", "d", "e", "v", "i", "c", "e", $f5, $be, "f", "o", "x", " ", $ca, "d", SCR::NEWLINE, $80, " ", $e6, $ff, $cd, " ", $fa, $ca, "s", $a5, $d0, "d", SCR::NEWLINE, $a4, $bf, $a2, " ", $de, "r", $ca, "g", $e7, "w", $c9, $ef, " ", "o", "f", SCR::NEWLINE, $84, "."
; <0 NOVA>Hey Kee? What just happened? Where are we?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "H", "e", $fe, "K", $d7, "?", " ", "W", "h", $c6, " ", "j", "u", $de, SCR::NEWLINE, "h", "a", "p", "p", $e6, "e", "d", "?", " ", "W", $a9, $e7, "a", "r", $e7, $c8, "?"
; <1 KEE>No idea, Nova. You look pretty different now though.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::KEE, "N", "o", " ", "i", "d", $ec, $f5, $a1, $f6, "Y", $f4, " ", $95, SCR::NEWLINE, "p", "r", "e", "t", "t", $fe, "d", $ce, "f", $ed, $e6, $d3, $b4, " ", $e0, $f4, $db, "."
; <0 NOVA>... I have a lot of questions. Come on, let's look around.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, ".", ".", $f6, $c0, $9b, $be, "l", "o", $d3, $bd, "q", "u", "e", $de, "i", $c2, "s", ".", SCR::NEWLINE, "C", "o", $d0, " ", $c2, $f5, $a8, $e9, $95, " ", "a", "r", $f4, $f0, "."
; [](Press up to read the signs or go in doors. Skip dialog with Start.)
.byt SCR::NARRATE, CHAR::NONE, "(", "P", "r", "e", $f1, " ", $cd, " ", $bb, "r", $ec, $ff, $a2, " ", "s", "i", "g", "n", "s", SCR::NEWLINE, $c9, " ", $cf, " ", $bf, $c5, $c9, "s", $f6, "S", "k", "i", "p", " ", "d", "i", "a", "l", "o", "g", SCR::NEWLINE, $9d, " ", "S", "t", "a", $ee, ".", ")"
.byt SCR::END_SCRIPT
Tutorial1:
.byt SCR::SCENE, SCENES::NOVA_SIGN_KEE
; <1 SIGN>Hold B to run, or press B to attack. From the pause menu you can choose to run with a double-tap instead, allowing you to attack while moving.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "H", "o", $ef, " ", "B", " ", $bb, "r", $f2, $f5, $c9, " ", "p", "r", "e", $f1, " ", "B", " ", $bc, SCR::NEWLINE, $c6, "t", "a", $f3, $f6, "F", "r", "o", "m", " ", $a2, " ", "p", "a", "u", $e5, " ", $d0, "n", "u", SCR::NEWLINE, $a6, " ", $b0, " ", $e2, $e4, $e5, " ", $bb, "r", $f2, " ", $9d, " ", "a", SCR::NEWLINE, $c5, "u", "b", "l", "e", "-", "t", "a", "p", " ", $d8, $de, $ec, "d", $f5, $ad, "o", "w", $b1, SCR::NEWLINE, $a6, " ", $bb, $c6, "t", "a", $f3, " ", $da, $dc, $e7, "m", "o", "v", $b1, "."
.byt SCR::END_SCRIPT
Tutorial2:
.byt SCR::SCENE, SCENES::NOVA_SIGN_KEE
; <1 SIGN>Some enemies can have their abilities copied. Try stunning this enemy with B and then press Up+B while facing it to copy its ability.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "S", "o", $d0, " ", $e6, "e", "m", $e3, $fb, $b0, " ", $9b, $a2, "i", "r", SCR::NEWLINE, "a", "b", $dc, "i", "t", $e3, $fb, "c", "o", "p", $e3, "d", $f6, "T", "r", $fe, $de, $f2, "n", $b1, SCR::NEWLINE, $99, " ", $e6, "e", $cb, " ", $9d, " ", "B", " ", $a4, $94, SCR::NEWLINE, "p", "r", "e", $f1, " ", "U", "p", "+", "B", " ", $da, $dc, $e7, "f", "a", "c", $b1, " ", $c1, $bc, SCR::NEWLINE, "c", "o", "p", $fe, "i", "t", $fb, "a", "b", $dc, "i", "t", "y", "."
; <1 SIGN>Hold Select to get rid of the ability you have. If an enemy throws projectiles, it is usually copyable.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "H", "o", $ef, " ", "S", "e", "l", "e", $c7, " ", $bb, $af, " ", $fc, $ff, $bd, $a2, SCR::NEWLINE, "a", "b", $dc, "i", "t", $fe, $a6, " ", "h", "a", "v", "e", $f6, "I", "f", " ", $ca, " ", $e6, "e", $cb, SCR::NEWLINE, $e0, "r", "o", "w", $fb, "p", "r", "o", "j", "e", $c7, $dc, "e", "s", $f5, $c1, $b9, SCR::NEWLINE, "u", "s", "u", $ad, $fe, "c", "o", "p", "y", "a", "b", "l", "e", "."
; <0 NOVA_YAY>Oooo, I should see if copying this enemy will let me shoot fireballs!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_YAY, "O", $e4, "o", $f5, $c0, $df, $a0, " ", $b3, " ", $ce, " ", "c", "o", "p", "y", $b1, SCR::NEWLINE, $99, " ", $e6, "e", $cb, " ", $9e, " ", $a8, " ", $d0, " ", $df, $e4, "t", SCR::NEWLINE, "f", "i", "r", "e", "b", $ad, "s", "!"
.byt SCR::END_SCRIPT
Tutorial3:
.byt SCR::SCENE, SCENES::NOVA_SIGN_KEE
; <1 SIGN>You can jump down from this white colored platform. Stand on it and then hold Down.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "Y", $f4, " ", $b0, " ", "j", "u", "m", "p", " ", $c5, "w", "n", " ", $97, $99, SCR::NEWLINE, $da, "i", $eb, " ", "c", "o", "l", $c9, $d6, "p", "l", $c6, $a5, "m", $f6, "S", "t", $ca, "d", SCR::NEWLINE, $c2, " ", $c1, $a4, $94, " ", "h", "o", $ef, " ", "D", "o", "w", "n", "."
; <0 NOVA>White platform? Like in the third Super M-
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "W", "h", "i", $eb, " ", "p", "l", $c6, $a5, "m", "?", " ", "L", "i", "k", $e7, $bf, $a2, SCR::NEWLINE, $e0, "i", "r", $ff, "S", $cd, $ed, " ", "M", "-"
; <2 KEE>Yes. Shhhh.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::KEE, "Y", "e", "s", $f6, "S", "h", "h", "h", "h", "."
.byt SCR::END_SCRIPT
Tutorial4:
.byt SCR::SCENE, SCENES::NOVA_SIGN_KEE
; <1 SIGN>Use Up to grab onto a ladder or Down to drop down onto it from the top.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "U", $e5, " ", "U", "p", " ", $bb, "g", "r", "a", "b", " ", $c2, $bb, $be, "l", $f7, "d", $ed, SCR::NEWLINE, $c9, " ", "D", "o", "w", "n", " ", $bb, "d", "r", "o", "p", " ", $c5, "w", "n", " ", $c2, $bb, "i", "t", SCR::NEWLINE, $97, $a2, " ", $bc, "p", "."
; <2 KEE>Yeah Nova, show off your rad climbing skills.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::KEE, "Y", $ec, "h", " ", $a1, $f5, $df, "o", "w", " ", "o", "f", "f", " ", $91, " ", "r", $f7, SCR::NEWLINE, "c", "l", "i", "m", "b", $b1, " ", "s", "k", $dc, "l", "s", "."
.byt SCR::END_SCRIPT
Tutorial5:
.byt SCR::SCENE, SCENES::NOVA_SIGN_KEE
; <1 SIGN>Many abilities have altered behavior if you hold Up or Down while you press B. Try holding up while shooting a fireball and see if you can hit this enemy.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "M", $ab, " ", "a", "b", $dc, "i", "t", $e3, $fb, $9b, "a", "l", $eb, "r", "e", "d", SCR::NEWLINE, "b", "e", "h", "a", "v", "i", $c9, " ", $ce, " ", $a6, " ", "h", "o", $ef, " ", "U", "p", " ", $c9, SCR::NEWLINE, "D", "o", "w", "n", " ", $da, $dc, $e7, $a6, " ", "p", "r", "e", $f1, " ", "B", $f6, "T", "r", "y", SCR::NEWLINE, "h", "o", $ef, $b1, " ", $cd, " ", $da, $dc, $e7, $df, $e4, "t", $b1, " ", "a", SCR::NEWLINE, "f", "i", "r", "e", "b", $ad, " ", $a4, $b3, " ", $ce, " ", $a6, " ", $b0, " ", "h", "i", "t", SCR::NEWLINE, $99, " ", $e6, "e", $cb, "."
; <0 NOVA>Still no idea what we're doing here, but I guess I'll find out if I press on? Eventually?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "S", "t", $dc, "l", " ", $d1, " ", "i", "d", $ec, " ", $8b, " ", $c8, "'", "r", $e7, $c5, $b1, SCR::NEWLINE, $a9, "e", $f5, $a7, " ", $c0, "g", "u", "e", $f1, " ", $d5, " ", "f", $d8, $ff, $ae, SCR::NEWLINE, $ce, " ", $c0, "p", "r", "e", $f1, " ", $c2, "?", " ", "E", "v", $e6, "t", "u", $ad, "y", "?"
; <2 KEE>Alright, while you're doing that I'm going to try and figure things out on my own.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::KEE, "A", "l", $fc, $db, "t", $f5, $da, $dc, $e7, $a6, "'", "r", $e7, $c5, $b1, SCR::NEWLINE, $9a, $d4, $cf, $b1, " ", $bb, $fa, $fe, $ca, "d", SCR::NEWLINE, "f", "i", "g", "u", "r", $e7, $e0, $b1, $fb, $ae, " ", $c2, " ", $cb, " ", "o", "w", "n", "."
.byt SCR::END_SCRIPT
Nice_Announcement:
.byt SCR::SCENE, SCENES::NOTHING
; []Before Nova arrived in Latteverse, the world was attacked by the "Scheme Team", a robot army that attempted to kill everyone. They were stopped by the Double Action Blaster Guys, who blasted their way to victory. The Scheme Team was arrested, but the Blaster Guys are nowhere to be found...
.byt SCR::NARRATE, CHAR::NONE, "B", "e", $a5, $e7, $a1, " ", "a", $d9, "i", "v", $d6, $d8, SCR::NEWLINE, $84, "v", $ed, $e5, $f5, $a2, " ", "w", $c9, $ef, " ", "w", $c4, SCR::NEWLINE, $c6, "t", "a", $f3, $d6, "b", $fe, $a2, " ", '"', "S", $e2, "e", $d0, SCR::NEWLINE, "T", $ec, "m", '"', $f5, $be, "r", "o", "b", "o", $d3, "a", "r", $cb, " ", $e0, $c6, SCR::NEWLINE, $c6, $eb, "m", "p", $eb, $ff, $bb, "k", $dc, "l", " ", "e", "v", $ed, "y", $ac, ".", SCR::NEWLINE, $f8, "e", $fe, $c8, "r", $e7, $de, "o", "p", "p", $d6, "b", $fe, $a2, SCR::NEWLINE, "D", $f4, "b", "l", $e7, "A", $c7, "i", $c2, " ", "B", "l", $c4, $eb, $ea, "G", "u", "y", "s", ",", SCR::NEWLINE, $da, "o", " ", "b", "l", $c4, $eb, $ff, $a2, "i", $ea, $b7, " ", $bc, SCR::NEWLINE, "v", "i", $c7, $c9, "y", $f6, $f8, $e7, "S", $e2, "e", $d0, " ", "T", $ec, "m", SCR::NEWLINE, "w", $c4, " ", "a", $d9, "e", $de, "e", "d", $f5, $a7, " ", $a2, " ", "B", "l", $c4, $eb, "r", SCR::NEWLINE, "G", "u", "y", $fb, "a", "r", $e7, $b4, $a9, $e7, $bb, "b", "e", SCR::NEWLINE, "f", $f4, $f0, ".", ".", "."
; [KOREY]New announcement for the Latteverse:
.byt SCR::NARRATE, CHAR::KOREY, "N", "e", "w", " ", $ca, $d1, $f2, "c", "e", $d0, $e1, " ", $a5, " ", $a2, SCR::NEWLINE, $84, "v", $ed, $e5, ":"
.byt SCR::SCENE, SCENES::FORUMS
; [KOREY]Henceforth, replying to any post with nothing more than the word "nice" or a loopholed "you think you're being witty but you're not" variation of it will result in an immediate arrest. Yes, this has seriously become this large of a problem and it's going to stop.
.byt SCR::NARRATE, CHAR::KOREY, "H", $e6, "c", "e", $a5, $e0, $f5, "r", "e", "p", "l", "y", $b1, " ", $bb, $ab, SCR::NEWLINE, "p", "o", $de, " ", $9d, " ", $a3, "h", $b1, " ", "m", $c9, $e7, $93, SCR::NEWLINE, $a2, " ", "w", $c9, $ff, '"', "n", "i", "c", "e", '"', " ", $c9, " ", "a", SCR::NEWLINE, "l", $e4, "p", "h", "o", "l", $d6, '"', $a6, " ", $82, " ", $a6, "'", "r", "e", SCR::NEWLINE, "b", "e", $b1, " ", "w", "i", "t", "t", $fe, $a7, " ", $a6, "'", "r", $e7, $a3, '"', SCR::NEWLINE, "v", "a", $fc, $c6, "i", $c2, " ", $bd, $c1, $9e, " ", "r", "e", "s", "u", "l", $d3, $bf, $ca, SCR::NEWLINE, "i", "m", $d0, "d", "i", $c6, $e7, "a", $d9, "e", $de, $f6, "Y", "e", "s", $f5, $99, SCR::NEWLINE, "h", $c4, " ", $e5, $fc, $f4, "s", $d2, "b", "e", $96, " ", $99, SCR::NEWLINE, "l", "a", "r", "g", $e7, $bd, $be, $81, " ", $a4, "i", "t", "'", "s", SCR::NEWLINE, $cf, $b1, " ", $bb, $de, "o", "p", "."
; [IKE]...Why? What does it actually hurt?
.byt SCR::NARRATE, CHAR::IKE, ".", ".", ".", "W", "h", "y", "?", " ", "W", "h", $c6, " ", $c5, "e", $fb, $c1, "a", $c7, "u", $ad, "y", SCR::NEWLINE, "h", "u", $ee, "?"
; [KOREY]Some of the Scheme Team members are Smiloids. These highly-dangerous robots derive their power from exactly this kind of behavior, and they shoot people while wishing them a NICE day. We can't risk it if we want to keep them contained, especially without our heroes.
.byt SCR::NARRATE, CHAR::KOREY, "S", "o", $d0, " ", $bd, $a2, " ", "S", $e2, "e", $d0, " ", "T", $ec, "m", SCR::NEWLINE, $d0, "m", "b", $ed, $fb, "a", "r", $e7, "S", "m", $dc, "o", "i", "d", "s", $f6, $f8, "e", $e5, SCR::NEWLINE, "h", "i", $db, "l", "y", "-", "d", $ca, "g", $ed, $f4, $fb, "r", "o", "b", "o", "t", "s", SCR::NEWLINE, "d", $ed, "i", "v", $e7, $a2, "i", $ea, "p", "o", $c8, $ea, "f", "r", "o", "m", SCR::NEWLINE, "e", "x", "a", $c7, $d2, $99, " ", "k", $d8, $ff, $bd, "b", "e", "h", "a", "v", "i", $c9, ",", SCR::NEWLINE, $a4, $98, " ", $df, $e4, $d3, "p", "e", "o", "p", "l", $e7, $da, $dc, "e", SCR::NEWLINE, "w", $b9, "h", $b1, " ", $92, " ", $be, "N", "I", "C", "E", " ", "d", "a", "y", $f6, "W", "e", SCR::NEWLINE, $b0, $e8, $fc, "s", "k", " ", $c1, $ce, " ", $c8, " ", "w", $ca, $d3, $bc, SCR::NEWLINE, "k", $d7, "p", " ", $92, " ", "c", $c2, "t", "a", $d8, "e", "d", ",", SCR::NEWLINE, "e", $dd, "e", "c", "i", $ad, $fe, $9d, $ae, " ", $b6, SCR::NEWLINE, $a9, "o", "e", "s", "."
; []Meanwhile, it seems like the Scheme Team has escaped after all...
.byt SCR::NARRATE, CHAR::NONE, "M", $ec, "n", $da, $dc, "e", $f5, $c1, $b3, "m", $fb, $8d, " ", $a2, SCR::NEWLINE, "S", $e2, "e", $d0, " ", "T", $ec, "m", " ", "h", $c4, " ", "e", "s", "c", "a", "p", "e", "d", SCR::NEWLINE, $83, " ", $ad, ".", ".", "."
.byt SCR::SCENE, SCENES::TWO_BAD_GUYS
; <0 S_TEAM>So you actually saw one of the Blaster Guys around here? We'd better capture him so that he can't interfere with the plans...
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::S_TEAM, "S", "o", " ", $a6, " ", "a", $c7, "u", $ad, $fe, "s", "a", "w", " ", $ac, " ", "o", "f", SCR::NEWLINE, $a2, " ", "B", "l", $c4, $eb, $ea, "G", "u", "y", $fb, "a", "r", $f4, $f0, SCR::NEWLINE, $a9, "e", "?", " ", "W", "e", "'", $ff, "b", "e", "t", $eb, $ea, "c", "a", "p", "t", "u", "r", "e", SCR::NEWLINE, $b2, " ", $cc, " ", $9a, $c3, " ", $b0, $e8, $d8, $eb, "r", "f", $ed, "e", SCR::NEWLINE, $9d, " ", $a2, " ", "p", "l", $ca, "s", ".", ".", "."
; <1 S_TEAM>GOOD idea. Hey, I think he's over there checking his mail!!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::S_TEAM, "G", "O", "O", "D", " ", "i", "d", $ec, $f6, "H", "e", "y", $f5, $c0, $82, " ", $c3, "'", "s", SCR::NEWLINE, $8c, " ", $88, " ", $e2, "e", $f3, $b1, " ", "h", $b8, "m", "a", $dc, "!", "!"
; <0 SHERWIN>Oh it's a fine day. *checks mail* 
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::SHERWIN, "O", "h", " ", "i", "t", $e9, $be, "f", $d8, $e7, "d", "a", "y", $f6, "*", $e2, "e", $f3, "s", SCR::NEWLINE, "m", "a", $dc, "*", " "
.byt SCR::SCENE, SCENES::SHERWIN_ALONE
; <0 SHERWIN>Whoa, could you two maybe knock?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::SHERWIN, "W", "h", "o", "a", $f5, "c", $a0, " ", $a6, " ", "t", "w", "o", " ", "m", "a", "y", "b", "e", SCR::NEWLINE, "k", $d1, $f3, "?"
.byt SCR::SCENE, SCENES::SHERWIN_WITH_BAD_GUYS_AS_POLICE
; <2 S_TEAM>You're coming with us!!
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::S_TEAM, "Y", $f4, "'", "r", $e7, "c", "o", "m", $b1, " ", $9d, " ", "u", "s", "!", "!"
; <0 SHERWIN>Wait, am I being arrested? Hi police guy!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::SHERWIN, "W", "a", "i", "t", $f5, "a", "m", " ", $c0, "b", "e", $b1, " ", "a", $d9, "e", $de, "e", "d", "?", " ", "H", "i", SCR::NEWLINE, "p", "o", "l", "i", "c", $e7, "g", "u", "y", "!"
; <1 S_TEAM>Yeah, we know who you are, you're one of the blaster guys.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::S_TEAM, "Y", $ec, "h", $f5, $c8, " ", $8f, " ", $da, "o", " ", $a6, " ", "a", "r", "e", ",", SCR::NEWLINE, $a6, "'", "r", $e7, $ac, " ", $bd, $a2, " ", "b", "l", $c4, $eb, "r", SCR::NEWLINE, "g", "u", "y", "s", "."
; <0 SHERWIN>Uh, no! I'm Sherwin actually.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::SHERWIN, "U", "h", $f5, $d1, $fd, $d4, "S", $a9, "w", $bf, "a", $c7, "u", $ad, "y", "."
; <1 S_TEAM>Suuuuure. I'd recognize that beard and orange shirt anywhere.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::S_TEAM, "S", "u", "u", "u", "u", "u", "r", "e", $f6, "I", "'", $ff, "r", "e", "c", "o", "g", "n", "i", "z", $e7, $e0, $c6, SCR::NEWLINE, "b", $ec, "r", $ff, $a4, $c9, $ca, "g", $e7, $df, "i", $ee, SCR::NEWLINE, $ab, $da, $ed, "e", "."
; <2 S_TEAM>We're going to lock you up forever yes you heard me FOREVER.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::S_TEAM, "W", "e", "'", "r", $e7, $cf, $b1, " ", $bb, "l", "o", $f3, " ", $a6, " ", $cd, SCR::NEWLINE, $a5, "e", "v", $ed, " ", "y", "e", $fb, $a6, " ", $c3, "a", "r", $ff, $d0, SCR::NEWLINE, "F", "O", "R", "E", "V", "E", "R", "."
; []-Sherwin gets taken to the Scheme Team lair-
.byt SCR::NARRATE, CHAR::NONE, "-", "S", $a9, "w", $bf, $af, $fb, $90, "n", " ", $bb, $a2, SCR::NEWLINE, "S", $e2, "e", $d0, " ", "T", $ec, "m", " ", "l", "a", "i", "r", "-"
.byt SCR::TRANSITION
; [SHERWIN]WELL I guess I'll go post about this on the forums. I'll create a new thread. I'll need a good name, hmmm...
.byt SCR::NARRATE, CHAR::SHERWIN, "W", "E", "L", "L", " ", $c0, "g", "u", "e", $f1, " ", $d5, " ", $cf, " ", "p", "o", $de, SCR::NEWLINE, $8a, $99, " ", $c2, " ", $a2, " ", $a5, "u", "m", "s", $f6, $d5, SCR::NEWLINE, "c", "r", $ec, $eb, " ", $be, $f9, "w", " ", $e0, "r", $ec, "d", $f6, $d5, " ", $f9, "e", "d", SCR::NEWLINE, $be, $cf, "o", $ff, "n", "a", $d0, $f5, "h", "m", "m", "m", ".", ".", "."
.byt SCR::SCENE, SCENES::FORUMS
; []-halp I've been taken-
.byt SCR::NARRATE, CHAR::NONE, $86
; [SHERWIN]These robot guys with guns just took me. This is illegal you know!
.byt SCR::NARRATE, CHAR::SHERWIN, $f8, "e", $e5, " ", "r", "o", "b", "o", $d3, "g", "u", "y", $fb, $9d, " ", "g", $f2, "s", SCR::NEWLINE, $8e, $bc, "o", "k", " ", $d0, $f6, $f8, $b8, $b8, $dc, "l", "e", "g", "a", "l", SCR::NEWLINE, $a6, " ", $8f, "!"
; [KOREY]Gosh dangit, guess I was too late. It's over, we're doomed.
.byt SCR::NARRATE, CHAR::KOREY, "G", "o", $df, " ", "d", $ca, "g", "i", "t", $f5, "g", "u", "e", $f1, " ", $c0, "w", $c4, " ", $bc, "o", SCR::NEWLINE, "l", $c6, "e", $f6, "I", "t", $e9, $8c, $f5, $c8, "'", "r", $e7, $c5, "o", $d0, "d", "."
.byt SCR::END_SCRIPT
FirstSchemeTeamEncounter:
.byt SCR::SCENE, SCENES::NOVA_AND_BAD_GUYS_AND_IKE
; <0 NOVA>Oh, finally some other people! Could you tell me where I am?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "O", "h", $f5, "f", $d8, $ad, $fe, $9c, " ", "o", $a2, $ea, "p", "e", "o", "p", "l", "e", "!", SCR::NEWLINE, "C", $a0, " ", $a6, " ", $eb, "l", "l", " ", $d0, " ", $da, $ed, $e7, $c0, "a", "m", "?"
; <1 S_TEAM>No, but you'd make great target practice before we take off with this cat here.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::S_TEAM, "N", "o", $f5, $a7, " ", $a6, "'", $ff, "m", "a", "k", $e7, "g", "r", $ec, "t", SCR::NEWLINE, "t", "a", "r", $af, " ", "p", "r", "a", $c7, "i", "c", $e7, "b", "e", $a5, $e7, $c8, SCR::NEWLINE, $90, " ", "o", "f", "f", " ", $9d, " ", $99, " ", "c", $c6, " ", $a9, "e", "."
; <3 IKE>Actually, you're going to leave this cat right here. I need to get back to my shop!
.byt SCR::SAY, SCR::SPEAKER_3|CHAR::IKE, "A", $c7, "u", $ad, "y", $f5, $a6, "'", "r", $e7, $cf, $b1, " ", $bc, SCR::NEWLINE, "l", $ec, "v", $e7, $99, " ", "c", $c6, " ", $fc, $db, $d3, $a9, "e", $f6, "I", SCR::NEWLINE, $f9, $d6, $bb, $af, " ", "b", "a", $f3, " ", $bb, $cb, " ", $df, "o", "p", "!"
; <0 NOVA_MAD>Oh you want a fight? I'll give you a fight...
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_MAD, "O", "h", " ", $a6, " ", "w", $ca, $d3, $be, "f", "i", $db, "t", "?", " ", $d5, " ", "g", "i", "v", "e", SCR::NEWLINE, $a6, " ", $be, "f", "i", $db, "t", ".", ".", "."
.byt SCR::END_SCRIPT
FirstSchemeTeamEncounterAfter:
.byt SCR::SCENE, SCENES::TWO_BAD_GUYS
; []The Scheme Team members flee.
.byt SCR::NARRATE, CHAR::NONE, $f8, $e7, "S", $e2, "e", $d0, " ", "T", $ec, "m", " ", $d0, "m", "b", $ed, "s", SCR::NEWLINE, "f", "l", $d7, "."
; <0 S_TEAM>Ouch. That squirrel isn't as weak as she seemed. We need to tell the boss so we can take care of this.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::S_TEAM, "O", "u", $e2, $f6, $f8, $c6, " ", $80, " ", $b9, "n", $e8, $c4, SCR::NEWLINE, $c8, "a", "k", " ", $c4, " ", $aa, " ", $b3, $d0, "d", $f6, "W", $e7, $f9, "e", "d", SCR::NEWLINE, $bb, $eb, "l", "l", " ", $a2, " ", "b", "o", $f1, " ", $cc, " ", $c8, " ", $b0, SCR::NEWLINE, $90, " ", "c", "a", "r", $e7, $bd, $99, "."
; <0 S_TEAM>Hey Bill???
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::S_TEAM, "H", "e", $fe, "B", $dc, "l", "?", "?", "?"
.byt SCR::SCENE, SCENES::BAD_GUYS_AND_LEADER
; <2 BILL>What? Why do you guys look beat-up?
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::BILL, "W", "h", $c6, "?", " ", "W", "h", $fe, $c5, " ", $a6, " ", "g", "u", "y", $fb, $95, SCR::NEWLINE, "b", $ec, "t", "-", $cd, "?"
; <0 S_TEAM>There's this weird green squirrel that totally kicked our butts, without even having a gun. Is that going to pose a threat to the plans?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::S_TEAM, $f8, $ed, "e", $e9, $99, " ", $c8, "i", "r", $ff, "g", "r", $d7, "n", SCR::NEWLINE, $80, " ", $9a, $bc, "t", $ad, $fe, "k", "i", $f3, "e", "d", SCR::NEWLINE, $b6, " ", $a7, "t", "s", $f5, $9d, $ae, " ", $9f, SCR::NEWLINE, "h", "a", "v", $b1, " ", $be, "g", $f2, $f6, "I", $fb, $9a, $cf, $b1, " ", $bc, SCR::NEWLINE, "p", "o", $e5, " ", $be, $e0, "r", $ec, $d3, $bb, $a2, " ", "p", "l", $ca, "s", "?"
; <2 BILL>No, probably not. We'll just send the Smiloids after her if it becomes a problem.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::BILL, "N", "o", $f5, "p", "r", "o", "b", "a", "b", $d2, $a3, $f6, "W", "e", "'", "l", "l", " ", "j", "u", $de, SCR::NEWLINE, $e5, $f0, " ", $a2, " ", "S", "m", $dc, "o", "i", "d", $fb, $83, " ", $a9, " ", $ce, SCR::NEWLINE, $c1, "b", "e", $96, $fb, $be, $81, "."
; <0 NOVA>There. Are you okay?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, $f8, $ed, "e", $f6, "A", "r", $e7, $a6, " ", "o", "k", "a", "y", "?"
.byt SCR::SCENE, SCENES::NOVA_AND_IKE
; <1 IKE>I'm fine, thank you. My name's Ike, and I run the item shop. The Scheme Team was trying to kidnap me so I couldn't sell items to any heroes.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::IKE, $d4, "f", $d8, "e", $f5, $93, "k", " ", $a6, $f6, "M", $fe, "n", "a", $d0, "'", "s", SCR::NEWLINE, "I", "k", "e", $f5, $a4, $c0, "r", $f2, " ", $a2, " ", "i", $eb, "m", " ", $df, "o", "p", ".", SCR::NEWLINE, $f8, $e7, "S", $e2, "e", $d0, " ", "T", $ec, "m", " ", "w", $c4, " ", $fa, "y", $b1, SCR::NEWLINE, $bb, "k", "i", "d", "n", "a", "p", " ", $d0, " ", $cc, " ", $c0, "c", $a0, "n", $e8, $e5, "l", "l", SCR::NEWLINE, "i", $eb, "m", $fb, $bb, $ab, " ", $a9, "o", "e", "s", "."
; <0 NOVA>The Scheme Team? Are there more of those guys?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, $f8, $e7, "S", $e2, "e", $d0, " ", "T", $ec, "m", "?", " ", "A", "r", $e7, $88, SCR::NEWLINE, "m", $c9, $e7, $bd, $e0, "o", $e5, " ", "g", "u", "y", "s", "?"
; <1 IKE>Yeah, tons. They recently broke out of prison and everyone's in a panic.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::IKE, "Y", $ec, "h", $f5, $bc, "n", "s", $f6, $f8, "e", $fe, "r", "e", "c", $e6, "t", "l", "y", SCR::NEWLINE, "b", "r", "o", "k", $e7, $ae, " ", $bd, "p", $fc, $cc, "n", " ", $ca, "d", SCR::NEWLINE, "e", "v", $ed, "y", $ac, $e9, $bf, $be, "p", $ca, "i", "c", "."
; <0 NOVA>I'll see what I can do to help. By the way, how do I get to your shop?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, $d5, " ", $b3, " ", $8b, " ", $c0, $b0, " ", $c5, " ", $bb, $c3, "l", "p", ".", SCR::NEWLINE, "B", $fe, $a2, " ", $b7, $f5, $b5, " ", $c5, " ", $c0, $af, " ", $bc, SCR::NEWLINE, $91, " ", $df, "o", "p", "?"
; <1 IKE>Just press Start on the level select screen. You can exit a level and go to it via the pause menu.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::IKE, "J", "u", $de, " ", "p", "r", "e", $f1, " ", "S", "t", "a", $ee, " ", $c2, " ", $a2, " ", "l", "e", "v", "e", "l", SCR::NEWLINE, $e5, "l", "e", $c7, " ", "s", "c", "r", $d7, "n", $f6, "Y", $f4, " ", $b0, " ", "e", "x", $c1, "a", SCR::NEWLINE, "l", "e", "v", "e", "l", " ", $a4, $cf, " ", $bb, $c1, "v", "i", $be, $a2, SCR::NEWLINE, "p", "a", "u", $e5, " ", $d0, "n", "u", "."
; <1 IKE>By the way, since you asked, this world is named Latte. Good luck, dude.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::IKE, "B", $fe, $a2, " ", $b7, $f5, "s", $d8, "c", $e7, $a6, " ", $c4, "k", "e", "d", ",", SCR::NEWLINE, $99, " ", "w", $c9, $ef, " ", $b8, "n", "a", $d0, $ff, $84, ".", SCR::NEWLINE, "G", $e4, $ff, "l", "u", $f3, $f5, "d", "u", "d", "e", "."
.byt SCR::END_SCRIPT
AfterFirstBattle:
.byt SCR::SCENE, SCENES::FORUMS
; []-halp I've been taken-
.byt SCR::NARRATE, CHAR::NONE, $86
; [SHERWIN]Let's make the best of my situation. I'm stuck here, so how about I leak out information on what the Scheme Team is doing?
.byt SCR::NARRATE, CHAR::SHERWIN, "L", "e", "t", $e9, "m", "a", "k", $e7, $a2, " ", "b", "e", $de, " ", $bd, $cb, SCR::NEWLINE, "s", "i", "t", "u", $c6, "i", $c2, $f6, $d4, $de, "u", $f3, " ", $a9, "e", $f5, $cc, SCR::NEWLINE, $b5, " ", $8a, $c0, "l", $ec, "k", " ", $ae, SCR::NEWLINE, $d8, $a5, "m", $c6, "i", $c2, " ", $c2, " ", $8b, " ", $a2, SCR::NEWLINE, "S", $e2, "e", $d0, " ", "T", $ec, "m", " ", $b8, $c5, $b1, "?"
; [KOREY]That could help. Are you saying you've got something to share?
.byt SCR::NARRATE, CHAR::KOREY, $f8, $c6, " ", "c", $a0, " ", $c3, "l", "p", $f6, "A", "r", $e7, $a6, SCR::NEWLINE, "s", "a", "y", $b1, " ", $a6, "'", "v", $e7, $cf, $d3, $9c, $e0, $b1, SCR::NEWLINE, $bb, $df, "a", "r", "e", "?"
; [SHERWIN]Yes! I heard there was a fight with some weird green squirrel? She totally kicked some Scheme Team members' butts.
.byt SCR::NARRATE, CHAR::SHERWIN, "Y", "e", "s", $fd, $c0, $c3, "a", "r", $ff, $88, " ", "w", $c4, " ", $be, "f", "i", $db, "t", SCR::NEWLINE, $9d, " ", $9c, " ", $c8, "i", "r", $ff, "g", "r", $d7, "n", SCR::NEWLINE, $80, "?", " ", "S", $c3, " ", $bc, "t", $ad, $fe, "k", "i", $f3, "e", "d", SCR::NEWLINE, $9c, " ", "S", $e2, "e", $d0, " ", "T", $ec, "m", " ", $d0, "m", "b", $ed, "s", "'", SCR::NEWLINE, $a7, "t", "s", "."
; [KOREY]Oh good! Do you know where she is? Or where -you- are?
.byt SCR::NARRATE, CHAR::KOREY, "O", "h", " ", $cf, "o", "d", $fd, "D", "o", " ", $a6, " ", $8f, " ", $da, $ed, "e", SCR::NEWLINE, $aa, " ", $b9, "?", " ", "O", $ea, $da, $ed, $e7, "-", $a6, "-", " ", "a", "r", "e", "?"
; [SHERWIN]I got taken to Atomic Videoclip Zone so I'll asume that's their base. The squirrel seemed to be heading to Bummer Club.
.byt SCR::NARRATE, CHAR::SHERWIN, $c0, $cf, $d3, $90, "n", " ", $bb, "A", $bc, "m", "i", "c", SCR::NEWLINE, "V", "i", "d", "e", "o", "c", "l", "i", "p", " ", "Z", $ac, " ", $cc, " ", $d5, " ", $c4, "u", $d0, SCR::NEWLINE, $e0, $c6, $e9, $a2, "i", $ea, "b", $c4, "e", $f6, $f8, "e", SCR::NEWLINE, $80, " ", $b3, $d0, $ff, $bb, $ba, $c3, $f7, $b1, SCR::NEWLINE, $bb, "B", "u", "m", $d0, $ea, "C", "l", "u", "b", "."
; [KOREY]I'll meet up with her there.
.byt SCR::NARRATE, CHAR::KOREY, $d5, " ", $d0, "e", $d3, $cd, " ", $9d, " ", $a9, " ", $88, "."
; []Korey rushes to the scene, introduces himself and explains Latte's situation to Nova. They chat a bit.
.byt SCR::NARRATE, CHAR::NONE, "K", $c9, "e", $fe, "r", "u", $aa, $fb, $bb, $a2, " ", "s", "c", $e6, "e", ",", SCR::NEWLINE, $d8, $fa, "o", "d", "u", "c", "e", $fb, $b2, $e5, "l", "f", " ", $ca, "d", SCR::NEWLINE, "e", "x", "p", "l", "a", $d8, $fb, $84, $e9, "s", "i", "t", "u", $c6, "i", $c2, " ", $bc, SCR::NEWLINE, $a1, $f6, $f8, "e", $fe, $e2, $c6, " ", $be, "b", "i", "t", "."
.byt SCR::SCENE, SCENES::NOVA_AND_KOREY
; <1 KOREY>... and this is the Scheme Team's second try at taking over, but this time they're prepared for anything any Latte residents can throw at them.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::KOREY, ".", ".", $f6, $a4, $99, " ", $b8, $a2, " ", "S", $e2, "e", $d0, SCR::NEWLINE, "T", $ec, "m", $e9, $e5, "c", $c2, $ff, $fa, $fe, $c6, " ", "t", "a", "k", $b1, SCR::NEWLINE, $8c, $f5, $a7, " ", $99, " ", "t", "i", $d0, " ", $98, "'", "r", "e", SCR::NEWLINE, "p", "r", "e", "p", "a", "r", $d6, $a5, " ", $ab, $e0, $b1, " ", $ab, SCR::NEWLINE, $84, " ", "r", "e", "s", "i", "d", $e6, "t", $fb, $b0, " ", $e0, "r", "o", "w", " ", $c6, SCR::NEWLINE, $92, "."
; <0 NOVA>Point being that I have a chance because I'm not from here?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "P", "o", $d8, $d3, "b", "e", $b1, " ", $9a, $c0, $9b, "a", SCR::NEWLINE, $e2, $ca, "c", $e7, "b", "e", "c", "a", "u", $e5, " ", $d4, $a3, " ", "f", "r", "o", "m", SCR::NEWLINE, $a9, "e", "?"
; <1 KOREY>Exactly. I know it's dangerous, but are you willing to help us? I don't know how you and Kee got here, but once this is over I'll try and get you two home.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::KOREY, "E", "x", "a", $c7, "l", "y", $f6, $c0, $8f, " ", "i", "t", "'", "s", SCR::NEWLINE, "d", $ca, "g", $ed, $f4, "s", $f5, $a7, " ", "a", "r", $e7, $a6, " ", $9e, $b1, SCR::NEWLINE, $bb, $c3, "l", "p", " ", "u", "s", "?", " ", $c0, $c5, "n", $e8, $8f, " ", $b5, SCR::NEWLINE, $a6, " ", $a4, "K", $d7, " ", $cf, $d3, $a9, "e", $f5, $a7, SCR::NEWLINE, $c2, "c", $e7, $99, " ", $b8, $8c, " ", $d5, " ", $fa, $fe, $ca, "d", SCR::NEWLINE, $af, " ", $a6, " ", "t", "w", "o", " ", "h", "o", $d0, "."
; <0 NOVA>I'll have to try. I was able to save Ike, maybe I can save the rest of you.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, $d5, " ", $9b, $bb, $fa, "y", $f6, $c0, "w", $c4, " ", "a", "b", "l", $e7, $bc, SCR::NEWLINE, "s", "a", "v", $e7, "I", "k", "e", $f5, "m", "a", "y", $ba, $c0, $b0, " ", "s", "a", "v", "e", SCR::NEWLINE, $a2, " ", "r", "e", $de, " ", $bd, $a6, "."
; <1 KOREY>Great. Latte has its own forum, and we've been keeping track of the situation on it. You should look at it.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::KOREY, "G", "r", $ec, "t", $f6, $84, " ", "h", $c4, " ", "i", "t", $fb, "o", "w", "n", SCR::NEWLINE, $a5, "u", "m", $f5, $a4, $c8, "'", "v", $e7, "b", $d7, "n", SCR::NEWLINE, "k", $d7, "p", $b1, " ", $fa, "a", $f3, " ", $bd, $a2, " ", "s", "i", "t", "u", $c6, "i", $c2, SCR::NEWLINE, $c2, " ", "i", "t", $f6, "Y", $f4, " ", $df, $a0, " ", $95, " ", $c6, " ", "i", "t", "."
; <0 NOVA>Alright. What should I do next?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "A", "l", $fc, $db, "t", $f6, "W", "h", $c6, " ", $df, $a0, " ", $c0, $c5, SCR::NEWLINE, $f9, "x", "t", "?"
; <1 KOREY>You should go through this clubhouse up ahead. It's named Bummer Club, and it's got a prize locked up at the very end.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::KOREY, "Y", $f4, " ", $df, $a0, " ", $cf, " ", $e0, "r", $f4, $db, " ", $99, SCR::NEWLINE, "c", "l", "u", "b", "h", $f4, $e5, " ", $cd, " ", "a", $c3, $f7, $f6, "I", "t", "'", "s", SCR::NEWLINE, "n", "a", $d0, $ff, "B", "u", "m", $d0, $ea, "C", "l", "u", "b", $f5, $a4, "i", "t", "'", "s", SCR::NEWLINE, $cf, $d3, $be, "p", $fc, "z", $e7, "l", "o", $f3, $d6, $cd, " ", $c6, " ", $a2, SCR::NEWLINE, "v", $ed, $fe, $e6, "d", "."
.byt SCR::END_SCRIPT
MeetLia:
.byt SCR::SCENE, SCENES::NOVA_AND_LIA
; <0 NOVA_WOW>Oh it's Lia! I haven't seen you in forever.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_WOW, "O", "h", " ", "i", "t", $e9, "L", "i", "a", $fd, $c0, "h", "a", "v", $e6, $e8, $b3, "n", " ", $a6, SCR::NEWLINE, $bf, $a5, "e", "v", $ed, "."
; <1 LIA>Das me! I was teleported here while looking for yous.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "D", $c4, " ", $d0, $fd, $c0, "w", $c4, " ", $eb, "l", "e", "p", $c9, $eb, $ff, $a9, "e", SCR::NEWLINE, $da, $dc, $e7, $95, $b1, " ", $a5, " ", $a6, "s", "."
; <0 NOVA>Maybe you can help me out on these puzzles.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "M", "a", "y", $ba, $a6, " ", $b0, " ", $c3, "l", "p", " ", $d0, " ", $ae, SCR::NEWLINE, $c2, " ", $89, "p", "u", "z", "z", "l", "e", "s", "."
; <1 LIA>Okies! I'd be happy to!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "O", "k", $e3, "s", $fd, "I", "'", $ff, $ba, "h", "a", "p", "p", $fe, $bc, "!"
.byt SCR::END_SCRIPT
SmiloidAtBummerClub:
.byt SCR::SCENE, SCENES::NOVA_AND_SMILOID
; <2 S_TEAM>Hey squirrel! Your adventure stops here!
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::S_TEAM, "H", "e", $fe, $80, $fd, "Y", $b6, " ", $f7, "v", $e6, "t", "u", "r", "e", SCR::NEWLINE, $de, "o", "p", $fb, $a9, "e", "!"
; <1 SMILOID>Have a nice day!!!! Prepare to die!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SMILOID, "H", "a", "v", $e7, $be, "n", "i", "c", $e7, "d", "a", "y", "!", "!", "!", $fd, "P", "r", "e", "p", "a", "r", $e7, $bc, SCR::NEWLINE, "d", $e3, "!"
; <0 NOVA_WOW>Lia, run!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_WOW, "L", "i", "a", $f5, "r", $f2, "!"
; [LIA]Aaa, way ahead of you there, Nova!
.byt SCR::NARRATE, CHAR::LIA, "A", "a", "a", $f5, $b7, " ", "a", $c3, $f7, " ", $bd, $a6, " ", $88, ",", SCR::NEWLINE, $a1, "!"
; <2 S_TEAM>Don't worry, we're only interested in taking out *you*.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::S_TEAM, "D", $c2, $e8, "w", $c9, "r", "y", $f5, $c8, "'", "r", $e7, $c2, "l", "y", SCR::NEWLINE, $d8, $eb, "r", "e", $de, $d6, $bf, "t", "a", "k", $b1, " ", $ae, SCR::NEWLINE, "*", $a6, "*", "."
.byt SCR::END_SCRIPT
AfterSmiloidAtBummerClub:
.byt SCR::SCENE, SCENES::NOVA_AND_SMILOID
; <2 S_TEAM>Oh is that so? Then we'll just have to build a bigger and stronger model!! Then you're toast!
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::S_TEAM, "O", "h", " ", $b8, $9a, $cc, "?", " ", $f8, $e6, " ", $c8, "'", "l", "l", " ", "j", "u", $de, SCR::NEWLINE, $9b, $bb, "b", "u", $dc, $ff, $be, "b", "i", "g", "g", $ed, " ", $ca, "d", SCR::NEWLINE, $de, "r", $c2, "g", $ed, " ", "m", "o", "d", "e", "l", "!", $fd, $f8, $e6, " ", $a6, "'", "r", "e", SCR::NEWLINE, $bc, $c4, "t", "!"
; <0 NOVA_SILLY>Yeah, we'll see about that.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_SILLY, "Y", $ec, "h", $f5, $c8, "'", "l", "l", " ", $b3, " ", $8a, $e0, $c6, "."
.byt SCR::END_SCRIPT
NovaAndEclipse:
.byt SCR::SCENE, SCENES::NOVA_AND_ECLIPSE
; <0 NOVA>Wow, Eclipse is here too? Is this where everyone went to?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "W", "o", "w", $f5, "E", "c", "l", "i", "p", $e5, " ", $b8, $a9, $e7, $bc, "o", "?", " ", "I", "s", SCR::NEWLINE, $99, " ", $da, $ed, $e7, "e", "v", $ed, "y", $ac, " ", $c8, $e1, " ", $bc, "?"
; <1 LIA>Apparently?
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "A", "p", "p", "a", "r", $e6, "t", "l", "y", "?"
; <2 ECLIPSE>Oh wow. Hi, sis!
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::ECLIPSE, "O", "h", " ", "w", "o", "w", $f6, "H", "i", $f5, "s", $b9, "!"
; <0 NOVA>Hiii! So, what do I get for completing Bummer Club?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "H", "i", "i", "i", $fd, "S", "o", $f5, $8b, " ", $c5, " ", $c0, $af, " ", $a5, SCR::NEWLINE, "c", "o", "m", "p", $a8, $b1, " ", "B", "u", "m", $d0, $ea, "C", "l", "u", "b", "?"
; <2 ECLIPSE>Oh, it's pretty rad! I'm awarding you some cool pants.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::ECLIPSE, "O", "h", $f5, "i", "t", $e9, "p", "r", "e", "t", "t", $fe, "r", $f7, $fd, "I", "'", "m", SCR::NEWLINE, "a", "w", "a", "r", "d", $b1, " ", $a6, " ", $9c, " ", "c", $e4, "l", SCR::NEWLINE, "p", $ca, "t", "s", "."
; <0 NOVA_STRAIGHT>...What?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_STRAIGHT, ".", ".", ".", "W", "h", $c6, "?"
; <2 ECLIPSE>Specifically, Nuclear Power Pants. They'll come in handy later on, and make you more powerful. I'm not making this up.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::ECLIPSE, "S", "p", "e", "c", $ce, "i", "c", $ad, "y", $f5, "N", "u", "c", "l", $ec, $ea, "P", "o", $c8, "r", SCR::NEWLINE, "P", $ca, "t", "s", $f6, $f8, "e", "y", "'", "l", "l", " ", $96, " ", $bf, "h", $ca, "d", "y", SCR::NEWLINE, "l", $c6, $ed, " ", $c2, $f5, $a4, "m", "a", "k", $e7, $a6, " ", "m", $c9, "e", SCR::NEWLINE, "p", "o", $c8, "r", "f", "u", "l", $f6, $d4, $a3, " ", "m", "a", "k", $b1, " ", $99, SCR::NEWLINE, $cd, "."
; <0 NOVA>Alright, thank you, Eclipse.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "A", "l", $fc, $db, "t", $f5, $93, "k", " ", $a6, $f5, "E", "c", "l", "i", "p", $e5, "."
.byt SCR::END_SCRIPT
JustGotPants:
.byt SCR::SCENE, SCENES::FORUMS
; []-halp I've been taken-
.byt SCR::NARRATE, CHAR::NONE, $86
; [NOVA_SILLY]Hey guys. I just got through Bummer Club and all I have to show for it are these new pants, hahaha. Where should I go next?
.byt SCR::NARRATE, CHAR::NOVA_SILLY, "H", "e", $fe, "g", "u", "y", "s", $f6, $c0, $8e, $cf, $d3, $e0, "r", $f4, $db, SCR::NEWLINE, "B", "u", "m", $d0, $ea, "C", "l", "u", "b", " ", $a4, $ad, " ", $c0, $9b, $bc, SCR::NEWLINE, $df, "o", "w", " ", $a5, " ", $c1, "a", "r", $e7, $89, $f9, "w", SCR::NEWLINE, "p", $ca, "t", "s", $f5, "h", "a", "h", "a", "h", "a", $f6, "W", $a9, $e7, $df, $a0, " ", "I", SCR::NEWLINE, $cf, " ", $f9, "x", "t", "?"
; [KOREY]Hey, Nuclear Power Pants are NOT a laughing matter.
.byt SCR::NARRATE, CHAR::KOREY, "H", "e", "y", $f5, $87, SCR::NEWLINE, "a", "r", $e7, "N", "O", "T", " ", $be, "l", "a", "u", $db, $b1, " ", "m", $c6, $eb, "r", "."
; [SHERWIN]I dunno I'm kind of laughing right now.
.byt SCR::NARRATE, CHAR::SHERWIN, $c0, "d", $f2, $d1, " ", $d4, "k", $d8, $ff, $bd, "l", "a", "u", $db, $b1, SCR::NEWLINE, $fc, $db, $d3, $b4, "."
; [KOREY]Anyway, head over to Frozen Volcano. Just trust me on this - I thnk it's really important that you get some Fa-a-ancy cola.
.byt SCR::NARRATE, CHAR::KOREY, "A", "n", "y", $b7, $f5, $c3, $f7, " ", $8c, " ", $bb, "F", "r", "o", "z", $e6, SCR::NEWLINE, "V", "o", "l", $b0, "o", $f6, "J", "u", $de, " ", $fa, "u", $de, " ", $d0, " ", $c2, " ", $99, SCR::NEWLINE, "-", " ", $c0, $e0, "n", "k", " ", "i", "t", $e9, "r", $ec, "l", $d2, "i", "m", "p", $c9, "t", $ca, "t", SCR::NEWLINE, $9a, $a6, " ", $af, " ", $9c, " ", "F", "a", "-", "a", "-", $ca, "c", "y", SCR::NEWLINE, "c", "o", "l", "a", "."
; [NOVA]What's so fancy about it?
.byt SCR::NARRATE, CHAR::NOVA, "W", "h", $c6, $e9, $cc, " ", "f", $ca, "c", $fe, $8a, "i", "t", "?"
; [KOREY]No, it's fa-a-ancy. Completely different. Anyway, in Frozen Volcano, there's this dude named MolSno. He has a real problem so he bought every single can of fa-a-ancy cola there is and you'll just have to get some from him.
.byt SCR::NARRATE, CHAR::KOREY, "N", "o", $f5, "i", "t", $e9, "f", "a", "-", "a", "-", $ca, "c", "y", ".", SCR::NEWLINE, "C", "o", "m", "p", $a8, "e", $d2, "d", $ce, "f", $ed, $e6, "t", $f6, "A", "n", "y", $b7, ",", SCR::NEWLINE, $bf, "F", "r", "o", "z", $e6, " ", "V", "o", "l", $b0, "o", $f5, $88, "'", "s", SCR::NEWLINE, $99, " ", "d", "u", "d", $e7, "n", "a", $d0, $ff, "M", "o", "l", "S", $d1, $f6, "H", "e", SCR::NEWLINE, "h", $c4, " ", $be, "r", $ec, "l", " ", $81, " ", $cc, " ", $c3, SCR::NEWLINE, "b", $f4, $db, $d3, "e", "v", $ed, $fe, "s", $b1, "l", $e7, $b0, " ", "o", "f", SCR::NEWLINE, "f", "a", "-", "a", "-", $ca, "c", $fe, "c", "o", "l", $be, $88, " ", $b8, $ca, "d", SCR::NEWLINE, $a6, "'", "l", "l", " ", $8e, $9b, $bb, $af, " ", $9c, SCR::NEWLINE, $97, $b2, "."
; [NOVA]Sure, I guess I'll try that. But why cola?
.byt SCR::NARRATE, CHAR::NOVA, "S", "u", "r", "e", $f5, $c0, "g", "u", "e", $f1, " ", $d5, " ", $fa, $fe, $e0, $c6, $f6, "B", "u", "t", SCR::NEWLINE, $da, $fe, "c", "o", "l", "a", "?"
; [KOREY]I'll let you in on a little secret - the name Latte comes from the latte caffeinated drink, and in this world caffeine is a really powerful thing, especially in the hands of a squirrel.
.byt SCR::NARRATE, CHAR::KOREY, $d5, " ", $a8, " ", $a6, " ", $bf, $c2, " ", $be, "l", "i", "t", "t", "l", "e", SCR::NEWLINE, $e5, "c", "r", "e", $d3, "-", " ", $a2, " ", "n", "a", $d0, " ", $84, SCR::NEWLINE, $96, $fb, $97, $a2, " ", "l", $c6, $eb, SCR::NEWLINE, "c", "a", "f", "f", "e", $d8, $c6, $d6, "d", $fc, "n", "k", $f5, $a4, $bf, $99, SCR::NEWLINE, "w", $c9, $ef, " ", "c", "a", "f", "f", "e", $d8, $e7, $b8, $be, "r", $ec, "l", "l", "y", SCR::NEWLINE, "p", "o", $c8, "r", "f", "u", "l", " ", $e0, $b1, $f5, "e", $dd, "e", "c", "i", $ad, $fe, $d8, SCR::NEWLINE, $a2, " ", "h", $ca, "d", $fb, $bd, $be, $80, "."
.byt SCR::END_SCRIPT
ColaSigns:
; []-halp I've been taken-
.byt SCR::NARRATE, CHAR::NONE, $86
.byt SCR::SCENE, SCENES::FORUMS
; [NOVA]You know maybe the reason MolSno went crazy and bought all the cola is because the volcano he lives in is covered with advertisements.
.byt SCR::NARRATE, CHAR::NOVA, "Y", $f4, " ", $8f, " ", "m", "a", "y", $ba, $a2, " ", "r", $ec, $cc, "n", SCR::NEWLINE, "M", "o", "l", "S", $d1, " ", $c8, $e1, " ", "c", "r", "a", "z", $fe, $ca, "d", SCR::NEWLINE, "b", $f4, $db, $d3, $ad, " ", $a2, " ", "c", "o", "l", $be, $b9, SCR::NEWLINE, "b", "e", "c", "a", "u", $e5, " ", $a2, " ", "v", "o", "l", $b0, "o", " ", $c3, " ", "l", "i", "v", "e", "s", SCR::NEWLINE, $bf, $b8, "c", $8c, $d6, $9d, SCR::NEWLINE, $f7, "v", $ed, "t", $b9, "e", $d0, $e1, "s", "."
; [SHERWIN]You think so?
.byt SCR::NARRATE, CHAR::SHERWIN, "Y", $f4, " ", $82, " ", $cc, "?"
.byt SCR::END_SCRIPT
MolSnoMeet:
.byt SCR::SCENE, SCENES::NOVA_AND_MOLSNO
; <0 NOVA>Hey I assume you're MolSno? I need some of your fa-a-ancy cola so I can save the world. Surely you can spare some cans?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "H", "e", $fe, $c0, $c4, "s", "u", $d0, " ", $a6, "'", "r", $e7, "M", "o", "l", "S", $d1, "?", SCR::NEWLINE, $c0, $f9, $d6, $9c, " ", $bd, $91, SCR::NEWLINE, "f", "a", "-", "a", "-", $ca, "c", $fe, "c", "o", "l", $be, $cc, " ", $c0, $b0, " ", "s", "a", "v", "e", SCR::NEWLINE, $a2, " ", "w", $c9, $ef, $f6, "S", "u", "r", "e", $d2, $a6, " ", $b0, SCR::NEWLINE, $dd, "a", "r", $e7, $9c, " ", $b0, "s", "?"
; <1 MOLSNO>No way, I'm safe in this volcano. This cola is all mine, every last can.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::MOLSNO, "N", "o", " ", $b7, $f5, $d4, "s", "a", "f", $e7, $bf, $99, SCR::NEWLINE, "v", "o", "l", $b0, "o", $f6, $f8, $b8, "c", "o", "l", $be, $b8, $ad, " ", "m", $d8, "e", ",", SCR::NEWLINE, "e", "v", $ed, $fe, "l", $c4, $d3, $b0, "."
; <0 NOVA_AW>MolSno, do we really have to do this? I don't want to fight you.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_AW, "M", "o", "l", "S", $d1, $f5, $c5, " ", $c8, " ", "r", $ec, "l", $d2, $9b, $bc, SCR::NEWLINE, $c5, " ", $99, "?", " ", $c0, $c5, "n", $e8, "w", $ca, $d3, $bb, "f", "i", $db, "t", SCR::NEWLINE, $a6, "."
; <1 MOLSNO>You know what? You can have my cans... the empty ones!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::MOLSNO, "Y", $f4, " ", $8f, " ", $8b, "?", " ", "Y", $f4, " ", $b0, SCR::NEWLINE, $9b, $cb, " ", $b0, "s", ".", ".", $f6, $a2, " ", "e", "m", "p", "t", "y", SCR::NEWLINE, $ac, "s", "!"
.byt SCR::END_SCRIPT
MolSnoAfterFight:
.byt SCR::SCENE, SCENES::NOVA_AND_MOLSNO
; <1 MOLSNO>Okay, sure, I guess you can have some cola.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::MOLSNO, "O", "k", "a", "y", $f5, "s", "u", "r", "e", $f5, $c0, "g", "u", "e", $f1, " ", $a6, " ", $b0, SCR::NEWLINE, $9b, $9c, " ", "c", "o", "l", "a", "."
; <0 NOVA>Thank you.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, $f8, $ca, "k", " ", $a6, "."
.byt SCR::END_SCRIPT
NovaLiaLWSS:
.byt SCR::SCENE, SCENES::NOVA_AND_LIA
; <0 NOVA>Oh hey, it's Lia again!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "O", "h", " ", $c3, "y", $f5, "i", "t", $e9, "L", "i", $be, "a", "g", "a", $d8, "!"
; <1 LIA>Heya Nova! Remember those weird pixelly things back in Bummer Club?
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "H", "e", "y", $be, $a1, $fd, "R", "e", $d0, "m", "b", $ed, " ", $e0, "o", $e5, SCR::NEWLINE, $c8, "i", "r", $ff, "p", "i", "x", "e", "l", $d2, $e0, $b1, $fb, "b", "a", $f3, " ", $d8, SCR::NEWLINE, "B", "u", "m", $d0, $ea, "C", "l", "u", "b", "?"
; <0 NOVA>The gliders and lightweight spaceships?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, $f8, $e7, "g", "l", "i", "d", $ed, $fb, $a4, "l", "i", $db, "t", $c8, "i", $db, "t", SCR::NEWLINE, $dd, "a", "c", "e", $df, "i", "p", "s", "?"
; <1 LIA>Yeahs! Watch this, I've been experimenting with the gliders...
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "Y", $ec, "h", "s", $fd, "W", $c6, $e2, " ", $99, $f5, "I", "'", "v", $e7, "b", $d7, "n", SCR::NEWLINE, "e", "x", "p", $ed, "i", $d0, $e1, $b1, " ", $9d, " ", $a2, SCR::NEWLINE, "g", "l", "i", "d", $ed, "s", ".", ".", "."
; []Lia sets down three glider guns, setting them to fire into the same spot in exactly the right way... and a rideable lightweight spaceship appears.
.byt SCR::NARRATE, CHAR::NONE, "L", "i", $be, $e5, "t", $fb, $c5, "w", "n", " ", $e0, "r", $d7, " ", "g", "l", "i", "d", $ed, SCR::NEWLINE, "g", $f2, "s", $f5, $e5, "t", "t", $b1, " ", $92, " ", $bb, "f", "i", "r", $e7, $d8, $bc, SCR::NEWLINE, $a2, " ", "s", "a", $d0, " ", $dd, "o", $d3, $bf, "e", "x", "a", $c7, $d2, $a2, SCR::NEWLINE, $fc, $db, $d3, $b7, ".", ".", $f6, $a4, $be, $fc, "d", $ec, "b", "l", "e", SCR::NEWLINE, "l", "i", $db, "t", $c8, "i", $db, $d3, $dd, "a", "c", "e", $df, "i", "p", SCR::NEWLINE, "a", "p", "p", $ec, "r", "s", "."
; <1 LIA>Dere, you can ride this into the bad guys' headquarters.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "D", $ed, "e", $f5, $a6, " ", $b0, " ", $fc, "d", $e7, $99, " ", $d8, $bc, SCR::NEWLINE, $a2, " ", "b", $f7, " ", "g", "u", "y", "s", "'", " ", $c3, $f7, "q", "u", "a", $ee, $ed, "s", "."
; <0 NOVA>Uhh, are you sure it's safe?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "U", "h", "h", $f5, "a", "r", $e7, $a6, " ", "s", "u", "r", $e7, "i", "t", $e9, "s", "a", "f", "e", "?"
; <1 LIA>Should be!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "S", "h", $a0, " ", "b", "e", "!"
; []Nova hops onto the spaceship and it takes off! It flies a pretty long distance, seemingly without any problems...
.byt SCR::NARRATE, CHAR::NONE, $a1, " ", "h", "o", "p", $fb, $c2, $bb, $a2, SCR::NEWLINE, $dd, "a", "c", "e", $df, "i", "p", " ", $a4, $c1, $90, $fb, "o", "f", "f", $fd, "I", "t", SCR::NEWLINE, "f", "l", $e3, $fb, $be, "p", "r", "e", "t", "t", $fe, "l", $c2, "g", " ", "d", $b9, "t", $ca, "c", "e", ",", SCR::NEWLINE, $b3, "m", $b1, $d2, $9d, $ae, " ", $ab, SCR::NEWLINE, $81, "s", ".", ".", "."
; []... but eventually gets hit by a stray glider, causing the ship to disintegrate and causing the squirrel to fall into a rather strange place.
.byt SCR::NARRATE, CHAR::NONE, ".", ".", $f6, $a7, " ", $9f, "t", "u", $ad, $fe, $af, $fb, "h", $c1, "b", "y", SCR::NEWLINE, $be, $de, "r", "a", $fe, "g", "l", "i", "d", $ed, $f5, "c", "a", "u", "s", $b1, " ", $a2, SCR::NEWLINE, $df, "i", "p", " ", $bb, "d", $b9, $d8, $eb, "g", "r", $c6, $e7, $ca, "d", SCR::NEWLINE, "c", "a", "u", "s", $b1, " ", $a2, " ", $80, " ", $bb, "f", $ad, SCR::NEWLINE, $d8, $bb, $be, "r", $c6, $a9, " ", $de, "r", $ca, "g", $e7, "p", "l", "a", "c", "e", "."
.byt SCR::SCENE, SCENES::NOVA_ALONE
; >0 NOVA_STRAIGHT<Aaaaa, okay, I had no idea it was that fragile! I'll go see what the forums think I should do.
.byt SCR::THINK, SCR::SPEAKER_0|CHAR::NOVA_STRAIGHT, "A", "a", "a", "a", "a", $f5, "o", "k", "a", "y", $f5, $c0, "h", $f7, " ", $d1, " ", "i", "d", $ec, " ", "i", "t", SCR::NEWLINE, "w", $c4, " ", $9a, "f", "r", "a", "g", $dc, "e", $fd, $d5, " ", $cf, " ", $b3, SCR::NEWLINE, $8b, " ", $a2, " ", $a5, "u", "m", $fb, $82, " ", "I", SCR::NEWLINE, $df, $a0, " ", $c5, "."
; []-halp I've been taken-
.byt SCR::NARRATE, CHAR::NONE, $86
.byt SCR::SCENE, SCENES::FORUMS
; [NOVA]The ship I was taking into the Scheme Team's headquarters broke. Now I'm stranded in some weird place.
.byt SCR::NARRATE, CHAR::NOVA, $f8, $e7, $df, "i", "p", " ", $c0, "w", $c4, " ", "t", "a", "k", $b1, " ", $d8, $bb, $a2, SCR::NEWLINE, "S", $e2, "e", $d0, " ", "T", $ec, "m", $e9, $c3, $f7, "q", "u", "a", $ee, $ed, "s", SCR::NEWLINE, "b", "r", "o", "k", "e", $f6, "N", "o", "w", " ", $d4, $de, "r", $ca, "d", $d6, $d8, SCR::NEWLINE, $9c, " ", $c8, "i", "r", $ff, "p", "l", "a", "c", "e", "."
; [KOREY]Broke? Nova, remember when I said they were prepared for anything that Latte could throw at them? I meant it.
.byt SCR::NARRATE, CHAR::KOREY, "B", "r", "o", "k", "e", "?", " ", $a1, $f5, "r", "e", $d0, "m", "b", $ed, " ", $da, $e6, SCR::NEWLINE, $c0, "s", "a", "i", $ff, $98, " ", $c8, "r", $e7, "p", "r", "e", "p", "a", "r", $d6, $a5, SCR::NEWLINE, $ab, $e0, $b1, " ", $9a, $84, " ", "c", $a0, SCR::NEWLINE, $e0, "r", "o", "w", " ", $c6, " ", $92, "?", " ", $c0, $d0, $ca, $d3, "i", "t", "."
; [NOVA]So they were already expecting that and sent out that glider? Figures.
.byt SCR::NARRATE, CHAR::NOVA, "S", "o", " ", $98, " ", $c8, "r", $e7, "a", "l", "r", $ec, "d", "y", SCR::NEWLINE, "e", "x", "p", "e", $c7, $b1, " ", $9a, $a4, $e5, $e1, " ", $ae, SCR::NEWLINE, $9a, "g", "l", "i", "d", $ed, "?", " ", "F", "i", "g", "u", "r", "e", "s", "."
; [SHERWIN]Well, hopefully you can get to Atomic Videoclip Zone soon! The Scheme Team are doing some really strange things.
.byt SCR::NARRATE, CHAR::SHERWIN, "W", "e", "l", "l", $f5, "h", "o", "p", "e", "f", "u", "l", $d2, $a6, " ", $b0, " ", $af, SCR::NEWLINE, $bb, $85, SCR::NEWLINE, $cc, $c2, $fd, $f8, $e7, "S", $e2, "e", $d0, " ", "T", $ec, "m", " ", "a", "r", "e", SCR::NEWLINE, $c5, $b1, " ", $9c, " ", "r", $ec, "l", $d2, $de, "r", $ca, "g", "e", SCR::NEWLINE, $e0, $b1, "s", "."
; [SHERWIN]They have one of those spinner things that make animal noises, but I think it's some sort of secret doomsday device. OR maybe they're just trying to throw us off. That sounds likely too.
.byt SCR::NARRATE, CHAR::SHERWIN, $f8, "e", $fe, $9b, $ac, " ", $bd, $e0, "o", $e5, SCR::NEWLINE, $dd, $d8, $f9, $ea, $e0, $b1, $fb, $9a, "m", "a", "k", "e", SCR::NEWLINE, $ca, "i", "m", "a", "l", " ", $d1, $b9, "e", "s", $f5, $a7, " ", $c0, $82, " ", "i", "t", "'", "s", SCR::NEWLINE, $9c, " ", $cc, $ee, " ", $bd, $e5, "c", "r", "e", "t", SCR::NEWLINE, $c5, "o", "m", "s", "d", "a", $fe, "d", "e", "v", "i", "c", "e", $f6, "O", "R", " ", "m", "a", "y", "b", "e", SCR::NEWLINE, $98, "'", "r", $e7, $8e, $fa, "y", $b1, " ", $bb, $e0, "r", "o", "w", SCR::NEWLINE, "u", $fb, "o", "f", "f", $f6, $f8, $c6, " ", $cc, $f2, "d", $fb, $8d, "l", "y", SCR::NEWLINE, $bc, "o", "."
; [KOREY]Are you hurt from the fall, Nova?
.byt SCR::NARRATE, CHAR::KOREY, "A", "r", $e7, $a6, " ", "h", "u", $ee, " ", $97, $a2, " ", "f", $ad, ",", SCR::NEWLINE, $a1, "?"
; [NOVA]Nah, but now I need to find a way out. The landscape here is really strange.
.byt SCR::NARRATE, CHAR::NOVA, "N", "a", "h", $f5, $a7, " ", $b4, " ", $c0, $f9, $d6, $bb, "f", $d8, $ff, "a", SCR::NEWLINE, $b7, " ", $ae, $f6, $f8, $e7, "l", $ca, "d", "s", "c", "a", "p", $e7, $a9, "e", SCR::NEWLINE, $b8, "r", $ec, "l", $d2, $de, "r", $ca, "g", "e", "."
; [KOREY]Uh oh, that's probably the World of Insanity. Yeahhh, you'll want to get out of there as soon as you can.
.byt SCR::NARRATE, CHAR::KOREY, "U", "h", " ", "o", "h", $f5, $e0, $c6, $e9, "p", "r", "o", "b", "a", "b", $d2, $a2, SCR::NEWLINE, "W", $c9, $ef, " ", $bd, "I", "n", "s", $ca, "i", "t", "y", $f6, "Y", $ec, "h", "h", "h", ",", SCR::NEWLINE, $a6, "'", "l", "l", " ", "w", $ca, $d3, $bb, $af, " ", $ae, " ", "o", "f", SCR::NEWLINE, $88, " ", $c4, " ", $cc, $c2, " ", $c4, " ", $a6, " ", $b0, "."
.byt SCR::END_SCRIPT
SmiloidAtWOI:
.byt SCR::SCENE, SCENES::NOVA_AND_SMILOID
; <2 S_TEAM>We made the Smiloids better and stronger and now we're pretty sure we'll win.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::S_TEAM, "W", $e7, "m", $f7, $e7, $a2, " ", "S", "m", $dc, "o", "i", "d", $fb, "b", "e", "t", $eb, "r", SCR::NEWLINE, $a4, $de, "r", $c2, "g", $ed, " ", $a4, $b4, " ", $c8, "'", "r", "e", SCR::NEWLINE, "p", "r", "e", "t", "t", $fe, "s", "u", "r", $e7, $c8, "'", "l", "l", " ", "w", $d8, "."
; <1 SMILOID>Have a nice day! Or maybe a bad one hahaha.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SMILOID, "H", "a", "v", $e7, $be, "n", "i", "c", $e7, "d", "a", "y", $fd, "O", $ea, "m", "a", "y", $ba, "a", SCR::NEWLINE, "b", $f7, " ", $ac, " ", "h", "a", "h", "a", "h", "a", "."
; <0 NOVA>Nope! I'm still going to win.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "N", "o", "p", "e", $fd, $d4, $de, $dc, "l", " ", $cf, $b1, " ", $bb, "w", $d8, "."
.byt SCR::END_SCRIPT
AfterSmiloidAtWOI:
.byt SCR::SCENE, SCENES::NOVA_AND_SMILOID
; <2 S_TEAM>You're still going down, even if Bill has to be the one to do it!! We will succeed!
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::S_TEAM, "Y", $f4, "'", "r", $e7, $de, $dc, "l", " ", $cf, $b1, " ", $c5, "w", "n", $f5, $9f, SCR::NEWLINE, $ce, " ", "B", $dc, "l", " ", "h", $c4, " ", $bb, $ba, $a2, " ", $ac, " ", $bb, $c5, SCR::NEWLINE, "i", "t", "!", $fd, "W", $e7, $9e, " ", "s", "u", "c", "c", $d7, "d", "!"
.byt SCR::END_SCRIPT
MeetRemy:
.byt SCR::SCENE, SCENES::NOVA_AND_REMY
; <0 NOVA>Hi, I'm Nova. Whatcha doing here?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "H", "i", $f5, $d4, $a1, $f6, "W", "h", $c6, $e2, $be, $c5, $b1, SCR::NEWLINE, $a9, "e", "?"
; <1 REMY>Ay, I'mma bounty huntin' space squirrel, an' I've been lookin' for work 'ere.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::REMY, "A", "y", $f5, "I", "'", "m", "m", $be, "b", $f4, $e1, $fe, "h", $f2, "t", $d8, "'", SCR::NEWLINE, $dd, "a", "c", $e7, $80, $f5, $ca, "'", " ", "I", "'", "v", $e7, "b", $d7, "n", SCR::NEWLINE, $95, $d8, "'", " ", $a5, " ", "w", $c9, "k", " ", "'", $ed, "e", "."
; <0 NOVA_WOW>SPACE squirrel? So I imagine you have a cool ship?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_WOW, "S", "P", "A", "C", "E", " ", $80, "?", " ", "S", "o", " ", $c0, "i", "m", "a", "g", $d8, "e", SCR::NEWLINE, $a6, " ", $9b, $be, "c", $e4, "l", " ", $df, "i", "p", "?"
; <1 REMY>Ya, d'ya need ta' get somewhere?
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::REMY, "Y", "a", $f5, "d", "'", "y", $be, $f9, $d6, "t", "a", "'", " ", $af, SCR::NEWLINE, $9c, $da, $ed, "e", "?"
; <0 NOVA>Yes actually. Do you think you could get me to Atomic Videoclip Zone?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "Y", "e", $fb, "a", $c7, "u", $ad, "y", $f6, "D", "o", " ", $a6, " ", $82, SCR::NEWLINE, $a6, " ", "c", $a0, " ", $af, " ", $d0, " ", $bb, "A", $bc, "m", "i", "c", SCR::NEWLINE, "V", "i", "d", "e", "o", "c", "l", "i", "p", " ", "Z", $ac, "?"
; <1 REMY>Sure. Nothin' betta ta' do.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::REMY, "S", "u", "r", "e", $f6, "N", "o", $e0, $d8, "'", " ", "b", "e", "t", "t", $be, "t", "a", "'", " ", $c5, "."
; []The two of them get into Remy's spaceship, which is much more stable than a LWSS, and fly to Atomic Videoclip Zone safely. Remy slips off to do whatever.
.byt SCR::NARRATE, CHAR::NONE, $f8, $e7, "t", "w", "o", " ", $bd, $92, " ", $af, " ", $d8, $bc, SCR::NEWLINE, "R", "e", $cb, $e9, $dd, "a", "c", "e", $df, "i", "p", $f5, $da, "i", $e2, " ", $b9, SCR::NEWLINE, "m", "u", $e2, " ", "m", $c9, $e7, $de, "a", "b", "l", $e7, $93, " ", "a", SCR::NEWLINE, "L", "W", "S", "S", $f5, $a4, "f", $d2, $bb, "A", $bc, "m", "i", "c", SCR::NEWLINE, "V", "i", "d", "e", "o", "c", "l", "i", "p", " ", "Z", $ac, " ", "s", "a", "f", "e", "l", "y", $f6, "R", "e", $cb, SCR::NEWLINE, "s", "l", "i", "p", $fb, "o", "f", "f", " ", $bb, $c5, " ", $8b, "e", "v", $ed, "."
; <0 NOVA>Okay, now this is the right place. Alright, Remy, wanna go with me to go save the world?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "O", "k", "a", "y", $f5, $b4, " ", $99, " ", $b8, $a2, " ", $fc, $db, "t", SCR::NEWLINE, "p", "l", "a", "c", "e", $f6, "A", "l", $fc, $db, "t", $f5, "R", "e", $cb, $f5, "w", $ca, "n", "a", SCR::NEWLINE, $cf, " ", $9d, " ", $d0, " ", $bb, $cf, " ", "s", "a", "v", $e7, $a2, SCR::NEWLINE, "w", $c9, $ef, "?"
.byt SCR::SCENE, SCENES::NOVA_ALONE
; <0 NOVA_AW>... Remy?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_AW, ".", ".", $f6, "R", "e", $cb, "?"
; <1 REMY>Oh, my bad, I juss met dis genie guy, an' he promised ta' grant "butt wishes" an' I dunno what he means, buuuut dat sounds more fun, so seeya!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::REMY, "O", "h", $f5, $cb, " ", "b", $f7, $f5, $c0, "j", "u", $f1, " ", $d0, $d3, "d", $b9, SCR::NEWLINE, "g", $e6, $e3, " ", "g", "u", "y", $f5, $ca, "'", " ", $c3, " ", "p", "r", "o", "m", $b9, $d6, "t", "a", "'", SCR::NEWLINE, "g", "r", $ca, $d3, '"', $a7, $d3, "w", $b9, $c3, "s", '"', " ", $ca, "'", " ", "I", SCR::NEWLINE, "d", $f2, $d1, " ", $8b, " ", $c3, " ", $d0, $ca, "s", $f5, "b", "u", "u", "u", "u", "t", SCR::NEWLINE, "d", $c6, " ", $cc, $f2, "d", $fb, "m", $c9, $e7, "f", $f2, $f5, $cc, SCR::NEWLINE, $b3, "y", "a", "!"
.byt SCR::SCENE, SCENES::NOVA_REMY_JAFGUAR
; <2 JAFGUAR>Yeah Remy let's go!!
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::JAFGUAR, "Y", $ec, "h", " ", "R", "e", $cb, " ", $a8, $e9, $cf, "!", "!"
; <0 NOVA>Remy! Fine, I'll go by myself.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "R", "e", $cb, $fd, "F", $d8, "e", $f5, $d5, " ", $cf, " ", "b", $fe, $cb, $e5, "l", "f", "."
.byt SCR::END_SCRIPT
.byt SCR::SCENE, SCENES::NOVA_ALONE
; >0 NOVA_AW<Here it is, the final battle. I've got to give it my best shot.
.byt SCR::THINK, SCR::SPEAKER_0|CHAR::NOVA_AW, "H", $ed, $e7, $c1, $b9, $f5, $a2, " ", "f", $d8, "a", "l", " ", "b", $c6, "t", "l", "e", ".", SCR::NEWLINE, "I", "'", "v", $e7, $cf, $d3, $bb, "g", "i", "v", $e7, $c1, $cb, " ", "b", "e", $de, SCR::NEWLINE, $df, "o", "t", "."
; []Nova drinks the F-a-ancy cola and equips the Nuclear Power Pants in preparation for the battle, then nervously walks through the door...
.byt SCR::NARRATE, CHAR::NONE, $a1, " ", "d", $fc, "n", "k", $fb, $a2, " ", "F", "-", "a", "-", $ca, "c", "y", SCR::NEWLINE, "c", "o", "l", $be, $a4, "e", "q", "u", "i", "p", $fb, $a2, " ", "N", "u", "c", "l", $ec, "r", SCR::NEWLINE, "P", "o", $c8, $ea, "P", $ca, "t", $fb, $bf, "p", "r", "e", "p", "a", "r", $c6, "i", $c2, SCR::NEWLINE, $a5, " ", $a2, " ", "b", $c6, "t", "l", "e", $f5, $94, SCR::NEWLINE, $f9, "r", "v", $f4, "s", $d2, "w", "a", "l", "k", $fb, $e0, "r", $f4, $db, " ", $a2, SCR::NEWLINE, $c5, $c9, ".", ".", "."
.byt SCR::TRANSITION
; <1 BILL>So, you managed to get all the way here? Looks like I'm going to have to take you down myself!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::BILL, "S", "o", $f5, $a6, " ", "m", $ca, "a", "g", $d6, $bb, $af, " ", $ad, SCR::NEWLINE, $a2, " ", $b7, " ", $a9, "e", "?", " ", "L", $e4, "k", $fb, $8d, " ", "I", "'", "m", SCR::NEWLINE, $cf, $b1, " ", $bb, $9b, $bb, $90, " ", $a6, SCR::NEWLINE, $c5, "w", "n", " ", $cb, $e5, "l", "f", "!"
.byt SCR::SCENE, SCENES::NOVA_AND_BILL
; <0 NOVA_MAD>Not a chance, giant floating head guy!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_MAD, "N", "o", $d3, $be, $e2, $ca, "c", "e", $f5, "g", "i", $ca, $d3, "f", "l", "o", $c6, $b1, SCR::NEWLINE, $c3, $f7, " ", "g", "u", "y", "!"
; <1 BILL>What did you just call me?? You're toast, squirrel!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::BILL, "W", "h", $c6, " ", "d", "i", $ff, $a6, " ", $8e, "c", $ad, " ", $d0, "?", "?", SCR::NEWLINE, "Y", $f4, "'", "r", $e7, $bc, $c4, "t", $f5, $80, "!"
.byt SCR::END_SCRIPT
.byt SCR::SCENE, SCENES::NOVA_ALONE
; <0 NOVA_WOW>W-wow, did I really just win?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_WOW, "W", "-", "w", "o", "w", $f5, "d", "i", $ff, $c0, "r", $ec, "l", $d2, $8e, "w", $d8, "?"
; []Having defeated Bill and the Scheme Team, Nova then finally frees Sherwin.
.byt SCR::NARRATE, CHAR::NONE, "H", "a", "v", $b1, " ", "d", "e", "f", $ec, $eb, $ff, "B", $dc, "l", " ", $a4, $a2, SCR::NEWLINE, "S", $e2, "e", $d0, " ", "T", $ec, "m", $f5, $a1, " ", $94, SCR::NEWLINE, "f", $d8, $ad, $fe, "f", "r", $d7, $fb, "S", $a9, "w", $d8, "."
.byt SCR::SCENE, SCENES::NOVA_AND_SHERWIN
; <1 SHERWIN>Thank you for rescuing me! I always believed in you, Nova.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SHERWIN, $f8, $ca, "k", " ", $a6, " ", $a5, " ", "r", "e", "s", "c", "u", $b1, " ", $d0, $fd, "I", SCR::NEWLINE, "a", "l", $b7, $fb, "b", "e", "l", $e3, "v", $d6, $bf, $a6, $f5, $a1, "."
; []Korey also shows up.
.byt SCR::NARRATE, CHAR::NONE, "K", $c9, "e", $fe, "a", "l", $cc, " ", $df, "o", "w", $fb, $cd, "."
.byt SCR::SCENE, SCENES::NOVA_SHERWIN_KOREY
; <2 KOREY>Latte will be eternally grateful. Are you ready to go home?
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::KOREY, $84, " ", $9e, " ", $ba, "e", $eb, "r", "n", $ad, "y", SCR::NEWLINE, "g", "r", $c6, "e", "f", "u", "l", $f6, "A", "r", $e7, $a6, " ", "r", $ec, "d", $fe, $bb, $cf, SCR::NEWLINE, "h", "o", $d0, "?"
; <0 NOVA>Actually, I'm not. I want to keep having adventures, and all of my friends are here with me.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "A", $c7, "u", $ad, "y", $f5, $d4, $a3, $f6, $c0, "w", $ca, $d3, $bc, SCR::NEWLINE, "k", $d7, "p", " ", "h", "a", "v", $b1, " ", $f7, "v", $e6, "t", "u", "r", "e", "s", $f5, $ca, "d", SCR::NEWLINE, $ad, " ", $bd, $cb, " ", "f", $fc, $e6, "d", $fb, "a", "r", $e7, $a9, "e", SCR::NEWLINE, $9d, " ", $d0, "."
; <2 KOREY>I figured you'd say that. Well in that case I have something to show you~
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::KOREY, $c0, "f", "i", "g", "u", "r", $d6, $a6, "'", $ff, "s", "a", $fe, $e0, $c6, $f6, "W", "e", "l", "l", SCR::NEWLINE, $bf, $9a, "c", $c4, $e7, $c0, $9b, $9c, $e0, $b1, SCR::NEWLINE, $bb, $df, "o", "w", " ", $a6, "~"
.byt SCR::TRANSITION
.byt SCR::SCENE, SCENES::NOTHING
; []Korey takes Nova to a room with a small space ship in the middle
.byt SCR::NARRATE, CHAR::NONE, "K", $c9, "e", $fe, $90, $fb, $a1, " ", $bb, $be, "r", $e4, "m", SCR::NEWLINE, $9d, " ", $be, "s", "m", $ad, " ", $dd, "a", "c", $e7, $df, "i", "p", " ", $bf, $a2, SCR::NEWLINE, "m", "i", "d", "d", "l", "e"
; [KOREY]Nova, this is the MV Explorer. It can take you to other worlds.
.byt SCR::NARRATE, CHAR::KOREY, $a1, $f5, $99, " ", $b8, $a2, " ", "M", "V", " ", "E", "x", "p", "l", $c9, $ed, ".", SCR::NEWLINE, "I", $d3, $b0, " ", $90, " ", $a6, " ", $bb, "o", $a2, "r", SCR::NEWLINE, "w", $c9, $ef, "s", "."
; [NOVA_WOW]Wow, was this what you were going to use to take me home?
.byt SCR::NARRATE, CHAR::NOVA_WOW, "W", "o", "w", $f5, "w", $c4, " ", $99, " ", $8b, " ", $a6, " ", $c8, "r", "e", SCR::NEWLINE, $cf, $b1, " ", $bb, "u", $e5, " ", $bb, $90, " ", $d0, SCR::NEWLINE, "h", "o", $d0, "?"
; [KOREY]Yeah, but I'm giving it to you. There are a bunch of worlds in need of help.
.byt SCR::NARRATE, CHAR::KOREY, "Y", $ec, "h", $f5, $a7, " ", $d4, "g", "i", "v", $b1, " ", $c1, $bb, $a6, ".", SCR::NEWLINE, $f8, $ed, $e7, "a", "r", $e7, $be, "b", $f2, $e2, " ", $bd, "w", $c9, $ef, "s", SCR::NEWLINE, $bf, $f9, $d6, $bd, $c3, "l", "p", "."
; [NOVA]Well thank you Korey! I'll get right on it!
.byt SCR::NARRATE, CHAR::NOVA, "W", "e", "l", "l", " ", $93, "k", " ", $a6, " ", "K", $c9, "e", "y", $fd, $d5, " ", $af, SCR::NEWLINE, $fc, $db, $d3, $c2, " ", "i", "t", "!"
.byt SCR::END_SCRIPT

WaterAbout:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>You can swim in the water. Use Up/Down to change your height.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "Y", $f4, " ", $b0, " ", "s", "w", "i", "m", " ", $bf, $a2, " ", "w", $c6, $ed, ".", SCR::NEWLINE, "U", $e5, " ", "U", "p", "/", "D", "o", "w", "n", " ", $bb, $e2, $ca, "g", $e7, $91, SCR::NEWLINE, $c3, "i", $db, "t", "."
.byt SCR::END_SCRIPT
SignBummerAbout:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>Welcome to Bummer Club! These levels up ahead are all about puzzles.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "W", "e", "l", $96, " ", $bb, "B", "u", "m", $d0, $ea, "C", "l", "u", "b", "!", SCR::NEWLINE, $f8, "e", $e5, " ", "l", "e", "v", "e", "l", $fb, $cd, " ", "a", $c3, $f7, " ", "a", "r", $e7, $ad, SCR::NEWLINE, $8a, "p", "u", "z", "z", "l", "e", "s", "."
.byt SCR::END_SCRIPT
SignBootsAbout:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>In puzzle levels, water is deadly, unless you get blue boots (flippers) first. Red boots protect you from fire, green boots let you get past green forcefields, and gray boots let you walk on ice without sliding.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "I", "n", " ", "p", "u", "z", "z", "l", $e7, "l", "e", "v", "e", "l", "s", $f5, "w", $c6, $ed, " ", $b9, SCR::NEWLINE, "d", $ec, "d", "l", "y", $f5, $f2, "l", "e", $f1, " ", $a6, " ", $af, " ", "b", "l", "u", "e", SCR::NEWLINE, "b", $e4, "t", $fb, "(", "f", "l", "i", "p", "p", $ed, "s", ")", " ", "f", "i", "r", $de, $f6, "R", "e", "d", SCR::NEWLINE, "b", $e4, "t", $fb, "p", "r", "o", $eb, $c7, " ", $a6, " ", $97, "f", "i", "r", "e", ",", SCR::NEWLINE, "g", "r", $d7, "n", " ", "b", $e4, "t", $fb, $a8, " ", $a6, " ", $af, " ", "p", $c4, "t", SCR::NEWLINE, "g", "r", $d7, "n", " ", $a5, "c", "e", "f", $e3, $ef, "s", $f5, $a4, "g", "r", "a", "y", SCR::NEWLINE, "b", $e4, "t", $fb, $a8, " ", $a6, " ", "w", "a", "l", "k", " ", $c2, " ", "i", "c", "e", SCR::NEWLINE, $9d, $ae, " ", "s", "l", "i", "d", $b1, "."
.byt SCR::END_SCRIPT
SignMeltIceAbout:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>Try throwing a fireball at this ice. If you killed the fire enemy, walk away and come back so it will respawn.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "T", "r", $fe, $e0, "r", "o", "w", $b1, " ", $be, "f", "i", "r", "e", "b", $ad, " ", $c6, " ", $99, SCR::NEWLINE, "i", "c", "e", $f6, "I", "f", " ", $a6, " ", "k", $dc, "l", $d6, $a2, " ", "f", "i", "r", "e", SCR::NEWLINE, $e6, "e", $cb, $f5, "w", "a", "l", "k", " ", "a", $b7, " ", $a4, $96, SCR::NEWLINE, "b", "a", $f3, " ", $cc, " ", $c1, $9e, " ", "r", "e", $dd, "a", "w", "n", "."
.byt SCR::END_SCRIPT
SignPushableAbout:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>This block ahead can be pushed forward, and will climb other blocks if pushed onto them.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, $f8, $b8, "b", "l", "o", $f3, " ", "a", $c3, $f7, " ", $b0, " ", "b", "e", SCR::NEWLINE, "p", "u", $aa, $ff, $a5, "w", "a", "r", "d", $f5, $a4, $9e, " ", "c", "l", "i", "m", "b", SCR::NEWLINE, "o", $a2, $ea, "b", "l", "o", $f3, $fb, $ce, " ", "p", "u", $aa, $ff, $c2, $bc, SCR::NEWLINE, $92, "."
.byt SCR::END_SCRIPT
LineFollowingAbout:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>This is a line following platform. Wait for it to come around.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, $f8, $b8, $b8, $be, "l", $d8, $e7, "f", "o", "l", "l", "o", "w", $b1, SCR::NEWLINE, "p", "l", $c6, $a5, "m", $f6, "W", "a", $c1, $a5, " ", $c1, $bb, $96, SCR::NEWLINE, "a", "r", $f4, $f0, "."
.byt SCR::END_SCRIPT
SignPuzzleAbout:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>Look around before acting. The order you do things in puzzle-oriented stages matters.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "L", $e4, "k", " ", "a", "r", $f4, $f0, " ", "b", "e", $a5, $e7, "a", $c7, $b1, ".", SCR::NEWLINE, $f8, $e7, $c9, "d", $ed, " ", $a6, " ", $c5, " ", $e0, $b1, $fb, $d8, SCR::NEWLINE, "p", "u", "z", "z", "l", "e", "-", $c9, $e3, $e1, $d6, $de, "a", "g", "e", "s", SCR::NEWLINE, "m", $c6, $eb, "r", "s", "."
.byt SCR::END_SCRIPT
SignPickupAbout:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>You can pick up these blocks. Stand on them and press Down+A.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "Y", $f4, " ", $b0, " ", "p", "i", $f3, " ", $cd, " ", $89, "b", "l", "o", $f3, "s", ".", SCR::NEWLINE, "S", "t", $a4, $c2, " ", $92, " ", $a4, "p", "r", "e", $f1, SCR::NEWLINE, "D", "o", "w", "n", "+", "A", "."
.byt SCR::END_SCRIPT
SignWaterFire:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>PROTIP: Water puts out fire.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "P", "R", "O", "T", "I", "P", ":", " ", "W", $c6, $ed, " ", "p", "u", "t", $fb, $ae, " ", "f", "i", "r", "e", "."
.byt SCR::END_SCRIPT
SignPrize:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>Congratulations for completing the puzzle challenge! Your prize awaits in the next room.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "C", $c2, "g", "r", $c6, "u", "l", $c6, "i", $c2, $fb, $a5, SCR::NEWLINE, "c", "o", "m", "p", $a8, $b1, " ", $a2, " ", "p", "u", "z", "z", "l", "e", SCR::NEWLINE, $e2, $ad, $e6, "g", "e", $fd, "Y", $b6, " ", "p", $fc, "z", $e7, "a", "w", "a", "i", "t", "s", SCR::NEWLINE, $bf, $a2, " ", $f9, "x", $d3, "r", $e4, "m", "."
.byt SCR::END_SCRIPT
AboutBombs:
.byt SCR::SCENE, SCENES::NOVA_LIA_SIGN
; <2 SIGN>You can copy these bomb enemies, but be quick. Up+B throws and Down+B drops bombs, and B alone will put one in midair. Try standing on a placed bomb.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::SIGN, "Y", $f4, " ", $b0, " ", "c", "o", "p", $fe, $89, "b", "o", "m", "b", SCR::NEWLINE, $e6, "e", "m", $e3, "s", $f5, $a7, " ", $ba, "q", "u", "i", $f3, $f6, "U", "p", "+", "B", SCR::NEWLINE, $e0, "r", "o", "w", $fb, $a4, "D", "o", "w", "n", "+", "B", " ", "d", "r", "o", "p", "s", SCR::NEWLINE, "b", "o", "m", "b", "s", $f5, $a4, "B", " ", "a", "l", $ac, " ", $9e, " ", "p", "u", "t", SCR::NEWLINE, $ac, " ", $bf, "m", "i", "d", "a", "i", "r", $f6, "T", "r", $fe, $de, $ca, "d", $b1, " ", $c2, SCR::NEWLINE, $be, "p", "l", "a", "c", $d6, "b", "o", "m", "b", "."
.byt SCR::END_SCRIPT
AboutMinecarts:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>Enjoy Frozen Volcano's really cool minecart rides. 
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "E", "n", "j", "o", $fe, "F", "r", "o", "z", $e6, " ", "V", "o", "l", $b0, "o", "'", "s", SCR::NEWLINE, "r", $ec, "l", $d2, "c", $e4, "l", " ", "m", $d8, "e", "c", "a", $ee, " ", $fc, "d", "e", "s", $f6
.byt SCR::END_SCRIPT
AboutSpinnerEnemy:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>The spinner enemy homes in on your position. If you don't have a weapon to kill it with, run away. It will stop chasing you once it's off-screen.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, $f8, $e7, $dd, $d8, $f9, $ea, $e6, "e", $cb, " ", "h", "o", $d0, $fb, $d8, SCR::NEWLINE, $c2, " ", $91, " ", "p", "o", "s", "i", "t", "i", $c2, $f6, "I", "f", " ", $a6, " ", $c5, "n", "'", "t", SCR::NEWLINE, $9b, $be, $c8, "a", "p", $c2, " ", $bb, "k", $dc, "l", " ", $c1, $9d, ",", SCR::NEWLINE, "r", $f2, " ", "a", $b7, $f6, "I", $d3, $9e, " ", $de, "o", "p", " ", $e2, $c4, $b1, SCR::NEWLINE, $a6, " ", $c2, "c", $e7, "i", "t", $e9, "o", "f", "f", "-", "s", "c", "r", $d7, "n", "."
.byt SCR::END_SCRIPT
ItiCameo:
.byt SCR::SCENE, SCENES::NOVA_AND_ITI
.byt SCR::END_SCRIPT
EmptyRoom:
.byt SCR::SCENE, SCENES::NOVA_ALONE
; >0 NOVA<There will probably be something really cool here later on.
.byt SCR::THINK, SCR::SPEAKER_0|CHAR::NOVA, $f8, $ed, $e7, $9e, " ", "p", "r", "o", "b", "a", "b", $d2, "b", "e", SCR::NEWLINE, $9c, $e0, $b1, " ", "r", $ec, "l", $d2, "c", $e4, "l", " ", $a9, "e", SCR::NEWLINE, "l", $c6, $ed, " ", $c2, "."
.byt SCR::END_SCRIPT
NekoEdCameo:
.byt SCR::SCENE, SCENES::NOVA_AND_NEKOED
; <1 NEKOED>I wanted to be in this game, so here I am! I should probably give you something cool.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::NEKOED, $c0, "w", $ca, $eb, $ff, $bb, $ba, $bf, $99, " ", "g", "a", $d0, ",", SCR::NEWLINE, $cc, " ", $a9, $e7, $c0, "a", "m", $fd, $c0, $df, $a0, SCR::NEWLINE, "p", "r", "o", "b", "a", "b", $d2, "g", "i", "v", $e7, $a6, " ", $9c, $e0, $b1, SCR::NEWLINE, "c", $e4, "l", "."
.byt SCR::END_SCRIPT
AboutIceJump:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>With the ice enemy's ability, use Down+B to start sliding on ice, and hold Down for as long as you want to slide. You can abuse it to get another jump in mid-air.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "W", "i", $e0, " ", $a2, " ", "i", "c", $e7, $e6, "e", $cb, $e9, "a", "b", $dc, "i", "t", "y", ",", SCR::NEWLINE, "u", $e5, " ", "D", "o", "w", "n", "+", "B", " ", $bb, $de, "a", $ee, " ", "s", "l", "i", "d", $b1, SCR::NEWLINE, $c2, " ", "i", "c", "e", $f5, $a4, "h", "o", $ef, " ", "D", "o", "w", "n", " ", $a5, " ", $c4, SCR::NEWLINE, "l", $c2, "g", " ", $c4, " ", $a6, " ", "w", $ca, $d3, $bb, "s", "l", "i", "d", "e", ".", SCR::NEWLINE, "Y", $f4, " ", $b0, " ", "a", "b", "u", $e5, " ", $c1, $bb, $af, SCR::NEWLINE, $ca, "o", $a2, $ea, "j", "u", "m", "p", " ", $bf, "m", "i", "d", "-", "a", "i", "r", "."
.byt SCR::END_SCRIPT
AboutWaterFreeze:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>Ice can freeze water (or lava!) into a solid platform, that fire can thaw out. You WILL need the ice ability up ahead.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "I", "c", $e7, $b0, " ", "f", "r", $d7, "z", $e7, "w", $c6, $ed, " ", "(", $c9, SCR::NEWLINE, "l", "a", "v", "a", "!", ")", " ", $d8, $bb, $be, $cc, "l", "i", $ff, "p", "l", $c6, $a5, "m", ",", SCR::NEWLINE, $9a, "f", "i", "r", $e7, $b0, " ", $e0, "a", "w", " ", $ae, $f6, "Y", $f4, SCR::NEWLINE, "W", "I", "L", "L", " ", $f9, $d6, $a2, " ", "i", "c", $e7, "a", "b", $dc, "i", "t", $fe, $cd, SCR::NEWLINE, "a", $c3, $f7, "."
.byt SCR::END_SCRIPT
AboutAutoItem:
.byt SCR::SCENE, SCENES::NOVA_LIA_SIGN
; <2 SIGN>If an item bag has an exclamation point on it, the effect triggers automatically.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::SIGN, "I", "f", " ", $ca, " ", "i", $eb, "m", " ", "b", "a", "g", " ", "h", $c4, " ", $ca, SCR::NEWLINE, "e", "x", "c", "l", "a", "m", $c6, "i", $c2, " ", "p", "o", $d8, $d3, $c2, " ", "i", "t", $f5, $a2, SCR::NEWLINE, "e", "f", "f", "e", $c7, " ", $fa, "i", "g", "g", $ed, $fb, "a", "u", $bc, "m", $c6, "i", "c", $ad, "y", "."
; <2 SIGN>Also, try pressing Down+B with the burger ability to ride on a burger. It only works once until you have to touch the ground again.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::SIGN, "A", "l", $cc, $f5, $fa, $fe, "p", "r", "e", $f1, $b1, " ", "D", "o", "w", "n", "+", "B", SCR::NEWLINE, $9d, " ", $a2, " ", "b", "u", "r", "g", $ed, " ", "a", "b", $dc, "i", "t", $fe, $bb, $fc, "d", "e", SCR::NEWLINE, $c2, " ", $be, "b", "u", "r", "g", $ed, $f6, "I", $d3, $c2, $d2, "w", $c9, "k", "s", SCR::NEWLINE, $c2, "c", $e7, $f2, "t", $dc, " ", $a6, " ", $9b, $bb, $bc, "u", $e2, SCR::NEWLINE, $a2, " ", "g", "r", $f4, $f0, " ", "a", "g", "a", $d8, "."
.byt SCR::END_SCRIPT
AboutPlaceable:
.byt SCR::SCENE, SCENES::NOVA_LIA_SIGN
; <2 SIGN>In these item boxes are items that allow you to place a block in the world. Use them to get across.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::SIGN, "I", "n", " ", $89, "i", $eb, "m", " ", "b", "o", "x", "e", $fb, "a", "r", $e7, "i", $eb, "m", "s", SCR::NEWLINE, $9a, $ad, "o", "w", " ", $a6, " ", $bb, "p", "l", "a", "c", $e7, "a", SCR::NEWLINE, "b", "l", "o", $f3, " ", $bf, $a2, " ", "w", $c9, $ef, $f6, "U", $e5, " ", $92, SCR::NEWLINE, $bb, $af, " ", "a", "c", "r", "o", $f1, "."
; <1 LIA>You can't scroll the screen while playing the block, so be careful.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "Y", $f4, " ", $b0, $e8, "s", "c", "r", "o", "l", "l", " ", $a2, " ", "s", "c", "r", $d7, "n", SCR::NEWLINE, $da, $dc, $e7, "p", "l", "a", "y", $b1, " ", $a2, " ", "b", "l", "o", $f3, $f5, $cc, " ", "b", "e", SCR::NEWLINE, "c", "a", "r", "e", "f", "u", "l", "."
.byt SCR::END_SCRIPT
AboutChipTall:
.byt SCR::SCENE, SCENES::NOVA_LIA_SIGN
; <2 SIGN>Beware the angry sunmask! Also collect all the chips so you can unlock the socket in the end.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::SIGN, "B", "e", "w", "a", "r", $e7, $a2, " ", $ca, "g", "r", $fe, "s", $f2, "m", $c4, "k", "!", SCR::NEWLINE, "A", "l", $cc, " ", "c", "o", "l", "l", "e", $c7, " ", $ad, " ", $a2, " ", $e2, "i", "p", $fb, $cc, SCR::NEWLINE, $a6, " ", $b0, " ", $f2, "l", "o", $f3, " ", $a2, " ", $cc, $f3, "e", $d3, $d8, SCR::NEWLINE, $a2, " ", $e6, "d", "."
; <1 LIA>Looks like we haves... 99 blocks and 99 springs? A lil excessive.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "L", $e4, "k", $fb, $8d, " ", $c8, " ", "h", "a", "v", "e", "s", ".", ".", $f6, "9", "9", SCR::NEWLINE, "b", "l", "o", $f3, $fb, $a4, "9", "9", " ", $dd, $fc, "n", "g", "s", "?", " ", "A", " ", "l", $dc, SCR::NEWLINE, "e", "x", "c", "e", $f1, "i", "v", "e", "."
.byt SCR::END_SCRIPT
AboutSunKey:
.byt SCR::SCENE, SCENES::NOVA_LIA_SIGN
; <2 SIGN>This key can fit into any color of lock. While touching it, press Up to pick it up or Down to set it down.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::SIGN, $f8, $b8, "k", "e", $fe, $b0, " ", "f", $c1, $d8, $bb, $ab, SCR::NEWLINE, "c", "o", "l", $c9, " ", $bd, "l", "o", $f3, $f6, "W", "h", $dc, $e7, $bc, "u", $e2, $b1, SCR::NEWLINE, "i", "t", $f5, "p", "r", "e", $f1, " ", "U", "p", " ", $bb, "p", "i", $f3, " ", $c1, $cd, " ", $c9, SCR::NEWLINE, "D", "o", "w", "n", " ", $bb, $e5, $d3, $c1, $c5, "w", "n", "."
; <1 LIA>There's something sinister about this key, I'd be careful with it.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, $f8, $ed, "e", $e9, $9c, $e0, $b1, " ", "s", $d8, $b9, $eb, "r", SCR::NEWLINE, $8a, $99, " ", "k", "e", "y", $f5, "I", "'", $ff, $ba, "c", "a", "r", "e", "f", "u", "l", SCR::NEWLINE, $9d, " ", "i", "t", "."
.byt SCR::END_SCRIPT

CutsceneDictionary:
.byt "squirre", 'l'|128
.byt "proble", 'm'|128
.byt "thin", 'k'|128
.byt "afte", 'r'|128
.byt "Latt", 'e'|128
.byt "Atomic Videoclip Zon", 'e'|128
.byt "-halp I've been taken", '-'|128
.byt "Nuclear Power Pant", 's'|128
.byt "ther", 'e'|128
.byt "these", ' '|128
.byt "about", ' '|128
.byt "wha", 't'|128
.byt "ove", 'r'|128
.byt "lik", 'e'|128
.byt "just", ' '|128
.byt "kno", 'w'|128
.byt "tak", 'e'|128
.byt "you", 'r'|128
.byt "the", 'm'|128
.byt "tha", 'n'|128
.byt "the", 'n'|128
.byt "loo", 'k'|128
.byt "com", 'e'|128
.byt "from", ' '|128
.byt "the", 'y'|128
.byt "thi", 's'|128
.byt "that", ' '|128
.byt "have", ' '|128
.byt "som", 'e'|128
.byt "wit", 'h'|128
.byt "wil", 'l'|128
.byt "eve", 'n'|128
.byt "oul", 'd'|128
.byt "Nov", 'a'|128
.byt "th", 'e'|128
.byt "no", 't'|128
.byt "and", ' '|128
.byt "fo", 'r'|128
.byt "yo", 'u'|128
.byt "bu", 't'|128
.byt "le", 't'|128
.byt "he", 'r'|128
.byt "sh", 'e'|128
.byt "an", 'y'|128
.byt "on", 'e'|128
.byt "al", 'l'|128
.byt "ou", 't'|128
.byt "ge", 't'|128
.byt "ca", 'n'|128
.byt "in", 'g'|128
.byt "hi", 'm'|128
.byt "se", 'e'|128
.byt "no", 'w'|128
.byt "ho", 'w'|128
.byt "ou", 'r'|128
.byt "wa", 'y'|128
.byt "is", ' '|128
.byt "i", 's'|128
.byt "be", ' '|128
.byt "to", ' '|128
.byt "t", 'o'|128
.byt "of", ' '|128
.byt "a", ' '|128
.byt "in", ' '|128
.byt "I", ' '|128
.byt "it", ' '|128
.byt "o", 'n'|128
.byt "h", 'e'|128
.byt "a", 's'|128
.byt "d", 'o'|128
.byt "a", 't'|128
.byt "c", 't'|128
.byt "w", 'e'|128
.byt "o", 'r'|128
.byt "a", 'n'|128
.byt "m", 'y'|128
.byt "s", 'o'|128
.byt "u", 'p'|128
.byt "i", 'f'|128
.byt "g", 'o'|128
.byt "m", 'e'|128
.byt "n", 'o'|128
.byt "ly", ' '|128
.byt "t", ' '|128
.byt "I'm", ' '|128
.byt "I'l", 'l'|128
.byt "ed", ' '|128
.byt "e", 'e'|128
.byt "i", 'n'|128
.byt "r", 'r'|128
.byt "w", 'h'|128
.byt "g", 'h'|128
.byt "i", 'l'|128
.byt "s", 'p'|128
.byt "s", 't'|128
.byt "s", 'h'|128
.byt "t", 'h'|128
.byt "n", 't'|128
.byt "c", 'h'|128
.byt "i", 'e'|128
.byt "o", 'o'|128
.byt "s", 'e'|128
.byt "e", 'n'|128
.byt "e", ' '|128
.byt "'t", ' '|128
.byt "'s", ' '|128
.byt "r", ' '|128
.byt "t", 'e'|128
.byt "e", 'a'|128
.byt "e", 'r'|128
.byt "r", 't'|128
.byt "l", 'd'|128
.byt "n", 'd'|128
.byt "s", 's'|128
.byt "u", 'n'|128
.byt "c", 'k'|128
.byt "o", 'u'|128
.byt ",", ' '|128
.byt ".", ' '|128
.byt "a", 'd'|128
.byt "T", 'h'|128
.byt "n", 'e'|128
.byt "t", 'r'|128
.byt "s", ' '|128
.byt "r", 'i'|128
.byt "!", ' '|128
.byt "y", ' '|128
.byt "d", ' '|128
