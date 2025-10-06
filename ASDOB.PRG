** ASDOB.prg
col=reccount()
go top
clear
@0,42 say '„€‚‹…ˆ… €ˆŒ…‚€ˆ‰ '+'** ‡ ¯¨á¥©:'+ltrim(str(col))
do while .t.
 pr='                       '
 ed='  '
 mbelok=0
 mjir=0.000
 mugl=0.000
 mkal=0.000
 @1,0 clear to 24,79
 @0,0 clear to 0,41
 @5,3 say 'p®¤ãªâ:     '
 @4,17 to 6,41 double
 @5,18 get pr picture "@!"
 @9,3 say '…¤.¨§¬¥p¥­¨ï:'
 @9,18 get ed picture "@!"
 @8,17 to 10,20 double
 @12,17 say'‘„…†€ˆ… ‚ 100 £ „“Š’€:'
 @14,17 say '¥«ª¨:    ' get mbelok
 @16,17 say '†¨pë:     ' get mjir
 @18,17 say '“£«¥¢®¤ë: ' get mugl
 @20,17 say 'Š «®p¨¨:  ' get mkal
 read
 msg1='„ ­­ë¥ ¢¢¥¤¥­ë ¯p ¢¨«ì­®?'
 do otvet
 if otv=1
  if pr='                       '
   set color to w/w
   @0,0 clear to 24,79
   set color to r/b+
   @12,29 say ' “‘’€Ÿ ‡€ˆ‘œ !!! '
   m=inkey(5)
   set color to w+/bg
   go top
   exit
  endif
  go top
  locate all for prod=pr
  if eof()
   clear
   @12,29 say '†„ˆ’…...'
   append blank
   select b
   append blank
   select c
   append blank
   select d
   append blank
   select e
   append blank
   select f
   append blank
   select a
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   select b
   replace prod with pr,ediz with ed
   select c
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   select d
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   select e
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   select f
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   select g
   use karta1_2
   append blank
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta1_3
   append blank
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta1_4
   append blank
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta2_2
   append blank
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta2_3
   append blank
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta2_4
   append blank
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta3_2
   append blank
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta3_3
   append blank
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta3_4
   append blank
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta4_2
   append blank
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta4_3
   append blank
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta4_4
   append blank
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use
   select a
   go top
   exit
  else
   set color to w/w
   @1,0 clear to 24,79
   set color to r+/b+
   @12,15 say ' €ˆŒ…‚€ˆ… <<'+trim(pr)+'>> “†… ‘“™…‘’‚“…’ !!! '
   m=inkey(5)
   set color to w+/bg
   exit
  endif
 else
  set color to w+/bg,w+/b
  loop
 endif
enddo
go top
return

