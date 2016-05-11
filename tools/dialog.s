Intro:
.byt SCR::SCENE, SCENES::NOVA_AND_KEE
; <0 NOVA_WOW>Wow, where are we? This doesn't look like the same forest...
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_WOW, "W", "o", "w", $f5, $da, $ed, $e7, "a", "r", $e7, $c8, "?", " ", $f8, $b9, SCR::NEWLINE, $c5, "e", "s", "n", $e8, $95, " ", $8d, " ", $a2, " ", "s", "a", $d0, SCR::NEWLINE, $a5, "e", $de, ".", ".", "."
; <1 KEE>Not sure. Not sure why you're suddenly a lot taller either, and... green?
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::KEE, "N", "o", $d3, "s", "u", "r", "e", $f6, "N", "o", $d3, "s", "u", "r", $e7, $da, $fe, $a6, "'", "r", "e", SCR::NEWLINE, "s", "u", "d", "d", $e6, $d2, $be, "l", "o", $d3, "t", $ad, $ed, " ", "e", "i", $a2, "r", ",", SCR::NEWLINE, $ca, "d", ".", ".", $f6, "g", "r", $d7, "n", "?"
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
; <1 SIGN>Some enemies can have their abilities copied. Try stunning this enemy with B and then press Up+B while facing it to copy its ability. Press Down+Select to reset.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "S", "o", $d0, " ", $e6, "e", "m", $e3, $fb, $b0, " ", $9b, $a2, "i", "r", SCR::NEWLINE, "a", "b", $dc, "i", "t", $e3, $fb, "c", "o", "p", $e3, "d", $f6, "T", "r", $fe, $de, $f2, "n", $b1, SCR::NEWLINE, $99, " ", $e6, "e", $cb, " ", $9d, " ", "B", " ", $a4, $94, SCR::NEWLINE, "p", "r", "e", $f1, " ", "U", "p", "+", "B", " ", $da, $dc, $e7, "f", "a", "c", $b1, " ", $c1, $bc, SCR::NEWLINE, "c", "o", "p", $fe, "i", "t", $fb, "a", "b", $dc, "i", "t", "y", $f6, "P", "r", "e", $f1, SCR::NEWLINE, "D", "o", "w", "n", "+", "S", "e", "l", "e", $c7, " ", $bb, "r", "e", $e5, "t", "."
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
; <1 SIGN>That should be everything you need to get started. Keep heading forward until you get to Bummer Club. Good Luck!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, $f8, $c6, " ", $df, $a0, " ", $ba, "e", "v", $ed, "y", $e0, $b1, SCR::NEWLINE, $a6, " ", $f9, $d6, $bb, $af, " ", $de, "a", $ee, "e", "d", ".", SCR::NEWLINE, "K", $d7, "p", " ", $c3, $f7, $b1, " ", $a5, "w", "a", "r", $ff, $f2, "t", $dc, SCR::NEWLINE, $a6, " ", $af, " ", $bb, "B", "u", "m", $d0, $ea, "C", "l", "u", "b", $f6, "G", $e4, "d", SCR::NEWLINE, "L", "u", $f3, "!"
; <0 NOVA>Okay then! Still dunno what I'm doing here.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "O", "k", "a", $fe, $94, $fd, "S", "t", $dc, "l", " ", "d", $f2, $d1, " ", $8b, SCR::NEWLINE, $d4, $c5, $b1, " ", $a9, "e", "."
; <2 KEE>*I'm* going to go back and explore some more. I think I saw a hut back there.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::KEE, "*", "I", "'", "m", "*", " ", $cf, $b1, " ", $bb, $cf, " ", "b", "a", $f3, " ", $ca, "d", SCR::NEWLINE, "e", "x", "p", "l", $c9, $e7, $9c, " ", "m", $c9, "e", $f6, $c0, $82, " ", "I", SCR::NEWLINE, "s", "a", "w", " ", $be, "h", "u", $d3, "b", "a", $f3, " ", $88, "."
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

