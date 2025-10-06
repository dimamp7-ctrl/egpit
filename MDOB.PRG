**mdob.prg
use dnmen
go top
count all for kuda=mkuda to kontrol
if kontrol=17
  set color to bg/bg
  @1,0 clear
  set color to n/n
  @8,7 clear to 10,72
  set color to w+/n
  @9,9 say 'Вы можете ввести не более 17 блюд для одного пpиема пищи'
  k=inkey(9)
  use
  return
endif
use
@1,0 clear
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
** lev1_1='karta'+ltrim(str(mnom))+'_1'
*** lev1_2='karta'+ltrim(str(mnom))+'_2'
** lev1_3='karta'+ltrim(str(mnom))+'_3'
** lev1_4='karta'+ltrim(str(mnom))+'_4'
lev3='kod'+ltrim(str(mnom))
use spisok index spis
go top
do clist
if mkod_t=0
 return
endif
go mkod_t
mbludo=bludo
mvihod1=vihod1
mvihod2=vihod2
mvihod3=vihod3
mvihod4=vihod4
mporc1=mg1
mporc2=mg2
mporc3=mg3
mporc4=mg4
mkod=&lev3
** lev2_1='a->bl'+ltrim(str(mkod))
** lev2_2='b->bl'+ltrim(str(mkod))
** lev2_3='c->bl'+ltrim(str(mkod))
** lev2_4='d->bl'+ltrim(str(mkod))
use
@1,0 clear
set color to w+/bg
@4,65 say 'I   II III  IV'
@5,1 say 'Блюдо: '
set color to gr+/b
@5,col() say mbludo
set color to w+/bg
@5,col()+1 say 'КО-ВО ПОРЦИЙ: '
@5,col()+1 say mporc1 picture "999"
@5,col()+1 say mporc2 picture "999"
@5,col()+1 say mporc3 picture "999"
@5,col()+1 say mporc4 picture "999"
** read
use dnmen
append blank
replace bludo with mbludo,porc1 with mporc1,porc2 with mporc2,porc3 with mporc3,porc4 with mporc4
replace &lev3 with mkod,nom with mnom,kuda with mkuda
replace vihod1 with mvihod1,vihod2 with mvihod2,vihod3 with mvihod3,vihod4 with mvihod4
use
return
