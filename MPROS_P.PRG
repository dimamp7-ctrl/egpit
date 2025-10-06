**mpros_p.prg
@12,29 say '‡€‹Ÿ ’…‚€ˆ…!!!'
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
 lev3='kod'+ltrim(str(mnom))
 select c
 use &lev1_1
 select b
 go top
 set relation to recno() into c
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
  mkuda=kuda
  mporc1=porc1
  select b
  go top
  do case
   case mkuda='zit'
    replace all zit with zit+&lev2_1*mporc1
   case mkuda='z2it'
    replace all z2it with z2it+&lev2_1*mporc1
   case mkuda='oit'
    replace all oit with oit+&lev2_1*mporc1
   case mkuda='pit'
    replace all pit with pit+&lev2_1*mporc1
   case mkuda='uit'
    replace all uit with uit+&lev2_1*mporc1
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
@12,29 say 'ˆ„…’ ‘—…’ „€›•!!!'
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
  replace itog with round(zit+z2it+oit+uit+pit,0)
  mitog=itog
  SG=0
  S=0
  if otv1=1
   do difceng
   replace rperg with rperg+(itog-mitog)
   replace surperg with surperg+SG
  endif
  if mitog>0
   xmitog=mitog
   do difcen
   replace rpern with rpern+xmitog
   replace surpern with surpern+S
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
 replace zit with zit/1000,z2it with z2it/1000,oit with oit/1000
 replace pit with pit/1000,uit with uit/1000
 replace itog with zit+z2it+oit+uit+pit
 mitog=itog
 SG=0
 S=0
 if otv1=1
  do difceng
  replace rperg with rperg+(itog-mitog)
  replace surperg with surperg+SG
 endif
 if mitog>0
  xmitog=mitog
  do difcen
  replace rpern with rpern+xmitog
  replace surpern with surpern+S
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
pp='„€›… ‘—ˆ’€›!!!'
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
 @12,29 say '„†„ˆ’… …Œƒ ...'
 do zamen
 go top
 do mnul
 go top
endif
close databases
return
