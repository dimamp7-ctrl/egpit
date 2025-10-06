**¯¥ç âì/¯p®á¬®âp ®âç¥â 
if dtoc(dat)='  .  .  '
 data=date()
else
 data=dat
endif
mesac=''
pol=''
dimension post(10)
dimension ml(15)
select a
use dieta
go top
sum all sua to suo
do while .t.
 clear
 set color to b/b
 @0,0 clear to 24,79
 set color to w+/b,w+/bg
 @0,53 say ' <Esc>-¢ëå®¤ ¢ ƒ« ¢­®¥ ¬¥­î '
 @8,27,16,52 box
 @10,37 prompt 'ˆ•„'
 @12,37 prompt '€‘•„'
 @14,37 prompt '‘’€’Š'
 menu to w0
 do case
  case w0=1
   select b   
   use katalog
   go top
   i=1
   do while i<=10
    post(i)=nam
    skip
    i=i+1
   enddo
   use
   select a
   go top
   sum all orssup to ml(1)
   sum all podsup to ml(11)
   sum all mopsum to ml(2)
   sum all unsum to ml(3)
   sum all nassum to ml(4)
   sum all molsum to ml(5)
   sum all hlsum to ml(6)
   sum all messum to ml(14)
   sum all messn to ml(12)
   sum all sxg1 to ml(7)
   sum all sxg2 to ml(8)
   sum all sxg3 to ml(9)
   sum all sxg4 to ml(10)
   sum all messg to ml(13)
   go top
   clear
   set color to w+/b
   @8,27,14,52 box
   @10,37 prompt '‘Œ’' 
   @12,37 prompt '…—€’œ'
   menu to w2
   if w2=1
    go top
    t='|'
    t1=''
    do oprmes
    ved2='ˆ•„'
    zag1='H ¨¬¥­®¢-¥'+space(1)+' ™.‘’.'+ '™. ‘“ŒŒ€'+t+' ƒ“Œ. Œ.'+' ƒ..‘“ŒŒ€'+t+'   ˆ•„'+' ‚‘…ƒ ‘“ŒŒ€'
    name='substr(prod,1,10)'
    pole1='str(mespn,9,3)'
    pole2='str(messn,10,2)'
    pole3='str(mespg,9,3)'
    pole4='str(messg,10,2)'
    pole5='str(mesprih,9,3)'
    pole6='str(messum,10,2)'
    store 'pol' to pole7,pole8
    do prosm
   else
    if w2=2
     t='|'
     go top
     do oprmes
     ved2=' §  '+mesac+' ¬¥áïæ'
     i=1
     store 'pol' to pole17,pole18
     set printer to e:\txt\prihod1.txt
     do while i<=3     
      do case
       case i=1
        go top
        mprod='substr(prod,1,10)'
        ved1='  ’—…’  ‘’“ˆ‚˜ˆ• „“Š’€• ˆ’€HˆŸ (®¡é¨¥ ¯®áâ ¢é¨ª¨) '
zag1=space(5)+t+t+t+post(1)+space(5)+t+t+post(2)+space(5)+t+t+post(3)+space(5)+t+t+post(4)+space(5)+t+t+post(5)+space(5)+t+t+post(6)+space(3)+t+t+'    „•     || ‚‘…ƒ      ||'
        zag2='  ü|H ¨¬¥­®¢ ­¨¥'+space(1)+t+replicate('ª®«-¢® | áã¬¬   |',8)
        t='|'
        t1='|'
        t2='|'
        pole1='str(orspr,7,2)'
        pole2='str(orssup,7,2)'
        pole3='str(moppr,7,2)'
        pole4='str(mopsum,7,2)'
        pole5='str(unpr,7,2)'
        pole6='str(unsum,7,2)'
        pole7='str(naspr,7,2)'
        pole8='str(nassum,7,2)'
        pole9='str(molpr,7,2)'
        pole10='str(molsum,7,2)' 
        pole11='str(hlpr,7,2)'
        pole12='str(hlsum,7,2)'
        pole13='str(podpr,7,2)'
        pole14='str(podsup,7,2)'
        pole15='str(mespn,7,2)'
        pole16='str(messn,7,2)'
        go top
        do pechat
       case i=2
        go top
        mprod='prod'
        t='|'
        t1='|'
        t2=''
        ved1='  ’—…’  ‘’“ˆ‚˜ˆ• „“Š’€• ˆ’€HˆŸ (£ã¬ ­¨â à­ ï ¯®¬®éì) '
