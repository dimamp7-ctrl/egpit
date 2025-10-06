**mpros.prg
if pp='„€HH›… ‘—ˆ’€H›!!!'
 clear
 @12,29 say '„€HH›… ‘—ˆ’€H›!!!'
 k=inkey(5)
 return
endif
msg1='ˆ ‘—…’… ‚ …‚“ —……„œ ’ˆ€’œ „“Š’› ˆ‡ ƒ“Œ€Hˆ’€H‰ Œ™ˆ ?'
do otvet
if otv=1
 otv1=1
else
 otv1=0
endif
clear
select a
use dnmen
go top
lev5=reccount()
go top
select b
use dietaz
replace all nedost with 0
go top
use
use dieta
go top
replace all nedost with 0
replace all itog with 0,summaob with 0
go top
if komu='…‘H€‹' 
 do mpros_p
 return
endif
@12,29 say '‡€‹HŸ ’…‚€Hˆ…!!!'
sti='°°°°°°°°°°°°°°°°°°°°'
stz='²²²²²²²²²²²²²²²²²²²²'
pro=0
j=1  &&áç¥âç¨ª ª àâ à áª« ¤ª¨ ¯® ª â¥£®à¨ï¬ ¡«î¤(1-¥,2-¥, ¨ â.¤.)
i=1
jij=0
do in
mnom=1
do while j<=4
 select a
 set filter to nom=mnom
 go top
 lev1_1='karta'+ltrim(str(mnom))+'_1'
 lev1_2='karta'+ltrim(str(mnom))+'_2'
 lev1_3='karta'+ltrim(str(mnom))+'_3'
 lev1_4='karta'+ltrim(str(mnom))+'_4'
 lev3='kod'+ltrim(str(mnom))
 select c
 use &lev1_1
 select 4
 use &lev1_2
 select 5
 use &lev1_3
 select 6
 use &lev1_4
 select b
 go top
 set relation to recno() into c
 set relation to recno() into d additive
 set relation to recno() into e additive
 set relation to recno() into f additive
 go top
 select a
 go top
 do while .not. eof()
  jij=int(100/lev5*i)
  if mod(jij,5)=0
   do in
  endif
  mkod=&lev3
  lev2_1='c->bl'+ltrim(str(mkod))
  lev2_2='d->bl'+ltrim(str(mkod))
  lev2_3='e->bl'+ltrim(str(mkod))
  lev2_4='f->bl'+ltrim(str(mkod))
  mkuda=kuda
  mporc1=porc1
  mporc2=porc2
  mporc3=porc3
  mporc4=porc4
  select b
  go top
***  replace all &mkuda with &mkuda+c->&lev2*mporc
  do case
   case mkuda='zit'
    replace all zg1 with zg1+&lev2_1*mporc1
    replace all zg2 with zg2+&lev2_2*mporc2
    replace all zg3 with zg3+&lev2_3*mporc3
    replace all zg4 with zg4+&lev2_4*mporc4
    replace all zit with zg1+zg2+zg3+zg4
   case mkuda='z2it'
    replace all z2g1 with z2g1+&lev2_1*mporc1
    replace all z2g2 with z2g2+&lev2_2*mporc2
    replace all z2g3 with z2g3+&lev2_3*mporc3
    replace all z2g4 with z2g4+&lev2_4*mporc4
    replace all z2it with z2g1+z2g2+z2g3+z2g4
   case mkuda='oit'
    replace all og1 with og1+&lev2_1*mporc1
    replace all og2 with og2+&lev2_2*mporc2
    replace all og3 with og3+&lev2_3*mporc3
    replace all og4 with og4+&lev2_4*mporc4
    replace all oit with og1+og2+og3+og4
   case mkuda='pit'
    replace all pg1 with pg1+&lev2_1*mporc1
    replace all pg2 with pg2+&lev2_2*mporc2
    replace all pg3 with pg3+&lev2_3*mporc3
    replace all pg4 with pg4+&lev2_4*mporc4
    replace all pit with pg1+pg2+pg3+pg4
   case mkuda='uit'
    replace all ug1 with ug1+&lev2_1*mporc1
    replace all ug2 with ug2+&lev2_2*mporc2
    replace all ug3 with ug3+&lev2_3*mporc3
    replace all ug4 with ug4+&lev2_4*mporc4
    replace all uit with ug1+ug2+ug3+ug4
  endcase
  go top
  select a
  skip
  i=i+1
 enddo
 set filter to
 j=j+1
 mnom=mnom+1
