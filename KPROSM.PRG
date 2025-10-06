**kprosm.prg
clear
@0,2 say 'èêéëåéíê äÄêí êÄëäãÄÑäà'
msg2='ÇÎ°•p®‚• ™†‚•£Æp®Ó °´Ó§† :'
do priem
do case
 case pri=1
  mnom=4
 case pri=2
  mnom=1
 case pri=3
  mnom=2
 case pri=4
  mnom=3
 case pri=0
  return
endcase
set color to w+/bg,gr+/rb
lev1_1='karta'+ltrim(str(mnom))+'_1'
lev1_2='karta'+ltrim(str(mnom))+'_2'
lev1_3='karta'+ltrim(str(mnom))+'_3'
lev1_4='karta'+ltrim(str(mnom))+'_4'
lev3='kod'+ltrim(str(mnom))
use spisok index spis
go top
do clist
if mkod_t=0
 return
endif
go mkod_t
mbludo=bludo
mkod=&lev3
lev2_1='a->bl'+ltrim(str(mkod))
lev2_2='b->bl'+ltrim(str(mkod))
lev2_3='c->bl'+ltrim(str(mkod))
lev2_4='d->bl'+ltrim(str(mkod))
use
use &lev1_1
select 2
use &lev1_2
select 3
use &lev1_3
select 4
use &lev1_4
select 1
go top
set relation to recno() into b
set relation to recno() into c additive
set relation to recno() into d additive
go top
set filter to &lev2_1#0
go top
sum all belok*&lev2_1/100 to mbelok1
sum all jir*&lev2_1/100 to mjir1
sum all ugl*&lev2_1/100 to mugl1
sum all kkal*&lev2_1/100 to mkkal1
select 2
go top
set filter to &lev2_2#0
go top
sum all belok*&lev2_2/100 to mbelok2
sum all jir*&lev2_2/100 to mjir2
sum all ugl*&lev2_2/100 to mugl2
sum all kkal*&lev2_2/100 to mkkal2
select 3
go top
set filter to &lev2_3#0
go top
sum all belok*&lev2_3/100 to mbelok3
sum all jir*&lev2_3/100 to mjir3
sum all ugl*&lev2_3/100 to mugl3
sum all kkal*&lev2_3/100 to mkkal3
select 4
go top
set filter to &lev2_4#0
go top
sum all belok*&lev2_4/100 to mbelok4
sum all jir*&lev2_4/100 to mjir4
sum all ugl*&lev2_4/100 to mugl4
sum all kkal*&lev2_4/100 to mkkal4
go top
select 1
clear
@0,2 say mbludo
set color to w+/b
@1,0 clear
@1,0 say replicate('_',79)
@1,5 say ' ç†®¨•≠Æ¢†≠®• ØpÆ§„™‚†  '
@1,col()+22 say 'É ¢ ØÆpÊ®®'
@2,38 say 'I'
@row(),col()+7 say 'II'
@row(),col()+8 say 'III'
@row(),col()+9 say 'IV'
set color to w+/b
go top
do while .not. eof()
 @3,0 clear
 l=0
 do while l<16 .and. .not. eof()
  @row()+1,7 say prod+space(2)+str(&lev2_1,9,3)+space(1)+str(&lev2_2,9,3)+space(1)+str(&lev2_3,9,3)+space(1)+str(&lev2_4,9,3)
  l=l+1
  skip
 enddo
 if eof()
  set color to w+/bg
  @row()+1,0 say replicate('_',79)
  ? '       ÅÖãäà : '+space(17)
  ??(str(mbelok1,9,3))+space(1)+(str(mbelok2,9,3))+space(1)+(str(mbelok3,9,3))+space(1)+(str(mbelok4,9,3))
  ?'       Üàêõ : '+space(18)
  ??(str(mjir1,9,3))+space(1)+(str(mjir2,9,3))+space(1)+(str(mjir3,9,3))+space(1)+(str(mjir4,9,3))
  ?'       ìÉãÖÇéÑõ : '+space(14)
  ??(str(mugl1,9,3))+space(1)+(str(mugl2,9,3))+space(1)+(str(mugl3,9,3))+space(1)+(str(mugl4,9,3))
  ?'       äÄãéêÄÜ : '+space(15)
  ??(str(mkkal1,9,3))+space(1)+(str(mkkal2,9,3))+space(1)+(str(mkkal3,9,3))+space(1)+(str(mkkal4,9,3))
  set color to w+/b
 else
  @row()+2,1 say space(12)+'ÇÇÖêï'+space(7)+' *** '+space(6)+'Ççàá'+space(14)+' ***'
  @row()+1,1 say ' PgUp-·‚p†≠®Ê† '+chr(24)+'-ß†Ø®·Ï  ***  PgDn-·‚p†≠®Ê† '+chr(25)+'-ß†Ø®·Ï  ***  Esc-ß†™Æ≠Á®‚Ï'
  co=col()
  @row()-2,0 to row()+1,co+2 double
 endif
 read
 lev=readkey()
 do case
  case eof()
   do case
    case lev=6 .or. lev=6+256
     skip -(l+15)
    case lev=4 .or. lev=4+256
     skip-18
    otherwise
     exit
   endcase
  case lev=6 .or. lev=6+256
   skip -(l+15)
  case lev=7 .or. lev=7+256
   skip -1 
  case lev=12 .or. lev=12+256
   exit
  case lev=5 .or. lev=5+256
   skip-15
  case lev=4 .or. lev=4+256
   skip-17
 endcase
enddo
set filter to
go top
use
close databases
return

