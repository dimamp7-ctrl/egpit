** clistm.prg
public mkod_t,com
mkod_t=0
if n=5
 lev7='Выбеpите пpодукт '
 lev8='prod+ediz'
else
 lev7='Выбеpите блюдо '
 lev8='bludo'
endif
mes=lev7+chr(24)+space(1)+chr(25)+space(1)+'Home End и нажмите Enter'
do while .not.eof()
 set color to w+/bg,gr+/rb
 @1,0 clear
 l=1 &&для pамки и кодов товаpов
 do while l<19 .and..not.eof()
  @row()+1,1 prompt &lev8 message mes
  k=ltrim(str(l))
  n&k=recno()
  l=l+1
  skip
 enddo
 @1,0 to l+1+2,col()+9 double
 com=l+1
 menu to com
 if com=0
  return
 endif
 if .not.com=l
  k=ltrim(str(com))
  mkod_t=n&k
  go mkod_t
  return
 endif
enddo
return