.byt SCR::SCENE, SCENES::TWO_BAD_GUYS
; <0 S_TEAM>Ouch. We're going to have to do something about that squirrel, because she could take our entire operation down if she found out. We need to tell the boss.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::S_TEAM, "O", "u", $e2, $f6, "W", "e", "'", "r", $e7, $cf, $b1, " ", $bb, $9b, $bc, SCR::NEWLINE, $c5, " ", $9c, $e0, $b1, " ", $8a, $e0, $c6, SCR::NEWLINE, $80, $f5, "b", "e", "c", "a", "u", $e5, " ", $aa, " ", "c", $a0, SCR::NEWLINE, $90, " ", $b6, " ", $e6, "t", "i", "r", $e7, "o", "p", $ed, $c6, "i", $c2, SCR::NEWLINE, $c5, "w", "n", " ", $ce, " ", $aa, " ", "f", $f4, $f0, " ", $ae, $f6, "W", "e", SCR::NEWLINE, $f9, $d6, $bb, $eb, "l", "l", " ", $a2, " ", "b", "o", $f1, "."
.byt SCR::TRANSITION
.byt SCR::SCENE, SCENES::BAD_GUYS_AND_LEADER
; <0 S_TEAM>Hey Bill???
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::S_TEAM, "H", "e", $fe, "B", $dc, "l", "?", "?", "?"
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
; <0 NOVA>Oh yeah, I heard I would be needed around here!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "O", "h", " ", "y", $ec, "h", $f5, $c0, $c3, "a", "r", $ff, $c0, "w", $a0, " ", "b", "e", SCR::NEWLINE, $f9, "e", "d", $d6, "a", "r", $f4, $f0, " ", $a9, "e", "!"
; <1 KIERAN>Anyway, those robot guys you fought? They're members of the Scheme Team, a big group of bad guys that seems intent on taking over the world or destroying it or whatever. I don't even know. We arrested them after they tried last time and now they're back at it. Will you help?
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::KIERAN, "A", "n", "y", $b7, $f5, $e0, "o", $e5, " ", "r", "o", "b", "o", $d3, "g", "u", "y", "s", SCR::NEWLINE, $a6, " ", "f", $f4, $db, "t", "?", " ", $f8, "e", "y", "'", "r", $e7, $d0, "m", "b", $ed, "s", SCR::NEWLINE, $bd, $a2, " ", "S", $e2, "e", $d0, " ", "T", $ec, "m", $f5, $be, "b", "i", "g", SCR::NEWLINE, "g", "r", $f4, "p", " ", $bd, "b", $f7, " ", "g", "u", "y", $fb, $9a, $b3, "m", "s", SCR::NEWLINE, $d8, $eb, $e1, " ", $c2, " ", "t", "a", "k", $b1, " ", $8c, " ", $a2, SCR::NEWLINE, "w", $c9, $ef, " ", $c9, " ", "d", "e", $de, "r", "o", "y", $b1, " ", $c1, $c9, SCR::NEWLINE, $8b, "e", "v", $ed, $f6, $c0, $c5, "n", $e8, $9f, " ", $8f, ".", SCR::NEWLINE, "W", $e7, "a", $d9, "e", $de, $d6, $92, " ", $83, " ", $98, SCR::NEWLINE, $fa, $e3, $ff, "l", $c4, $d3, "t", "i", $d0, " ", $a4, $b4, SCR::NEWLINE, $98, "'", "r", $e7, "b", "a", $f3, " ", $c6, " ", "i", "t", $f6, "W", $dc, "l", " ", $a6, SCR::NEWLINE, $c3, "l", "p", "?"
; <0 NOVA>Yeah, of course!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "Y", $ec, "h", $f5, $bd, "c", $b6, $e5, "!"
; <1 KIERAN>Great. This place has its own forum, and we're keeping track of the situation on there. You should go look.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::KIERAN, "G", "r", $ec, "t", $f6, $f8, $b8, "p", "l", "a", "c", $e7, "h", $c4, " ", "i", "t", $fb, "o", "w", "n", SCR::NEWLINE, $a5, "u", "m", $f5, $a4, $c8, "'", "r", $e7, "k", $d7, "p", $b1, SCR::NEWLINE, $fa, "a", $f3, " ", $bd, $a2, " ", "s", "i", "t", "u", $c6, "i", $c2, " ", $c2, SCR::NEWLINE, $88, $f6, "Y", $f4, " ", $df, $a0, " ", $cf, " ", $95, "."
; <0 NOVA>Alright. I'll go register.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "A", "l", $fc, $db, "t", $f6, $d5, " ", $cf, " ", "r", "e", "g", $b9, $eb, "r", "."
; <1 KIERAN>In the meantime you should focus on getting ready for facing off against the Scheme Team while we still have time. This place, Bummer Club, is a big puzzle challenge and there's a prize waiting at the end which should help give you the advantage.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::KIERAN, "I", "n", " ", $a2, " ", $d0, $ca, "t", "i", $d0, " ", $a6, " ", $df, $a0, SCR::NEWLINE, "f", "o", "c", "u", $fb, $c2, " ", $af, "t", $b1, " ", "r", $ec, "d", $fe, $a5, SCR::NEWLINE, "f", "a", "c", $b1, " ", "o", "f", "f", " ", "a", "g", "a", $d8, $de, " ", $a2, SCR::NEWLINE, "S", $e2, "e", $d0, " ", "T", $ec, "m", " ", $da, $dc, $e7, $c8, " ", $de, $dc, "l", SCR::NEWLINE, $9b, "t", "i", $d0, $f6, $f8, $b8, "p", "l", "a", "c", "e", $f5, "B", "u", "m", $d0, "r", SCR::NEWLINE, "C", "l", "u", "b", $f5, $b8, $be, "b", "i", "g", " ", "p", "u", "z", "z", "l", "e", SCR::NEWLINE, $e2, $ad, $e6, "g", $e7, $a4, $88, $e9, $be, "p", $fc, "z", "e", SCR::NEWLINE, "w", "a", "i", "t", $b1, " ", $c6, " ", $a2, " ", $e6, $ff, $da, "i", $e2, SCR::NEWLINE, $df, $a0, " ", $c3, "l", "p", " ", "g", "i", "v", $e7, $a6, " ", $a2, SCR::NEWLINE, $f7, "v", $ca, "t", "a", "g", "e", "."
; <0 NOVA>Oh, okay.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "O", "h", $f5, "o", "k", "a", "y", "."
.byt SCR::END_SCRIPT
SmiloidAtBummerClub:
.byt SCR::SCENE, SCENES::NOVA_AND_SMILOID
; <2 S_TEAM>Hey squirrel! Your adventure stops here!
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::S_TEAM, "H", "e", $fe, $80, $fd, "Y", $b6, " ", $f7, "v", $e6, "t", "u", "r", "e", SCR::NEWLINE, $de, "o", "p", $fb, $a9, "e", "!"
; <1 SMILOID>Have a nice day!!!! Prepare to die!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SMILOID, "H", "a", "v", $e7, $be, "n", "i", "c", $e7, "d", "a", "y", "!", "!", "!", $fd, "P", "r", "e", "p", "a", "r", $e7, $bc, SCR::NEWLINE, "d", $e3, "!"
; <0 NOVA_MAD>Uh, no! I'm still going to win.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_MAD, "U", "h", $f5, $d1, $fd, $d4, $de, $dc, "l", " ", $cf, $b1, " ", $bb, "w", $d8, "."
.byt SCR::END_SCRIPT
AfterSmiloidAtBummerClub:
.byt SCR::SCENE, SCENES::NOVA_AND_SMILOID
; <2 S_TEAM>Oh is that so? Then we'll just have to build a bigger and stronger model!!
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::S_TEAM, "O", "h", " ", $b8, $9a, $cc, "?", " ", $f8, $e6, " ", $c8, "'", "l", "l", " ", "j", "u", $de, SCR::NEWLINE, $9b, $bb, "b", "u", $dc, $ff, $be, "b", "i", "g", "g", $ed, " ", $ca, "d", SCR::NEWLINE, $de, "r", $c2, "g", $ed, " ", "m", "o", "d", "e", "l", "!", "!"
.byt SCR::END_SCRIPT
NovaAndEclipse:
.byt SCR::SCENE, SCENES::NOVA_AND_ECLIPSE
; <0 NOVA>Another squirrel!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "A", $a3, $a9, " ", $80, "!"
; <1 ECLIPSE>Oh wow. Hi, Nova! 
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::ECLIPSE, "O", "h", " ", "w", "o", "w", $f6, "H", "i", $f5, $a1, $fd
; <0 NOVA>You know me?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "Y", $f4, " ", $8f, " ", $d0, "?"
; <1 ECLIPSE>Yeah, I'm your long-lost sister, Eclipse. Anyway, the prize for completing Bummer Club is pretty rad. I'm awarding you some cool pants.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::ECLIPSE, "Y", $ec, "h", $f5, $d4, $91, " ", "l", $c2, "g", "-", "l", "o", $de, SCR::NEWLINE, "s", $b9, $eb, "r", $f5, "E", "c", "l", "i", "p", $e5, $f6, "A", "n", "y", $b7, $f5, $a2, SCR::NEWLINE, "p", $fc, "z", $e7, $a5, " ", "c", "o", "m", "p", $a8, $b1, " ", "B", "u", "m", $d0, "r", SCR::NEWLINE, "C", "l", "u", "b", " ", $b8, "p", "r", "e", "t", "t", $fe, "r", $f7, $f6, "I", "'", "m", SCR::NEWLINE, "a", "w", "a", "r", "d", $b1, " ", $a6, " ", $9c, " ", "c", $e4, "l", SCR::NEWLINE, "p", $ca, "t", "s", "."
; <0 NOVA_STRAIGHT>...What? 
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_STRAIGHT, ".", ".", ".", "W", "h", $c6, "?", " "
; <1 ECLIPSE>Specifically, Nuclear Power Pants. This pair will power up any explosions you make. I'm not making this up.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::ECLIPSE, "S", "p", "e", "c", $ce, "i", "c", $ad, "y", $f5, "N", "u", "c", "l", $ec, $ea, "P", "o", $c8, "r", SCR::NEWLINE, "P", $ca, "t", "s", $f6, $f8, $b8, "p", "a", "i", $ea, $9e, " ", "p", "o", $c8, $ea, $cd, SCR::NEWLINE, $ab, " ", "e", "x", "p", "l", "o", "s", "i", $c2, $fb, $a6, " ", "m", "a", "k", "e", $f6, "I", "'", "m", SCR::NEWLINE, $a3, " ", "m", "a", "k", $b1, " ", $99, " ", $cd, "."
; <0 NOVA>Alright, bigger explosions sound like they'll help. Thank you, Eclipse.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "A", "l", $fc, $db, "t", $f5, "b", "i", "g", "g", $ed, " ", "e", "x", "p", "l", "o", "s", "i", $c2, "s", SCR::NEWLINE, $cc, $f2, $ff, $8d, " ", $98, "'", "l", "l", " ", $c3, "l", "p", $f6, $f8, $ca, "k", SCR::NEWLINE, $a6, $f5, "E", "c", "l", "i", "p", $e5, "."
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
; <1 MOLSNO>No. Fight me!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::MOLSNO, "N", "o", $f6, "F", "i", $db, $d3, $d0, "!"
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
NovaAndRaoul:
.byt SCR::SCENE, SCENES::NOVA_AND_RAOUL
; <1 RAOUL>Hey, it's me, Raoul, I can get you to the Scheme Team's headquarters with this teleporter I made.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::RAOUL, "H", "e", "y", $f5, "i", "t", $e9, $d0, $f5, "R", "a", $f4, "l", $f5, $c0, $b0, " ", $af, SCR::NEWLINE, $a6, " ", $bb, $a2, " ", "S", $e2, "e", $d0, " ", "T", $ec, "m", "'", "s", SCR::NEWLINE, $c3, $f7, "q", "u", "a", $ee, $ed, $fb, $9d, " ", $99, SCR::NEWLINE, $eb, "l", "e", "p", $c9, $eb, $ea, $c0, "m", $f7, "e", "."
; <0 NOVA>Okay, k00l, that sounds way faster than walking all the way there!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "O", "k", "a", "y", $f5, "k", "0", "0", "l", $f5, $9a, $cc, $f2, "d", $fb, $b7, SCR::NEWLINE, "f", $c4, $eb, $ea, $93, " ", "w", "a", "l", "k", $b1, " ", $ad, " ", $a2, SCR::NEWLINE, $b7, " ", $88, "!"
.byt SCR::SCENE, SCENES::BAD_GUYS_AND_LEADER
.byt SCR::TRANSITION
; []A little while earlier
.byt SCR::NARRATE, CHAR::NONE, "A", " ", "l", "i", "t", "t", "l", $e7, $da, $dc, $e7, $ec, "r", "l", $e3, "r"
; <0 S_TEAM>Sooo some fox was going to give Nova a teleporter to get into our base. Obviously this isn't OK.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::S_TEAM, "S", $e4, "o", " ", $9c, " ", "f", "o", "x", " ", "w", $c4, " ", $cf, $b1, " ", $bc, SCR::NEWLINE, "g", "i", "v", $e7, $a1, " ", $be, $eb, "l", "e", "p", $c9, $eb, $ea, $bb, $af, SCR::NEWLINE, $d8, $bb, $b6, " ", "b", $c4, "e", $f6, "O", "b", "v", "i", $f4, "s", $d2, $99, SCR::NEWLINE, $b9, "n", $e8, "O", "K", "."
; <1 S_TEAM>We already took care of it though. We sabotaged it so it's actually going to teleport her to the World of Insanity.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::S_TEAM, "W", $e7, "a", "l", "r", $ec, "d", $fe, $bc, "o", "k", " ", "c", "a", "r", $e7, $bd, "i", "t", SCR::NEWLINE, $e0, $f4, $db, $f6, "W", $e7, "s", "a", "b", "o", "t", "a", "g", $d6, $c1, $cc, SCR::NEWLINE, "i", "t", $e9, "a", $c7, "u", $ad, $fe, $cf, $b1, " ", $bb, $eb, "l", "e", "p", $c9, "t", SCR::NEWLINE, $a9, " ", $bb, $a2, " ", "W", $c9, $ef, " ", $bd, "I", "n", "s", $ca, "i", "t", "y", "."
; <2 BILL>Haha yeah hopefully she won't survive there.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::BILL, "H", "a", "h", $be, "y", $ec, "h", " ", "h", "o", "p", "e", "f", "u", "l", $d2, $aa, SCR::NEWLINE, "w", $c2, $e8, "s", "u", "r", "v", "i", "v", $e7, $88, "."
.byt SCR::TRANSITION
.byt SCR::SCENE, SCENES::NOVA_AND_RAOUL
; <1 RAOUL>Alright, you ready? I'll go send you on your way then.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::RAOUL, "A", "l", $fc, $db, "t", $f5, $a6, " ", "r", $ec, "d", "y", "?", " ", $d5, " ", $cf, SCR::NEWLINE, $e5, $f0, " ", $a6, " ", $c2, " ", $91, " ", $b7, " ", $94, "."
; <0 NOVA>Okay, send me to the Scheme Team's headquarters.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "O", "k", "a", "y", $f5, $e5, $f0, " ", $d0, " ", $bb, $a2, " ", "S", $e2, "e", $d0, SCR::NEWLINE, "T", $ec, "m", $e9, $c3, $f7, "q", "u", "a", $ee, $ed, "s", "."
.byt SCR::TRANSITION
.byt SCR::SCENE, SCENES::NOVA_ALONE
; >0 NOVA_MAD<Okayyyy this is NOT the right place, dumb fox. Let's see if I can get out of here.
.byt SCR::THINK, SCR::SPEAKER_0|CHAR::NOVA_MAD, "O", "k", "a", "y", "y", "y", $fe, $99, " ", $b8, "N", "O", "T", " ", $a2, " ", $fc, $db, "t", SCR::NEWLINE, "p", "l", "a", "c", "e", $f5, "d", "u", "m", "b", " ", "f", "o", "x", $f6, "L", "e", "t", $e9, $b3, " ", $ce, " ", "I", SCR::NEWLINE, $b0, " ", $af, " ", $ae, " ", $bd, $a9, "e", "."
WrongPlace:
.byt SCR::SCENE, SCENES::FORUMS
; []-halp I've been taken-
.byt SCR::NARRATE, CHAR::NONE, $86
; [NOVA_MAD]Yeah I've been sent to the wrong place!!
.byt SCR::NARRATE, CHAR::NOVA_MAD, "Y", $ec, "h", " ", "I", "'", "v", $e7, "b", $d7, "n", " ", $e5, $e1, " ", $bb, $a2, SCR::NEWLINE, "w", "r", $c2, "g", " ", "p", "l", "a", "c", "e", "!", "!"
; [SHERWIN]WHAT? Well, hopefully you can get to Atomic Videoclip Zone soon! The Scheme Team are doing some really strange things.
.byt SCR::NARRATE, CHAR::SHERWIN, "W", "H", "A", "T", "?", " ", "W", "e", "l", "l", $f5, "h", "o", "p", "e", "f", "u", "l", $d2, $a6, SCR::NEWLINE, $b0, " ", $af, " ", $bb, "A", $bc, "m", "i", "c", " ", "V", "i", "d", "e", "o", "c", "l", "i", "p", SCR::NEWLINE, "Z", $ac, " ", $cc, $c2, $fd, $f8, $e7, "S", $e2, "e", $d0, " ", "T", $ec, "m", SCR::NEWLINE, "a", "r", $e7, $c5, $b1, " ", $9c, " ", "r", $ec, "l", $d2, $de, "r", $ca, "g", "e", SCR::NEWLINE, $e0, $b1, "s", "."
; [SHERWIN]They have one of those spinner things that make animal noises, but I think it's some sort of secret doomsday device. OR maybe they're just trying to throw us off. That sounds likely too.
.byt SCR::NARRATE, CHAR::SHERWIN, $f8, "e", $fe, $9b, $ac, " ", $bd, $e0, "o", $e5, SCR::NEWLINE, $dd, $d8, $f9, $ea, $e0, $b1, $fb, $9a, "m", "a", "k", "e", SCR::NEWLINE, $ca, "i", "m", "a", "l", " ", $d1, $b9, "e", "s", $f5, $a7, " ", $c0, $82, " ", "i", "t", "'", "s", SCR::NEWLINE, $9c, " ", $cc, $ee, " ", $bd, $e5, "c", "r", "e", "t", SCR::NEWLINE, $c5, "o", "m", "s", "d", "a", $fe, "d", "e", "v", "i", "c", "e", $f6, "O", "R", " ", "m", "a", "y", "b", "e", SCR::NEWLINE, $98, "'", "r", $e7, $8e, $fa, "y", $b1, " ", $bb, $e0, "r", "o", "w", SCR::NEWLINE, "u", $fb, "o", "f", "f", $f6, $f8, $c6, " ", $cc, $f2, "d", $fb, $8d, "l", "y", SCR::NEWLINE, $bc, "o", "."
; [NOVA]I'll try. Hopefully I find someone who can help.
.byt SCR::NARRATE, CHAR::NOVA, $d5, " ", $fa, "y", $f6, "H", "o", "p", "e", "f", "u", "l", $d2, $c0, "f", $d8, "d", SCR::NEWLINE, $9c, $ac, " ", $da, "o", " ", $b0, " ", $c3, "l", "p", "."
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
.byt SCR::TRANSITION
.byt SCR::SCENE, SCENES::NOVA_ALONE
; <0 NOVA>Okay, now this is the right place. Alright, Remy, wanna go with me to go save the world?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "O", "k", "a", "y", $f5, $b4, " ", $99, " ", $b8, $a2, " ", $fc, $db, "t", SCR::NEWLINE, "p", "l", "a", "c", "e", $f6, "A", "l", $fc, $db, "t", $f5, "R", "e", $cb, $f5, "w", $ca, "n", "a", SCR::NEWLINE, $cf, " ", $9d, " ", $d0, " ", $bb, $cf, " ", "s", "a", "v", $e7, $a2, SCR::NEWLINE, "w", $c9, $ef, "?"
; <0 NOVA_AW>... Remy?
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_AW, ".", ".", $f6, "R", "e", $cb, "?"
.byt SCR::SCENE, SCENES::NOVA_REMY_JAFGUAR
; <1 REMY>Oh, my bad, I juss met dis genie guy, an' he promised ta' grant "butt wishes" an' I dunno what he means, buuuut dat sounds more fun, so seeya!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::REMY, "O", "h", $f5, $cb, " ", "b", $f7, $f5, $c0, "j", "u", $f1, " ", $d0, $d3, "d", $b9, SCR::NEWLINE, "g", $e6, $e3, " ", "g", "u", "y", $f5, $ca, "'", " ", $c3, " ", "p", "r", "o", "m", $b9, $d6, "t", "a", "'", SCR::NEWLINE, "g", "r", $ca, $d3, '"', $a7, $d3, "w", $b9, $c3, "s", '"', " ", $ca, "'", " ", "I", SCR::NEWLINE, "d", $f2, $d1, " ", $8b, " ", $c3, " ", $d0, $ca, "s", $f5, "b", "u", "u", "u", "u", "t", SCR::NEWLINE, "d", $c6, " ", $cc, $f2, "d", $fb, "m", $c9, $e7, "f", $f2, $f5, $cc, SCR::NEWLINE, $b3, "y", "a", "!"
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
.byt SCR::SCENE, SCENES::NOVA_AND_BILL
; <1 BILL>So, you managed to get all the way here? Looks like I'm going to have to take you down myself!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::BILL, "S", "o", $f5, $a6, " ", "m", $ca, "a", "g", $d6, $bb, $af, " ", $ad, SCR::NEWLINE, $a2, " ", $b7, " ", $a9, "e", "?", " ", "L", $e4, "k", $fb, $8d, " ", "I", "'", "m", SCR::NEWLINE, $cf, $b1, " ", $bb, $9b, $bb, $90, " ", $a6, SCR::NEWLINE, $c5, "w", "n", " ", $cb, $e5, "l", "f", "!"
; <0 NOVA_MAD>Not a chance, giant floating head guy!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_MAD, "N", "o", $d3, $be, $e2, $ca, "c", "e", $f5, "g", "i", $ca, $d3, "f", "l", "o", $c6, $b1, SCR::NEWLINE, $c3, $f7, " ", "g", "u", "y", "!"
; <1 BILL>What did you just call me?? Time to die, squirrel!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::BILL, "W", "h", $c6, " ", "d", "i", $ff, $a6, " ", $8e, "c", $ad, " ", $d0, "?", "?", SCR::NEWLINE, "T", "i", $d0, " ", $bb, "d", $e3, $f5, $80, "!"
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
; <0 NOVA_YAY>Haha yeah. I'm the hero!~
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_YAY, "H", "a", "h", $be, "y", $ec, "h", $f6, $d4, $a2, " ", $a9, "o", "!", "~"
; <2 KIERAN>You're very popular with Caffie residents. One of them, Jafguar said he'd grant you one free wish...
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::KIERAN, "Y", $f4, "'", "r", $e7, "v", $ed, $fe, "p", "o", "p", "u", "l", "a", $ea, $9d, SCR::NEWLINE, $84, " ", "r", "e", "s", "i", "d", $e6, "t", "s", $f6, "O", $f9, " ", $bd, $92, ",", SCR::NEWLINE, "J", "a", "f", "g", "u", "a", $ea, "s", "a", "i", $ff, $c3, "'", $ff, "g", "r", $ca, $d3, $a6, SCR::NEWLINE, $ac, " ", "f", "r", $d7, " ", "w", $b9, "h", ".", ".", "."
; <0 NOVA_AW>Not interested in any of his "butt wishes".
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_AW, "N", "o", $d3, $d8, $eb, "r", "e", $de, $d6, $bf, $ab, " ", $bd, "h", $b9, SCR::NEWLINE, '"', $a7, $d3, "w", $b9, $c3, "s", '"', "."
; <2 KIERAN>Uh, no? Regular ones! Like, maybe you want to be a princess or something.
.byt SCR::SAY, SCR::SPEAKER_2|CHAR::KIERAN, "U", "h", $f5, $d1, "?", " ", "R", "e", "g", "u", "l", "a", $ea, $ac, "s", $fd, "L", "i", "k", "e", ",", SCR::NEWLINE, "m", "a", "y", $ba, $a6, " ", "w", $ca, $d3, $bb, $ba, "a", SCR::NEWLINE, "p", $fc, "n", "c", "e", $f1, " ", $c9, " ", $9c, $e0, $b1, "."
; <0 NOVA_WOW>Oh my goodness, I totally might.
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA_WOW, "O", "h", " ", $cb, " ", $cf, "o", "d", $f9, $f1, $f5, $c0, $bc, "t", $ad, "y", SCR::NEWLINE, "m", "i", $db, "t", "."
.byt SCR::TRANSITION
.byt SCR::SCENE, SCENES::NOTHING
; []-Epilogue-
.byt SCR::NARRATE, CHAR::NONE, "-", "E", "p", $dc, "o", "g", "u", "e", "-"
; Nova, with the help of a wish, went on to found the kingdom of Toasterland as a nation of cute animals like herself. Sherwin made a second home there, and a lot of cuties just decided to move there.
.byt SCR::NEWLINE, $a1, $f5, $9d, " ", $a2, " ", $c3, "l", "p", " ", $bd, $be, "w", $b9, "h", ",", SCR::NEWLINE, $c8, $e1, " ", $c2, " ", $bb, "f", $f4, $f0, " ", $a2, " ", "k", $b1, $c5, "m", SCR::NEWLINE, $bd, "T", "o", $c4, $eb, "r", "l", $a4, $c4, " ", $be, "n", $c6, "i", $c2, " ", "o", "f", SCR::NEWLINE, "c", "u", $eb, " ", $ca, "i", "m", "a", "l", $fb, $8d, " ", $a9, $e5, "l", "f", ".", SCR::NEWLINE, "S", $a9, "w", $bf, "m", $f7, $e7, $be, $e5, "c", $c2, $ff, "h", "o", $d0, SCR::NEWLINE, $88, $f5, $a4, $be, "l", "o", $d3, $bd, "c", "u", "t", $e3, $fb, "j", "u", $de, SCR::NEWLINE, "d", "e", "c", "i", "d", $d6, $bb, "m", "o", "v", $e7, $88, "."
.byt SCR::END_SCRIPT

