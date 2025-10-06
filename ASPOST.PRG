** aspost.prg
set color to b/b
@0,0 clear to 24,79
use katalog
go top
dimension prt(10)
i=1
go top
set color to w/b
do while i<=10
 prt(i)=nam
 skip
 i=i+1
enddo
select b use dieta
select a
do while .t.
 @3,17 to 19,53 double
 set color to gr+/b
 @4,28 say'Ž‘’€‚™ˆŠˆ'
 set color to w+/b,w+/bg
 @5,28 prompt prt(1)
 @row()+1,28 prompt prt(2)
 @row()+1,28 prompt prt(3)
 @row()+1,28 prompt prt(4)
 @row()+1,28 prompt prt(5)
 @row()+1,28 prompt prt(6)
 set color to gr+/b
 @row()+2,20 say 'Ž‘’€‚™ˆŠˆ ƒ“Œ€ˆ’€Ž‰ ŽŒŽ™ˆ'
 set color to w+/b
 @row()+1,28 prompt prt(7)
 @row()+1,28 prompt prt(8)
 @row()+1,28 prompt prt(9)
 @row()+1,28 prompt prt(10)
 menu to post
 if post#0
  go top
  locate for nam=prt(post)
  mpole=pole
  mspole=spole
  select b
  go top
  sum all &mspole to ms
  if ms#0
   set color to w+/w+
   @0,0 clear to 24,79
   set color to r*/w+
   @2,3,7,75 box
   @3,5 say 'Ž’ „€ŽƒŽ Ž‘’€‚™ˆŠ€ ‚ ’ŽŒ Œ…‘Ÿ–… Ž‘“™…‘’‚‹Ÿ‹ˆ‘œ Ž‘’€‚Šˆ Ž„“Š’Ž‚,'
   @4,5 say 'Ž’ŽŒ“ ‚›€Ž… €ˆŒ…Ž‚€ˆ… … ŒŽ†…’ ›’œ ˆ‡Œ……Ž.'
   @5,5 say '‚›…ˆ’… „“ƒŽƒŽ Ž‘’€‚™ˆŠ€ ˆ ˆ‡Œ…ˆ’… €‡‚€ˆ….'
   k= inkey(15)
   loop
  endif 
  select a
  go top
  locate for nam=prt(post)
  do while .t.
   @0,0 clear to 24,79
   @2,3 say 'Ž‘’€‚™ˆŠ: '
   set color to gr+/b
   @row(),col()+1 say prt(post)
   set color to w+/b
   @4,3 say 'Ž‚Ž… €ˆŒ…Ž‚€ˆ… Ž‘’€‚™ˆŠ€: 'get prt(post) picture "@!"
   read
   msg1='„ ­­ë¥ ¢¢¥¤¥­ë ¯p ¢¨«ì­® ?'
   do otvet
   if otv=1
    replace nam with prt(post)
    exit
   else
    if otv=2
     set color to w+/b,w+/bg
     loop
    else
     exit
    endif
   endif
  enddo
 endif
 exit
enddo
return 