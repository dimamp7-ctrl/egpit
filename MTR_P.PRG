** mtr_p.prg
set color to w+/b,w+/bg
@0,17 clear to 3,63
do while .t.
 clear
 @1,14 say komu
 @2,14 say 'М Е Н Ю - Т Р Е Б О В А Н И Е'
 @3,14 say 'на выдачу пpодуктов питания'
 @4,14 say 'за ' get dat
 @6,5 say 'Количество человек: ' get ob
 read
 msg1='Данные введены пpавильно ?'
 do otvet
 if otv=1
  datz=dat
  exit
 else
  loop
 endif
enddo
set confirm on
lev4='ЗАВТРАК'
mkuda='zit'
do while .t.
 set color to b/b
 @0,0 clear
 set color to w+/b,w+/bg
 @0,2 say lev4
 @0,col()+5 say 'на '
 @0,col() say dat
 @0,col()+5 say komu
 @2,2 say 'Блюдо'+space(36)+'|'+space(1)+'Поpций'
 @1,1 to 3,col()+1
 use dnmen
 set filter to kuda=mkuda
 go top
 do while .not. eof()
  @row()+1,2 say bludo+' | '+str(porc1,6)
  skip
 enddo
 @3,1 to row()+1,col()+1
 use
 set color to bg/bg
 @22,0 clear to 24,79
 set color to r+/bg
 @22,0 to 24,79 double
 set color to w+/bg,w+/rb
 @23,7 prompt 'ДОБАВИТЬ'
 @23,col()+3 prompt 'ЗАМЕНИТЬ'
 @23,col()+3 prompt 'УДАЛИТЬ'
 @23,col()+3 prompt 'ДАЛЬШЕ'
 @23,col()+3 prompt 'ПРЕДЫДУЩИЙ'
 @23,col()+3 prompt 'ЗАКОНЧИТЬ'
 menu to mm
 set color to w+/b,w+/bg
 do case
  case mm=1
   do mdob_p
  case mm=2
   do mzam_p
  case mm=3
   do mud
  case mm=4
   do mdal
  case mm=5
   do mpred
  case mm=6
   exit
  case mm=0
   exit
 endcase
enddo
set confirm off
return
