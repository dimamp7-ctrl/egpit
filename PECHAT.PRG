** PECHAT.PRG
clear
pn=1
page=1
mar=0
@2,2 say ved1
@2,col() say ved2
set color to b/b
@1,0 clear to 24,79
set color to w+/b
@12,29 say '…—€’€ ...'
set print on
do while .not. eof()
 l=1
 it=0
 ?'  ‡­ ¬¥­áª¨© ¤¥âáª¨© ¤®¬-¨­â¥p­ â'
 ?ved1+ved2
 ??' ®â '+dtoc(data)
 ?
 l=l+2
 ?zag1
 if w0=2 .and. i=2
  ?zag3
  l=l+1
 endif
 ?zag2
 l=l+3
 do while .t.
?str(pn,3),t,&mprod,t,&pole1,t,&pole2,t,&pole3,t,&pole4,t,&pole5,t,&pole6,t,&pole7,t
?? &pole8,t1,&pole9,t1,&pole10,t1
??&pole11,t2,&pole12,t2,&pole13,t2,&pole14,t2,&pole15,t2,&pole16,t2
If w0#1
??&pole17,t2,&pole18
Endif
it=it+1
skip
if eof()
 exit
endif
pn=pn+1
l=l+1
 enddo
 if eof()
  ? '@'
  do case
   case w0=1
    do while.t.
      do case
       case i=1
        t='|'
?t+space(15)+t+space(1)+t+str(ml(1),13,2)+t+space(1)+t+str(ml(2),13,2)+t+space(1)+t
??str(ml(3),13,2)+t+space(1)+t+str(ml(4),13,2)+t+space(1)+t+str(ml(5),13,2)
??t+space(1)+t+str(ml(6),13,2)+t+space(1)+t
??str(ml(11),13,2)+t+space(1)+t+str(ml(12),13,2)
        case i=2
?t+space(15)+t+space(1)+t+str(ml(7),17,2)+t+space(1)+t+str(ml(8),17,2)+t+space(1)
??t+str(ml(9),17,2)+t+space(1)+t+str(ml(10),17,2)+t+space(1)+t+str(ml(13),17,2)
       case i=3
        ? '@'
        ??' ‚‘…ƒ ‘’“ˆ‹ „“Š’‚ H€ ‘“ŒŒ“: |||'
        ??ml(14)
      endcase
      exit
    enddo
   case w0=2
    do while.t.
      do case
       case i=1
        t='|'
        ? '@'
      ?? '| | |'+str(ml(1),16,2)+t+space(1)+t+str(ml(2),16,2)+t+space(1)
        ??t+str(ml(3),16,2)+t+space(1)+t+str(ml(4),16,2)
        ??t+space(1)+t+str(ml(15),16,2)+t+space(1)+t+str(ml(5),16,2)+t
       case i=2
        t='|'
        ? '@'
        ?? '| | |'+str(ml(6),14,2)+t+space(1)+t+str(ml(7),14,2)+t+space(1)
        ??t+str(ml(5),14,2)+t+space(1)+t+str(ml(8),11,2)
        ??t+space(1)+t+str(ml(9),11,2)
        ??t+space(1)+t+str(ml(10),11,2)+t+space(1)+t+str(ml(11),11,2)
        ??t+space(1)+t+str(ml(12),11,2)+t+space(1)+t+str(ml(13),11,2)+t
       case i=3
        t='|'
        ? '@'
        ?? '| | |'+str(lev1,18,2)+t+space(1)+t+str(lev2,18,2)
        ??t+space(5)+t+str(lev3,18,2)
      endcase
      exit
      ?'+'
      set print off
    enddo
   case w0=3
    ?'|™€Ÿ ‘“ŒŒ€:'+kya+str(lev4,12,2)
  endcase 
 ** ?'+'
 else
 ** ?'+'
  if eof()
   exit
  endif
  set print off
  set print on
  loop
 endif
enddo
set print off
return

