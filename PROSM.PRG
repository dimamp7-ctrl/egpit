** PROSM.PRG
clear
@0,2 say ved2+' §  '+mesac+' ¬¥áïæ'
@1,0 say replicate('_',79)
@2,1 say zag1
set color to w+/b
go top
do while .not. eof()
 @3,0 clear
 l=0
 do while l<17 .and. .not. eof()
  @row()+1,1 say &name+space(1)+&pole1+space(1)+&pole2+t+&pole3+space(1)
  @row(),col() say &pole4+t+&pole5+space(1)+&pole6+t1+&pole7+space(1)+&pole8
  l=l+1
  skip
 enddo
 if eof()
  set color to w+/bg
  if w0=1
   do while .t.
    if l<10
     @row()+1,0 say replicate('_',79)
     @row()+1,1 say post(1)+space(2)+str(ml(1),12,2)+space(5)+post(7)+space(2)+str(ml(7),12,2)
     @row()+1,1 say post(2)+space(2)+str(ml(2),12,2)+space(5)+post(8)+space(2)+str(ml(8),12,2)
     @row()+1,1 say post(3)+space(2)+str(ml(3),12,2)+space(5)+post(9)+space(2)+str(ml(9),12,2)
     @row()+1,1 say post(4)+space(2)+str(ml(4),12,2)+space(5)+post(10)+space(2)+str(ml(10),12,2)
     @row()+1,1 say post(5)+space(2)+str(ml(5),12,2)
     @row()+1,1 say post(6)+space(2)+str(ml(6),12,2)
     @row()+1,1 say 'Ž„•Ž‡:'+space(5)+str(ml(11),12,2)
     @row()+1,1 say '‚‘…ƒŽ: '+space(5)+str(ml(12),12,2)+space(5)+'‚‘…ƒŽ: '+space(5)+str(ml(13),12,2)
     @row()+1,20 say 'ˆ’ŽƒŽ: '+space(2)+str(ml(14),12,2)
     exit
    else
     wait
     @2,0 clear
     set color to w+/bg
     @2,0 say ''
     l=0
     loop
    endif
   enddo
  else
   if w0=2
    @row()+1,0 say replicate('_',79)
    @row()+1,0 say ' ‘“ŒŒ€ :'+space(6)+str(ml(5),12,2)+space(4)+str(ml(10),12,2)
    @row(),col() say space(4)+str(ml(13),12,2)+space(9)+str(ml(14),12,2)
   else
    @row()+1,10 say 'Ž.‘“ŒŒ€:'+space(2)+str(lev2,12,2)
    @row(),col()+1 say 'ƒ..‘“ŒŒ€:'+space(1)+str(lev3,9,2)
    @row(),col()+1 say '‚‘…ƒŽ :'+space(1)+str(lev1,12,2)
   endif
  endif
  set color to w+/b
 else
  @row()+2,1 say space(12)+'‚‚…•'+space(7)+' *** '+space(6)+'‚ˆ‡'+space(14)+' ***'
  @row()+1,1 say ' PgUp-áâp ­¨æ  '+chr(24)+'-§ ¯¨áì  ***  PgDn-áâp ­¨æ  '+chr(25)+'-§ ¯¨áì  ***  Esc-§ ª®­ç¨âì'
  co=col()
  @row()-2,0 to row()+1,co+2 double
 endif
 read
 lev=readkey()
 do case
  case eof()
   do case
    case lev=6 .or. lev=6+256
     skip -(l+16)
    case lev=4 .or. lev=4+256
     skip-18
    otherwise
     exit
   endcase
  case lev=6 .or. lev=6+256
   skip -(l+16)
  case lev=7 .or. lev=7+256
   skip -1 
  case lev=12 .or. lev=12+256
   exit
  case lev=5 .or. lev=5+256
   skip-16
  case lev=4 .or. lev=4+256
   skip-18
 endcase
enddo
return

