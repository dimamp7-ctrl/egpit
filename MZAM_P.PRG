**mzam_p.prg
select b
use dnmen
set filter to kuda=mkuda
go top
do clistm
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
select a
use spisok index spis
go top
do clist
if mkod_t=0
 close databases
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
@5,col()+1 say mporc1 picture "999"
select b
replace bludo with mbludo,&lev3 with mkod,nom with mnom,kuda with mkuda
replace porc1 with mporc1
replace vihod1 with mvihod1
use
select a
return