NoFlippersJoke:
.byt SCR::SCENE, SCENES::NOTHING
; []Ooops! Nova can't swim without flippers!
.byt SCR::NARRATE, CHAR::NONE, "O", $e4, "p", "s", $fd, $a1, " ", $b0, $e8, "s", "w", "i", "m", SCR::NEWLINE, $9d, $ae, " ", "f", "l", "i", "p", "p", $ed, "s", "!"
; Haha just kidding. That won't come until World 2.
.byt SCR::NEWLINE, "H", "a", "h", $be, $8e, "k", "i", "d", "d", $b1, $f6, $f8, $c6, " ", "w", $c2, "'", "t", SCR::NEWLINE, $96, " ", $f2, "t", $dc, " ", "W", $c9, $ef, " ", "2", "."
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
SignWrapAbout:
.byt SCR::SCENE, SCENES::NOVA_AND_SIGN
; <1 SIGN>In puzzle levels, falling off the bottom of the screen wraps you to the top, instead of killing you.
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::SIGN, "I", "n", " ", "p", "u", "z", "z", "l", $e7, "l", "e", "v", "e", "l", "s", $f5, "f", $ad, $b1, " ", "o", "f", "f", SCR::NEWLINE, $a2, " ", "b", "o", "t", $bc, "m", " ", $bd, $a2, " ", "s", "c", "r", $d7, "n", SCR::NEWLINE, "w", "r", "a", "p", $fb, $a6, " ", $bb, $a2, " ", $bc, "p", $f5, $d8, $de, $ec, "d", SCR::NEWLINE, $bd, "k", $dc, "l", $b1, " ", $a6, "."
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
LiaCameo:
.byt SCR::SCENE, SCENES::NOVA_AND_LIA

