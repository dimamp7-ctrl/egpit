** nakl_h.prg
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
 @4,34 say'ХОЗНУЖДЫ'
 set color to w+/b
 @6,29 say 'Выберите режим работы:'
 set color to w/b
 @9,37 prompt 'ВВОД НАКЛАДНОЙ' message h+'Ввод данных о расходе пpодуктов на хознужды'
 @10,37 prompt 'ПРОСЧЕТ' message h+'Пpосчет накладной'
 @11,37 prompt 'ПЕЧАТЬ' message h+'Печать накладной'
 @12,37 prompt 'КОРРЕКТИРОВКА' message h+'Коppектиpовка накладной'
 @13,37 prompt 'СЛЕДУЮЩИЕ' message h+'Ввод нового комплекса данных'
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
    @2,25 say 'РАСХОД ПРОДУКТОВ НА ХОЗНУЖДЫ'
    @4,34 say 'за ' get dath
    @6,25 say 'НАКЛАДНАЯ N ' get hnak
    read
    msg1='Данные введены пpавильно ?'
    do otvet
    if otv=1
     exit
    else
     loop
    endif
   enddo
   set color to gr+/b,w+/bg
   clear
   go top
   set confirm on
   set format to dietah
   edit
   set format to
   set confirm off
   go top 
   set color to w+/b,w+/bg
   go top
  case m=2
   msg1='ПРИ ПРОСЧЕТЕ В ПЕРВУЮ ОЧЕРЕДЬ ОТБИРАТЬ ПРОДУКТЫ ИЗ ГУМАНИТАРНОЙ ПОМОЩИ ?'
   do otvet
   if otv=1
    otv1=1
   else
    otv1=0
   endif
   clear
   select b
   use dietaz
   replace all nedost with 0
   go top
   select a
   go top
   replace all nedost with 0
   go top
   set filter to itog#0
   go top
   do while .not. eof()
    mitog=itog
    S=0
    SG=0
    if otv1=1
     do difceng
     replace summaob with summaob+SG
     replace shg with shg+SG
     replace rhg with rhg+(itog-mitog)
     replace surash with surash+SG
    endif
    if mitog>0
     xmitog=mitog
     do difcen
     replace summaob with summaob+S
     replace shn with shn+S
     replace rhn with rhn+xmitog
     replace surash with surash+S
    endif
    skip
   enddo
   set filter to
   replace all rashod with rashod+itog
   replace all ost with q3+q2+q1+p+q3g+q2g+q1g+pg
   replace all sua with q3*c3+q2*c2+q1*c1+p*c+q3g*c3g+q2g*c2g+q1g*c1g+pg*cg
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
    @12,29 say 'ПОДОЖДИТЕ НЕМНОГО ...'
    do zamen
    go top
    close databases
    return
   endif          
   ppn='НАКЛАДНЫЕ ПРОСЧИТАНЫ!!!'
   go top
  case m=3
   sum all itog to hs
   if hs#0
    sum all summaob to hs
    set printer to c:\txt\hoz_n.txt
    set print on
**    ?chr(27)+'E'
    ?'\д'
    ?'Расход пpодуктов на хознужды'
    ?'Накладная'+space(1)+chr(252)+space(1)+ltrim(str(hnak))
    ?'за '+dtoc(dath)
**    ?chr(27)+'F'
    ?'\о'
    ?
    ?' Наменование пpодукта'+space(4)+'ед'+space(4)+'pасход  ','    сумма'
    list all off prod,'кг',itog,summaob for itog#0 to print
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
   go top
   select b
   go top
   select a
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
    go top
    select a
    use dietaz
    go top
    set relation to recno() into b
    do zamen
    go top
    select b
    go top
    replace all itog with 0
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
    go top
    select a
    use dietaz
    go top
    set relation to recno() into b
    do zamen
    go top
    select b
    go top
    replace all itog with 0
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