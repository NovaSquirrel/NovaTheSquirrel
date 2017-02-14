Intro:
.byt SCR::SCENE, SCENES::NOVA_AND_KEE
; []A fox and a squirrel used to play together in a forest, having become quite the unlikely pair of friends.
.byt SCR::NARRATE, CHAR::NONE, "A", " ", "f", "o", "x", " ", $a4, $be, $80, " ", "u", $e5, $ff, $bc, SCR::NEWLINE, "p", "l", "a", $fe, $bc, $af, $a9, " ", $bf, $be, $a5, "e", $de, ",", SCR::NEWLINE, "h", "a", "v", $b1, " ", "b", "e", $96, " ", "q", "u", "i", $eb, " ", $a2, SCR::NEWLINE, $f2, $8d, $d2, "p", "a", "i", $ea, $bd, "f", $fc, $e6, "d", "s", "."
; []However, one day the squirrel got taken to a lab, which the fox attempted to rescue her from.
.byt SCR::NARRATE, CHAR::NONE, "H", "o", $c8, "v", $ed, $f5, $ac, " ", "d", "a", $fe, $a2, " ", $80, SCR::NEWLINE, $cf, $d3, $90, "n", " ", $bb, $be, "l", "a", "b", $f5, $da, "i", $e2, " ", $a2, SCR::NEWLINE, "f", "o", "x", " ", $c6, $eb, "m", "p", $eb, $ff, $bb, "r", "e", "s", "c", "u", $e7, $a9, SCR::NEWLINE, "f", "r", "o", "m", "."
; []The fox accidentally damaged the lab equipment, and after a big flash of light the two of them ended up in another world.
.byt SCR::NARRATE, CHAR::NONE, $f8, $e7, "f", "o", "x", " ", "a", "c", "c", "i", "d", $e6, "t", $ad, $fe, "d", "a", "m", "a", "g", "e", "d", SCR::NEWLINE, $a2, " ", "l", "a", "b", " ", "e", "q", "u", "i", "p", $d0, $e1, $f5, $a4, $83, SCR::NEWLINE, $be, "b", "i", "g", " ", "f", "l", $c4, "h", " ", $bd, "l", "i", $db, $d3, $a2, " ", "t", "w", "o", " ", "o", "f", SCR::NEWLINE, $92, " ", $e6, "d", $d6, $cd, " ", $bf, $ca, "o", $a2, "r", SCR::NEWLINE, "w", $c9, $ef, "."
; <0 NOVA_WOW>Hey Kee? What just happened? Where are we?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_WOW, "H", "e", $fe, "K", $d7, "?", " ", "W", "h", $c6, " ", "j", "u", $de, SCR::NEWLINE, "h", "a", "p", "p", $e6, "e", "d", "?", " ", "W", $a9, $e7, "a", "r", $e7, $c8, "?"
; <1 KEE>Not sure, Nova. You look pretty different now though.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::KEE, "N", "o", $d3, "s", "u", "r", "e", $f5, $a1, $f6, "Y", $f4, " ", $95, SCR::NEWLINE, "p", "r", "e", "t", "t", $fe, "d", $ce, "f", $ed, $e6, $d3, $b4, " ", $e0, $f4, $db, "."
; <0 NOVA_WOW>Am I? You're different too. Hey, there's a sign over there, maybe it'll have useful information.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_WOW, "A", "m", " ", "I", "?", " ", "Y", $f4, "'", "r", $e7, "d", $ce, "f", $ed, $e6, $d3, $bc, "o", ".", SCR::NEWLINE, "H", "e", "y", $f5, $88, $e9, $be, "s", "i", "g", "n", " ", $8c, SCR::NEWLINE, $88, $f5, "m", "a", "y", $ba, "i", "t", "'", "l", "l", " ", $9b, "u", $e5, "f", "u", "l", SCR::NEWLINE, $d8, $a5, "m", $c6, "i", $c2, "."
.byt SCR::SCENE, SCENES::NOVA_KEE_SIGN
; <0 NOVA>Okay, let's see...
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "O", "k", "a", "y", $f5, $a8, $e9, $b3, ".", ".", "."
; <2 SIGN>Welcome to the tutorial! You have ended up in Caffie, a video game world. These signs will explain how to play.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::SIGN, "W", "e", "l", $96, " ", $bb, $a2, " ", "t", "u", $bc, $fc, "a", "l", $fd, "Y", $f4, SCR::NEWLINE, $9b, $e6, "d", $d6, $cd, " ", $bf, $84, $f5, "a", SCR::NEWLINE, "v", "i", "d", "e", "o", " ", "g", "a", $d0, " ", "w", $c9, $ef, $f6, $f8, "e", $e5, SCR::NEWLINE, "s", "i", "g", "n", $fb, $9e, " ", "e", "x", "p", "l", "a", $bf, $b5, " ", $bb, "p", "l", "a", "y", "."
.byt SCR::END_SCRIPT
Tutorial1:
.byt SCR::SCENE, SCENES::NOVA_SIGN_KEE
; <1 SIGN>First, the controls: A to jump, like most games. However, B can either be a tail attack or run, based on if you're walking or not. Don't step on the spikes.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "F", "i", "r", $de, $f5, $a2, " ", "c", $c2, $fa, "o", "l", "s", ":", " ", "A", " ", $bb, "j", "u", "m", "p", ",", SCR::NEWLINE, $8d, " ", "m", "o", $de, " ", "g", "a", $d0, "s", $f6, "H", "o", $c8, "v", $ed, $f5, "B", SCR::NEWLINE, $b0, " ", "e", "i", $a2, $ea, $ba, $be, "t", "a", $dc, " ", $c6, "t", "a", $f3, " ", $c9, SCR::NEWLINE, "r", $f2, $f5, "b", $c4, $d6, $c2, " ", $ce, " ", $a6, "'", "r", "e", SCR::NEWLINE, "w", "a", "l", "k", $b1, " ", $c9, " ", $a3, $f6, "D", $c2, $e8, $de, "e", "p", " ", $c2, SCR::NEWLINE, $a2, " ", $dd, "i", "k", "e", "s", "."
.byt SCR::END_SCRIPT
Tutorial2:
.byt SCR::SCENE, SCENES::NOVA_SIGN_KEE
; <1 SIGN>Some enemies can have their abilities copied. Try stunning this enemy with B and then press Up+B while facing it to copy its ability.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "S", "o", $d0, " ", $e6, "e", "m", $e3, $fb, $b0, " ", $9b, $a2, "i", "r", SCR::NEWLINE, "a", "b", $dc, "i", "t", $e3, $fb, "c", "o", "p", $e3, "d", $f6, "T", "r", $fe, $de, $f2, "n", $b1, SCR::NEWLINE, $99, " ", $e6, "e", $cb, " ", $9d, " ", "B", " ", $a4, $94, SCR::NEWLINE, "p", "r", "e", $f1, " ", "U", "p", "+", "B", " ", $da, $dc, $e7, "f", "a", "c", $b1, " ", $c1, $bc, SCR::NEWLINE, "c", "o", "p", $fe, "i", "t", $fb, "a", "b", $dc, "i", "t", "y", "."
; <1 SIGN>Hold Select to get rid of the ability you have. If an enemy throws projectiles, it is usually copyable.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "H", "o", $ef, " ", "S", "e", "l", "e", $c7, " ", $bb, $af, " ", $fc, $ff, $bd, $a2, SCR::NEWLINE, "a", "b", $dc, "i", "t", $fe, $a6, " ", "h", "a", "v", "e", $f6, "I", "f", " ", $ca, " ", $e6, "e", $cb, SCR::NEWLINE, $e0, "r", "o", "w", $fb, "p", "r", "o", "j", "e", $c7, $dc, "e", "s", $f5, $c1, $b9, SCR::NEWLINE, "u", "s", "u", $ad, $fe, "c", "o", "p", "y", "a", "b", "l", "e", "."
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
; <1 SIGN>That should be everything you need to get started. Keep heading forward until you get to Bummer Club. Good Luck!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, $f8, $c6, " ", $df, $a0, " ", $ba, "e", "v", $ed, "y", $e0, $b1, SCR::NEWLINE, $a6, " ", $f9, $d6, $bb, $af, " ", $de, "a", $ee, "e", "d", ".", SCR::NEWLINE, "K", $d7, "p", " ", $c3, $f7, $b1, " ", $a5, "w", "a", "r", $ff, $f2, "t", $dc, SCR::NEWLINE, $a6, " ", $af, " ", $bb, "B", "u", "m", $d0, $ea, "C", "l", "u", "b", $f6, "G", $e4, "d", SCR::NEWLINE, "L", "u", $f3, "!"
; <0 NOVA>Okay then! Still dunno what I'm doing here.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "O", "k", "a", $fe, $94, $fd, "S", "t", $dc, "l", " ", "d", $f2, $d1, " ", $8b, SCR::NEWLINE, $d4, $c5, $b1, " ", $a9, "e", "."
; <2 KEE>*I'm* going to go back and explore some more. I think I saw a hut back there. You should go on through this door though.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::KEE, "*", "I", "'", "m", "*", " ", $cf, $b1, " ", $bb, $cf, " ", "b", "a", $f3, " ", $ca, "d", SCR::NEWLINE, "e", "x", "p", "l", $c9, $e7, $9c, " ", "m", $c9, "e", $f6, $c0, $82, " ", "I", SCR::NEWLINE, "s", "a", "w", " ", $be, "h", "u", $d3, "b", "a", $f3, " ", $88, $f6, "Y", $f4, SCR::NEWLINE, $df, $a0, " ", $cf, " ", $c2, " ", $e0, "r", $f4, $db, " ", $99, SCR::NEWLINE, $c5, $c9, " ", $e0, $f4, $db, "."
.byt SCR::END_SCRIPT
Nice_Announcement:
.byt SCR::SCENE, SCENES::FORUMS
; [KIERAN]New announcement for the Caffieverse:
.byt SCR::NARRATE, CHAR::KIERAN, "N", "e", "w", " ", $ca, $d1, $f2, "c", "e", $d0, $e1, " ", $a5, " ", $a2, SCR::NEWLINE, $84, "v", $ed, $e5, ":"
; [KIERAN]Henceforth, replying to any post with nothing more than the word "nice" or a loopholed "you think you're being witty but you're not" variation of it will result in an immediate arrest. Yes, this has seriously become this large of a problem and it's going to stop.
.byt SCR::NARRATE, CHAR::KIERAN, "H", $e6, "c", "e", $a5, $e0, $f5, "r", "e", "p", "l", "y", $b1, " ", $bb, $ab, SCR::NEWLINE, "p", "o", $de, " ", $9d, " ", $a3, "h", $b1, " ", "m", $c9, $e7, $93, SCR::NEWLINE, $a2, " ", "w", $c9, $ff, '"', "n", "i", "c", "e", '"', " ", $c9, " ", "a", SCR::NEWLINE, "l", $e4, "p", "h", "o", "l", $d6, '"', $a6, " ", $82, " ", $a6, "'", "r", "e", SCR::NEWLINE, "b", "e", $b1, " ", "w", "i", "t", "t", $fe, $a7, " ", $a6, "'", "r", $e7, $a3, '"', SCR::NEWLINE, "v", "a", $fc, $c6, "i", $c2, " ", $bd, $c1, $9e, " ", "r", "e", "s", "u", "l", $d3, $bf, $ca, SCR::NEWLINE, "i", "m", $d0, "d", "i", $c6, $e7, "a", $d9, "e", $de, $f6, "Y", "e", "s", $f5, $99, SCR::NEWLINE, "h", $c4, " ", $e5, $fc, $f4, "s", $d2, "b", "e", $96, " ", $99, SCR::NEWLINE, "l", "a", "r", "g", $e7, $bd, $be, $81, " ", $a4, "i", "t", "'", "s", SCR::NEWLINE, $cf, $b1, " ", $bb, $de, "o", "p", "."
; [KIERAN]This law also covers Smiloids, those super dangerous robots that shoot people while wishing them a NICE day. I honestly don't know why they haven't been banned until now. With the recent event where the robot Scheme Team army tried to kill everyone we really need to tighten up on security around here. I'm just glad the two Blaster Guys were able to take care of things, but no one knows where they are now, so we can't just rely on them to save us. I have also IP banned the Scheme Team from our forums, just in case.
.byt SCR::NARRATE, CHAR::KIERAN, $f8, $b8, "l", "a", "w", " ", "a", "l", $cc, " ", "c", $8c, $fb, "S", "m", $dc, "o", "i", "d", "s", ",", SCR::NEWLINE, $e0, "o", $e5, " ", "s", $cd, $ed, " ", "d", $ca, "g", $ed, $f4, "s", SCR::NEWLINE, "r", "o", "b", "o", "t", $fb, $9a, $df, $e4, $d3, "p", "e", "o", "p", "l", "e", SCR::NEWLINE, $da, $dc, $e7, "w", $b9, "h", $b1, " ", $92, " ", $be, "N", "I", "C", "E", SCR::NEWLINE, "d", "a", "y", $f6, $c0, "h", $ac, $de, $d2, $c5, "n", $e8, $8f, SCR::NEWLINE, $da, $fe, $98, " ", "h", "a", "v", $e6, $e8, "b", $d7, "n", SCR::NEWLINE, "b", $ca, $f9, $ff, $f2, "t", $dc, " ", $b4, $f6, "W", "i", $e0, " ", $a2, SCR::NEWLINE, "r", "e", "c", $e6, $d3, $9f, $d3, $da, $ed, $e7, $a2, " ", "r", "o", "b", "o", "t", SCR::NEWLINE, "S", $e2, "e", $d0, " ", "T", $ec, "m", " ", "a", "r", $cb, " ", $fa, $e3, $ff, $bc, SCR::NEWLINE, "k", $dc, "l", " ", "e", "v", $ed, "y", $ac, " ", $c8, " ", "r", $ec, "l", $d2, $f9, "e", "d", SCR::NEWLINE, $bb, "t", "i", $db, $eb, "n", " ", $cd, " ", $c2, " ", $e5, "c", "u", $fc, "t", "y", SCR::NEWLINE, "a", "r", $f4, $f0, " ", $a9, "e", $f6, $d4, $8e, "g", "l", $f7, " ", $a2, SCR::NEWLINE, "t", "w", "o", " ", "B", "l", $c4, $eb, $ea, "G", "u", "y", $fb, $c8, "r", $e7, "a", "b", "l", "e", SCR::NEWLINE, $bb, $90, " ", "c", "a", "r", $e7, $bd, $e0, $b1, "s", $f5, $a7, " ", $d1, SCR::NEWLINE, $ac, " ", $8f, $fb, $da, $ed, $e7, $98, " ", "a", "r", "e", SCR::NEWLINE, $b4, $f5, $cc, " ", $c8, " ", $b0, $e8, $8e, "r", "e", $d2, $c2, SCR::NEWLINE, $92, " ", $bb, "s", "a", "v", $e7, "u", "s", $f6, $c0, $9b, "a", "l", $cc, SCR::NEWLINE, "I", "P", " ", "b", $ca, $f9, $ff, $a2, " ", "S", $e2, "e", $d0, " ", "T", $ec, "m", SCR::NEWLINE, $97, $b6, " ", $a5, "u", "m", "s", $f5, $8e, $bf, "c", $c4, "e", "."
; []Meanwhile...
.byt SCR::NARRATE, CHAR::NONE, "M", $ec, "n", $da, $dc, "e", ".", ".", "."
.byt SCR::SCENE, SCENES::TWO_BAD_GUYS
; <0 S_TEAM>So one of the Blaster Guys is around here, right? We'd better capture him so that he can't interfere with the plans, now that we've broken out of jail and stuff.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::S_TEAM, "S", "o", " ", $ac, " ", $bd, $a2, " ", "B", "l", $c4, $eb, $ea, "G", "u", "y", $fb, $b9, SCR::NEWLINE, "a", "r", $f4, $f0, " ", $a9, "e", $f5, $fc, $db, "t", "?", " ", "W", "e", "'", "d", SCR::NEWLINE, "b", "e", "t", $eb, $ea, "c", "a", "p", "t", "u", "r", $e7, $b2, " ", $cc, " ", $9a, $c3, SCR::NEWLINE, $b0, $e8, $d8, $eb, "r", "f", $ed, $e7, $9d, " ", $a2, " ", "p", "l", $ca, "s", ",", SCR::NEWLINE, $b4, " ", $9a, $c8, "'", "v", $e7, "b", "r", "o", "k", $e6, " ", $ae, " ", "o", "f", SCR::NEWLINE, "j", "a", $dc, " ", $a4, $de, "u", "f", "f", "."
; <1 S_TEAM>Yeah, let's go do that. Also let's pretend to be cops.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::S_TEAM, "Y", $ec, "h", $f5, $a8, $e9, $cf, " ", $c5, " ", $e0, $c6, $f6, "A", "l", $cc, SCR::NEWLINE, $a8, $e9, "p", "r", "e", $eb, $f0, " ", $bb, $ba, "c", "o", "p", "s", "."
; <0 S_TEAM>GOOD idea. Hey, I think he's over there checking his mail!!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::S_TEAM, "G", "O", "O", "D", " ", "i", "d", $ec, $f6, "H", "e", "y", $f5, $c0, $82, " ", $c3, "'", "s", SCR::NEWLINE, $8c, " ", $88, " ", $e2, "e", $f3, $b1, " ", "h", $b8, "m", "a", $dc, "!", "!"
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
; [SHERWIN]yeah so these robot guys with guns just took me. this is illegal you know!
.byt SCR::NARRATE, CHAR::SHERWIN, "y", $ec, "h", " ", $cc, " ", $89, "r", "o", "b", "o", $d3, "g", "u", "y", "s", SCR::NEWLINE, $9d, " ", "g", $f2, $fb, $8e, $bc, "o", "k", " ", $d0, $f6, $99, " ", $b9, SCR::NEWLINE, $dc, "l", "e", "g", "a", "l", " ", $a6, " ", $8f, "!"
; [KIERAN]omg they must be the scheme team
.byt SCR::NARRATE, CHAR::KIERAN, "o", "m", "g", " ", $98, " ", "m", "u", $de, " ", $ba, $a2, " ", "s", $e2, "e", $d0, SCR::NEWLINE, $eb, "a", "m"
; [SHERWIN]maybe??
.byt SCR::NARRATE, CHAR::SHERWIN, "m", "a", "y", "b", "e", "?", "?"
; [KIERAN]I *JUST* arrested those idiots, and they're already out again. great! Well I guess we're doomed now!
.byt SCR::NARRATE, CHAR::KIERAN, $c0, "*", "J", "U", "S", "T", "*", " ", "a", $d9, "e", $de, $d6, $e0, "o", $e5, SCR::NEWLINE, "i", "d", "i", "o", "t", "s", $f5, $a4, $98, "'", "r", $e7, "a", "l", "r", $ec, "d", "y", SCR::NEWLINE, $ae, " ", "a", "g", "a", $d8, $f6, "g", "r", $ec, "t", $fd, "W", "e", "l", "l", " ", $c0, "g", "u", "e", $f1, SCR::NEWLINE, $c8, "'", "r", $e7, $c5, "o", $d0, $ff, $b4, "!"
.byt SCR::END_SCRIPT
FirstSchemeTeamEncounter:
.byt SCR::SCENE, SCENES::NOVA_AND_BAD_GUYS
; <0 NOVA>Oh hey, do you know how to get to Bummer Club from here?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "O", "h", " ", $c3, "y", $f5, $c5, " ", $a6, " ", $8f, " ", $b5, " ", $bc, SCR::NEWLINE, $af, " ", $bb, "B", "u", "m", $d0, $ea, "C", "l", "u", "b", " ", "f", "r", "o", "m", SCR::NEWLINE, $a9, "e", "?"
; <1 S_TEAM>Oh look, target practice!!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::S_TEAM, "O", "h", " ", $95, $f5, "t", "a", "r", $af, " ", "p", "r", "a", $c7, "i", "c", "e", "!", "!"
; <0 NOVA_AW>W-wait! That's not nice!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_AW, "W", "-", "w", "a", "i", "t", $fd, $f8, $c6, $e9, $a3, " ", "n", "i", "c", "e", "!"
; <1 S_TEAM>We're the Scheme Team, we're not supposed to be nice, and you're going down!!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::S_TEAM, "W", "e", "'", "r", $e7, $a2, " ", "S", $e2, "e", $d0, " ", "T", $ec, "m", $f5, $c8, "'", "r", "e", SCR::NEWLINE, $a3, " ", "s", $cd, "p", "o", $e5, $ff, $bb, $ba, "n", "i", "c", "e", $f5, $ca, "d", SCR::NEWLINE, $a6, "'", "r", $e7, $cf, $b1, " ", $c5, "w", "n", "!", "!"
; <0 NOVA_MAD>Oh, is that how it's going to be? Fine, I'll fight you, but you're going to lose~
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_MAD, "O", "h", $f5, $b8, $9a, $b5, " ", "i", "t", $e9, $cf, $b1, " ", $bc, SCR::NEWLINE, "b", "e", "?", " ", "F", $d8, "e", $f5, $d5, " ", "f", "i", $db, $d3, $a6, $f5, $a7, SCR::NEWLINE, $a6, "'", "r", $e7, $cf, $b1, " ", $bb, "l", "o", $e5, "~"
.byt SCR::END_SCRIPT
FirstSchemeTeamEncounterAfter:
.byt SCR::SCENE, SCENES::TWO_BAD_GUYS
; <0 S_TEAM>Ouch. We're going to have to do something about that squirrel, because she could take our entire operation down if she wanted. We need to tell the boss.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::S_TEAM, "O", "u", $e2, $f6, "W", "e", "'", "r", $e7, $cf, $b1, " ", $bb, $9b, $bc, SCR::NEWLINE, $c5, " ", $9c, $e0, $b1, " ", $8a, $e0, $c6, SCR::NEWLINE, $80, $f5, "b", "e", "c", "a", "u", $e5, " ", $aa, " ", "c", $a0, SCR::NEWLINE, $90, " ", $b6, " ", $e6, "t", "i", "r", $e7, "o", "p", $ed, $c6, "i", $c2, SCR::NEWLINE, $c5, "w", "n", " ", $ce, " ", $aa, " ", "w", $ca, $eb, "d", $f6, "W", $e7, $f9, "e", "d", SCR::NEWLINE, $bb, $eb, "l", "l", " ", $a2, " ", "b", "o", $f1, "."
.byt SCR::TRANSITION
; <0 S_TEAM>Hey Bill???
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::S_TEAM, "H", "e", $fe, "B", $dc, "l", "?", "?", "?"
.byt SCR::SCENE, SCENES::BAD_GUYS_AND_LEADER
; <2 BILL>What? Why do you guys look beat-up?
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::BILL, "W", "h", $c6, "?", " ", "W", "h", $fe, $c5, " ", $a6, " ", "g", "u", "y", $fb, $95, SCR::NEWLINE, "b", $ec, "t", "-", $cd, "?"
; <0 S_TEAM>There's this weird green squirrel that might be an issue for us. She was able to kick our butts, and she seems stronger than the Blaster Guys were and she doesn't even have a gun. She went on towards Bummer Club afterwards, not sure what she's doing.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::S_TEAM, $f8, $ed, "e", $e9, $99, " ", $c8, "i", "r", $ff, "g", "r", $d7, "n", SCR::NEWLINE, $80, " ", $9a, "m", "i", $db, $d3, $ba, $ca, SCR::NEWLINE, $b9, "s", "u", $e7, $a5, " ", "u", "s", $f6, "S", $c3, " ", "w", $c4, " ", "a", "b", "l", $e7, $bc, SCR::NEWLINE, "k", "i", $f3, " ", $b6, " ", $a7, "t", "s", $f5, $a4, $aa, " ", $b3, "m", "s", SCR::NEWLINE, $de, "r", $c2, "g", $ed, " ", $93, " ", $a2, " ", "B", "l", $c4, $eb, "r", SCR::NEWLINE, "G", "u", "y", $fb, $c8, "r", $e7, $a4, $aa, " ", $c5, "e", "s", "n", "'", "t", SCR::NEWLINE, $9f, " ", $9b, $be, "g", $f2, $f6, "S", $c3, " ", $c8, $e1, " ", $c2, SCR::NEWLINE, $bc, "w", "a", "r", "d", $fb, "B", "u", "m", $d0, $ea, "C", "l", "u", "b", SCR::NEWLINE, $83, "w", "a", "r", "d", "s", $f5, $a3, " ", "s", "u", "r", $e7, $8b, SCR::NEWLINE, $aa, $e9, $c5, $b1, "."
; <2 BILL>Well, she won't be a problem for much longer. We'll just send the Smiloids after her when they're done.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::BILL, "W", "e", "l", "l", $f5, $aa, " ", "w", $c2, $e8, $ba, $be, $81, SCR::NEWLINE, $a5, " ", "m", "u", $e2, " ", "l", $c2, "g", $ed, $f6, "W", "e", "'", "l", "l", " ", "j", "u", $de, SCR::NEWLINE, $e5, $f0, " ", $a2, " ", "S", "m", $dc, "o", "i", "d", $fb, $83, " ", $a9, SCR::NEWLINE, $da, $e6, " ", $98, "'", "r", $e7, $c5, $f9, "."
.byt SCR::END_SCRIPT
AfterFirstBattle:
.byt SCR::SCENE, SCENES::FORUMS
; []-halp I've been taken-
.byt SCR::NARRATE, CHAR::NONE, $86
; [SHERWIN]So, I guess one benefit to being stuck here with the bad guys is I get to leak out information on whatever they're doing. They can't read this forum, right?
.byt SCR::NARRATE, CHAR::SHERWIN, "S", "o", $f5, $c0, "g", "u", "e", $f1, " ", $ac, " ", "b", $e6, "e", "f", $c1, $bc, SCR::NEWLINE, "b", "e", $b1, " ", $de, "u", $f3, " ", $a9, $e7, $9d, " ", $a2, " ", "b", $f7, SCR::NEWLINE, "g", "u", "y", $fb, $b8, $c0, $af, " ", $bb, "l", $ec, "k", " ", $ae, SCR::NEWLINE, $d8, $a5, "m", $c6, "i", $c2, " ", $c2, " ", $8b, "e", "v", $ed, SCR::NEWLINE, $98, "'", "r", $e7, $c5, $b1, $f6, $f8, "e", $fe, $b0, $e8, "r", $ec, "d", SCR::NEWLINE, $99, " ", $a5, "u", "m", $f5, $fc, $db, "t", "?"
; [KIERAN]They're IP banned. Anyone else can read it though.
.byt SCR::NARRATE, CHAR::KIERAN, $f8, "e", "y", "'", "r", $e7, "I", "P", " ", "b", $ca, $f9, "d", $f6, "A", "n", "y", $ac, SCR::NEWLINE, "e", "l", $e5, " ", $b0, " ", "r", $ec, $ff, $c1, $e0, $f4, $db, "."
; [SHERWIN]Anyway, I heard there was a fight with some weird green squirrel? She totally kicked some Scheme Team members' butts. I'll keep reporting on this.
.byt SCR::NARRATE, CHAR::SHERWIN, "A", "n", "y", $b7, $f5, $c0, $c3, "a", "r", $ff, $88, " ", "w", $c4, " ", "a", SCR::NEWLINE, "f", "i", $db, $d3, $9d, " ", $9c, " ", $c8, "i", "r", $ff, "g", "r", $d7, "n", SCR::NEWLINE, $80, "?", " ", "S", $c3, " ", $bc, "t", $ad, $fe, "k", "i", $f3, "e", "d", SCR::NEWLINE, $9c, " ", "S", $e2, "e", $d0, " ", "T", $ec, "m", " ", $d0, "m", "b", $ed, "s", "'", SCR::NEWLINE, $a7, "t", "s", $f6, $d5, " ", "k", $d7, "p", " ", "r", "e", "p", $c9, "t", $b1, " ", $c2, SCR::NEWLINE, $99, "."
; [KIERAN]Oh good! Oh! Do you know exactly WHERE you are? It would really help to know where their base is.
.byt SCR::NARRATE, CHAR::KIERAN, "O", "h", " ", $cf, "o", "d", $fd, "O", "h", $fd, "D", "o", " ", $a6, " ", $8f, SCR::NEWLINE, "e", "x", "a", $c7, $d2, "W", "H", "E", "R", "E", " ", $a6, " ", "a", "r", "e", "?", " ", "I", "t", SCR::NEWLINE, "w", $a0, " ", "r", $ec, "l", $d2, $c3, "l", "p", " ", $bb, $8f, SCR::NEWLINE, $da, $ed, $e7, $a2, "i", $ea, "b", $c4, $e7, $b9, "."
; [SHERWIN]I think this place is named Atomic Videoclip Zone?? And Nova said she was going to Bummer Club.
.byt SCR::NARRATE, CHAR::SHERWIN, $c0, $82, " ", $99, " ", "p", "l", "a", "c", $e7, $b8, "n", "a", $d0, "d", SCR::NEWLINE, $85, "?", "?", " ", "A", $f0, SCR::NEWLINE, $a1, " ", "s", "a", "i", $ff, $aa, " ", "w", $c4, " ", $cf, $b1, " ", $bc, SCR::NEWLINE, "B", "u", "m", $d0, $ea, "C", "l", "u", "b", "."
; [KIERAN]Well then, I'll be waiting for her there.
.byt SCR::NARRATE, CHAR::KIERAN, "W", "e", "l", "l", " ", $94, $f5, $d5, " ", $ba, "w", "a", "i", "t", $b1, " ", $a5, SCR::NEWLINE, $a9, " ", $88, "."
; [SHERWIN]Btw guys I'm not weak and I could totally break out of here. I'm just staying so I can give you guys info. That, and they would probably catch me again and I would be worse off.
.byt SCR::NARRATE, CHAR::SHERWIN, "B", "t", "w", " ", "g", "u", "y", $fb, $d4, $a3, " ", $c8, "a", "k", " ", $a4, "I", SCR::NEWLINE, "c", $a0, " ", $bc, "t", $ad, $fe, "b", "r", $ec, "k", " ", $ae, " ", "o", "f", SCR::NEWLINE, $a9, "e", $f6, $d4, $8e, $de, "a", "y", $b1, " ", $cc, " ", $c0, $b0, SCR::NEWLINE, "g", "i", "v", $e7, $a6, " ", "g", "u", "y", $fb, $d8, "f", "o", $f6, $f8, $c6, $f5, $ca, "d", SCR::NEWLINE, $98, " ", "w", $a0, " ", "p", "r", "o", "b", "a", "b", $d2, "c", $c6, $e2, " ", $d0, SCR::NEWLINE, "a", "g", "a", $bf, $a4, $c0, "w", $a0, " ", $ba, "w", $c9, $e5, SCR::NEWLINE, "o", "f", "f", "."
; [KIERAN]Understood.
.byt SCR::NARRATE, CHAR::KIERAN, "U", $f0, $ed, $de, $e4, "d", "."
.byt SCR::TRANSITION
.byt SCR::SCENE, SCENES::NOVA_AND_KIERAN
; <1 KIERAN>Heyyy squirrel.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::KIERAN, "H", "e", "y", "y", $fe, $80, "."
; <0 NOVA_YAY>Oh hi!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_YAY, "O", "h", " ", "h", "i", "!"
; <1 KIERAN>You probably want some answers. This is a virtual world named Caffie, and I'm Kieran, its leader. And now I'm going to be needing your help.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::KIERAN, "Y", $f4, " ", "p", "r", "o", "b", "a", "b", $d2, "w", $ca, $d3, $9c, SCR::NEWLINE, $ca, "s", $c8, "r", "s", $f6, $f8, $b8, $b8, $be, "v", "i", $ee, "u", "a", "l", SCR::NEWLINE, "w", $c9, $ef, " ", "n", "a", $d0, $ff, $84, $f5, $a4, "I", "'", "m", SCR::NEWLINE, "K", $e3, "r", $ca, $f5, "i", "t", $fb, "l", $ec, "d", $ed, $f6, "A", $f0, " ", $b4, " ", "I", "'", "m", SCR::NEWLINE, $cf, $b1, " ", $bb, $ba, $f9, "e", "d", $b1, " ", $91, " ", $c3, "l", "p", "."
; <0 NOVA>My help? Why me in particular?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "M", $fe, $c3, "l", "p", "?", " ", "W", "h", $fe, $d0, " ", $d8, SCR::NEWLINE, "p", "a", $ee, "i", "c", "u", "l", "a", "r", "?"
; <1 KIERAN>You know those robot guys you fought? They're members of the Scheme Team, and that evil group seems to want to take over the world or destroy it. I'm not sure, I just they have bad intentions. We arrested them, but they broke out. They're really determined not to lose again, so they're prepared for anything anyone in Caffie could have thrown at them.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::KIERAN, "Y", $f4, " ", $8f, " ", $e0, "o", $e5, " ", "r", "o", "b", "o", $d3, "g", "u", "y", "s", SCR::NEWLINE, $a6, " ", "f", $f4, $db, "t", "?", " ", $f8, "e", "y", "'", "r", $e7, $d0, "m", "b", $ed, "s", SCR::NEWLINE, $bd, $a2, " ", "S", $e2, "e", $d0, " ", "T", $ec, "m", $f5, $a4, $e0, $c6, SCR::NEWLINE, "e", "v", $dc, " ", "g", "r", $f4, "p", " ", $b3, "m", $fb, $bb, "w", $ca, $d3, $bc, SCR::NEWLINE, $90, " ", $8c, " ", $a2, " ", "w", $c9, $ef, " ", $c9, SCR::NEWLINE, "d", "e", $de, "r", "o", $fe, "i", "t", $f6, $d4, $a3, " ", "s", "u", "r", "e", $f5, $c0, "j", "u", $de, SCR::NEWLINE, $98, " ", $9b, "b", $f7, " ", $d8, $eb, $e1, "i", $c2, "s", $f6, "W", "e", SCR::NEWLINE, "a", $d9, "e", $de, $d6, $92, $f5, $a7, " ", $98, SCR::NEWLINE, "b", "r", "o", "k", $e7, $ae, $f6, $f8, "e", "y", "'", "r", $e7, "r", $ec, "l", "l", "y", SCR::NEWLINE, "d", "e", $eb, "r", "m", $d8, $d6, $a3, " ", $bb, "l", "o", $e5, " ", "a", "g", "a", $d8, ",", SCR::NEWLINE, $cc, " ", $98, "'", "r", $e7, "p", "r", "e", "p", "a", "r", $d6, $a5, SCR::NEWLINE, $ab, $e0, $b1, " ", $ab, $ac, " ", $bf, $84, SCR::NEWLINE, "c", $a0, " ", $9b, $e0, "r", "o", "w", "n", " ", $c6, " ", $92, "."
; <0 NOVA>Yeah? Oh, I get it. I'm not from here, so I actually have a good chance.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "Y", $ec, "h", "?", " ", "O", "h", $f5, $c0, $af, " ", "i", "t", $f6, $d4, $a3, " ", "f", "r", "o", "m", SCR::NEWLINE, $a9, "e", $f5, $cc, " ", $c0, "a", $c7, "u", $ad, $fe, $9b, "a", SCR::NEWLINE, $cf, "o", $ff, $e2, $ca, "c", "e", "."
; <1 KIERAN>That's the logic here. Will you help? I can try and get you home once we're no longer threatened.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::KIERAN, $f8, $c6, $e9, $a2, " ", "l", "o", "g", "i", "c", " ", $a9, "e", $f6, "W", $dc, "l", " ", $a6, SCR::NEWLINE, $c3, "l", "p", "?", " ", $c0, $b0, " ", $fa, $fe, $a4, $af, " ", $a6, SCR::NEWLINE, "h", "o", $d0, " ", $c2, "c", $e7, $c8, "'", "r", $e7, $d1, " ", "l", $c2, "g", $ed, SCR::NEWLINE, $e0, "r", $ec, $eb, $f9, "d", "."
; <0 NOVA>Of course!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "O", "f", " ", "c", $b6, $e5, "!"
; <1 KIERAN>Great. This place has its own forum, and we're keeping track of the situation on there. You should go look.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::KIERAN, "G", "r", $ec, "t", $f6, $f8, $b8, "p", "l", "a", "c", $e7, "h", $c4, " ", "i", "t", $fb, "o", "w", "n", SCR::NEWLINE, $a5, "u", "m", $f5, $a4, $c8, "'", "r", $e7, "k", $d7, "p", $b1, SCR::NEWLINE, $fa, "a", $f3, " ", $bd, $a2, " ", "s", "i", "t", "u", $c6, "i", $c2, " ", $c2, SCR::NEWLINE, $88, $f6, "Y", $f4, " ", $df, $a0, " ", $cf, " ", $95, "."
; <0 NOVA>Alright. I'll go register and read up on the details.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "A", "l", $fc, $db, "t", $f6, $d5, " ", $cf, " ", "r", "e", "g", $b9, $eb, $ea, $ca, "d", SCR::NEWLINE, "r", $ec, $ff, $cd, " ", $c2, " ", $a2, " ", "d", "e", "t", "a", $dc, "s", "."
; <1 KIERAN>In the meantime you should focus on getting ready for facing off against the Scheme Team while we still have time. This place, Bummer Club, is a big puzzle challenge and there's a prize waiting at the end which should help give you the advantage.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::KIERAN, "I", "n", " ", $a2, " ", $d0, $ca, "t", "i", $d0, " ", $a6, " ", $df, $a0, SCR::NEWLINE, "f", "o", "c", "u", $fb, $c2, " ", $af, "t", $b1, " ", "r", $ec, "d", $fe, $a5, SCR::NEWLINE, "f", "a", "c", $b1, " ", "o", "f", "f", " ", "a", "g", "a", $d8, $de, " ", $a2, SCR::NEWLINE, "S", $e2, "e", $d0, " ", "T", $ec, "m", " ", $da, $dc, $e7, $c8, " ", $de, $dc, "l", SCR::NEWLINE, $9b, "t", "i", $d0, $f6, $f8, $b8, "p", "l", "a", "c", "e", $f5, "B", "u", "m", $d0, "r", SCR::NEWLINE, "C", "l", "u", "b", $f5, $b8, $be, "b", "i", "g", " ", "p", "u", "z", "z", "l", "e", SCR::NEWLINE, $e2, $ad, $e6, "g", $e7, $a4, $88, $e9, $be, "p", $fc, "z", "e", SCR::NEWLINE, "w", "a", "i", "t", $b1, " ", $c6, " ", $a2, " ", $e6, $ff, $da, "i", $e2, SCR::NEWLINE, $df, $a0, " ", $c3, "l", "p", " ", "g", "i", "v", $e7, $a6, " ", $a2, SCR::NEWLINE, $f7, "v", $ca, "t", "a", "g", "e", "."
.byt SCR::END_SCRIPT
MeetLia:
.byt SCR::SCENE, SCENES::NOVA_AND_LIA
; <0 NOVA_WOW>Another squirrel!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_WOW, "A", $a3, $a9, " ", $80, "!"
; <1 LIA>Heys. Oh, I think I recognize you. You were the squirrel that played with that fox, right?
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "H", "e", "y", "s", $f6, "O", "h", $f5, $c0, $82, " ", $c0, "r", "e", "c", "o", "g", "n", "i", "z", "e", SCR::NEWLINE, $a6, $f6, "Y", $f4, " ", $c8, "r", $e7, $a2, " ", $80, SCR::NEWLINE, $9a, "p", "l", "a", "y", $d6, $9d, " ", $9a, "f", "o", "x", ",", SCR::NEWLINE, $fc, $db, "t", "?"
; <0 NOVA>Yeah, I am. Are you from that forest too? What even happened back there?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "Y", $ec, "h", $f5, $c0, "a", "m", $f6, "A", "r", $e7, $a6, " ", $97, $e0, $c6, SCR::NEWLINE, $a5, "e", $de, " ", $bc, "o", "?", " ", "W", "h", $c6, " ", $9f, SCR::NEWLINE, "h", "a", "p", "p", $e6, $d6, "b", "a", $f3, " ", $88, "?"
; <1 LIA>Yea, I just remember a flash of light, and here I was. I wanna go home...
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "Y", $ec, $f5, $c0, $8e, "r", "e", $d0, "m", "b", $ed, " ", $be, "f", "l", $c4, "h", SCR::NEWLINE, $bd, "l", "i", $db, "t", $f5, $a4, $a9, $e7, $c0, "w", $c4, $f6, "I", SCR::NEWLINE, "w", $ca, "n", $be, $cf, " ", "h", "o", $d0, ".", ".", "."
; <0 NOVA>Oh! I could take you with me, since I'm trying to get out of here too.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "O", "h", $fd, $c0, "c", $a0, " ", $90, " ", $a6, " ", $9d, " ", $d0, ",", SCR::NEWLINE, "s", $d8, "c", $e7, $d4, $fa, "y", $b1, " ", $bb, $af, " ", $ae, " ", "o", "f", SCR::NEWLINE, $a9, $e7, $bc, "o", "."
; <1 LIA>You dun have to do that for me.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "Y", $f4, " ", "d", $f2, " ", $9b, $bb, $c5, " ", $9a, $a5, SCR::NEWLINE, $d0, "."
; <0 NOVA_YAY>I want to though, and besides I could use the company. I'll help you find your way home.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_YAY, $c0, "w", $ca, $d3, $bb, $e0, $f4, $db, $f5, $a4, "b", "e", "s", "i", "d", "e", "s", SCR::NEWLINE, $c0, "c", $a0, " ", "u", $e5, " ", $a2, " ", "c", "o", "m", "p", $ab, $f6, $d5, SCR::NEWLINE, $c3, "l", "p", " ", $a6, " ", "f", $d8, $ff, $91, " ", $b7, " ", "h", "o", $d0, "."
; <1 LIA>Okies!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "O", "k", $e3, "s", "!"
; <0 NOVA>I'm Nova, by the way.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, $d4, $a1, $f5, "b", $fe, $a2, " ", $b7, "."
; <1 LIA>And I'm Lia!~
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "A", $f0, " ", $d4, "L", "i", "a", "!", "~"
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
; <0 NOVA>Another squirrel!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "A", $a3, $a9, " ", $80, "!"
; <1 LIA>Squirrel party!~
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "S", "q", "u", "i", $d9, "e", "l", " ", "p", "a", $ee, "y", "!", "~"
; <2 ECLIPSE>Oh wow. Hi, Nova! 
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::ECLIPSE, "O", "h", " ", "w", "o", "w", $f6, "H", "i", $f5, $a1, $fd
; <0 NOVA>You know me?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "Y", $f4, " ", $8f, " ", $d0, "?"
; <2 ECLIPSE>Yeah, I'm your long-lost sister, Eclipse. Anyway, the prize for completing Bummer Club is pretty rad. I'm awarding you some cool pants.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::ECLIPSE, "Y", $ec, "h", $f5, $d4, $91, " ", "l", $c2, "g", "-", "l", "o", $de, SCR::NEWLINE, "s", $b9, $eb, "r", $f5, "E", "c", "l", "i", "p", $e5, $f6, "A", "n", "y", $b7, $f5, $a2, SCR::NEWLINE, "p", $fc, "z", $e7, $a5, " ", "c", "o", "m", "p", $a8, $b1, " ", "B", "u", "m", $d0, "r", SCR::NEWLINE, "C", "l", "u", "b", " ", $b8, "p", "r", "e", "t", "t", $fe, "r", $f7, $f6, "I", "'", "m", SCR::NEWLINE, "a", "w", "a", "r", "d", $b1, " ", $a6, " ", $9c, " ", "c", $e4, "l", SCR::NEWLINE, "p", $ca, "t", "s", "."
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
; [KIERAN]Hey, Nuclear Power Pants are NOT a laughing matter.
.byt SCR::NARRATE, CHAR::KIERAN, "H", "e", "y", $f5, $87, SCR::NEWLINE, "a", "r", $e7, "N", "O", "T", " ", $be, "l", "a", "u", $db, $b1, " ", "m", $c6, $eb, "r", "."
; [SHERWIN]I dunno I'm kind of laughing right now.
.byt SCR::NARRATE, CHAR::SHERWIN, $c0, "d", $f2, $d1, " ", $d4, "k", $d8, $ff, $bd, "l", "a", "u", $db, $b1, SCR::NEWLINE, $fc, $db, $d3, $b4, "."
; [KIERAN]Anyway, head over to Frozen Volcano. Just trust me on this - I thnk it's really important that you get some Fa-a-ancy cola.
.byt SCR::NARRATE, CHAR::KIERAN, "A", "n", "y", $b7, $f5, $c3, $f7, " ", $8c, " ", $bb, "F", "r", "o", "z", $e6, SCR::NEWLINE, "V", "o", "l", $b0, "o", $f6, "J", "u", $de, " ", $fa, "u", $de, " ", $d0, " ", $c2, " ", $99, SCR::NEWLINE, "-", " ", $c0, $e0, "n", "k", " ", "i", "t", $e9, "r", $ec, "l", $d2, "i", "m", "p", $c9, "t", $ca, "t", SCR::NEWLINE, $9a, $a6, " ", $af, " ", $9c, " ", "F", "a", "-", "a", "-", $ca, "c", "y", SCR::NEWLINE, "c", "o", "l", "a", "."
; [NOVA]What's so fancy about it?
.byt SCR::NARRATE, CHAR::NOVA, "W", "h", $c6, $e9, $cc, " ", "f", $ca, "c", $fe, $8a, "i", "t", "?"
; [KIERAN]No, it's fa-a-ancy. Completely different. Anyway, in Frozen Volcano, there's this dude named MolSno. He has a real problem so he bought every single can of fa-a-ancy cola there is and you'll just have to get some from him.
.byt SCR::NARRATE, CHAR::KIERAN, "N", "o", $f5, "i", "t", $e9, "f", "a", "-", "a", "-", $ca, "c", "y", ".", SCR::NEWLINE, "C", "o", "m", "p", $a8, "e", $d2, "d", $ce, "f", $ed, $e6, "t", $f6, "A", "n", "y", $b7, ",", SCR::NEWLINE, $bf, "F", "r", "o", "z", $e6, " ", "V", "o", "l", $b0, "o", $f5, $88, "'", "s", SCR::NEWLINE, $99, " ", "d", "u", "d", $e7, "n", "a", $d0, $ff, "M", "o", "l", "S", $d1, $f6, "H", "e", SCR::NEWLINE, "h", $c4, " ", $be, "r", $ec, "l", " ", $81, " ", $cc, " ", $c3, SCR::NEWLINE, "b", $f4, $db, $d3, "e", "v", $ed, $fe, "s", $b1, "l", $e7, $b0, " ", "o", "f", SCR::NEWLINE, "f", "a", "-", "a", "-", $ca, "c", $fe, "c", "o", "l", $be, $88, " ", $b8, $ca, "d", SCR::NEWLINE, $a6, "'", "l", "l", " ", $8e, $9b, $bb, $af, " ", $9c, SCR::NEWLINE, $97, $b2, "."
; [NOVA]Sure, I guess I'll try that. But why cola?
.byt SCR::NARRATE, CHAR::NOVA, "S", "u", "r", "e", $f5, $c0, "g", "u", "e", $f1, " ", $d5, " ", $fa, $fe, $e0, $c6, $f6, "B", "u", "t", SCR::NEWLINE, $da, $fe, "c", "o", "l", "a", "?"
; [KIERAN]I'll let you in on a little secret - the name Caffie comes from caffeine, and caffeine is this really powerful thing here, especially if a squirrel uses it.
.byt SCR::NARRATE, CHAR::KIERAN, $d5, " ", $a8, " ", $a6, " ", $bf, $c2, " ", $be, "l", "i", "t", "t", "l", "e", SCR::NEWLINE, $e5, "c", "r", "e", $d3, "-", " ", $a2, " ", "n", "a", $d0, " ", $84, SCR::NEWLINE, $96, $fb, $97, "c", "a", "f", "f", "e", $d8, "e", $f5, $ca, "d", SCR::NEWLINE, "c", "a", "f", "f", "e", $d8, $e7, $b8, $99, " ", "r", $ec, "l", "l", "y", SCR::NEWLINE, "p", "o", $c8, "r", "f", "u", "l", " ", $e0, $b1, " ", $a9, "e", ",", SCR::NEWLINE, "e", $dd, "e", "c", "i", $ad, $fe, $ce, " ", $be, $80, " ", "u", $e5, "s", SCR::NEWLINE, "i", "t", "."
.byt SCR::END_SCRIPT
MolSnoMeet:
.byt SCR::SCENE, SCENES::NOVA_AND_MOLSNO
; <0 NOVA>Heyyy I assume you're MolSno? I need some of your fa-a-ancy cola so I can save the world.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "H", "e", "y", "y", $fe, $c0, $c4, "s", "u", $d0, " ", $a6, "'", "r", "e", SCR::NEWLINE, "M", "o", "l", "S", $d1, "?", " ", $c0, $f9, $d6, $9c, " ", $bd, $91, SCR::NEWLINE, "f", "a", "-", "a", "-", $ca, "c", $fe, "c", "o", "l", $be, $cc, " ", $c0, $b0, " ", "s", "a", "v", "e", SCR::NEWLINE, $a2, " ", "w", $c9, $ef, "."
; <1 MOLSNO>Yeah, no. This cola is all mine, all 65535 cans of it I have here. I absolutely need every single one for myself. Totally.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::MOLSNO, "Y", $ec, "h", $f5, $d1, $f6, $f8, $b8, "c", "o", "l", $be, $b8, $ad, " ", "m", $d8, "e", ",", SCR::NEWLINE, $ad, " ", "6", "5", "5", "3", "5", " ", $b0, $fb, $bd, $c1, $c0, "h", "a", "v", "e", SCR::NEWLINE, $a9, "e", $f6, $c0, "a", "b", $cc, "l", "u", $eb, $d2, $f9, $d6, "e", "v", $ed, "y", SCR::NEWLINE, "s", $b1, "l", $e7, $ac, " ", $a5, " ", $cb, $e5, "l", "f", ".", SCR::NEWLINE, "T", "o", "t", $ad, "y", "."
; <0 NOVA_AW>What? Kieran told me that it was really important. Please?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_AW, "W", "h", $c6, "?", " ", "K", $e3, "r", $ca, " ", $bc, $ef, " ", $d0, " ", $9a, "i", "t", SCR::NEWLINE, "w", $c4, " ", "r", $ec, "l", $d2, "i", "m", "p", $c9, "t", $ca, "t", $f6, "P", "l", $ec, $e5, "?"
; <1 MOLSNO>No. Fight me! I'll throw all these empty cans at you.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::MOLSNO, "N", "o", $f6, "F", "i", $db, $d3, $d0, $fd, $d5, " ", $e0, "r", "o", "w", " ", $ad, SCR::NEWLINE, $89, "e", "m", "p", "t", $fe, $b0, $fb, $c6, " ", $a6, "."
; <0 NOVA_SILLY>Haha, okay.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_SILLY, "H", "a", "h", "a", $f5, "o", "k", "a", "y", "."
.byt SCR::END_SCRIPT
MolSnoAfterFight:
.byt SCR::SCENE, SCENES::NOVA_AND_MOLSNO
; <1 MOLSNO>Okay, sure, I guess you can have some cola.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::MOLSNO, "O", "k", "a", "y", $f5, "s", "u", "r", "e", $f5, $c0, "g", "u", "e", $f1, " ", $a6, " ", $b0, SCR::NEWLINE, $9b, $9c, " ", "c", "o", "l", "a", "."
; <0 NOVA>Thank you. Don't be so unreasonable next time!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, $f8, $ca, "k", " ", $a6, $f6, "D", $c2, $e8, $ba, $cc, SCR::NEWLINE, $f2, "r", $ec, $cc, "n", "a", "b", "l", $e7, $f9, "x", $d3, "t", "i", $d0, "!"
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
; []Nova hops onto the spaceship and it takes off! It flies a pretty long distance, but eventually gets hit by a stray glider... causing the ship to disintegrate and causing the squirrel to fall into a rather strange place.
.byt SCR::NARRATE, CHAR::NONE, $a1, " ", "h", "o", "p", $fb, $c2, $bb, $a2, SCR::NEWLINE, $dd, "a", "c", "e", $df, "i", "p", " ", $a4, $c1, $90, $fb, "o", "f", "f", $fd, "I", "t", SCR::NEWLINE, "f", "l", $e3, $fb, $be, "p", "r", "e", "t", "t", $fe, "l", $c2, "g", " ", "d", $b9, "t", $ca, "c", "e", ",", SCR::NEWLINE, $a7, " ", $9f, "t", "u", $ad, $fe, $af, $fb, "h", $c1, "b", $fe, "a", SCR::NEWLINE, $de, "r", "a", $fe, "g", "l", "i", "d", $ed, ".", ".", $f6, "c", "a", "u", "s", $b1, " ", $a2, SCR::NEWLINE, $df, "i", "p", " ", $bb, "d", $b9, $d8, $eb, "g", "r", $c6, $e7, $ca, "d", SCR::NEWLINE, "c", "a", "u", "s", $b1, " ", $a2, " ", $80, " ", $bb, "f", $ad, SCR::NEWLINE, $d8, $bb, $be, "r", $c6, $a9, " ", $de, "r", $ca, "g", $e7, "p", "l", "a", "c", "e", "."
.byt SCR::SCENE, SCENES::NOVA_ALONE
; >0 NOVA_STRAIGHT<Aaaaa, okay this isn't the headquarters. Ugh, I'll go post on the forums, and see if I can find out where I am.
.byt SCR::THINK, SCR::SPEAKER_0|CHAR::NOVA_STRAIGHT, "A", "a", "a", "a", "a", $f5, "o", "k", "a", $fe, $99, " ", $b9, "n", $e8, $a2, SCR::NEWLINE, $c3, $f7, "q", "u", "a", $ee, $ed, "s", $f6, "U", $db, $f5, $d5, " ", $cf, SCR::NEWLINE, "p", "o", $de, " ", $c2, " ", $a2, " ", $a5, "u", "m", "s", $f5, $a4, $b3, SCR::NEWLINE, $ce, " ", $c0, $b0, " ", "f", $d8, $ff, $ae, " ", $da, $ed, $e7, $c0, "a", "m", "."
; []-halp I've been taken-
.byt SCR::NARRATE, CHAR::NONE, $86
.byt SCR::SCENE, SCENES::FORUMS
; [NOVA_MAD]The ship I was taking into the Scheme Team's headquarters broke. Now I'm stranded in some weird place.
.byt SCR::NARRATE, CHAR::NOVA_MAD, $f8, $e7, $df, "i", "p", " ", $c0, "w", $c4, " ", "t", "a", "k", $b1, " ", $d8, $bb, $a2, SCR::NEWLINE, "S", $e2, "e", $d0, " ", "T", $ec, "m", $e9, $c3, $f7, "q", "u", "a", $ee, $ed, "s", SCR::NEWLINE, "b", "r", "o", "k", "e", $f6, "N", "o", "w", " ", $d4, $de, "r", $ca, "d", $d6, $d8, SCR::NEWLINE, $9c, " ", $c8, "i", "r", $ff, "p", "l", "a", "c", "e", "."
; [SHERWIN]WHAT? Well, hopefully you can get to Atomic Videoclip Zone soon! The Scheme Team are doing some really strange things.
.byt SCR::NARRATE, CHAR::SHERWIN, "W", "H", "A", "T", "?", " ", "W", "e", "l", "l", $f5, "h", "o", "p", "e", "f", "u", "l", $d2, $a6, SCR::NEWLINE, $b0, " ", $af, " ", $bb, "A", $bc, "m", "i", "c", " ", "V", "i", "d", "e", "o", "c", "l", "i", "p", SCR::NEWLINE, "Z", $ac, " ", $cc, $c2, $fd, $f8, $e7, "S", $e2, "e", $d0, " ", "T", $ec, "m", SCR::NEWLINE, "a", "r", $e7, $c5, $b1, " ", $9c, " ", "r", $ec, "l", $d2, $de, "r", $ca, "g", "e", SCR::NEWLINE, $e0, $b1, "s", "."
; [SHERWIN]They have one of those spinner things that make animal noises, but I think it's some sort of secret doomsday device. OR maybe they're just trying to throw us off. That sounds likely too.
.byt SCR::NARRATE, CHAR::SHERWIN, $f8, "e", $fe, $9b, $ac, " ", $bd, $e0, "o", $e5, SCR::NEWLINE, $dd, $d8, $f9, $ea, $e0, $b1, $fb, $9a, "m", "a", "k", "e", SCR::NEWLINE, $ca, "i", "m", "a", "l", " ", $d1, $b9, "e", "s", $f5, $a7, " ", $c0, $82, " ", "i", "t", "'", "s", SCR::NEWLINE, $9c, " ", $cc, $ee, " ", $bd, $e5, "c", "r", "e", "t", SCR::NEWLINE, $c5, "o", "m", "s", "d", "a", $fe, "d", "e", "v", "i", "c", "e", $f6, "O", "R", " ", "m", "a", "y", "b", "e", SCR::NEWLINE, $98, "'", "r", $e7, $8e, $fa, "y", $b1, " ", $bb, $e0, "r", "o", "w", SCR::NEWLINE, "u", $fb, "o", "f", "f", $f6, $f8, $c6, " ", $cc, $f2, "d", $fb, $8d, "l", "y", SCR::NEWLINE, $bc, "o", "."
; [KIERAN]Are you hurt from the fall, Nova?
.byt SCR::NARRATE, CHAR::KIERAN, "A", "r", $e7, $a6, " ", "h", "u", $ee, " ", $97, $a2, " ", "f", $ad, ",", SCR::NEWLINE, $a1, "?"
; [NOVA]Nah, but now I need to find a way out. The landscape here is really strange.
.byt SCR::NARRATE, CHAR::NOVA, "N", "a", "h", $f5, $a7, " ", $b4, " ", $c0, $f9, $d6, $bb, "f", $d8, $ff, "a", SCR::NEWLINE, $b7, " ", $ae, $f6, $f8, $e7, "l", $ca, "d", "s", "c", "a", "p", $e7, $a9, "e", SCR::NEWLINE, $b8, "r", $ec, "l", $d2, $de, "r", $ca, "g", "e", "."
; [KIERAN]Uh oh, that's probably the World of Insanity. Yeahhh, you'll want to get out of there as soon as you can.
.byt SCR::NARRATE, CHAR::KIERAN, "U", "h", " ", "o", "h", $f5, $e0, $c6, $e9, "p", "r", "o", "b", "a", "b", $d2, $a2, SCR::NEWLINE, "W", $c9, $ef, " ", $bd, "I", "n", "s", $ca, "i", "t", "y", $f6, "Y", $ec, "h", "h", "h", ",", SCR::NEWLINE, $a6, "'", "l", "l", " ", "w", $ca, $d3, $bb, $af, " ", $ae, " ", "o", "f", SCR::NEWLINE, $88, " ", $c4, " ", $cc, $c2, " ", $c4, " ", $a6, " ", $b0, "."
; [LIA]Ohhh, sorry Nova! I didn't actually fully test it first, I was so eager to help...
.byt SCR::NARRATE, CHAR::LIA, "O", "h", "h", "h", $f5, $cc, $d9, $fe, $a1, $fd, $c0, "d", "i", "d", "n", "'", "t", SCR::NEWLINE, "a", $c7, "u", $ad, $fe, "f", "u", "l", $d2, $eb, $de, " ", $c1, "f", "i", "r", $de, $f5, "I", SCR::NEWLINE, "w", $c4, " ", $cc, " ", $ec, "g", $ed, " ", $bb, $c3, "l", "p", ".", ".", "."
; [NOVA]It's okay, and hopefully I find someone who can give me a ride.
.byt SCR::NARRATE, CHAR::NOVA, "I", "t", $e9, "o", "k", "a", "y", $f5, $a4, "h", "o", "p", "e", "f", "u", "l", $d2, $c0, "f", $d8, "d", SCR::NEWLINE, $9c, $ac, " ", $da, "o", " ", $b0, " ", "g", "i", "v", $e7, $d0, " ", "a", SCR::NEWLINE, $fc, "d", "e", "."
.byt SCR::END_SCRIPT
SmiloidAtWOI:
.byt SCR::SCENE, SCENES::NOVA_AND_SMILOID
; <2 S_TEAM>We made the Smiloids better and stronger and now we're pretty sure we'll win.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::S_TEAM, "W", $e7, "m", $f7, $e7, $a2, " ", "S", "m", $dc, "o", "i", "d", $fb, "b", "e", "t", $eb, "r", SCR::NEWLINE, $a4, $de, "r", $c2, "g", $ed, " ", $a4, $b4, " ", $c8, "'", "r", "e", SCR::NEWLINE, "p", "r", "e", "t", "t", $fe, "s", "u", "r", $e7, $c8, "'", "l", "l", " ", "w", $d8, "."
; <1 SMILOID>Have a nice day! Or maybe a bad one hahaha.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SMILOID, "H", "a", "v", $e7, $be, "n", "i", "c", $e7, "d", "a", "y", $fd, "O", $ea, "m", "a", "y", $ba, "a", SCR::NEWLINE, "b", $f7, " ", $ac, " ", "h", "a", "h", "a", "h", "a", "."
; <0 NOVA>Nope, you're not going to stop this squirrelll
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "N", "o", "p", "e", $f5, $a6, "'", "r", $e7, $a3, " ", $cf, $b1, " ", $bc, SCR::NEWLINE, $de, "o", "p", " ", $99, " ", $80, "l", "l"
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
; []Kieran also shows up.
.byt SCR::NARRATE, CHAR::NONE, "K", $e3, "r", $ca, " ", "a", "l", $cc, " ", $df, "o", "w", $fb, $cd, "."
.byt SCR::SCENE, SCENES::NOVA_SHERWIN_KIERAN
; <2 KIERAN>Wow Nova, Caffie will be eternally grateful.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::KIERAN, "W", "o", "w", " ", $a1, $f5, $84, " ", $9e, " ", "b", "e", SCR::NEWLINE, "e", $eb, "r", "n", $ad, $fe, "g", "r", $c6, "e", "f", "u", "l", "."
; <0 NOVA_YAY>It feels really good to get to be the hero.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_YAY, "I", $d3, "f", $d7, "l", $fb, "r", $ec, "l", $d2, $cf, "o", $ff, $bb, $af, " ", $bc, SCR::NEWLINE, $ba, $a2, " ", $a9, "o", "."
; <2 KIERAN>So, are you ready to go home?
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::KIERAN, "S", "o", $f5, "a", "r", $e7, $a6, " ", "r", $ec, "d", $fe, $bb, $cf, SCR::NEWLINE, "h", "o", $d0, "?"
; <0 NOVA>I'm actually unsure, I've got friends here and all...
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, $d4, "a", $c7, "u", $ad, $fe, $f2, "s", "u", "r", "e", $f5, "I", "'", "v", $e7, $cf, "t", SCR::NEWLINE, "f", $fc, $e6, "d", $fb, $a9, $e7, $a4, $ad, ".", ".", "."
; <2 KIERAN>You're very popular with Caffie residents. Actually, one of them said he'd grant you a free wish... I think his name was Jafguar?
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::KIERAN, "Y", $f4, "'", "r", $e7, "v", $ed, $fe, "p", "o", "p", "u", "l", "a", $ea, $9d, SCR::NEWLINE, $84, " ", "r", "e", "s", "i", "d", $e6, "t", "s", $f6, "A", $c7, "u", $ad, "y", ",", SCR::NEWLINE, $ac, " ", $bd, $92, " ", "s", "a", "i", $ff, $c3, "'", $ff, "g", "r", $ca, "t", SCR::NEWLINE, $a6, " ", $be, "f", "r", $d7, " ", "w", $b9, "h", ".", ".", $f6, $c0, $82, " ", "h", $b9, SCR::NEWLINE, "n", "a", $d0, " ", "w", $c4, " ", "J", "a", "f", "g", "u", "a", "r", "?"
; <0 NOVA_AW>Not interested in any of his "butt wishes".
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_AW, "N", "o", $d3, $d8, $eb, "r", "e", $de, $d6, $bf, $ab, " ", $bd, "h", $b9, SCR::NEWLINE, '"', $a7, $d3, "w", $b9, $c3, "s", '"', "."
; <2 KIERAN>Uh, what? Regular ones! What's something you'd really really like?
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::KIERAN, "U", "h", $f5, $8b, "?", " ", "R", "e", "g", "u", "l", "a", $ea, $ac, "s", "!", SCR::NEWLINE, "W", "h", $c6, $e9, $9c, $e0, $b1, " ", $a6, "'", $ff, "r", $ec, "l", "l", "y", SCR::NEWLINE, "r", $ec, "l", $d2, $8d, "?"
; <0 NOVA>Hmm, I think I know...
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "H", "m", "m", $f5, $c0, $82, " ", $c0, $8f, ".", ".", "."
.byt SCR::TRANSITION
.byt SCR::SCENE, SCENES::NOTHING
; []-Epilogue-
.byt SCR::NARRATE, CHAR::NONE, "-", "E", "p", $dc, "o", "g", "u", "e", "-"
; Nova, with the help of a wish, went on to found the kingdom of Toasterland as a nation of cute animals like herself, ruling as its princess. She decided her friends needed a place to live that didn't have monsters running around everywhere. Sherwin made a second home there, and a lot of cuties decided to move there.
.byt SCR::NEWLINE, $a1, $f5, $9d, " ", $a2, " ", $c3, "l", "p", " ", $bd, $be, "w", $b9, "h", ",", SCR::NEWLINE, $c8, $e1, " ", $c2, " ", $bb, "f", $f4, $f0, " ", $a2, " ", "k", $b1, $c5, "m", SCR::NEWLINE, $bd, "T", "o", $c4, $eb, "r", "l", $a4, $c4, " ", $be, "n", $c6, "i", $c2, " ", "o", "f", SCR::NEWLINE, "c", "u", $eb, " ", $ca, "i", "m", "a", "l", $fb, $8d, " ", $a9, $e5, "l", "f", ",", SCR::NEWLINE, "r", "u", "l", $b1, " ", $c4, " ", "i", "t", $fb, "p", $fc, "n", "c", "e", $f1, $f6, "S", $c3, SCR::NEWLINE, "d", "e", "c", "i", "d", $d6, $a9, " ", "f", $fc, $e6, "d", $fb, $f9, "e", "d", $d6, "a", SCR::NEWLINE, "p", "l", "a", "c", $e7, $bb, "l", "i", "v", $e7, $9a, "d", "i", "d", "n", $e8, "h", "a", "v", "e", SCR::NEWLINE, "m", $c2, $de, $ed, $fb, "r", $f2, "n", $b1, " ", "a", "r", $f4, $f0, SCR::NEWLINE, "e", "v", $ed, "y", $da, $ed, "e", $f6, "S", $a9, "w", $bf, "m", $f7, $e7, "a", SCR::NEWLINE, $e5, "c", $c2, $ff, "h", "o", $d0, " ", $88, $f5, $a4, $be, "l", "o", "t", SCR::NEWLINE, $bd, "c", "u", "t", $e3, $fb, "d", "e", "c", "i", "d", $d6, $bb, "m", "o", "v", "e", SCR::NEWLINE, $88, "."
.byt SCR::END_SCRIPT

