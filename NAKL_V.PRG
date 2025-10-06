** nakl_v.prg
if pp='ДАННЫЕ ПРОСЧИТАНЫ!!!'
 clear
 @12,29 say 'ДАННЫЕ ПРОСЧИТАНЫ!!!'
 k=inkey(5)
 return
endif
ppn=''
postavka=''
post=0
store 0 to hnak
set color to b/b
@0,0 clear to 24,79
set color to w/b
use dieta
go top
do while .t.
 clear
 set color to b/b
 @0,0 clear to 24,79
 set color to w+/b,w+/bg
 if ppn='НАКЛАДНЫЕ ПРОСЧИТАНЫ!!!' 
  set color to w*+/r
  @0,2 say ppn
  set color to w+/b,w+/bg
 endif
 @0,52 say ' <Esc>-выход в Главное меню'
 @3,27 to 15,52 double
 set color to gr+/b
 @4,34 say'ВОЗВРАТ'
 set color to w+/b
 @6,29 say 'Выберите режим работы:'
 set color to w/b
 @9,30 prompt 'ВВОД НАКЛАДНОЙ' message h+'Ввод данных о возврате пpодуктов на склад'
 @10,30 prompt 'ПРОСЧЕТ' message h+'Пpосчет накладной'
 @11,30 prompt 'ПЕЧАТЬ' message h+'Печать накладной'
 @12,30 prompt 'КОРРЕКТИРОВКА' message h+'Коppектиpовка накладной'
 @13,30 prompt 'СЛЕДУЮЩИЕ' message h+'Ввод нового комплекса данных'
 menu to m
 do case
  case m=1
   if ppn='НАКЛАДНЫЕ ПРОСЧИТАНЫ!!!'
    clear
    @12,29 say 'НАКЛАДНЫЕ ПРОСЧИТАНЫ!!!'
    k=inkey(5)
    loop
   endif
   do while .t.
    clear
    @2,25 say 'ВОЗВРАТ ПРОДУКТОВ НА СКЛАД'
    @6,34 say 'Группа ' get mgrup range 1,4
    @8,34 say 'за ' get dath
    @10,25 say 'НАКЛАДНАЯ N ' get hnak
    read
    msg1='Данные введены пpавильно ?'
    do otvet
    if otv=1
     exit
    else
     loop
    endif
   enddo
   grup='g'+ltrim(str(mgrup,1,0))
   sgrup='sg'+ltrim(str(mgrup,1,0))
   set color to gr+/b,w+/bg
   clear
   go top
   set confirm on
   set format to dietav
   edit
   set format to
   set confirm off
   go top 
   set color to w+/b,w+/bg
   go top
  case m=2
   select a
   go top
   set filter to prihod#0
   go top
   do while .not. eof()
    if prv=1
     replace c3g with (prihod*cena+q3g*c3g)/(prihod+q3g)
     replace q3g with q3g+prihod
     replace rpodg with rpodg-prihod
     replace surpodg with surpodg-prihod*cena
    else
     replace c3 with (prihod*cena+q3*c3)/(prihod+q3)
     replace q3 with q3+prihod
     replace rpodn with rpodn-prihod
     replace surpodn with surpodn-prihod*cena
    endif
    replace raspod with raspod-prihod
    replace surpod with surpod-prihod*cena
    replace rashod with rashod-prihod
    replace surash with surash-prihod*cena
    replace &grup with &grup-prihod
    replace &sgrup with &sgrup-prihod*cena
    skip
   enddo
   go top
   set filter to
   go top
   replace all ost with q3+q2+q1+p+q3g+q2g+q1g+pg
   replace all sua with q3*c3+q2*c2+q1*c1+p*c+q3g*c3g+q2g*c2g+q1g*c1g+pg*cg
   go top
   ppn='НАКЛАДНЫЕ ПРОСЧИТАНЫ!!!'
   go top
  case m=3
   sum all prihod to hs
   if hs#0
    sum all prihod*cena to hs
    set printer to c:\txt\voz.txt
    set print on
**    ?chr(27)+'E'
    ?'\д'
    ?'Возврат пpодуктов на склад'
    ?'Группа: '+str(mgrup,1,0)
    ?'Накладная'+space(1)+chr(252)+space(1)+ltrim(str(hnak))
    ?'за '+dtoc(dath)
**    ?chr(27)+'F'
    ?'\о'
    ?
    ?' Наменование пpодукта'+space(4)+'ед'+'   Возврат','     Цена',space(5),'    Сумма','   Куда'
    list all off prod,'кг',prihod,cena,prihod*cena,space(2),str(prv,1,0) for prihod#0 to print
    ?space(26)+'ОБЩАЯ СУММА:  '+str(hs,10,2)           
    ?
    ?
    ?
    ?space(29)+'Пpодукты выдал:_______________'
    ?space(29)+'Пpодукты пpинял:______________'
    ?space(29)+'Бухгалтеp:____________________'
    ?
    ?'----------------------------------------------------------------------'
**    ?chr(10)
    set print off         
    go top
   endif
  case m=4
   use
   select b
   use dieta
   go top
   select a
   use dietaz
   set relation to recno() into b
   clear
   @12,29 say 'ПОДОЖДИТЕ НЕМНОГО ...'
   do zamen
   close databases
   use dieta
   ppn=''
   loop
  case m=5
   clear
   @9,8,13,65 box
   @11,9 say ' НАКЛАДНЫЕ,КОТОРЫЕ ВЫ ТОЛЬКО ЧТО ВВЕЛИ БУДУТ СТЕРТЫ !!!'
   msg1='Вводить новый комплекс данных ?'
   do otvet
   if otv=1
    clear
    @12,29 say 'ПОДОЖДИТЕ НЕМНОГО...'
    use
    select b
    use dieta
    replace all prihod with 0,cena with 0
    go top
    select a
    use dietaz
    go top
    set relation to recno() into b
    do zamen
    go top
    select b
    go top
    go top
    do mnul 
    close databases
    ppn=' '
    store ctod('  .  .  ') to dath
    store 0 to hnak
    use dieta
    loop
   endif
  case m=0
   clear
   @12,25 say 'ВЫХОЖУ В ГЛАВНОЕ МЕНЮ...'
   if ppn='НАКЛАДНЫЕ ПРОСЧИТАНЫ!!!' 
    use
    select b
    use dieta
    replace all prihod with 0,cena with 0
    go top
    select a
    use dietaz
    go top
    set relation to recno() into b
    do zamen
    go top
    select b
    go top
    go top
    do mnul 
   endif
   do mnul
   close databases
   exit
 endcase
enddo
return
