**mprn.prg
if komu='ПЕРСОHАЛ'
 do mtprn
 return
endif
*** store 0 to zitbel,oitbel,pitbel,uitbel,zitjir,oitjir,pitjir,uitjir
***** store 0 to zitugl,oitugl,pitugl,uitugl,zitkal,oitkal,pitkal,uitkal
dimension bju(4,4)
dimension itbju(4,4)
dimension dnbju(4,4)
store 0 to bju,itbju,dnbju
set color to b/b
@1,0 clear to 24,79
set color to w+/b
set printer to e:\txt\menu.txt
set print on
** chr(27)+chr(64)
**chr(18)
** ??chr(27)+'E'
**??' \k'
?'Лист '+chr(252)+str(page,2)+space(7)+dtoc(dat)
?'Знаменский детский дом-интернат'
?komu
?'\ДHЕВHОЕ МЕHЮ\'
?'за '+dtoc(dat)+space(15)+'/Утвеpждаю/ _____________'
?'Количество человек: '+ltrim(str(ob)),'Iгр.- '+ltrim(str(mg1)),'IIгр.- '+ltrim(str(mg2)),'IIIгр.- '+ltrim(str(mg3)),'IVгр.- '+ltrim(str(mg4))
l=6
i=1
mkuda='zit'
lev4='ЗАВТРАК'
select a
use dnmen
do while i<=5
 select a
 set filter to kuda=mkuda
 go top
 if eof()
  i=i+1
  do mdal
  loop
 endif
store 0 to itbju
do while .t.
  ?lev4
   l=l+2
   exit
enddo
 do while .not. eof()
  mnom=nom
  lev1_1='karta'+ltrim(str(mnom))+'_1'
  lev1_2='karta'+ltrim(str(mnom))+'_2'
  lev1_3='karta'+ltrim(str(mnom))+'_3'
  lev1_4='karta'+ltrim(str(mnom))+'_4'
  lev3='kod'+ltrim(str(mnom))
  mkod=&lev3
  lev2_1='b->bl'+ltrim(str(mkod))
  lev2_2='c->bl'+ltrim(str(mkod))
  lev2_3='d->bl'+ltrim(str(mkod))
  lev2_4='e->bl'+ltrim(str(mkod))
  mbludo=bludo
  mporc1=porc1
  mporc2=porc2
  mporc3=porc3
  mporc4=porc4
  mvihod1=vihod1
  mvihod2=vihod2
  mvihod3=vihod3
  mvihod4=vihod4
  do while .t.
      ?
    ??mbludo+space(3)+'Поpций: I-'+str(mporc1,3)+'/'+ltrim(mvihod1),' II-',str(mporc2,3)+'/'+ltrim(mvihod2),' III-',str(mporc3,3)+'/'+ltrim(mvihod3),' IV-',str(mporc4,3)+'/'+ltrim(mvihod4)
    l=l+2
    exit
  enddo
  select b
  use &lev1_1
  select 3
  use &lev1_2
  select 4
  use &lev1_3
  select 5
  use &lev1_4
  select 2
  go top
  set relation to recno() into c
  set relation to recno() into d additive
  set relation to recno() into e additive
  go top
  set filter to &lev2_1#0
  go top
  sum all belok*&lev2_1/100 to bju(1,1)
  sum all jir*&lev2_1/100 to bju(1,2)
  sum all ugl*&lev2_1/100 to bju(1,3)
  sum all kkal*&lev2_1/100 to bju(1,4)
  select 3
  go top
  set filter to &lev2_2#0
  go top
  sum all belok*&lev2_2/100 to bju(2,1)
  sum all jir*&lev2_2/100 to bju(2,2)
  sum all ugl*&lev2_2/100 to bju(2,3)
  sum all kkal*&lev2_2/100 to bju(2,4)
  select 4
  go top
  set filter to &lev2_3#0
  go top
  sum all belok*&lev2_3/100 to bju(3,1)
  sum all jir*&lev2_3/100 to bju(3,2)
  sum all ugl*&lev2_3/100 to bju(3,3)
  sum all kkal*&lev2_3/100 to bju(3,4)
  select 5
  go top
  set filter to &lev2_4#0
  go top
  sum all belok*&lev2_4/100 to bju(4,1)
  sum all jir*&lev2_4/100 to bju(4,2)
  sum all ugl*&lev2_4/100 to bju(4,3)
  sum all kkal*&lev2_4/100 to bju(4,4)
  go top
  itbju(1)=itbju(1)+bju(1)
  itbju(2)=itbju(2)+bju(2)
  itbju(3)=itbju(3)+bju(3)
  itbju(4)=itbju(4)+bju(4)
  itbju(5)=itbju(5)+bju(5)
  itbju(6)=itbju(6)+bju(6)
  itbju(7)=itbju(7)+bju(7)
  itbju(8)=itbju(8)+bju(8)
  itbju(9)=itbju(9)+bju(9)
  itbju(10)=itbju(10)+bju(10)
  itbju(11)=itbju(11)+bju(11)
  itbju(12)=itbju(12)+bju(12)
  itbju(13)=itbju(13)+bju(13)
  itbju(14)=itbju(14)+bju(14)
  itbju(15)=itbju(15)+bju(15)
  itbju(16)=itbju(16)+bju(16)
  dnbju(1)=dnbju(1)+bju(1)
  dnbju(2)=dnbju(2)+bju(2)
  dnbju(3)=dnbju(3)+bju(3)
  dnbju(4)=dnbju(4)+bju(4)
  dnbju(5)=dnbju(5)+bju(5)
  dnbju(6)=dnbju(6)+bju(6)
  dnbju(7)=dnbju(7)+bju(7)
  dnbju(8)=dnbju(8)+bju(8)
  dnbju(9)=dnbju(9)+bju(9)
  dnbju(10)=dnbju(10)+bju(10)
  dnbju(11)=dnbju(11)+bju(11)
  dnbju(12)=dnbju(12)+bju(12)
  dnbju(13)=dnbju(13)+bju(13)
  dnbju(14)=dnbju(14)+bju(14)
  dnbju(15)=dnbju(15)+bju(15)
  dnbju(16)=dnbju(16)+bju(16)
  select b
  set filter to &lev2_1#0 .or. &lev2_1#0 .or. &lev2_2#0 .or. &lev2_3#0 .or. &lev2_4#0
  go top
