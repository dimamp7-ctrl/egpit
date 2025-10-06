** cl_d_r.prg
public mkod_t,com
mkod_t=0
mes='Выбеpите пpодукт '+chr(24)+space(1)+chr(25)+space(1)+'Home End и нажмите Enter'
do while .not.eof()
 set color to w+/bg,gr+/rb
 @1,0 clear to 24,38
** @1,0
  @1,57 say 'I'
  @row(),col()+4 say 'II'
  @row(),col()+4 say 'III'
  @row(),col()+4 say 'IV'
 l=1 &&для pамки и кодов товаpов
 do while l<19 .and..not.eof()
  @row()+1,1 prompt substr(prod,1,12)+space(1)+str(&lev2_1,5,1)+space(1)+str(&lev2_2,5,1)+space(1)+str(&lev2_3,5,1)+space(1)+str(&lev2_4,5,1) message mes
  k=ltrim(str(l))
  n&k=recno()
  l=l+1
  skip
 enddo
 @row()+1,1 prompt 'Enter - пpодолжение ; Esc - выход'
 @1,0 to l+1+2,col()+3 double
 @1,17 say 'I'
 @1,22 say 'II'
 @1,28 say 'III'
 @1,34 say 'IV'
 com=l+1
 menu to com
 if com=0
  return
 endif
 if .not.com=l
   k=ltrim(str(com))
   mkod_t=n&k
   go mkod_t
  if ediz='ШТ'
   set color to gr+/w,w+/b
   @com+1,1 clear to com+1,36
   @com+1,1 say substr(prod,1,9)+space(1)+ediz get &lev2_1 picture '9.999'
   @row(),col()+1 get &lev2_2 picture '9.999'
   @row(),col()+1 get &lev2_3 picture '9.999'
   @row(),col()+1 get &lev2_4 picture '9.999'
   read
   set color to gr+/bg
  else
   set color to gr+/w,w+/b
   @com+1,1 clear to com+1,36
   @com+1,1 say substr(prod,1,9)+space(1)+ediz get &lev2_1 picture '999.9'
   @row(),col()+1 get &lev2_2 picture '999.9'
   @row(),col()+1 get &lev2_3 picture '999.9'
   @row(),col()+1 get &lev2_4 picture '999.9'
   read
   set color to gr+/bg
  endif
  @2,39 clear to 20,79
  i=2
  set filter to &lev2_1#0.or.&lev2_2#0.or.&lev2_3#0.or.&lev2_4#0
  go top
  do while .not. eof()
   if i<=22
    @i,39 say substr(prod,1,15)+space(1)+str(&lev2_1,5,1)
    @row(),col()+1 say str(&lev2_2,5,1)
    @row(),col()+1 say str(&lev2_3,5,1)
    @row(),col()+1 say str(&lev2_4,5,1)
    i=i+1
    skip
   else
    exit
   endif
  enddo
  set filter to
  go mkod_t
 endif
enddo
return