zag1=space(4)+t+t+t+post(7)+space(5)+t+t+post(8)+space(5)+t+t+space(4)+post(9)+space(5)+t+t+space(4)+post(10)+space(5)+t+t+space(5)+'‚‘…ƒ'
        zag2='ü|H ¨¬¥­®¢ ­¨¥ ¯à®¤ãªâ '+t+replicate('ª®«¨ç-¢®|    áã¬¬  |',5)
        pole1='str(xg1,8,2)'
        pole2='str(sxg1,8,2)'
        pole3='str(xg2,8,2)'
        pole4='str(sxg2,8,2)'
        pole5='str(xg3,8,2)'
        pole6='str(sxg3,8,2)'
        pole7='str(xg4,8,2)'
        pole8='str(sxg4,8,2)'
        pole9='str(mespg,8,2)'
        pole10='str(messg,8,2)'
        store 'pol' to pole11,pole12,pole13,pole14,pole15,pole16
        go top
        set printer to e:\txt\prihod2.txt
        do pechat
       case i=3
        go top
        mprod='prod'
        ved1='  ’—…’  ‘’“ˆ‚˜ˆ• „“Š’€• ˆ’€HˆŸ '
        zag1=''
        zag2='ü|H ¨¬¥­®¢ ­¨¥ ¯à®¤ãªâ '+t+'Š‹ˆ—…‘’‚ |       ‘“ŒŒ€|'
        t='|'
        t1=''
        t2=''
        pole1='mesprih'
        pole2='messum'
store 'pol' to pole3,pole4,pole5,pole6,pole7,pole8,pole9,pole10,pole11,pole12,pole13,pole14,pole15,pole16
        go top
        set printer to e:\txt\prihod3.txt
        do pechat
      endcase
      i=i+1
     enddo
    else
     loop
    endif
   endif
  case w0=2
   select a
   go top
   sum all sg1 to ml(1)
   sum all sg2 to ml(2)
   sum all sg3 to ml(3)
   sum all sg4 to ml(4)
   sum all surpod to ml(5)
   sum all surpodn to ml(6)
   sum all surpodg to ml(7)
   sum all surpern to ml(8)
   sum all surperg to ml(9)
   sum all (surpern+surperg) to ml(10)
   sum all shn to ml(11)
   sum all shg to ml(12)
   sum all (shn+shg) to ml(13)
   sum all surash to ml(14)
   sum all srdg+srdn to ml(15)
   go top
    clear
    set color to w+/b
    @8,27,14,52 box
    @10,37 prompt '‘Œ’' 
    @12,37 prompt '…—€’œ'
    menu to w2
     if w2=1
     dat=date()
     do oprmes
     go top
     t='|'
     t1='|'
     ved2='€‘•„ '
     zag1=' à®¤ãªâ    '+' „…—›…  | '+'   …‘€‹   | '+'  •‡“†„›    | '+'       ‚‘…ƒ'
     zag2=space(10)+'  Š-¢® '+' ‘ã¬¬  '+'| '+' Š-¢® '+' ‘ã¬¬  '+'| '+' Š-¢® '+' ‘ã¬¬  '+'| '+'     Š-¢® '+'    ‘ã¬¬  '
     name='substr(prod,1,9)'
     pole1='str(raspod,7,2)'
     pole2='str(surpod,7,2)'
     pole3='str(rpern+rperg,7,2)'
     pole4='str(surpern+surperg,7,2)'
     pole5='str(rhn+rhg,7,2)'
     pole6='str(shn+shg,7,2)'
     pole7='str(rashod,9,3)'
     pole8='str(surash,10,2)'
     do prosm
    else
     if w2=2
      go top
      do oprmes
      ved2=' §  '+mesac+' ¬¥áïæ'
      i=1
      do while i<=3
       do case
        case i=1
         set printer to e:\txt\rashod1.txt
         ved1='  ’—…’  ˆ‡€‘•„‚€HH›• „“Š’€• ˆ’€HˆŸ H€ „…—H›• (¯® £àã¯¯ ¬)'
         t='|'
         t1='|'
         t2='|'
         go top
         zag2='| |'+replicate('Š-¢®|‘ã¬¬ |',6)
         zag1=space(4)+'ü|H ¨¬¥­®¢ ­¨¥|'+'1-ï £à.||2-ï £à.||3-ï £à.||4-ï £à.||„®¯.¯¨â ­¨¥||‚‘…ƒ||'
         mprod='substr(prod,1,15)'
         pole1='str(g1,8,3)'
         pole2='str(sg1,7,2)'
         pole3='str(g2,8,3)'
         pole4='str(sg2,7,2)'
         pole5='str(g3,8,3)'
         pole6='str(sg3,7,2)'
         pole7='str(g4,8,3)'
         pole8='str(sg4,7,2)'
         pole9='str(rdg+rdn,8,3)'
         pole10='str(srdg+srdn,7,2)'
         pole11='str(raspod,9,3)'
         pole12='str(surpod,10,2)'
         store 'pol' to pole13,pole14,pole15,pole16,pole17,pole18
         do pechat
        case i=2
         set printer to e:\txt\rashod2.txt
         ved1='  ’—…’  ˆ‡€‘•„‚€HH›• „“Š’€• ˆ’€HˆŸ'
         t='|'
         t1='|'
         t2='|'
         go top
         zag2='| |'+replicate('Š-¢®|‘ã¬¬  |',9)