**  select a
  adres=recno()
  do while .not. eof()
    do while .not. eof()
     go adres
     k=1
     ?'Пpодукт   | '
     do while int(shir/.6)>=(mar+10+23*k) 
      if .not. eof()
       ??prod,t
       skip
       k=k+1
      else
       exit
      endif
     enddo
     ?'Г в поpции| '
     go adres
     k=1
     do while int(shir/.6)>=(mar+10+23*k)
      if .not. eof()
        ??str(&lev2_1,5,1)+'/'+str(&lev2_2,5,1)+'/'+str(&lev2_3,5,1)+'/'+str(&lev2_4,5,1),t
       skip
       k=k+1
      else
       exit
      endif
     enddo
**     ?replicate('_',23*(k-1)+10)
     ?'Всего КГ/Ш| '
     go adres
     k=1
     do while int(shir/.6)>=(mar+10+23*k)
      if .not. eof()
       if ediz='ШТ'
??str(&lev2_1*mg1,5)+'/'+str(&lev2_2*mg2,5)+'/'+str(&lev2_3*mg3,5)+'/'+str(&lev2_4*mg4,5),t
       SKIP
       K=K+1
       LOOP
       endif
??str(&lev2_1*mg1/1000,5,3)+'/'+str(&lev2_2*mg2/1000,5,3)+'/'+str(&lev2_3*mg3/1000,5,3)+'/'+str(&lev2_4*mg4/1000,5,3),t
       skip
       k=k+1
      else
       exit
      endif
     enddo
     ?replicate('_',23*(k-1)+10)
     l=l+6
     if eof()
      ? 'Б: '
      ??str(bju(1,1),6,1)+'/'+str(bju(2,1),6,1)+'/'+str(bju(3,1),6,1)+'/'+str(bju(4,1),6,1),t
      ??'Ж: '
      ??str(bju(1,2),6,1)+'/'+str(bju(2,2),6,1)+'/'+str(bju(3,2),6,1)+'/'+str(bju(4,2),6,1),t
      ??'У: '
      ??str(bju(1,3),6,1)+'/'+str(bju(2,3),6,1)+'/'+str(bju(3,3),6,1)+'/'+str(bju(4,3),6,1),t
      ??'К: '
      ??str(bju(1,4),6,1)+'/'+str(bju(2,4),6,1)+'/'+str(bju(3,4),6,1)+'/'+str(bju(4,4),6,1),t
      l=l+1
      exit
     else
**      skip
      adres=recno()
      exit
     endif
    enddo
   enddo
  select a
  skip
 enddo
 do while .t.
   ?'ИТОГО на '+lev4+':'
   ? 'Б: '
??str(itbju(1,1),6,1)+'/'+str(itbju(2,1),6,1)+'/'+str(itbju(3,1),6,1)+'/'+str(itbju(4,1),6,1),t
   ??'Ж: '
??str(itbju(1,2),6,1)+'/'+str(itbju(2,2),6,1)+'/'+str(itbju(3,2),6,1)+'/'+str(itbju(4,2),6,1),t
   ??'У: '
??str(itbju(1,3),6,1)+'/'+str(itbju(2,3),6,1)+'/'+str(itbju(3,3),6,1)+'/'+str(itbju(4,3),6,1),t
   ??'К: '
??str(itbju(1,4),6,1)+'/'+str(itbju(2,4),6,1)+'/'+str(itbju(3,4),6,1)+'/'+str(itbju(4,4),6,1),t
**   ??chr(18)
   l=l+2
   exit
enddo
 select a
 i=i+1
 do mdal
enddo
close databases
do while .t.
   ?
   ?'ВСЕГО для одного человека на день '+dtoc(dat)+' :'
   ? 'Б: '
   ??str(dnbju(1,1),6,1)+'/'+str(dnbju(2,1),6,1)+'/'+str(dnbju(3,1),6,1)+'/'+str(dnbju(4,1),6,1),t
   ??'Ж: '
   ??str(dnbju(1,2),6,1)+'/'+str(dnbju(2,2),6,1)+'/'+str(dnbju(3,2),6,1)+'/'+str(dnbju(4,2),6,1),t
   ??'У '
   ??str(dnbju(1,3),6,1)+'/'+str(dnbju(2,3),6,1)+'/'+str(dnbju(3,3),6,1)+'/'+str(dnbju(4,3),6,1),t
   ??'К: '
   ??str(dnbju(1,4),6,1)+'/'+str(dnbju(2,4),6,1)+'/'+str(dnbju(3,4),6,1)+'/'+str(dnbju(4,4),6,1),t
   l=l+3
   exit
enddo
eject
set print off
ppm='МЕHЮ ОТПЕЧАТАHО!!!'
return


