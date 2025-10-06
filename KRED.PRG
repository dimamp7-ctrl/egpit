**kred.prg
clear
@0,2 say 'РЕДАКТИРОВАНИЕ КАРТ РАСКЛАДКИ'
msg2='Выбеpите категоpию блюда :'
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
pr=bludo
mvihod1=vihod1
mvihod2=vihod2
mvihod3=vihod3
mvihod4=vihod4
mkod=&lev3
lev2_1='a->bl'+ltrim(str(mkod))
lev2_2='b->bl'+ltrim(str(mkod))
lev2_3='c->bl'+ltrim(str(mkod))
lev2_4='d->bl'+ltrim(str(mkod))
do while .t.
 @1,0 clear
 @5,3 say 'Блюдо:     '
 @4,17 to 6,59 double
 @5,18 get pr picture "@!"
 @7,3 say 'Выход:     '
 @9,5 say 'I: ' get mvihod1
 @9,col()+2 say 'II: ' get mvihod2
 @9,col()+2 say 'III: ' get mvihod3
 @9,col()+2 say 'IV: ' get mvihod4
 read
 if pr='                                        '
  msg1='Наименование бдюда не введено.Повтоpить?'
  do otvet
  if otv=1
   loop
  endif
  set color to w+/bg,gr+/rb
 endif
 exit
enddo
replace bludo with pr
replace vihod1 with mvihod1,vihod2 with mvihod2,vihod3 with mvihod3,vihod4 with mvihod4
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
@0,35 clear to 0,79
@0,39 say pr
 set color to gr+/bg
 @1,0 clear
 i=2
 set filter to &lev2_1#0 .or. &lev2_2#0 .or. &lev2_3#0 .or. &lev2_4#0
 go top
 do while .not. eof()
  if i<=23
   @i,39 say substr(prod,1,15)+space(1)+str(&lev2_1,5,1)+space(1)+str(&lev2_2,5,1)+space(1)+str(&lev2_3,5,1)+space(1)+str(&lev2_4,5,1)
   i=i+1
   skip
  else
   exit
  endif
 enddo
 set filter to
 go top
do cl_d_r
set color to gr+/n
if mkod_t=0
  return
endif
return