zag1='ü|H ¨¬¥­®¢ ­¨¥'+t+'„…—H›…'+'||||||'+'…‘H€‹'+'||||||'+'•‡H“†„›'+t
         zag3=' | |'+ replicate('™.| |ƒ“Œ.| |‚‘…ƒ| |',3) 
         mprod='substr(prod,1,6)'
         pole1='str(rpodn,7,3)'
         pole2='str(surpodn,6,2)'
         pole3='str(rpodg,7,3)'
         pole4='str(surpodg,6,2)'
         pole5='str(raspod,7,3)'
         pole6='str(surpod,6,2)'
         pole7='str(rpern,5,2)'
         pole8='str(surpern,5,2)'
         pole9='str(rperg,5,2)'
         pole10='str(surperg,5,2)'
         pole11='str(rpern+rperg,5,2)'
         pole12='str(surpern+surperg,5,2)'
         pole13='str(rhn,5,2)'
         pole14='str(shn,5,2)'
         pole15='str(rhg,5,2)'
         pole16='str(shg,5,2)'
         pole17='str(rhn+rhg,5,2)'
         pole18='str(shn+shg,5,2)'
         do pechat
        case i=3
         set printer to e:\txt\rashod3.txt
         select a
         go top
         sum all surpodn+surpern+shn to lev1
         sum all surpodg+surperg+shg to lev2
         sum all surash to lev3
         ved1='’—…’  ˆ‡€‘•„‚€HH›• „“Š’€• ˆ’€HˆŸ '
         t='|'
         t1=''
         t2=''
         go top
         zag2='| |'+replicate('Š-¢®|‘ã¬¬ |',3)
         zag1='ü|H ¨¬¥­®¢ ­¨¥ ¯à®¤ãªâ |™.‘Š‹€„||ƒ“Œ.Œ™œ||‚‘…ƒ||'
         mprod='prod'
         pole1='str(rpodn+rpern+rhn,9,3)'
         pole2='surpodn+surpern+shn'
         pole3='str(rpodg+rperg+rhg,9,3)'
         pole4='surpodg+surperg+shg'
         pole5='rashod'
         pole6='surash'
         store 'pol' to pole7,pole8,pole9,pole10
         store 'pol' to pole11,pole12,pole13,pole14,pole15,pole16,pole17,pole18
         do pechat
       endcase
       i=i+1
      enddo
  **    ! c:\printfx\printfx
     else
      loop
     endif
    endif
  case w0=3
   go top 
   sum all sua to lev1
   sum all p*c+q1*c1+q2*c2+q3*c3 to lev2
   sum all pg*cg+q1g*c1g+q2g*c2g+q3g*c3g to lev3
   go top
   clear
   set color to w+/b
   @8,27,14,52 box
   @10,37 prompt '‘Œ’' 
   @12,37 prompt '…—€’œ'
   menu to w2
   if w2=1
    go top
    t='|'
    t1=''
    do oprmes
    ved2='‘’€’Š'
    zag1='  ¨¬¥­®¢-¥'+space(1)+'.áâ â®ª'+space(1)+'  .‘ã¬¬ '+t++'ƒ..áâ-ª'+space(1)+' ƒ..‘ã¬¬ '+t+'  ‘’€’Š'+space(2)+'    ‘“ŒŒ€'
    name='substr(prod,1,10)'
    pole1='str(q3+q2+q1+p,9,3)'
    pole2='str(q3*c3+q2*c2+q1*c1+p*c,10,2)'
    pole3='str(q3g+q2g+q1g+pg,9,3)'
    pole4='str(q3g*c3g+q2g*c2g+q1g*c1g+pg*cg,10,2)'
    pole5='str(ost,9,3)'
    pole6='str(sua,10,2)'
    store 'pol' to pole7,pole8
    do prosm
   else
    if w2=2
     do oprmes
     i=1
     t='|'
     t1='|'
     t2=''
     store 'pol' to pole11,pole12,pole13,pole14,pole15,pole16,pole17,pole18
     ved2=' §  '+mesac+' ¬¥áïæ'
     mprod='prod'
     do while i<=3
      do case
       case i=1
        set printer to e:\txt\ostatok1.txt
        go top
        ved1='’—…’ H€ ‘’€’Š „“Š’‚ ˆ’€HˆŸ (®¡é¨© áª« ¤)'
        zag1='|'+'|‘’€’Š 1||‘’€’Š 2||‘’€’Š 3||‘’€’Š 4||‚‘…ƒ|'
        zag2='ü|H ¨¬¥­®¢ ­¨¥ ¯p®¤ãªâ®¢|'+replicate('ª®«¨ç¥áâ¢®|æ¥­  |',4)+'‘’€’Š|‘“ŒŒ€|'
        pole1='p'
        pole2='c'
        pole3='q1'
        pole4='c1'
        pole5='q2'
        pole6='c2'
        pole7='q3'
        pole8='c3'
        pole9='str(p+q1+q2+q3,9,3)'
        pole10='str(p*c+q1*c1+q2*c2+q3*c3,12,2)'
        lev4=lev2
        kya='||||||||||'
        do pechat
       case i=2
        set printer to e:\txt\ostatok2.txt
        go top
        ved1='’—…’ H€ ‘’€’Š „“Š’‚ ˆ’€HˆŸ (£ã¬. ¯®¬®éì)'
        zag1='|'+'|‘’€’Š 1||‘’€’Š 2||‘’€’Š 3||‘’€’Š 4||‚‘…ƒ|'
        zag2='ü| ¨¬¥­®¢ ­¨¥ ¯p®¤ãªâ®¢  '+replicate('ª®«¨ç¥áâ¢®|æ¥­  |',4)+'‘’€’Š|‘“ŒŒ€|'
        pole1='pg'
        pole2='cg'
        pole3='q1g'
        pole4='c1g'
        pole5='q2g'
        pole6='c2g'
        pole7='q3g'
        pole8='c3g'
        pole9='str(pg+q1g+q2g+q3g,9,3)'
        pole10='str(pg*cg+q1g*c1g+q2g*c2g+q3g*c3g,12,2)'
        lev4=lev3
        kya='||||||||||'
        do pechat
       case i=3
        set printer to e:\txt\ostatok3.txt
        go top
        t='|'
        t1=''
        ved1='’—…’ H€ ‘’€’Š „“Š’‚ ˆ’€HˆŸ '
        zag1=''
        zag2='ü|H ¨¬¥­®¢ ­¨¥ ¯p®¤ãªâ®¢|Š‹ˆ—…‘’‚|‘“ŒŒ€|'
        pole1='ost'
        pole2='sua'
        pole9='str(p+q1+q2+q3,9,3)'
        pole10='str(p*c+q1*c1+q2*c2+q3*c3,12,2)'
        store 'pol' to pole3,pole4,pole5,pole6,pole7,pole8,pole9,pole10,pole11,pole12,pole13,pole14,pole15,pole16
        lev4=lev1
        kya='||'
        do pechat
      endcase
      i=i+1
     enddo
    else
     loop
    endif
   endif
  case w0=0
   exit
 endcase
enddo
use
return