WaterAbout:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>You can swim in the water. Use Up/Down to change your height.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "Y", $f4, " ", $b0, " ", "s", "w", "i", "m", " ", $bf, $a2, " ", "w", $c6, $ed, ".", SCR::NEWLINE, "U", $e5, " ", "U", "p", "/", "D", "o", "w", "n", " ", $bb, $e2, $ca, "g", $e7, $91, SCR::NEWLINE, $c3, "i", $db, "t", "."
.byt SCR::END_SCRIPT
SignBummerAbout:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>Welcome to Bummer Club! This place is a giant puzzle clubhouse and if you're clever enough to reach the end there is a fabulous prize waiting for you! These puzzle levels may assign you a specific ability to use or certain items to use, and many of them require using items or abilities on the environment.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "W", "e", "l", $96, " ", $bb, "B", "u", "m", $d0, $ea, "C", "l", "u", "b", "!", SCR::NEWLINE, $f8, $b8, "p", "l", "a", "c", $e7, $b8, $be, "g", "i", $ca, $d3, "p", "u", "z", "z", "l", "e", SCR::NEWLINE, "c", "l", "u", "b", "h", $f4, $e5, " ", $a4, $ce, " ", $a6, "'", "r", "e", SCR::NEWLINE, "c", "l", "e", "v", $ed, " ", $e6, $f4, $db, " ", $bb, "r", $ec, $e2, " ", $a2, SCR::NEWLINE, $e6, $ff, $88, " ", $b8, $be, "f", "a", "b", "u", "l", $f4, $fb, "p", $fc, "z", "e", SCR::NEWLINE, "w", "a", "i", "t", $b1, " ", $a5, " ", $a6, $fd, $f8, "e", $e5, " ", "p", "u", "z", "z", "l", "e", SCR::NEWLINE, "l", "e", "v", "e", "l", $fb, "m", "a", $fe, $c4, "s", "i", "g", "n", " ", $a6, " ", "a", SCR::NEWLINE, $dd, "e", "c", $ce, "i", "c", " ", "a", "b", $dc, "i", "t", $fe, $bb, "u", $e5, " ", $c9, SCR::NEWLINE, "c", $ed, "t", "a", $bf, "i", $eb, "m", $fb, $bb, "u", $e5, $f5, $ca, "d", SCR::NEWLINE, "m", $ab, " ", $bd, $92, " ", "r", "e", "q", "u", "i", "r", $e7, "u", "s", $b1, SCR::NEWLINE, "i", $eb, "m", $fb, $c9, " ", "a", "b", $dc, "i", "t", $e3, $fb, $c2, " ", $a2, SCR::NEWLINE, $e6, "v", "i", "r", $c2, $d0, $e1, "."
.byt SCR::END_SCRIPT
SignChipAbout:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>If you see computer chips in a level that means that you need to collect all or most of them to finish the level.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "I", "f", " ", $a6, " ", $b3, " ", "c", "o", "m", "p", "u", $eb, $ea, $e2, "i", "p", $fb, $bf, "a", SCR::NEWLINE, "l", "e", "v", "e", "l", " ", $9a, $d0, $ca, $fb, $9a, $a6, SCR::NEWLINE, $f9, $d6, $bb, "c", "o", "l", "l", "e", $c7, " ", $ad, " ", $c9, " ", "m", "o", $de, " ", "o", "f", SCR::NEWLINE, $92, " ", $bb, "f", $d8, $b9, "h", " ", $a2, " ", "l", "e", "v", "e", "l", "."
.byt SCR::END_SCRIPT
SignBootsAbout:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>In puzzle levels, water is deadly, unless you get blue boots (flippers) first. Red boots protect you from fire, green boots let you get past green forcefields, and gray boots let you walk on ice without sliding.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "I", "n", " ", "p", "u", "z", "z", "l", $e7, "l", "e", "v", "e", "l", "s", $f5, "w", $c6, $ed, " ", $b9, SCR::NEWLINE, "d", $ec, "d", "l", "y", $f5, $f2, "l", "e", $f1, " ", $a6, " ", $af, " ", "b", "l", "u", "e", SCR::NEWLINE, "b", $e4, "t", $fb, "(", "f", "l", "i", "p", "p", $ed, "s", ")", " ", "f", "i", "r", $de, $f6, "R", "e", "d", SCR::NEWLINE, "b", $e4, "t", $fb, "p", "r", "o", $eb, $c7, " ", $a6, " ", $97, "f", "i", "r", "e", ",", SCR::NEWLINE, "g", "r", $d7, "n", " ", "b", $e4, "t", $fb, $a8, " ", $a6, " ", $af, " ", "p", $c4, "t", SCR::NEWLINE, "g", "r", $d7, "n", " ", $a5, "c", "e", "f", $e3, $ef, "s", $f5, $a4, "g", "r", "a", "y", SCR::NEWLINE, "b", $e4, "t", $fb, $a8, " ", $a6, " ", "w", "a", "l", "k", " ", $c2, " ", "i", "c", "e", SCR::NEWLINE, $9d, $ae, " ", "s", "l", "i", "d", $b1, "."
.byt SCR::END_SCRIPT
SignMeltIceAbout:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>Try throwing a fireball at this ice. If you killed the fire enemy, walk away and come back.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "T", "r", $fe, $e0, "r", "o", "w", $b1, " ", $be, "f", "i", "r", "e", "b", $ad, " ", $c6, " ", $99, SCR::NEWLINE, "i", "c", "e", $f6, "I", "f", " ", $a6, " ", "k", $dc, "l", $d6, $a2, " ", "f", "i", "r", "e", SCR::NEWLINE, $e6, "e", $cb, $f5, "w", "a", "l", "k", " ", "a", $b7, " ", $a4, $96, SCR::NEWLINE, "b", "a", $f3, "."
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
NoFlippers:
.byt SCR::SCENE, SCENES::NOTHING
; []Ooooops! Nova can't swim without flippers!!!
.byt SCR::NARRATE, CHAR::NONE, "O", $e4, $e4, "p", "s", $fd, $a1, " ", $b0, $e8, "s", "w", "i", "m", SCR::NEWLINE, $9d, $ae, " ", "f", "l", "i", "p", "p", $ed, "s", "!", "!", "!"
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

CutsceneDictionary:
.byt "squirre", 'l'|128
.byt "proble", 'm'|128
.byt "thin", 'k'|128
.byt "afte", 'r'|128
.byt "Caffi", 'e'|128
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