enddo
close databases
use dieta
go top
clear
@12,29 say 'ˆ„…’ ‘—…’ „€HH›•!!!'
sti='°°°°°°°°°°°°°°°°°°°°'
stz='²²²²²²²²²²²²²²²²²²²²'
pro=0
lev5=reccount()
go top
i=1
jij=0
do in
mitog=0
S=0
SG=0
do while i<=lev5
 jij=int(100/lev5*i)
 if mod(jij,5)=0
  do in
 endif
 *¯®¯p®£p ¬¬  "ï©æ®"
 if ediz='˜’'
  if komu='„…—H›…' 
   replace g1 with g1+zg1+z2g1+og1+pg1+ug1
   replace g2 with g2+zg2+z2g2+og2+pg2+ug2
   replace g3 with g2+zg3+z2g3+og3+pg3+ug3
   replace g4 with g4+zg4+z2g4+og4+pg4+ug4
   replace itog with round(zit+z2it+oit+uit+pit,0)
   mitog=itog
   SG=0
   S=0
  endif
  if otv1=1
   do difceng
   replace rpodg with rpodg+(itog-mitog)
   replace surpodg with surpodg+SG
  endif
  if mitog>0
   xmitog=mitog
   do difcen
   replace rpodn with rpodn+xmitog
   replace surpodn with surpodn+S
  endif
  replace summaob with S+SG
  replace rashod with rashod+itog
  replace surash with surash+summaob
  replace ost with q3+q2+q1+p+q3g+q2g+q1g+pg
  replace sua with q3*c3+q2*c2+q1*c1+p*c+q3g*c3g+q2g*c2g+q1g*c1g+pg*cg
  skip
  i=i+1
  loop
 endif
 * ª®­¥æ ¯®¤¯p®£p ¬¬ë "ï©æ®"          
 * ¯p®áç¥â
 if komu='„…—H›…' 
  replace zg1 with zg1/1000,zg2 with zg2/1000,zg3 with zg3/1000,zg4 with zg4/1000
  replace z2g1 with z2g1/1000,z2g2 with z2g2/1000,z2g3 with z2g3/1000,z2g4 with z2g4/1000
  replace og1 with og1/1000,og2 with og2/1000,og3 with og3/1000,og4 with og4/1000
  replace pg1 with pg1/1000,pg2 with pg2/1000,pg3 with pg3/1000,pg4 with pg4/1000
  replace ug1 with ug1/1000,ug2 with ug2/1000,ug3 with ug3/1000,ug4 with ug4/1000
  replace zit with zit/1000,z2it with z2it/1000,oit with oit/1000
  replace pit with pit/1000,uit with uit/1000
  replace g1 with g1+(zg1+z2g1+og1+pg1+ug1)
  replace g2 with g2+(zg2+z2g2+og2+pg2+ug2)
  replace g3 with g3+(zg3+z2g3+og3+pg3+ug3)
  replace g4 with g4+(zg4+z2g4+og4+pg4+ug4)
  replace itog with zit+z2it+oit+uit+pit
  mitog=itog
  SG=0
  S=0
 endif
 if otv1=1
  do difceng
  replace rpodg with rpodg+(itog-mitog)
  replace surpodg with surpodg+SG
 endif
 if mitog>0
  xmitog=mitog
  do difcen
  replace rpodn with rpodn+xmitog
  replace surpodn with surpodn+S
 endif
 replace itog with zit+z2it+oit+uit+pit
 replace summaob with S+SG
 replace rashod with rashod+itog
 replace surash with surash+summaob
 replace ost with q3+q2+q1+p+q3g+q2g+q1g+pg
 replace sua with q3*c3+q2*c2+q1*c1+p*c+q3g*c3g+q2g*c2g+q1g*c1g+pg*cg
 skip
 i=i+1
enddo
go top
replace all raspod with raspod+itog
replace all surpod with surpod+summaob
replace all sg1 with sg1+(summaob/itog)*(zg1+z2g1+og1+pg1+ug1) for itog#0
replace all sg2 with sg2+(summaob/itog)*(zg2+z2g2+og2+pg2+ug2) for itog#0
replace all sg3 with sg3+(summaob/itog)*(zg3+z2g3+og3+pg3+ug3) for itog#0
replace all sg4 with sg4+(summaob/itog)*(zg4+z2g4+og4+pg4+ug4) for itog#0
pp='„€HH›… ‘—ˆ’€H›!!!'
go top
***¤¥ä¨æ¨â ¯p®¤ãªâ®¢***
sum all nedost to xx
if xx#0
 select b
 use dietaz
 go top
 select a
 use dieta
 go top
 set relation to recno() into b
 do blok
 clear
 @12,29 say '„†„ˆ’… H…ŒHƒ ...'
 do zamen
 go top
 do mnul
 go top
** if post=8 .or. post=9 .or. post=10 .or. post=11
**  replace all prihodg with pprih for pprih#0
**  replace all cenag with pcen for pcen#0
**  replace all psup with prihodg*cenag
** else
**  replace all prihod with pprih for pprih#0
**  replace all cena with pcen for pcen#0
**  replace all psup with prihod*cena
** endif
endif
close databases
return

