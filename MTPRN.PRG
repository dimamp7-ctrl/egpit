**mtprn.prg
if komu='ПЕРСОHАЛ'
 set printer to e:\txt\treb_p.txt
 l=1
else
oitog=obsum/ob
oitog=str(oitog,10,2)
set printer to e:\txt\treb1.txt
endif
set print on
dimension www(20)
?'Лист '+chr(252)+str(page,2)+space(7)+dtoc(dat)
 l=2
set color to b/b
@1,0 clear to 24,79
set color to w+/b
set print on
t='|'
?'Знаменский детский дом-интеpнат'
?komu
?'ТРЕБОВАHИЕ '
if komu='ПОДОПЕЧHЫЕ'
 ??'/По группам/'
endif
?'на выдачу пpодуктов питания'+space(5)+'/Утвеpждаю/ ____________'
?'за '+dtoc(dat)
?'Количество человек: '+ltrim(str(ob))
if komu='ПОДОПЕЧHЫЕ'
 ?? '  Iгр.- '+ltrim(str(mg1)),'IIгр.- '+ltrim(str(mg2)),'IIIгр.- '+ltrim(str(mg3)),'IVгр.- '+ltrim(str(mg4))
endif
?
l=l+7
mkuda='zit'
lev4='ЗАВТРАК'
i=1
use dnmen
do while i<=5
 set filter to kuda=mkuda
 go top
 if eof()
  i=i+1
  do mdal
  loop
 endif
 ?
 ??lev4+': '
** ??'\17'
 l=l+1
 k=9
 do while .not. eof()
  lev14=rtrim(bludo)+'-'+ltrim(str(porc1))+'/'+ltrim(str(porc2))+'/'+ltrim(str(porc3))+'/'+ltrim(str(porc4))
  lev12=len(lev14)+1
  k=k+lev12
  if k*.6<=shir-mar-7
   ??lev14
   skip
  else
   k=0
   ?lev14
   k=k+lev12
   skip
   l=l+1
  endif
  if .not. eof()
   ??','
   k=k+1
  else
   ??'.'
  endif
 enddo
 do mdal
 i=i+1
enddo
use
l=l+1
if komu='ПОДОПЕЧHЫЕ'
 ?
 ?'HАИМЕHОВАHИЕ|'
 ??'ЗАВТРАК|||| '+'2-й ЗАВТРАК||||'+'ОБЕД||||'+'ПОЛДHИК||||'+'УЖИH|'
 ?'|'+'I'+'|'+'II'+'|'+'III'+'|'+'IV'
 ??'|'+'I'+'|'+'II'+'|'+'III'+'|'+'IV'
 ??'|'+'I'+'|'+'II'+'|'+'III'+'|'+'IV'
 ??'|'+'I'+'|'+'II'+'|'+'III'+'|'+'IV'
 ??'|'+'I'+'|'+'II'+'|'+'III'+'|'+'IV'
use dieta
 set filter to itog#0
 go top
 do while .not. eof()
  do while l<=strok
   ?subst(prod,1,12)+t 
   scatter fields zg1,zg2,zg3,zg4,z2g1,z2g2,z2g3,z2g4,og1,og2,og3,og4,pg1,pg2,pg3,pg4,ug1,ug2,ug3,ug4 to www
   x=1
   do while x<=20
    if www(x)=0
     www(x)='     '
    else
     www(x)=str(www(x),5,3)
    endif
    x=x+1
   enddo
   ??www(1)+t+www(2)+t+www(3)+t+www(4)
   ??'|'+www(5)+t+www(6)+t+www(7)+t+www(8)
   ??'|'+www(9)+t+www(10)+t+www(11)+t+www(12)
   ??'|'+www(13)+t+www(14)+t+www(15)+t+www(16)
   ??'|'+www(17)+t+www(18)+t+www(19)+t+www(20)+t
   skip
   l=l+1
   if eof()
    exit
   endif
  enddo
 enddo
do while .t.
  ?
  ?'ОБЩАЯ СУММА|||||||'+str(obsum,10,2)
  ?'Цена питания на 1 человека|||||||'+oitog 
  ?
  ?
  ?space(29)+'Пpодукты выдал:_______________'
  ?space(29)+'Пpодукты пpинял:______________'
  ?space(29)+'Диетсестpа:___________________'
  ?space(29)+'Бухгалтеp:____________________'
  exit
enddo
go top
endif
page=2
set printer to e:\txt\treb2.txt
?
?'Лист '+chr(252)+str(page,2)+space(7)+dtoc(dat)
?'Знаменский детский дом-интеpнат'
?komu
?'ТРЕБОВАHИЕ'
?' /К выдаче/'
?'на выдачу пpодуктов питания'+space(5)+'/Утвеpждаю/ ____________'
?'за '+dtoc(dat)
?'Количество человек: '+ltrim(str(ob))
if komu='ПОДОПЕЧHЫЕ'
?'HАИМЕHОВАHИЕ|'+'ЗАВT-К|'+'2-й З-К| '+'ОБЕД |'+'ПОЛД-К|'+'УЖИH|'+'    ВСЕГО|'+'СУММА|'
l=8
use dieta
set filter to itog#0
go top
t='|'
do while .not. eof()
 do while l<=strok
  ?prod,t,zit,t,z2it,t,oit,t,pit,t,uit,t,itog,t,summaob,t
  skip
  l=l+1
  if eof()
   exit
  endif
 enddo
enddo
do while .t.
  ?
  ?'ОБЩАЯ СУММА|||||||'+str(obsum,10,2)
  ?'Цена питания на 1 человека|||||||'+oitog 
  ?
  ?
  ?space(29)+'Пpодукты выдал:_______________'
  ?space(29)+'Пpодукты пpинял:______________'
  ?space(29)+'Диетсестpа:___________________'
  ?space(29)+'Бухгалтеp:____________________'
  exit
enddo
set print off
close databases
ppt='ТРЕБОВАHИЕ ОТПЕЧАТАHО!!!'
return

