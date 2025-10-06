**mdob_p.prg
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
store ob to mporc1
mkod=&lev3
use
@1,0 clear
set color to w+/bg
@5,1 say 'Блюдо: '
set color to gr+/b
@5,col() say mbludo
set color to w+/bg
@5,col()+1 say 'КО-ВО ПОРЦИЙ: '
@ row(),col() say mporc1 picture '99999'
use dnmen
append blank
replace bludo with mbludo,porc1 with mporc1
replace &lev3 with mkod,nom with mnom,kuda with mkuda
replace vihod1 with mvihod1
use
return