.byt SCR::GOTO, <LiaCameoAlreadyBombs, >LiaCameoAlreadyBombs
.byt SCR::RUN_ASM
 lda InventoryItem::ABILITY_BOMB
 jsr InventoryGiveIfDontHave
 brk
; <1 LIA>Hey Nova, I'm Lia. To help you on your adventure, I'm giving you my infinite supply of bombs. Have fun!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "H", "e", $fe, $a1, $f5, $d4, "L", "i", "a", $f6, "T", "o", " ", $c3, "l", "p", " ", $a6, SCR::NEWLINE, $c2, " ", $91, " ", $f7, "v", $e6, "t", "u", "r", "e", $f5, $d4, "g", "i", "v", $b1, SCR::NEWLINE, $a6, " ", $cb, " ", $d8, "f", $d8, "i", $eb, " ", "s", $cd, "p", $d2, "o", "f", SCR::NEWLINE, "b", "o", "m", "b", "s", $f6, "H", "a", "v", $e7, "f", $f2, "!"
; <0 NOVA>Wow, thanks Lia!
.byt SCR::SAY, SCR::SPEAKER_0|CHAR::NOVA, "W", "o", "w", $f5, $93, "k", $fb, "L", "i", "a", "!"
.byt SCR::END_SCRIPT
LiaCameoAlreadyBombs:
; <1 LIA>Nooooova stop hanging around here and go save the world!
.byt SCR::SAY, SCR::SPEAKER_1|CHAR::LIA, "N", $e4, $e4, "o", "v", $be, $de, "o", "p", " ", "h", $ca, "g", $b1, SCR::NEWLINE, "a", "r", $f4, $f0, " ", $a9, $e7, $a4, $cf, " ", "s", "a", "v", $e7, $a2, SCR::NEWLINE, "w", $c9, $ef, "!"
.byt SCR::END_SCRIPT
ItiCameo:
.byt SCR::SCENE, SCENES::NOVA_AND_ITI
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
