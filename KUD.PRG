**kud.prg
clear
@0,2 say 'УДАЛЕНИЕ БЛЮДА'
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
mkod=&lev3
lev2_1='a->bl'+ltrim(str(mkod))
lev2_2='b->bl'+ltrim(str(mkod))
lev2_3='c->bl'+ltrim(str(mkod))
lev2_4='d->bl'+ltrim(str(mkod))
set color to gr+/n
@com+1,1 say bludo
msg1=' Подтвеpдите удаление !!! '
do otvet
if otv=1
 clear
 @12,29 say 'ЖДИТЕ ...'
 delete 
 pack
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
 replace all &lev2_1 with 0,&lev2_2 with 0,&lev2_3 with 0,&lev2_4 with 0
 go top
 use
 use kontrol
 go top
 locate for &lev3=0
 replace &lev3 with mkod
 go top
 use
endif
return
