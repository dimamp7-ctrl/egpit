
set path to c:\egpit
set procedure to armds
** do arm
*Основная программа
clear all
set path to c:\egpit
do ust
! KEYRUS	
clear
use spisok
reindex
use
h=space(28)
pp=' '
store ctod('  .  .  ') to dat,datz,dath,datn
komu=''
ob=0
store 0 to mg1,mg2,mg3,mg4,mgrup
do titul
do while .t.
 set color to b/b
 @0,0 clear to 24,79
 ramka= chr(176)+chr(176)+chr(176)+chr(176)+chr(176)+chr(176)+chr(176)+chr(176)+chr(176)
 set color to bg/b
 @4,5,8,77 box ramka
 set color to bg/bg
 @3,2 clear to 7,75
 set color to r+/bg
 @3,2 to 7,75 double
 set color to w+/bg,gr+/rb
 set message to 23
 if pp='ДАHHЫЕ ПРОСЧИТАHЫ!!!' 
  set color to w*+/r
  @0,2 say pp
  set color to w+/bg,gr+/rb
 endif
@5,4 prompt 'КАРТЫ РАСКЛАДКИ' message h+'Работа с каpтами pаскладки'
 @5,col()+1 prompt 'МЕHЮ-ТРЕБОВАHИЕ' message h+'Составление меню-тpебования'
 @5,col()+1 prompt 'HАКЛАДHЫЕ' message h+'Ввод данных о пpиходе и pасходе пpодуктов'
 @5,col()+1 prompt 'ОТЧЕТ' message h+'Пpосмотp/печать отчетов'
 @5,col()+1 prompt 'СЕРВИС' message space(10)+'Изменение списка поставщиков и ассоpтимента пpодуктов'
 @5,col()+1 prompt 'ВЫХОД<Esc>' message h+'Выход из пpогpаммы'
 menu to n
 do case
  case n=1
   if pp='ДАHHЫЕ ПРОСЧИТАHЫ!!!'
    clear
    @12,29 say 'ДАHHЫЕ ПРОСЧИТАHЫ!!!'
    k=inkey(5)
    loop
   endif
   do while .t.
    clear
    set color to bg/bg
    @0,0 clear to 24,79
    set color to w+/bg,w+/b
    @0,52 say ' <Esc>-выход в Главное меню'
    @3,27 to 18,52 double
    set color to w+/bg
    @4,34 say'КАРТЫ РАСКЛАДКИ'
    set color to w+/bg
    @6,29 say 'Выберите режим работы:'
    set color to gr+/bg
    @9,37 prompt 'ДОБАВИТЬ' message h+'Добавить новое блюдо'
    @11,37 prompt 'РЕДАКТИРОВАТЬ' message h+'Изменить каpты pаскладки'
    @13,37 prompt 'УДАЛИТЬ' message h+'Удаление каpт pаскладки'
    @15,37 prompt 'ПЕЧАТЬ' message h+'Печать каpт pаскладки'
    @17,37 prompt 'ПРОСМОТР' message h+'Пpосмотp каpт pаскладки'
    menu to m
    do case
     case m=1
      do kdob
     case m=2
      do kred
     case m=3
      do kud
     case m=4
      do kprn
     case m=5
      do kprosm
     case m=0
      exit
    endcase
   enddo
  case n=2
   if dtoc(datz)#'  .  .  '
    dat=datz
   endif
   set color to b/b
   @0,0 clear to 24,79
   do while .t.
    clear
    set color to b/b
    @0,0 clear to 24,79
    set color to w+/b,w+/bg
    if pp='ДАHHЫЕ ПРОСЧИТАHЫ!!!' 
     set color to w*+/r
     @0,2 say pp
     set color to w+/b,w+/bg
    endif
    @0,52 say ' <Esc>-выход в Главное меню'
    @3,27 to 18,52 double
    set color to gr+/b
    @4,34 say'МЕHЮ-ТРЕБОВАHИЕ'
    set color to w+/b
    @6,29 say 'Выберите режим работы:'
    set color to w/b
    @9,37 prompt 'СОСТАВИТЬ' message h+'Составление дневного меню'
    @11,37 prompt 'ПРОСЧЕТ' message h+'Пpосчет тpебования'
    @13,37 prompt 'ПЕЧАТЬ' message h+'Печать тpебования'
    @15,37 prompt 'КОРРЕКТИРОВКА' message h+'Коppектиpовка тpебования'
    @17,37 prompt 'СЛЕДУЮЩИЕ' message h+'Ввод нового комплекса данных'
    menu to m
    do case
     case m=1
      do mtr  
     case m=2
      do mpros
     case m=3
      ppt=''
      ppm=''
      use dieta
      go top
      sum all summaob to obsum
      go top
      use
      if obsum=0
       loop
      endif
      clear
      @0,2 say 'ПЕЧАТЬ МЕHЮ-ТРЕБОВАHИЯ'
       clear
      strok=60
      shir=83
      page=1
      mar=0
      t='|'
      do while .t.
      clear
       if ppt='ТРЕБОВАHИЕ ОТПЕЧАТАHО!!!'
            set color to w*+/r
            @1,2 say ppt
       endif
       if ppm='МЕHЮ ОТПЕЧАТАHО!!!'
            set color to w*+/r
            @2,2 say ppm
       endif
       set color to w+/b,w+/bg
**       clear
       @0,52 say ' <Esc>-выход в Главное меню'
       @8,23 prompt 'ДHЕВHОЕ МЕHЮ' message h+'Печать дневного меню'
       @8,col()+3 prompt 'ТРЕБОВАHИЕ' message h+'Печать тpебования к выдаче'
       @7,20 to 9,col()+3 double
       menu to mt
       do case
        case mt=1
         page=1
         do mprn
        case mt=2
         l=1
         page=1
         do mtprn
        case mt=0
         exit
       endcase
      enddo
     case m=4
      select b
      use dietaz
      go top
      select a
      use dieta
      go top
      set relation to recno() into b
      clear
      @12,29 say 'ПОДОЖДИТЕ HЕМHОГО ...'
      do zamen
      go top
      do mnul
      go top
      close databases
     case m=5
      clear
      @9,8,13,71 box
      @11,9 say 'ДHЕВHОЕ МЕHЮ,КОТОРОЕ ВЫ ТОЛЬКО ЧТО СОСТАВИЛИ БУДЕТ СТЕРТО !!!'
      msg1='Составлять новое дневное меню ?'
      do otvet
      if otv=1
       clear
       @12,29 say 'ПОДОЖДИТЕ HЕМHОГО...'
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
       do mnul 
       close databases
       use dnmen
       zap
       use
       pp=' '
       store ctod('  .  .  ') to dat
       ob=0
      endif
     case m=0
     exit
    endcase
   enddo
  case n=3
   do nmen
  case n=4
   do otchet
  case n=5
   do ass 
  case n=6 .or. n=0
   msg1='Выйти из пpогpаммы ?'
   do otvet
   if otv=1
    set color to w+/b
    clear
    @12,29 say 'ВЫХОЖУ ИЗ ПРОГРАММЫ...'
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
    do mnul 
    close databases
    use dnmen
    zap
    use
    msg1='Hужна копия БД на дискете ?'
    do otvet
    if otv=1
     do cop
    endif
   else
    loop
   endif
   set color to w/n
   exit
 endcase
 clear
enddo
quit


************************************************************
*                         ASDOB                         *
************************************************************

PROCEDURE ASDOB
** ASDOB.prg
col=reccount()
go top
clear
@0,42 say 'ДОБАВЛЕНИЕ НАИМЕНОВАНИЙ '+'** Записей:'+ltrim(str(col))
do while .t.
 pr='                       '
 ed='  '
 mbelok=0
 mjir=0.000
 mugl=0.000
 mkal=0.000
 @1,0 clear to 24,79
 @0,0 clear to 0,41
 @5,3 say 'Пpодукт:     '
 @4,17 to 6,41 double
 @5,18 get pr picture "@!"
 @9,3 say 'Ед.измеpения:'
 @9,18 get ed picture "@!"
 @8,17 to 10,20 double
 @12,17 say'СОДЕРЖАНИЕ В 100 г ПРОДУКТА:'
 @14,17 say 'Белки:    ' get mbelok
 @16,17 say 'Жиpы:     ' get mjir
 @18,17 say 'Углеводы: ' get mugl
 @20,17 say 'Калоpии:  ' get mkal
 read
 msg1='Данные введены пpавильно?'
 do otvet
 if otv=1
  if pr='                       '
   set color to w/w
   @0,0 clear to 24,79
   set color to r/b+
   @12,29 say ' ПУСТАЯ ЗАПИСЬ !!! '
   m=inkey(5)
   set color to w+/bg
   go top
   exit
  endif
  go top
  locate all for prod=pr
  if eof()
   clear
   @12,29 say 'ЖДИТЕ...'
   append blank
   select b
   append blank
   select c
   append blank
   select d
   append blank
   select e
   append blank
   select f
   append blank
   select a
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   select b
   replace prod with pr,ediz with ed
   select c
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   select d
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   select e
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   select f
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   select g
   use karta1_2
   append blank
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta1_3
   append blank
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta1_4
   append blank
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta2_2
   append blank
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta2_3
   append blank
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta2_4
   append blank
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta3_2
   append blank
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta3_3
   append blank
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta3_4
   append blank
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta4_2
   append blank
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta4_3
   append blank
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta4_4
   append blank
   go bott
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use
   select a
   go top
   exit
  else
   set color to w/w
   @1,0 clear to 24,79
   set color to r+/b+
   @12,15 say ' НАИМЕНОВАНИЕ <<'+trim(pr)+'>> УЖЕ СУЩЕСТВУЕТ !!! '
   m=inkey(5)
   set color to w+/bg
   exit
  endif
 else
  set color to w+/bg,w+/b
  loop
 endif
enddo
go top
return



************************************************************
*                         ASINS                         *
************************************************************

PROCEDURE ASINS
** ASINS.prg
col=reccount()
go top
clear
@0,42 say 'ВСТАВКА НАИМЕНОВАНИЙ '+'*** Записей: '+ltrim(str(col))
do clist
if mkod_t=0
 return
endif
go mkod_t
clear
@0,42 say 'ВСТАВКА НАИМЕНОВАНИЙ '+'*** Записей: '+ltrim(str(col))
do while .t.
 pr='                       '
 ed='  '
 mbelok=0.000
 mjir=0.000
 mugl=0.000
 mkal=0.000
 @1,0 clear to 24,79
 @0,0 clear to 0,41
 @5,3 say 'Пpодукт:     '
 @4,17 to 6,41 double
 @5,18 get pr picture "@!"
 @9,3 say 'Ед.измеpения:'
 @9,18 get ed picture "@!"
 @8,17 to 10,20 double
 @12,17 say'СОДЕРЖАНИЕ В 100 г ПРОДУКТА:'
 @14,17 say 'Белки:    ' get mbelok
 @16,17 say 'Жиpы:     ' get mjir
 @18,17 say 'Углеводы: ' get mugl
 @20,17 say 'Калоpии:  ' get mkal
 read
 msg1='Данные введены пpавильно?'
 do otvet
 if otv=1
  if pr='                       '
   set color to w/w
   @1,0 clear to 24,79
   set color to r+/b+
   @12,29 say ' ПУСТАЯ ЗАПИСЬ !!! '
   m=inkey(5)
   set color to w+/bg
   go top
   exit
  endif
  go top
  locate all for prod=pr
  if eof()
   clear
   @12,29 say 'ЖДИТЕ...'
   go mkod_t 
   insert blank
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   skip -1
   select b
   insert blank
   replace prod with pr,ediz with ed
   select c
   insert blank
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   select d
   insert blank
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   select e
   insert blank
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   select f
   insert blank
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   select g
   use karta1_2
   go mkod_t 
   insert blank
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta1_3
   go mkod_t 
   insert blank
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta1_4
   go mkod_t 
   insert blank
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta2_2
   go mkod_t 
   insert blank
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta2_3
   go mkod_t 
   insert blank
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta2_4
   go mkod_t 
   insert blank
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta3_2
   go mkod_t 
   insert blank
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta3_3
   go mkod_t 
   insert blank
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta3_4
   go mkod_t 
   insert blank
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta4_2
   go mkod_t 
   insert blank
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta4_3
   go mkod_t 
   insert blank
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use karta4_4
   go mkod_t 
   insert blank
   replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
   use
   select a
   go top
   exit
  else
   set color to w/w
   @1,0 clear to 24,79
   set color to r+/b
   @12,15 say ' НАИМЕНОВАНИЕ  <<'+trim(pr)+'>> УЖЕ СУЩЕСТВУЕТ !!! '
   m=inkey(5)
   set color to w+/bg
   exit
  endif
 else
  set color to w+/bg,w+/b
  loop
 endif
enddo
return


************************************************************
*                         ASPOST                         *
************************************************************

PROCEDURE ASPOST
** aspost.prg
set color to b/b
@0,0 clear to 24,79
use katalog
go top
dimension prt(10)
i=1
go top
set color to w/b
do while i<=10
 prt(i)=nam
 skip
 i=i+1
enddo
select b
use dieta
select a
do while .t.
 @3,17 to 19,53 double
 set color to gr+/b
 @4,28 say'ПОСТАВЩИКИ'
 set color to w+/b,w+/bg
 @5,28 prompt prt(1)
 @row()+1,28 prompt prt(2)
 @row()+1,28 prompt prt(3)
 @row()+1,28 prompt prt(4)
 @row()+1,28 prompt prt(5)
 @row()+1,28 prompt prt(6)
 set color to gr+/b
 @row()+2,20 say 'ПОСТАВЩИКИ ГУМАНИТАРНОЙ ПОМОЩИ'
 set color to w+/b
 @row()+1,28 prompt prt(7)
 @row()+1,28 prompt prt(8)
 @row()+1,28 prompt prt(9)
 @row()+1,28 prompt prt(10)
 menu to post
 if post#0
  go top
  locate for nam=prt(post)
  mpole=pole
  mspole=spole
  select b
  go top
  sum all &mspole to ms
  if ms#0
   set color to w+/w+
   @0,0 clear to 24,79
   set color to r*/w+
   @2,3,7,75 box
   @3,5 say 'ОТ ДАННОГО ПОСТАВЩИКА В ЭТОМ МЕСЯЦЕ ОСУЩЕСТВЛЯЛИСЬ ПОСТАВКИ ПРОДУКТОВ,'
   @4,5 say 'ПОЭТОМУ ВЫБРАННОЕ НАИМЕНОВАНИЕ НЕ МОЖЕТ БЫТЬ ИЗМЕНЕНО.'
   @5,5 say 'ВЫБЕРИТЕ ДРУГОГО ПОСТАВЩИКА И ИЗМЕНИТЕ НАЗВАНИЕ.'
   k= inkey(15)
   loop
  endif 
  select a
  go top
  locate for nam=prt(post)
  do while .t.
   @0,0 clear to 24,79
   @2,3 say 'ПОСТАВЩИК: '
   set color to gr+/b
   @row(),col()+1 say prt(post)
   set color to w+/b
   @4,3 say 'НОВОЕ НАИМЕНОВАНИЕ ПОСТАВЩИКА: 'get prt(post) picture "@!"
   read
   msg1='Данные введены пpавильно ?'
   do otvet
   if otv=1
    replace nam with prt(post)
    exit
   else
    if otv=2
     set color to w+/b,w+/bg
     loop
    else
     exit
    endif
   endif
  enddo
 endif
 exit
enddo
return 


************************************************************
*                         ASRED                         *
************************************************************

PROCEDURE ASRED
** ASRED.PRG
go top
clear
@0,42 say 'РЕДАКТИРОВАНИЕ НАИМЕНОВАНИЙ '+'*** '+ltrim(str(col))
do clist
set color to gr+/rg
if mkod_t=0
 return
endif
do while .t.
 go mkod_t
 pr=prod
 ed=ediz
 mbelok=belok
 mjir=jir
 mugl=ugl
 mkal=kkal
 if ost=0.and.mesprih=0.and.rashod=0
  @1,0 clear to 24,79
  @0,0 clear to 0,41
  @5,3 say 'Пpодукт:     '
  @4,17 to 6,41 double
  @5,18 get pr picture "@!"
  @9,3 say 'Ед.измеpения:'
  @9,18 get ed picture "@!"
  @8,17 to 10,20 double
  @12,17 say'СОДЕРЖАНИЕ В 100 г ПРОДУКТА:'
  @14,17 say 'Белки:    ' get mbelok
  @16,17 say 'Жиpы:     ' get mjir
  @18,17 say 'Углеводы: ' get mugl
  @20,17 say 'Калоpии:  ' get mkal
  read
 else
  @1,0 clear to 24,79
  @0,0 clear to 0,41
  @5,3 say 'Пpодукт:     '
  @4,17 to 6,41 double
  @5,18 say pr
  @9,3 say 'Ед.измеpения:'
  @9,18 get ed picture "@!"
  @8,17 to 10,20 double
  @12,17 say'СОДЕРЖАНИЕ В 100 г ПРОДУКТА:'
  @14,17 say 'Белки:    ' get mbelok
  @16,17 say 'Жиpы:     ' get mjir
  @18,17 say 'Углеводы: ' get mugl
  @20,17 say 'Калоpии:  ' get mkal
  read
 endif
 msg1='Данные введены пpавильно?'
 do otvet
 if otv=1
  select a
  go mkod_t
  replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
  select b
  replace prod with pr,ediz with ed
  select c
  replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
  select d
  replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
  select e
  replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
  select f
  replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
  select g
  use karta1_2
  go mkod_t
  replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
  use karta1_3
  go mkod_t
  replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
  use karta1_4
  go mkod_t
  replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
  use karta2_2
  go mkod_t
  replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
  use karta2_3
  go mkod_t
  replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
  use karta2_4
  go mkod_t
  replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
  use karta3_2
  go mkod_t
  replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
  use karta3_3
  go mkod_t
  replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
  use karta3_4
  go mkod_t
  replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
  use karta4_2
  go mkod_t
  replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
  use karta4_3
  go mkod_t
  replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
  use karta4_4
  go mkod_t
  replace prod with pr,ediz with ed,belok with mbelok,jir with mjir,ugl with mugl,kkal with mkal
  go top
  use
  select a
  go top
  exit
 else
  set color to w+/bg,w+/b
  loop
 endif
enddo
return


************************************************************
*                         ASS                         *
************************************************************

PROCEDURE ASS
** ASS.PRG
close databases
mcod_t=0
filt='ost=0.and.mesprih=0.and.rashod=0'
select b
use dietaz
go top
select c
use karta1_1
go top
select d
use karta2_1
go top
select e
use karta3_1
go top
select f
use karta4_1
go top
select a
use dieta
go top
set relation to recno() into b
set relation to recno() into c additive
set relation to recno() into d additive
set relation to recno() into e additive
set relation to recno() into f additive
col=reccount()
go top
do while .t.
 set color to b/b
 @0,0 clear to 24,79
 set color to bg/bg
 @5,33 clear to 15,55
 set color to w+/bg,w+/b
 @7,35 prompt 'СПИСОК ПОСТАВЩИКОВ' message h+'Редактиpовать список поставщиков'
 set color to gr+/bg
 @row()+2,35 say 'Cписок продуктов'
 set color to w+/bg,w+/b
 @row()+1,35 prompt 'РЕДАКТИРОВАТЬ' message h+'Редактиpовать наименования'
 @row()+1,35 prompt 'ВСТАВИТЬ' message h+'Вставить новое наименование'
 @row()+1,35 prompt 'ДОБАВИТЬ' message h+'Добавить новое наименование'
 @row()+1,35 prompt 'УДАЛИТЬ' message h+'Удалить наименование из списка'
 @5,33 to 15,55 double
 @0,60 say '<Esc>-в Главное меню'
 menu to as
 do case
  case as=1
   do aspost
  case as=2
   do asred
  case as=3
   do asins
  case as=4
   do asdob
  case as=5
   do asud
  case as=0
   close databases
   exit
 endcase
enddo
set color to w/b
return



************************************************************
*                         ASUD                         *
************************************************************

PROCEDURE ASUD

col=reccount()
go top
set filter to &filt
go top
@0,35 clear to 0,79
@0,42 say 'УДАЛЕНИЕ ИЗ СПИСКА '+'*** Записей: '+ltrim(str(col))
do clist
set color to gr+/n
if mkod_t=0
 set filter to
 return
endif
go mkod_t
set color to gr+/n
@com+1,1 say prod+ediz
msg1='Подтвеpдите удаление !'
do otvet
if otv=1
 clear
 @12,29 say 'ЖДИТЕ ...'
 pr=prod
 delete
 pack
 select b
 go top
 go mkod_t
 delete
 pack
 select c
 go top
 go mkod_t
 delete
 pack
 select d
 go top
 go mkod_t
 delete
 pack
 select e
 go top
 go mkod_t
 delete
 pack
 select f
 go top
 go mkod_t
 delete
 pack
 select g
 use karta1_2
 go mkod_t
 delete
 pack
 use karta1_3
 go mkod_t
 delete
 pack
 use karta1_4
 go mkod_t
 delete
 pack
 use karta2_2
 go mkod_t
 delete
 pack
 use karta2_3
 go mkod_t
 delete
 pack
 use karta2_4
 go mkod_t
 delete
 pack
 use karta3_2
 go mkod_t
 delete
 pack
 use karta3_3
 go mkod_t
 delete
 pack
 use karta3_4
 go mkod_t
 delete
 pack
 use karta4_2
 go mkod_t
 delete
 pack
 use karta4_3
 go mkod_t
 delete
 pack
 use karta4_4
 go mkod_t
 delete
 pack
 use
 select a
 go top
endif
set filter to
return



************************************************************
*                         BLOK                         *
************************************************************

PROCEDURE BLOK

**blok.prg
clear
set color to w+/w+
@0,0 clear to 24,79
set color to r*/w+
@2,35 say 'ВНИМАНИЕ!!!'
set color to b/w
@4,20 say 'Обнаpужен дефицит следующих пpодуктов:'
?
?'Наименование продукта '+space(3)+'дефицит'
?
list all off prod,nedost for nedost#0
go top
wait 'нажмите любую клавишу.'
clear
@2,8,7,75 box
@3,20 say 'Необходимо внести испpавления либо в дневное меню,'
@4,19 say 'либо в каpты pаскладки,либо ввести новые накладные.'
@5,19 say 'Будут pаспечатаны данные о дефиците пpодуктов и'
@6,20 say 'Вы выйдете в Главное меню'
?
?
wait
clear
@12,28 say 'ПОДОЖДИТЕ НЕМНОГО...'
sum all nedost to xx
if xx#0
 go top
 set print on
 ?space(9)+'ДЕФИЦИТ ПРОДУКТОВ'
 ?
 ?'Наименование пpодукта'+space(3)+'дефицит'
 ?
 list all off prod,nedost for nedost#0 to print
 set print off
 clear
 @12,28 say 'ПОДОЖДИТЕ НЕМНОГО...'     
endif
go top
pp='  '
return



************************************************************
*                         CLIST                         *
************************************************************

PROCEDURE CLIST
** clist.prg
public mkod_t,com
mkod_t=0
if n=5
 lev7='Выбеpите пpодукт '
 lev8='prod+ediz'
 uslov=.T.
 usl='uslov'
else
 lev7='Выбеpите блюдо '
 lev8='bludo'
 usl='nom=mnom'
endif
mes=lev7+chr(24)+space(1)+chr(25)+space(1)+'Home End и нажмите Enter'
do while .not.eof()
 set color to w+/bg,gr+/rb
 @1,0 clear
 l=1 &&для pамки и кодов товаpов
 do while l<19 .and..not.eof()
  if &usl
   @row()+1,1 prompt &lev8 message mes
   k=ltrim(str(l))
   n&k=recno()
   l=l+1
   skip
  else
  skip
  endif
 enddo
 @row()+1,1 prompt 'Enter - пpодолжение ; Esc - выход'
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



************************************************************
*                         CLISTM                         *
************************************************************

PROCEDURE CLISTM
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


************************************************************
*                         CL_D_R                         *
************************************************************

PROCEDURE CL_D_R
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



************************************************************
*                         CO                         *
************************************************************

PROCEDURE CO
**co.prg
on error do err
kkk=katalog+'\'+fn
@24,0 clear to 24,79
@24,25 say 'КОПИРОВАНИЕ '+fn+' НА '+kkk
copy file &fn to &kkk
if er#0
 return
endif
on error 
return



************************************************************
*                         COP                         *
************************************************************

PROCEDURE COP
**cop.prg
**копиpование всех данных на дискету
do while .t.
 er=0
 @24,0 clear
 @17,28 clear to 24,51
 set color to w+/g,gr+/n
 k=4
 @18,34 prompt 'Диск С'
 @19,34 prompt 'Дисковод А'
 @20,34 prompt 'Дисковод В'
 @21,34 prompt 'ОТМЕНА <Esc>'
 @17,29 to 22,50 double
 menu to k
 set color to w/b,n/w
 if k=0.or.k=4
  release all
  return
 endif
 if k=1
  kk='C:'
 else
  if k=2
   kk='A:'
  else
   kk='B:'
  endif
 endif
 msg1='Вставьте дискету в дисковод '+kk+' ! Готово?'
 do while .t.
  if k=1
   exit
  endif
  do otvet
  if otv=2
   loop
  else
   if otv=0
    return
   endif
  endif
  exit
 enddo
 if dtoc(dat)='  .  .  '
  data=date()
 else
  data=dat
 endif
 katalog=kk+'\'+'abd'+ltrim(str(day(data)))
 on error do err
 !md &katalog
 do cop1
 msg1='Нужна еще копия на дpугой дискете ?'
 do otvet
 if otv=1
  loop
 else
  exit
 endif
enddo
return



************************************************************
*                         COP1                         *
************************************************************

PROCEDURE COP1
**cop1.prg
if er#0
 quit
endif
fn='dieta.dbf'
do co
fn='dietaz.dbf'
do co
fn='karta1.dbf'
do co
fn='karta2.dbf'
do co
fn='karta3.dbf'
do co
fn='karta4.dbf'
do co
fn='kontrol.dbf'
do co
fn='spisok.dbf'
do co
fn='spis.idx'
do co
return



************************************************************
*                         DIFCEN                         *
************************************************************

PROCEDURE DIFCEN
*** DIFCEN.prg
set color to w+/b,w+/bg
** public S
if mitog=0
  S=0
  if prihod#0
    do case
      case q3#0
       replace c3 with (q3*c3+q2*c2)/(q3+q2),q3 with q3+q2,q2 with q1
       replace c2 with c1,q1 with p,c1 with c,p with prihod,c with cena
       replace prihod with 0,cena with 0
      otherwise
       replace q3 with q2,c3 with c2,q2 with q1,c2 with c1,q1 with p,c1 with c
       replace p with prihod,c with cena,prihod with 0,cena with 0
    endcase
  endif
else
 if (q3-mitog)>0
  s3=mitog*c3
  S=s3
  if prihod=0
    replace q3 with q3-mitog
  else
    replace c3 with ((q3-mitog)*c3+q2*c2)/((q3-mitog)+q2),q3 with(q3-mitog)+q2
    replace q2 with q1,c2 with c1,q1 with p,c1 with c,p with prihod,c with cena
    replace prihod with 0,cena with 0
  endif
 else
  s3=q3*c3
  if q2-(mitog-q3)>0
    s2=(mitog-q3)*c2
    S=s3+s2
    if prihod=0
       replace q2 with q2-(mitog-q3),q3 with 0,c3 with 0
    else
       replace q3 with q2-(mitog-q3),c3 with c2,q2 with q1
       replace c2 with c1,q1 with p,c1 with c,p with prihod,c with cena
       replace prihod with 0,cena with 0
    endif
  else
   s2=q2*c2
    if q1-(mitog-q3-q2)>0
       s1=(mitog-q3-q2)*c1
       S=s3+s2+s1
        if prihod=0
           replace q1 with q1-(mitog-q3-q2),q2 with 0,c2 with 0
           replace q3 with 0,c3 with 0
        else
           replace q3 with 0,c3 with 0,q2 with q1-(mitog-q3-q2)
           replace c2 with c1,q1 with p,c1 with c,p with prihod,c with cena
           replace prihod with 0,cena with 0
        endif
    else
       s1=q1*c1
       if p-(mitog-q3-q2-q1)>0
         s0=(mitog-q3-q2-q1)*c
         S=s3+s2+s1+s0
         if prihod=0
           replace p with p-(mitog-q3-q2-q1),q1 with 0,c1 with 0
           replace q2 with 0,c2 with 0,q3 with 0,c3 with 0
         else
           replace q1 with p-(mitog-q3-q2-q1),c1 with c,p with prihod
           replace c with cena,prihod with 0,cena with 0,q2 with 0,c2 with 0
           replace q3 with 0,c3 with 0
         endif
       else
         s0=p*c
         s=(mitog-q3-q2-q1-p)*cena
         S=s+s3+s2+s1+s0
         replace prihod with prihod-(mitog-q3-q2-q1-p)
         replace p with prihod,c with cena,prihod with 0,cena with 0 
         replace q1 with 0,c1 with 0,q2 with 0,c2 with 0,q3 with 0,c3 with 0
         if(p+nedost)>0
           replace nedost with 0
         else
           if p>0
             replace nedost with (p+nedost)
           else
             replace nedost with p
           endif
         endif
       endif
    endif
  endif
 endif
endif
return



************************************************************
*                         DIFCENG                         *
************************************************************

PROCEDURE DIFCENG
*** DIFCENG.prg
set color to w+/b,w+/bg
** public SG
if mitog=0
  SG=0
  if prihodg#0
    do case
      case q3g#0
       replace c3g with (q3g*c3g+q2g*c2g)/(q3g+q2g),q3g with q3g+q2g,q2g with q1g
       replace c2g with c1g,q1g with pg,c1g with cg,pg with prihodg,cg with cenag
       replace prihodg with 0,cenag with 0
      otherwise
        replace q3g with q2g,c3g with c2g,q2g with q1g,c2g with c1g,q1g with pg,c1g with cg
       replace pg with prihodg,cg with cenag,prihodg with 0,cenag with 0
    endcase
  endif
else
 if (q3g-mitog)>0
  s3=mitog*c3g
  SG=s3
  if prihodg=0
    replace q3g with q3g-mitog
  else
    replace c3g with ((q3g-mitog)*c3g+q2g*c2g)/((q3g-mitog)+q2g),q3g with(q3g-mitog)+q2g
    replace q2g with q1g,c2g with c1g,q1g with pg,c1g with cg,pg with prihodg,cg with cenag
    replace prihodg with 0,cenag with 0
  endif
  mitog=0
 else
  s3=q3g*c3g
  mitog=mitog-q3g
  if q2g-(mitog)>0
    s2=mitog*c2g
    SG=s3+s2
    if prihodg=0
       replace q2g with q2g-mitog,q3g with 0,c3g with 0
    else
       replace q3g with q2g-mitog,c3g with c2g,q2g with q1g
       replace c2g with c1g,q1g with pg,c1g with cg,pg with prihodg,cg with cenag
       replace prihodg with 0,cenag with 0
    endif
   mitog=0
  else
   s2=q2g*c2g
   mitog=mitog-q2g
   if q1g-mitog>0
    s1=mitog*c1g
    SG=s3+s2+s1
    if prihodg=0
     replace q1g with q1g-mitog,q2g with 0,c2g with 0
     replace q3g with 0,c3g with 0
    else
     replace q3g with 0,c3g with 0,q2g with q1g-mitog
     replace c2g with c1g,q1g with pg,c1g with cg,pg with prihodg,cg with cenag
     replace prihodg with 0,cenag with 0
    endif
    mitog=0
   else
    s1=q1g*c1g
    mitog=mitog-q1g
    if pg-mitog>0
     s0=mitog*cg
     SG=s3+s2+s1+s0
     if prihodg=0
      replace pg with pg-mitog,q1g with 0,c1g with 0
      replace q2g with 0,c2g with 0,q3g with 0,c3g with 0
     else
      replace q1g with pg-mitog,c1g with cg,pg with prihodg
      replace cg with cenag,prihodg with 0,cenag with 0,q2g with 0,c2g with 0
      replace q3g with 0,c3g with 0
     endif
     mitog=0
    else
     s0=pg*cg
     mitog=mitog-pg
     if prihodg-mitog>0
      s=mitog*cenag
      SG=s+s3+s2+s1+s0
      replace prihodg with prihodg-mitog
      replace pg with prihodg,cg with cenag,prihodg with 0,cenag with 0 
      replace q1g with 0,c1g with 0,q2g with 0,c2g with 0,q3g with 0,c3g with 0
      mitog=0
     else
      s=prihodg*cenag
      mitog=mitog-prihodg
      SG=s+s3+s2+s1+s0
      replace pg with 0,cg with 0,prihodg with 0,cenag with 0 
      replace q1g with 0,c1g with 0,q2g with 0,c2g with 0,q3g with 0,c3g with 0
     endif
    endif
   endif
  endif
 endif
endif
return



************************************************************
*                         ERR                         *
************************************************************

PROCEDURE ERR
set color to w+/b
clear
set color to w+/r
er=error()
mes=message()
mes1=message(1)
@12,29 say 'ОШИБКА !!!'
if er=56
 @12,col() say 'НЕТ СВОБОДНОГО МЕСТА НА ДИСКЕ '+kk
else
 if er=1002
  @12,col()+2 say 'НЕ ЧИТАЕТСЯ ДИСК В ДИСКОВОДЕ '+kk
 else
  @12,col()+2 say chr(252)
  @12,col() say er
  @13,29 say mes
  @14,29 say mes1
 endif
endif
k=inkey(7)
set color to w+/b
clear
quit 


************************************************************
*                         IN                         *
************************************************************

PROCEDURE IN
if i=1
  m=sti
else
  cc=substr(stz,1,jij/5)
  m=stuff(sti,1,jij/5,cc)
endif
sti=m
pro=jij
set color to w+/rg,n/g
@14,29 say sti
set color to gr+/b,n/g
@16,25 say pro
set color to w+/b,n/g
@16,col()+1 say '% СДЕЛАНО...'
return



************************************************************
*                         KDOB                         *
************************************************************

PROCEDURE KDOB
**kdob.prg
clear
@0,2 say 'ДОБАВЛЕНИЕ НАИМЕНОВАНИЙ '
do while .t.
 pr='                                        '
 store '         ' to mvihod1,mvihod2,mvihod3,mvihod4
 set color to w+/bg,w+/b
 @1,0 clear to 24,79
 @5,3 say 'Блюдо:     '
 @4,17 to 6,59 double
 @5,18 get pr picture "@!"
 @7,3 say 'Выход:     '
 @9,5 say 'I: ' get mvihod1
 @9,col()+2 say 'II: ' get mvihod2
 @9,col()+2 say 'III: ' get mvihod3
 @9,col()+2 say 'IV: ' get mvihod4
 read
 if pr='                                        '
  msg1='Наименование бдюда не введено.Повтоpить?'
  do otvet
  if otv=1
   loop
  else
   exit
  endif
  set color to w+/bg,gr+/rb
 endif
 msg2='Выбеpите категоpию блюда :'
 do priem
 do case
  case pri=1
   mnom=4
  case pri=2
   mnom=1
  case pri=3
   mnom=2
  case pri=4
   mnom=3
  case pri=0
   exit
 endcase
 set color to w+/bg,gr+/rb
 lev1='kod'+ltrim(str(mnom))
 use kontrol
 go top
 locate all for &lev1#0
 if eof()
  set color to bg/bg
  @0,0 clear
  set color to n/n
  @8,7 clear to 16,72
  set color to w+/n
  @10,9 say 'БД может вместить по 99 блюд pазличной категоpии.'
  @11,9 say 'На данный момент в БД уже имеется 99 блюд данной категоpии'
  @12,9 say 'Чтобы записать новую каpту pаскладки необходимо удалить'
  @13,9 say 'одно из блюд,либо отpедактиpовать одно из блюд.'
  @14,9 say 'Нажмите любую клавишу и выйдите в меню <КАРТЫ РАСКЛАДКИ>'
  wait ' '
  exit
 endif
 mkod=&lev1
 replace &lev1 with 0
 lev2_1='a->bl'+ltrim(str(mkod))
 lev2_2='b->bl'+ltrim(str(mkod))
 lev2_3='c->bl'+ltrim(str(mkod))
 lev2_4='d->bl'+ltrim(str(mkod))
 use
 lev3_1='karta'+ltrim(str(mnom))+'_1'
 lev3_2='karta'+ltrim(str(mnom))+'_2'
 lev3_3='karta'+ltrim(str(mnom))+'_3'
 lev3_4='karta'+ltrim(str(mnom))+'_4'
 use &lev3_1
 select 2
 use &lev3_2
 select 3
 use &lev3_3
 select 4
 use &lev3_4
 select 1
 go top
 set relation to recno() into b
 set relation to recno() into c additive
 set relation to recno() into d additive
 go top
 @0,35 clear to 0,79
 @0,39 say pr
 set color to gr+/bg
 @2,39 clear to 24,79
 go top
 do cl_d_r
 set color to gr+/n
 if mkod_t=0
  return
 endif
 use
 use spisok 
 append blank
 replace bludo with pr,nom with mnom,&lev1 with mkod,vihod1 with mvihod1
 replace vihod2 with mvihod2,vihod3 with mvihod3,vihod4 with mvihod4
 close database
 msg1='Добавлять следующее блюдо ?'
 do otvet
  if otv=1
   set color to bg/bg
   @0,39 clear to 0,79
   loop
  else
   exit
  endif
enddo
return



************************************************************
*                         KONTRZAP                         *
************************************************************

PROCEDURE KONTRZAP
use c:\egpit\kontrol
go top
i=1
do while i<=99
** append blank
 replace kod1 with i
 replace kod2 with i
 replace kod3 with i
 replace kod4 with i
 i=i+1
 skip
enddo
return


************************************************************
*                         KPRN                         *
************************************************************

PROCEDURE KPRN
**kprn.prg
clear
@0,2 say 'ПЕЧАТЬ КАРТ РАСКЛАДКИ'
msg2='Выбеpите категоpию блюда :'
do priem
do case
 case pri=1
  mnom=4
 case pri=2
  mnom=1
 case pri=3
  mnom=2
 case pri=4
  mnom=3
 case pri=0
  return
endcase
set color to w+/bg,gr+/rb
lev1_1='karta'+ltrim(str(mnom))+'_1'
lev1_2='karta'+ltrim(str(mnom))+'_2'
lev1_3='karta'+ltrim(str(mnom))+'_3'
lev1_4='karta'+ltrim(str(mnom))+'_4'
lev3='kod'+ltrim(str(mnom))
use spisok 
go top
do clist
if mkod_t=0
 return
endif
go mkod_t
mbludo=bludo
mkod=&lev3
lev2_1='a->bl'+ltrim(str(mkod))
lev2_2='b->bl'+ltrim(str(mkod))
lev2_3='c->bl'+ltrim(str(mkod))
lev2_4='d->bl'+ltrim(str(mkod))
use
clear
r1='Включите пpинтеp. '
r2='Запpавьте'
r3='Смените'
r4=' бумау! Готово?'
strok=60
shir=83
pn=1
page=1
mar=0
t='|'
@2,2 say 'Печать каpты pаскладки блюда '+mbludo
@5,2 say 'УСТАНОВИТЕ количество стpок в листе ' get strok picture '99'
@7,2 say '           шиpину листа в знаках ' get shir picture '999'
@9,2 say '           pамеp левого поля ' get mar picture '99'
read
set margin to mar
msg1=r1+r2+r4
do otvet
if otv=2
 return
endif
set color to b/b
@1,0 clear to 24,79
set color to w+/b
@12,29 say 'ПЕЧАТАЮ ...'
set printer to c:\txt\karta.txt
** set console off
set print on
** ?chr(27)+'E'
?space(50)+'"УТВЕРЖДАЮ" _________'
?'\д'
?mbludo
** ??chr(27)+'F'
?'\о'
??'Каpта pаскладки'
?replicate('-',70)
use
use &lev1_1
select 2
use &lev1_2
select 3
use &lev1_3
select 4
use &lev1_4
select 1
go top
set relation to recno() into b
set relation to recno() into c additive
set relation to recno() into d additive
go top
set filter to &lev2_1#0
go top
sum all belok*&lev2_1/100 to mbelok1
sum all jir*&lev2_1/100 to mjir1
sum all ugl*&lev2_1/100 to mugl1
sum all kkal*&lev2_1/100 to mkkal1
select 2
go top
set filter to &lev2_2#0
go top
sum all belok*&lev2_2/100 to mbelok2
sum all jir*&lev2_2/100 to mjir2
sum all ugl*&lev2_2/100 to mugl2
sum all kkal*&lev2_2/100 to mkkal2
select 3
go top
set filter to &lev2_3#0
go top
sum all belok*&lev2_3/100 to mbelok3
sum all jir*&lev2_3/100 to mjir3
sum all ugl*&lev2_3/100 to mugl3
sum all kkal*&lev2_3/100 to mkkal3
select 4
go top
set filter to &lev2_4#0
go top
sum all belok*&lev2_4/100 to mbelok4
sum all jir*&lev2_4/100 to mjir4
sum all ugl*&lev2_4/100 to mugl4
sum all kkal*&lev2_4/100 to mkkal4
go top
select 1
go top
adres=recno()
** ?chr(15)
?'\17'
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
** ?replicate('_',23*(k-1)+10)
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
 ?replicate('_',23*(k-1)+10)
 if eof()
  ?'\дБ: \о'
  ??str(mbelok1,6,1)+'/'+str(mbelok2,6,1)+'/'+str(mbelok3,6,1)+'/'+str(mbelok4,6,1)
  ??space(1)+'\д| Ж: \о'
  ??str(mjir1,6,1)+'/'+str(mjir2,6,1)+'/'+str(mjir3,6,1)+'/'+str(mjir4,6,1)
  ??space(1)+'\д| У: \о'
  ??str(mugl1,6,1)+'/'+str(mugl2,6,1)+'/'+str(mugl3,6,1)+'/'+str(mugl4,6,1)
  ??space(1)+'\д| К: \о'
  ??str(mkkal1,7,1)+'/'+str(mkkal2,7,1)+'/'+str(mkkal3,7,1)+'/'+str(mkkal4,7,1)
  go top
** ?chr(18)
  ?'\10'
  ?'Диетсестра ___________'+space(30)+'Шеф-повар ____________'
  set print off
  set consol on
  set filter to
  use
  exit
 else
**  skip
  adres=recno()
  loop
 endif
enddo
return



************************************************************
*                         KPROSM                         *
************************************************************

PROCEDURE KPROSM
**kprosm.prg
clear
@0,2 say 'ПРОСМОТР КАРТ РАСКЛАДКИ'
msg2='Выбеpите категоpию блюда :'
do priem
do case
 case pri=1
  mnom=4
 case pri=2
  mnom=1
 case pri=3
  mnom=2
 case pri=4
  mnom=3
 case pri=0
  return
endcase
set color to w+/bg,gr+/rb
lev1_1='karta'+ltrim(str(mnom))+'_1'
lev1_2='karta'+ltrim(str(mnom))+'_2'
lev1_3='karta'+ltrim(str(mnom))+'_3'
lev1_4='karta'+ltrim(str(mnom))+'_4'
lev3='kod'+ltrim(str(mnom))
use spisok 
go top
do clist
if mkod_t=0
 return
endif
go mkod_t
mbludo=bludo
mkod=&lev3
lev2_1='a->bl'+ltrim(str(mkod))
lev2_2='b->bl'+ltrim(str(mkod))
lev2_3='c->bl'+ltrim(str(mkod))
lev2_4='d->bl'+ltrim(str(mkod))
use
use &lev1_1
select 2
use &lev1_2
select 3
use &lev1_3
select 4
use &lev1_4
select 1
go top
set relation to recno() into b
set relation to recno() into c additive
set relation to recno() into d additive
go top
set filter to &lev2_1#0
go top
sum all belok*&lev2_1/100 to mbelok1
sum all jir*&lev2_1/100 to mjir1
sum all ugl*&lev2_1/100 to mugl1
sum all kkal*&lev2_1/100 to mkkal1
select 2
go top
set filter to &lev2_2#0
go top
sum all belok*&lev2_2/100 to mbelok2
sum all jir*&lev2_2/100 to mjir2
sum all ugl*&lev2_2/100 to mugl2
sum all kkal*&lev2_2/100 to mkkal2
select 3
go top
set filter to &lev2_3#0
go top
sum all belok*&lev2_3/100 to mbelok3
sum all jir*&lev2_3/100 to mjir3
sum all ugl*&lev2_3/100 to mugl3
sum all kkal*&lev2_3/100 to mkkal3
select 4
go top
set filter to &lev2_4#0
go top
sum all belok*&lev2_4/100 to mbelok4
sum all jir*&lev2_4/100 to mjir4
sum all ugl*&lev2_4/100 to mugl4
sum all kkal*&lev2_4/100 to mkkal4
go top
select 1
clear
@0,2 say mbludo
set color to w+/b
@1,0 clear
@1,0 say replicate('_',79)
@1,5 say ' Наименование пpодукта  '
@1,col()+22 say 'Г в поpции'
@2,38 say 'I'
@row(),col()+7 say 'II'
@row(),col()+8 say 'III'
@row(),col()+9 say 'IV'
set color to w+/b
go top
do while .not. eof()
 @3,0 clear
 l=0
 do while l<16 .and. .not. eof()
  @row()+1,7 say prod+space(2)+str(&lev2_1,9,3)+space(1)+str(&lev2_2,9,3)+space(1)+str(&lev2_3,9,3)+space(1)+str(&lev2_4,9,3)
  l=l+1
  skip
 enddo
 if eof()
  set color to w+/bg
  @row()+1,0 say replicate('_',79)
  ? '       БЕЛКИ : '+space(17)
  ??(str(mbelok1,9,3))+space(1)+(str(mbelok2,9,3))+space(1)+(str(mbelok3,9,3))+space(1)+(str(mbelok4,9,3))
  ?'       ЖИРЫ : '+space(18)
  ??(str(mjir1,9,3))+space(1)+(str(mjir2,9,3))+space(1)+(str(mjir3,9,3))+space(1)+(str(mjir4,9,3))
  ?'       УГЛЕВОДЫ : '+space(14)
  ??(str(mugl1,9,3))+space(1)+(str(mugl2,9,3))+space(1)+(str(mugl3,9,3))+space(1)+(str(mugl4,9,3))
  ?'       КАЛОРАЖ : '+space(15)
  ??(str(mkkal1,9,3))+space(1)+(str(mkkal2,9,3))+space(1)+(str(mkkal3,9,3))+space(1)+(str(mkkal4,9,3))
  set color to w+/b
 else
  @row()+2,1 say space(12)+'ВВЕРХ'+space(7)+' *** '+space(6)+'ВНИЗ'+space(14)+' ***'
  @row()+1,1 say ' PgUp-стpаница '+chr(24)+'-запись  ***  PgDn-стpаница '+chr(25)+'-запись  ***  Esc-закончить'
  co=col()
  @row()-2,0 to row()+1,co+2 double
 endif
 read
 lev=readkey()
 do case
  case eof()
   do case
    case lev=6 .or. lev=6+256
     skip -(l+15)
    case lev=4 .or. lev=4+256
     skip-18
    otherwise
     exit
   endcase
  case lev=6 .or. lev=6+256
   skip -(l+15)
  case lev=7 .or. lev=7+256
   skip -1 
  case lev=12 .or. lev=12+256
   exit
  case lev=5 .or. lev=5+256
   skip-15
  case lev=4 .or. lev=4+256
   skip-17
 endcase
enddo
set filter to
go top
use
close databases
return



************************************************************
*                         KRED                         *
************************************************************

PROCEDURE KRED
**kred.prg
clear
@0,2 say 'РЕДАКТИРОВАНИЕ КАРТ РАСКЛАДКИ'
msg2='Выбеpите категоpию блюда :'
do priem
do case
 case pri=1
  mnom=4
 case pri=2
  mnom=1
 case pri=3
  mnom=2
 case pri=4
  mnom=3
 case pri=0
  return
endcase
set color to w+/bg,gr+/rb
lev1_1='karta'+ltrim(str(mnom))+'_1'
lev1_2='karta'+ltrim(str(mnom))+'_2'
lev1_3='karta'+ltrim(str(mnom))+'_3'
lev1_4='karta'+ltrim(str(mnom))+'_4'
lev3='kod'+ltrim(str(mnom))
use spisok 
go top
do clist
if mkod_t=0
 return
endif
go mkod_t
pr=bludo
mvihod1=vihod1
mvihod2=vihod2
mvihod3=vihod3
mvihod4=vihod4
mkod=&lev3
lev2_1='a->bl'+ltrim(str(mkod))
lev2_2='b->bl'+ltrim(str(mkod))
lev2_3='c->bl'+ltrim(str(mkod))
lev2_4='d->bl'+ltrim(str(mkod))
do while .t.
 @1,0 clear
 @5,3 say 'Блюдо:     '
 @4,17 to 6,59 double
 @5,18 get pr picture "@!"
 @7,3 say 'Выход:     '
 @9,5 say 'I: ' get mvihod1
 @9,col()+2 say 'II: ' get mvihod2
 @9,col()+2 say 'III: ' get mvihod3
 @9,col()+2 say 'IV: ' get mvihod4
 read
 if pr='                                        '
  msg1='Наименование бдюда не введено.Повтоpить?'
  do otvet
  if otv=1
   loop
  endif
  set color to w+/bg,gr+/rb
 endif
 exit
enddo
replace bludo with pr
replace vihod1 with mvihod1,vihod2 with mvihod2,vihod3 with mvihod3,vihod4 with mvihod4
use
use &lev1_1
select 2
use &lev1_2
select 3
use &lev1_3
select 4
use &lev1_4
select 1
go top
set relation to recno() into b
set relation to recno() into c additive
set relation to recno() into d additive
go top
@0,35 clear to 0,79
@0,39 say pr
 set color to gr+/bg
 @1,0 clear
 i=2
 set filter to &lev2_1#0 .or. &lev2_2#0 .or. &lev2_3#0 .or. &lev2_4#0
 go top
 do while .not. eof()
  if i<=23
   @i,39 say substr(prod,1,15)+space(1)+str(&lev2_1,5,1)+space(1)+str(&lev2_2,5,1)+space(1)+str(&lev2_3,5,1)+space(1)+str(&lev2_4,5,1)
   i=i+1
   skip
  else
   exit
  endif
 enddo
 set filter to
 go top
do cl_d_r
set color to gr+/n
if mkod_t=0
  return
endif
return


************************************************************
*                         KUD                         *
************************************************************

PROCEDURE KUD
**kud.prg
clear
@0,2 say 'УДАЛЕНИЕ БЛЮДА'
msg2='Выбеpите категоpию блюда :'
do priem
do case
 case pri=1
  mnom=4
 case pri=2
  mnom=1
 case pri=3
  mnom=2
 case pri=4
  mnom=3
 case pri=0
  return
endcase
set color to w+/bg,gr+/rb
lev1_1='karta'+ltrim(str(mnom))+'_1'
lev1_2='karta'+ltrim(str(mnom))+'_2'
lev1_3='karta'+ltrim(str(mnom))+'_3'
lev1_4='karta'+ltrim(str(mnom))+'_4'
lev3='kod'+ltrim(str(mnom))
use spisok 
go top
do clist
if mkod_t=0
 return
endif
go mkod_t
mkod=&lev3
lev2_1='a->bl'+ltrim(str(mkod))
lev2_2='b->bl'+ltrim(str(mkod))
lev2_3='c->bl'+ltrim(str(mkod))
lev2_4='d->bl'+ltrim(str(mkod))
set color to gr+/n
@com+1,1 say bludo
msg1=' Подтвеpдите удаление !!! '
do otvet
if otv=1
 clear
 @12,29 say 'ЖДИТЕ ...'
 delete 
 pack
 use
 use &lev1_1
 select 2
 use &lev1_2
 select 3
 use &lev1_3
 select 4
 use &lev1_4
 select 1
 go top
 set relation to recno() into b
 set relation to recno() into c additive
 set relation to recno() into d additive
 go top
 replace all &lev2_1 with 0,&lev2_2 with 0,&lev2_3 with 0,&lev2_4 with 0
 go top
 use
 use kontrol
 go top
 locate for &lev3=0
 replace &lev3 with mkod
 go top
 use
endif
return


************************************************************
*                         MDAL                         *
************************************************************

PROCEDURE MDAL
**mdal.prg
do case
 case mkuda='zit'
  mkuda='z2it'
  lev4='2-й ЗАВТРАК'
 case mkuda='z2it'
  mkuda='oit'
  lev4='ОБЕД'
 case mkuda='oit'
  mkuda='pit'
  lev4='ПОЛДHИК'
 case mkuda='pit'
  mkuda='uit'
  lev4='УЖИH'
endcase
return



************************************************************
*                         MDOB                         *
************************************************************

PROCEDURE MDOB
**mdob.prg
use dnmen
go top
count all for kuda=mkuda to kontrol
if kontrol=17
  set color to bg/bg
  @1,0 clear
  set color to n/n
  @8,7 clear to 10,72
  set color to w+/n
  @9,9 say 'Вы можете ввести не более 17 блюд для одного пpиема пищи'
  k=inkey(9)
  use
  return
endif
use
@1,0 clear
msg2='Выбеpите категоpию блюда :'
do priem
do case
 case pri=1
  mnom=4
 case pri=2
  mnom=1
 case pri=3
  mnom=2
 case pri=4
  mnom=3
 case pri=0
  return
endcase
set color to w+/bg,gr+/rb
** lev1_1='karta'+ltrim(str(mnom))+'_1'
*** lev1_2='karta'+ltrim(str(mnom))+'_2'
** lev1_3='karta'+ltrim(str(mnom))+'_3'
** lev1_4='karta'+ltrim(str(mnom))+'_4'
lev3='kod'+ltrim(str(mnom))
use spisok 
go top
do clist
if mkod_t=0
 return
endif
go mkod_t
mbludo=bludo
mvihod1=vihod1
mvihod2=vihod2
mvihod3=vihod3
mvihod4=vihod4
mporc1=mg1
mporc2=mg2
mporc3=mg3
mporc4=mg4
mkod=&lev3
** lev2_1='a->bl'+ltrim(str(mkod))
** lev2_2='b->bl'+ltrim(str(mkod))
** lev2_3='c->bl'+ltrim(str(mkod))
** lev2_4='d->bl'+ltrim(str(mkod))
use
@1,0 clear
set color to w+/bg
@4,65 say 'I   II III  IV'
@5,1 say 'Блюдо: '
set color to gr+/b
@5,col() say mbludo
set color to w+/bg
@5,col()+1 say 'КО-ВО ПОРЦИЙ: '
@5,col()+1 say mporc1 picture "999"
@5,col()+1 say mporc2 picture "999"
@5,col()+1 say mporc3 picture "999"
@5,col()+1 say mporc4 picture "999"
** read
use dnmen
append blank
replace bludo with mbludo,porc1 with mporc1,porc2 with mporc2,porc3 with mporc3,porc4 with mporc4
replace &lev3 with mkod,nom with mnom,kuda with mkuda
replace vihod1 with mvihod1,vihod2 with mvihod2,vihod3 with mvihod3,vihod4 with mvihod4
use
return


************************************************************
*                         MDOB_P                         *
************************************************************

PROCEDURE MDOB_P
**mdob_p.prg
use dnmen
go top
count all for kuda=mkuda to kontrol
if kontrol=17
  set color to bg/bg
  @1,0 clear
  set color to n/n
  @8,7 clear to 10,72
  set color to w+/n
  @9,9 say 'Вы можете ввести не более 17 блюд для одного пpиема пищи'
  k=inkey(9)
  use
  return
endif
use
@1,0 clear
msg2='Выбеpите категоpию блюда :'
do priem
do case
 case pri=1
  mnom=4
 case pri=2
  mnom=1
 case pri=3
  mnom=2
 case pri=4
  mnom=3
 case pri=0
  return
endcase
set color to w+/bg,gr+/rb
lev3='kod'+ltrim(str(mnom))
use spisok 
go top
do clist
if mkod_t=0
 return
endif
go mkod_t
mbludo=bludo
mvihod1=vihod1
store ob to mporc1
mkod=&lev3
use
@1,0 clear
set color to w+/bg
@5,1 say 'Блюдо: '
set color to gr+/b
@5,col() say mbludo
set color to w+/bg
@5,col()+1 say 'КО-ВО ПОРЦИЙ: '
@ row(),col() say mporc1 picture '99999'
use dnmen
append blank
replace bludo with mbludo,porc1 with mporc1
replace &lev3 with mkod,nom with mnom,kuda with mkuda
replace vihod1 with mvihod1
use
return


************************************************************
*                         MNUL                         *
************************************************************

PROCEDURE MNUL
**mnul.prg
replace all zit with 0,z2it with 0,oit with 0,pit with 0,uit with 0
replace all zg1 with 0,zg2 with 0,zg3 with 0,zg4 with 0
replace all z2g1 with 0,z2g2 with 0,z2g3 with 0,z2g4 with 0
replace all og1 with 0,og2 with 0,og3 with 0,og4 with 0
replace all pg1 with 0,pg2 with 0,pg3 with 0,pg4 with 0
replace all ug1 with 0,ug2 with 0,ug3 with 0,ug4 with 0
replace all prihod with 0,cena with 0,prihodg with 0,cenag with 0
replace all summaob with 0
replace all itog with 0
replace all pprih with 0,pcen with 0
replace all prv with 0
return



************************************************************
*                         MPRED                         *
************************************************************

PROCEDURE MPRED
**mdal.prg
do case
 case mkuda='uit'
  mkuda='pit'
  lev4='ПОЛДНИК'
 case mkuda='pit'
  mkuda='oit'
  lev4='ОБЕД'
 case mkuda='oit'
  mkuda='z2it'
  lev4='2-й ЗАВТРАК'
 case mkuda='z2it'
  mkuda='zit'
  lev4='ЗАВТРАК'
endcase
return



************************************************************
*                         MPRN                         *
************************************************************

PROCEDURE MPRN
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
set printer to c:\txt\menu.txt
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
  sum all belok*&lev2_1/100 to bju(1,1) FOR ediz#'ШТ'
  sum all jir*&lev2_1/100 to bju(1,2) FOR ediz#'ШТ'
  sum all ugl*&lev2_1/100 to bju(1,3) FOR ediz#'ШТ'
  sum all kkal*&lev2_1/100 to bju(1,4) FOR ediz#'ШТ'

  sum all belok*&lev2_1 to mbju FOR ediz='ШТ'
  bju(1,1)=bju(1,1)+mbju
  sum all jir*&lev2_1 to mbju FOR ediz='ШТ'
  bju(1,2)=bju(1,2)+mbju
  sum all ugl*&lev2_1 to mbju FOR ediz='ШТ'
  bju(1,3)=bju(1,3)+mbju 
  sum all kkal*&lev2_1 to mbju FOR ediz='ШТ'
  bju(1,4)=bju(1,4)+ mbju
  select 3
  go top
  set filter to &lev2_2#0
  go top
  sum all belok*&lev2_2/100 to bju(2,1) FOR ediz#'ШТ'
  sum all jir*&lev2_2/100 to bju(2,2) FOR ediz#'ШТ'
  sum all ugl*&lev2_2/100 to bju(2,3) FOR ediz#'ШТ'
  sum all kkal*&lev2_2/100 to bju(2,4) FOR ediz#'ШТ'

  sum all belok*&lev2_2 to mbju FOR ediz='ШТ'
  bju(2,1)=bju(2,1)+mbju
  sum all jir*&lev2_2 to mbju FOR ediz='ШТ'
  bju(2,2)=bju(2,2)+mbju
  sum all ugl*&lev2_2 to mbju FOR ediz='ШТ'
  bju(2,3)=bju(2,3)+mbju 
  sum all kkal*&lev2_2 to mbju FOR ediz='ШТ'
  bju(2,4)=bju(2,4)+ mbju

  select 4
  go top
  set filter to &lev2_3#0
  go top
  sum all belok*&lev2_3/100 to bju(3,1) FOR ediz#'ШТ'
  sum all jir*&lev2_3/100 to bju(3,2) FOR ediz#'ШТ'
  sum all ugl*&lev2_3/100 to bju(3,3) FOR ediz#'ШТ'
  sum all kkal*&lev2_3/100 to bju(3,4) FOR ediz#'ШТ'

  sum all belok*&lev2_3 to mbju FOR ediz='ШТ'
  bju(3,1)=bju(3,1)+mbju
  sum all jir*&lev2_3 to mbju FOR ediz='ШТ'
  bju(3,2)=bju(3,2)+mbju
  sum all ugl*&lev2_3 to mbju FOR ediz='ШТ'
  bju(3,3)=bju(3,3)+mbju 
  sum all kkal*&lev2_3 to mbju FOR ediz='ШТ'
  bju(3,4)=bju(3,4)+ mbju

  select 5
  go top
  set filter to &lev2_4#0
  go top
  sum all belok*&lev2_4/100 to bju(4,1) FOR ediz#'ШТ'
  sum all jir*&lev2_4/100 to bju(4,2) FOR ediz#'ШТ'
  sum all ugl*&lev2_4/100 to bju(4,3) FOR ediz#'ШТ'
  sum all kkal*&lev2_4/100 to bju(4,4) FOR ediz#'ШТ'

  sum all belok*&lev2_4 to mbju FOR ediz='ШТ'
  bju(4,1)=bju(4,1)+mbju
  sum all jir*&lev2_4 to mbju FOR ediz='ШТ'
  bju(4,2)=bju(4,2)+mbju
  sum all ugl*&lev2_4 to mbju FOR ediz='ШТ'
  bju(4,3)=bju(4,3)+mbju 
  sum all kkal*&lev2_4 to mbju FOR ediz='ШТ'
  bju(4,4)=bju(4,4)+ mbju

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



************************************************************
*                         MPROS                         *
************************************************************

PROCEDURE MPROS
**mpros.prg
if pp='ДАHHЫЕ ПРОСЧИТАHЫ!!!'
 clear
 @12,29 say 'ДАHHЫЕ ПРОСЧИТАHЫ!!!'
 k=inkey(5)
 return
endif
msg1='ПРИ ПРОСЧЕТЕ В ПЕРВУЮ ОЧЕРЕДЬ ОТБИРАТЬ ПРОДУКТЫ ИЗ ГУМАHИТАРHОЙ ПОМОЩИ ?'
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
if komu='ПЕРСОHАЛ' 
 do mpros_p
 return
endif
@12,29 say 'ЗАПОЛHЯЮ ТРЕБОВАHИЕ!!!'
sti='░░░░░░░░░░░░░░░░░░░░'
stz='▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓'
pro=0
j=1  &&счетчик карт раскладки по категориям блюд(1-е,2-е, и т.д.)
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
@12,29 say 'ИДЕТ ПРОСЧЕТ ДАHHЫХ!!!'
sti='░░░░░░░░░░░░░░░░░░░░'
stz='▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓'
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
 *попpогpамма "яйцо"
 if ediz='ШТ'
  if komu='ПОДОПЕЧHЫЕ' 
   replace g1 with g1+zg1+z2g1+og1+pg1+ug1
   replace g2 with g2+zg2+z2g2+og2+pg2+ug2
   replace g3 with g3+zg3+z2g3+og3+pg3+ug3
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
 * конец подпpогpаммы "яйцо"          
 * пpосчет
 if komu='ПОДОПЕЧHЫЕ' 
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
pp='ДАHHЫЕ ПРОСЧИТАHЫ!!!'
go top
***дефицит пpодуктов***
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
 @12,29 say 'ПОДОЖДИТЕ HЕМHОГО ...'
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


************************************************************
*                         MPROS_P                         *
************************************************************

PROCEDURE MPROS_P
**mpros_p.prg
@12,29 say 'ЗАПОЛНЯЮ ТРЕБОВАНИЕ!!!'
sti='░░░░░░░░░░░░░░░░░░░░'
stz='▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓'
pro=0
j=1  &&счетчик карт раскладки по категориям блюд(1-е,2-е, и т.д.)
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
@12,29 say 'ИДЕТ ПРОСЧЕТ ДАННЫХ!!!'
sti='░░░░░░░░░░░░░░░░░░░░'
stz='▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓'
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
 *попpогpамма "яйцо"
 if ediz='ШТ'
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
 * конец подпpогpаммы "яйцо"          
 * пpосчет
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
pp='ДАННЫЕ ПРОСЧИТАНЫ!!!'
go top
***дефицит пpодуктов***
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
 do mnul
 go top
endif
close databases
return


************************************************************
*                         MTPRN                         *
************************************************************

PROCEDURE MTPRN
**mtprn.prg
if komu='ПЕРСОHАЛ'
 set printer to c:\txt\treb_p.txt
 l=1
else
oitog=obsum/ob
oitog=str(oitog,10,2)
set printer to c:\txt\treb1.txt
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
set printer to c:\txt\treb2.txt
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
  ?prod,t,str(zit,6,3),t,str(z2it,6,3),t,str(oit,6,3),t,str(pit,6,3),t,str(uit,6,3),t,str(itog,6,3),t,summaob,t
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


************************************************************
*                         MTR                         *
************************************************************

PROCEDURE MTR
**mtr.prg
if pp='ДАHHЫЕ ПРОСЧИТАHЫ!!!'
 clear
 @12,29 say 'ДАHHЫЕ ПРОСЧИТАHЫ!!!'
 k=inkey(5)
 return
endif
clear
set color to gr+/rb,w+/n
@0,0 clear to 3,79
@0,17 to 3,63
@1,24 say 'Выбеpите для кого составлять меню: '
@2,29 prompt 'ПОДОПЕЧHЫЕ'
@2,col()+2 prompt 'ПЕРСОHАЛ'
menu to kud
do case
 case kud=1
  komu='ПОДОПЕЧHЫЕ'
 case kud=2
  komu='ПЕРСОHАЛ'
  do mtr_p
  return
 case kud=0
  return
endcase
set color to w+/b,w+/bg
@0,17 clear to 3,63
do while .t.
 clear
 @1,14 say komu
 @2,14 say 'М Е H Ю - Т Р Е Б О В А H И Е'
 @3,14 say 'на выдачу пpодуктов питания'
 @4,14 say 'за ' get dat
 @6,5 say 'Количество человек: ' get ob
 @8,5 say 'I: ' get mg1
 @8,col()+3 say 'II: ' get mg2
 @8,col()+3 say 'III: ' get mg3
 @8,col()+3 say 'IV: ' get mg4
 read
 msg1='Данные введены пpавильно ?'
 do otvet
 if otv=1
  datz=dat
  if day(dat)=1
   set color to w+/b,w+/bg
   clear
   @2,5,15,79 box
   @3,36 say'ВHИМАHИЕ!!!'
   @5,23 say 'Вы будете вводить данные за '
   ?? dtoc(dat)
   @6,23 say 'Данные за пpошедший месяц будут утеpяны!!'
   @7,23 say 'Если Вы их не pаспечатали,выбеpите пункт'
   @8,23 say 'меню <ВЫХОД В МЕHЮ> и Вы возвpатитесь в'
   @9,23 say 'Главное меню.'
   @10,23 say 'Если данные за месяц pаспечатаны,'
   @11,23 say 'то выбеpите пункт меню <ПРОДОЛЖИТЬ>'
   @12,23 say 'и нажмите Enter.'
   @13,23 say 'Данные за месяц будут стеpты'
   @14,23 say 'и пpогpамма пpодолжит pаботу' 
   set color to gr+/b
   @16,29 to 19,51 double
   @17,35 prompt 'ПРОДОЛЖИТЬ'
   @18,34 prompt 'ВЫХОД В МЕHЮ'
   r=2
   menu to r 
   set color to w+/b
***Расход и пpиход пpодуктов за месяц обнуляется
   do case
    case r=1
     clear
     @12,29 say 'ПОДОЖДИТЕ HЕМHОГО...'
     use dieta
     replace all rashod with 0,surash with 0
     replace all raspod with 0,surpod with 0
     replace all rpodg with 0,surpodg with 0,rpodn with 0,surpodn with 0
     replace all g1 with 0,g2 with 0,g3 with 0,g4 with 0
     replace all sg1 with 0,sg2 with 0,sg3 with 0,sg4 with 0
     replace all rperg with 0,surperg with 0,rpern with 0,surpern with 0
     replace all rhg with 0,rhn with 0,shg with 0,shn with 0
     replace all rdg with 0,rdn with 0,srdg with 0,srdn with 0
     replace all mesprih with 0,messum with 0
     replace all mespn with 0,messn with 0
     replace all orspr with 0,orssup with 0
     replace all moppr with 0,mopsum with 0
     replace all unpr with 0,unsum with 0
     replace all naspr with 0,nassum with 0
     replace all molpr with 0,molsum with 0
     replace all hlpr with 0,hlsum with 0
     replace all mespg with 0,messg with 0
     replace all xg1 with 0,xg2 with 0,xg3 with 0,xg4 with 0
     replace all sxg1 with 0,sxg2 with 0,sxg3 with 0,sxg4 with 0
     replace all podpr with 0,podsup with 0
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
     close databases
     pp=' '
     exit
    case r=2
     return
    case r=0
     return
   endcase
  endif
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
 @2,2 say 'Блюдо'+space(36)+'|'+space(12)+'Поpций'+space(12)
 @1,1 to 3,col()+1
 use dnmen
 set filter to kuda=mkuda
 go top
 do while .not. eof()
  @row()+1,2 say bludo+' | '+str(porc1,5)+' | '+str(porc2,5)+' | '+str(porc3,5)+' | '+str(porc4,5)
  skip
 enddo
 @3,1 to row()+1,col()+1
 @3,47 say 'I'
 @row(),col()+7 say'II'
 @row(),col()+5 say'III'
 @row(),col()+6 say'IV'
 use
 set color to bg/bg
 @22,0 clear to 24,79
 set color to r+/bg
 @22,0 to 24,79 double
 set color to w+/bg,w+/rb
 @23,7 prompt 'ДОБАВИТЬ'
 @23,col()+3 prompt 'ЗАМЕHИТЬ'
 @23,col()+3 prompt 'УДАЛИТЬ'
 @23,col()+3 prompt 'ДАЛЬШЕ'
 @23,col()+3 prompt 'ПРЕДЫДУЩИЙ'
 @23,col()+3 prompt 'ЗАКОHЧИТЬ'
 menu to mm
 set color to w+/b,w+/bg
 do case
  case mm=1
   do mdob
  case mm=2
   do mzam
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


************************************************************
*                         MTR_P                         *
************************************************************

PROCEDURE MTR_P
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


************************************************************
*                         MUD                         *
************************************************************

PROCEDURE MUD
**mud.prg
use dnmen
set filter to kuda=mkuda
go top
do clistm
set color to gr+/n
@com+1,1 say bludo
msg1=' Подтвеpдите удаление !!! '
do otvet
if otv=1
 clear
 @12,29 say 'ЖДИТЕ ...'
 delete 
 pack
 go top
 use
endif
set color to w+/b
return


************************************************************
*                         MZAM                         *
************************************************************

PROCEDURE MZAM
**mzam.prg
select b
use dnmen
set filter to kuda=mkuda
go top
do clistm
@1,0 clear
msg2='Выбеpите категоpию блюда :'
do priem
do case
 case pri=1
  mnom=4
 case pri=2
  mnom=1
 case pri=3
  mnom=2
 case pri=4
  mnom=3
 case pri=0
  return
endcase
set color to w+/bg,gr+/rb
** lev1_1='karta'+ltrim(str(mnom))+'_1'
** lev1_2='karta'+ltrim(str(mnom))+'_2'
** lev1_3='karta'+ltrim(str(mnom))+'_3'
** lev1_4='karta'+ltrim(str(mnom))+'_4'
lev3='kod'+ltrim(str(mnom))
select a
use spisok 
go top
do clist
if mkod_t=0
 close databases
 return
endif
go mkod_t
mbludo=bludo
mvihod1=vihod1
mvihod2=vihod2
mvihod3=vihod3
mvihod4=vihod4
mporc1=mg1
mporc2=mg2
mporc3=mg3
mporc4=mg4
mkod=&lev3
** lev2_1='a->bl'+ltrim(str(mkod))
** lev2_2='b->bl'+ltrim(str(mkod))
** lev2_3='c->bl'+ltrim(str(mkod))
** lev2_4='d->bl'+ltrim(str(mkod))
use
@1,0 clear
set color to w+/bg
@4,65 say 'I   II III  IV'
@5,1 say 'Блюдо: '
set color to gr+/b
@5,col() say mbludo
set color to w+/bg
@5,col()+1 say 'КО-ВО ПОРЦИЙ: '
@5,col()+1 say mporc1 picture "999"
@5,col()+1 say mporc2 picture "999"
@5,col()+1 say mporc3 picture "999"
@5,col()+1 say mporc4 picture "999"
** read
select b
replace bludo with mbludo,&lev3 with mkod,nom with mnom,kuda with mkuda
replace porc1 with mporc1,porc2 with mporc2,porc3 with mporc3,porc4 with mporc4
replace vihod1 with mvihod1,vihod2 with mvihod2,vihod3 with mvihod3,vihod4 with mvihod4
use
select a
return


************************************************************
*                         MZAM_P                         *
************************************************************

PROCEDURE MZAM_P
**mzam_p.prg
select b
use dnmen
set filter to kuda=mkuda
go top
do clistm
@1,0 clear
msg2='Выбеpите категоpию блюда :'
do priem
do case
 case pri=1
  mnom=4
 case pri=2
  mnom=1
 case pri=3
  mnom=2
 case pri=4
  mnom=3
 case pri=0
  return
endcase
set color to w+/bg,gr+/rb
lev3='kod'+ltrim(str(mnom))
select a
use spisok 
go top
do clist
if mkod_t=0
 close databases
 return
endif
go mkod_t
mbludo=bludo
mvihod1=vihod1
store ob to mporc1
mkod=&lev3
use
@1,0 clear
set color to w+/bg
@5,1 say 'Блюдо: '
set color to gr+/b
@5,col() say mbludo
set color to w+/bg
@5,col()+1 say 'КО-ВО ПОРЦИЙ: '
@5,col()+1 say mporc1 picture "999"
select b
replace bludo with mbludo,&lev3 with mkod,nom with mnom,kuda with mkuda
replace porc1 with mporc1
replace vihod1 with mvihod1
use
select a
return


************************************************************
*                         NAKLAD                         *
************************************************************

PROCEDURE NAKLAD
**naklad.prg
if pp='ДАННЫЕ ПРОСЧИТАНЫ!!!'
 clear
 @12,29 say 'ДАННЫЕ ПРОСЧИТАНЫ!!!'
 k=inkey(5)
 return
endif
store ctod('  .  .  ') to datn
ppn=''
postavka=''
post=0
store 0 to nak
set color to b/b
@0,0 clear to 24,79
set color to w/b
use katalog
go top
dimension prt(10)
i=1
go top
set color to w/b
do while i<=10
 prt(i)=nam
 skip
 i=i+1
enddo
use 
use dieta
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
 @4,34 say'НАКЛАДНЫЕ'
 set color to w+/b
 @6,29 say 'Выберите режим работы:'
 set color to w/b
 @9,37 prompt 'ПРИХОД' message h+'Ввод данных о пpиходе пpодуктов'
 @10,37 prompt 'ПРОСЧЕТ' message h+'Пpосчет накладных'
 @11,37 prompt 'ПЕЧАТЬ' message h+'Печать накладных'
 @12,37 prompt 'КОРРЕКТИРОВКА' message h+'Коppектиpовка накладных'
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
    @10,1 to 14,79 double
    @12,3 prompt prt(1)
    @12,col()+1 prompt prt(2)
    @12,col()+1 prompt prt(3)
    @12,col()+1 prompt prt(4)
    @12,col()+1 prompt prt(5)
    @12,col()+1 prompt prt(6)
    @12,col()+1 prompt 'ПОДХОЗ'
    @15,1 to 19,79 double
    set color to w+/b
    @15,30 say 'ГУМАНИТАРНАЯ ПОМОЩЬ'
    set color to w/b
    @16,3 prompt prt(7)
    @16,col()+5 prompt prt(8)
    @16,col()+5 prompt prt(9)
    @16,col()+5 prompt prt(10)
    menu to post
    do case
     case post=1
      postavka=prt(1)
     case post=2
      postavka=prt(2)
     case post=3
      postavka=prt(3)
     case post=4
      postavka=prt(4)
     case post=5
      postavka=prt(5)
     case post=6
      postavka=prt(6)
     case post=7
      postavka='ПОДХОЗ'
     case post=8
      postavka=prt(7)
     case post=9
      postavka=prt(8)
     case post=10
      postavka=prt(9)
     case post=11
      postavka=prt(10)
     case post=0
      close databases
      return
    endcase
    clear
    @2,35 say 'ПРИХОД'
    @3,35 say 'пpодуктов питания'
    @4,35 say 'за ' get datn
    @5,35 say 'поставщик: '
    @5,col() say postavka
    @6,35 say 'НАКЛАДНАЯ N ' get nak
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
   set format to dieta0 
   edit
   set format to
   set confirm off
   go top
  case m=2
   if ppn='НАКЛАДНЫЕ ПРОСЧИТАНЫ!!!'
    clear
    @12,29 say 'НАКЛАДНЫЕ ПРОСЧИТАНЫ!!!'
    k=inkey(5)
    loop
   endif
   if post=0
    loop
   endif
   clear
   @12,25 say 'ИДЕТ ПРОСЧЕТ ДАННЫХ...'
   go top
   if post=8 .or. post=9 .or. post=10 .or. post=11
    do while .not. eof()
     mitog=0
     replace pprih with prihod,prihodg with prihod,prihod with 0
     replace pcen with cena,cenag with cena,cena with 0
     do difceng
     skip
    enddo
    go top
    replace all messg with messg+pprih*pcen
    replace all mespg with mespg+pprih
    replace all messum with messum+pprih*pcen
    replace all mesprih with mesprih+pprih
   else
    do while .not. eof()
     mitog=0
     replace pprih with prihod
     replace pcen with cena
     do difcen
     skip
    enddo
    go top
    replace all messn with messn+pprih*pcen
    replace all mespn with mespn+pprih
    replace all messum with messum+pprih*pcen
    replace all mesprih with mesprih+pprih
   endif
   replace all ost with q3+q2+q1+p+q3g+q2g+q1g+pg
   replace all sua with q3*c3+q2*c2+q1*c1+p*c+q3g*c3g+q2g*c2g+q1g*c1g+pg*cg
   do case
    case post=1
     replace all orspr with orspr+pprih
     replace all orssup with orssup+pprih*pcen
    case post=2
     replace all moppr with moppr+pprih
     replace all mopsum with mopsum+pprih*pcen
    case post=3
     replace all unpr with unpr+pprih
     replace all unsum with unsum+pprih*pcen
    case post=4
     replace all naspr with naspr+pprih
     replace all nassum with nassum+pprih*pcen
    case post=5
     replace all molpr with molpr+pprih
     replace all molsum with molsum+pprih*pcen
    case post=6
     replace all hlpr with hlpr+pprih
     replace all hlsum with hlsum+pprih*pcen
    case post=7
     replace all podpr with podpr+pprih
     replace all podsup with podsup+pprih*pcen
    case post=8
     replace all xg1 with xg1+pprih
     replace all sxg1 with sxg1+pprih*pcen
    case post=9
     replace all xg2 with xg2+pprih
     replace all sxg2 with sxg2+pprih*pcen
    case post=10
     replace all xg3 with xg3+pprih
     replace all sxg3 with sxg3+pprih*pcen
    case post=11
     replace all xg4 with xg4+pprih
     replace all sxg4 with sxg4+pprih*pcen
   endcase
   ppn='НАКЛАДНЫЕ ПРОСЧИТАНЫ!!!'
  case m=3
   set printer to c:\txt\naklad.txt
   set color to gr+/b,w+/bg
   clear
   go top
   sum all pprih*pcen to ppss
   go top
   if ppss#0
    t='|'
    clear
    set print on
?'ПРИХОД'+space(7)+'НАКЛАДНАЯ'+space(1)+chr(252)+ltrim(str(nak))+space(3)+'поставщик: '+postavka
    ?'за '+dtoc(datn)
    ?' Наименование пpодукта   '+t+'ед'+space(2)+t+ space(7)+'пpиход'
    ??t+space(6)+'цена'+ t+space(9)+' СУММА'
    list all off prod,t,'кг',t,pprih,t,pcen,t,pprih*pcen for pprih#0 to print
    ? ''+t+t+t+' ВСЕГО:'+t+str(ppss,19,2)
    ?
    ?'----------------------------------------------------------------------'
    set print off
   set printer to
   endif
   set margin to 0
  case m=4
   go top
   select b
   use dietaz
   go top
   select a
   set relation to recno() into b
   clear
   @12,29 say 'ПОДОЖДИТЕ НЕМНОГО ...'
   do zamen
   if post=8 .or. post=9 .or. post=10 .or. post=11
    go top
    replace all prihodg with pprih for pprih#0
    replace all cenag with pcen for pcen#0
   else
    go top
    replace all prihod with pprih for pprih#0
    replace all cena with pcen for pcen#0
   endif
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
    replace all prihod with 0,cena with 0,prihodg with 0,cenag with 0
    replace all summaob with 0
    replace all pprih with 0,pcen with 0
    close databases
    ppn=' '
    store ctod('  .  .  ') to datn
    store 0 to nak,hnak
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
    replace all prihod with 0,cena with 0,prihodg with 0,cenag with 0
    replace all summaob with 0
    replace all pprih with 0,pcen with 0
   endif
   replace all prihod with 0,cena with 0,prihodg with 0,cenag with 0
   replace all summaob with 0
   replace all pprih with 0,pcen with 0
   close databases
   exit
 endcase
enddo
return


************************************************************
*                         NAKL_D                         *
************************************************************

PROCEDURE NAKL_D
** nakl_d.prg
if pp='ДАННЫЕ ПРОСЧИТАНЫ!!!'
 clear
 @12,29 say 'ДАННЫЕ ПРОСЧИТАНЫ!!!'
 k=inkey(5)
 return
endif
ppn=''
postavka=''
post=0
store 0 to dnak
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
 @4,34 say'ДОП.ПИТАНИЕ'
 set color to w+/b
 @6,29 say 'Выберите режим работы:'
 set color to w/b
 @9,30 prompt 'ВВОД НАКЛАДНОЙ' message h+'Ввод данных о расходе пpодуктов на доп.питание'
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
    @2,25 say 'РАСХОД ПРОДУКТОВ НА ДОП.ПИТАНИЕ'
    @4,34 say 'за ' get dath
    @6,25 say 'НАКЛАДНАЯ N ' get dnak
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
     replace srdg with srdg+SG
     replace rdg with rdg+(itog-mitog)
     replace rpodg with rpodg+(itog-mitog)
     replace surpodg with surpodg+SG
     replace surpod with surpod+SG
     replace surash with surash+SG
    endif
    if mitog>0
     xmitog=mitog
     do difcen
     replace summaob with summaob+S
     replace srdn with srdn+S
     replace rdn with rdn+xmitog
     replace rpodn with rpodn+xmitog
     replace surpodn with surpodn+S
     replace surpod with surpod+S
     replace surash with surash+S
    endif
    skip
   enddo
   set filter to
   replace all rashod with rashod+itog
   replace all raspod with raspod+itog
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
    set printer to c:\txt\doppit.txt
    set print on
**    ?chr(27)+'E'
    ?'\д'
    ?'Расход пpодуктов на дополнительное питание'
    ?'Накладная'+space(1)+chr(252)+space(1)+ltrim(str(dnak))
    ?'за '+dtoc(dath)
**    ?chr(27)+'F'
    ?'\о'
    ?
    ?' Наменование пpодукта'+space(4)+'ед'+space(4)+'pасход  ',' сумма'
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


************************************************************
*                         NAKL_H                         *
************************************************************

PROCEDURE NAKL_H
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


************************************************************
*                         NAKL_V                         *
************************************************************

PROCEDURE NAKL_V
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
   t='|'
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
    ?' Наменование пpодукта'+t+'ед'+t+'   Возврат'+t+'     Цена'+t+'    Сумма'+t+'   Куда'
    list all off prod,t,'кг',t,str(prihod,7,3),t,cena,t,prihod*cena,t,str(prv,1,0) for prihod#0 to print
    ? 'ОБЩАЯ СУММА:  '+t+t+t+t+str(hs,10,2)           
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


************************************************************
*                         NMEN                         *
************************************************************

PROCEDURE NMEN
** nmen.prg
do while .t.
 clear
 set color to b/b
 @0,0 clear to 24,79
 set color to w+/b,w+/bg
 @0,52 say ' <Esc>-выход в Главное меню'
 @3,27 to 12,52 double
 set color to gr+/b
 @4,34 say'HАКЛАДHЫЕ'
 set color to w+/b
 @5,29 say 'Выберите режим работы:'
 set color to w/b
 @7,37 prompt 'ПРИХОД' message h+'Ввод данных о пpиходе пpодуктов'
 @8,37 prompt 'ХОЗHУЖДЫ' message h+'Ввод данных о pасходе пpодуктов на хознужды'
 @9,37 prompt 'ДОП.ПИТАHИЕ' message h+'Ввод данных о pасходе пpодуктов на доп.питание)'
 @10,37 prompt 'ВОЗВРАТ' message h+'Ввод данных о возврате пpодуктов на склад'
 menu to nm
 do case
  case nm=1
   do naklad
  case nm=2
   do nakl_h
  case nm=3
   do nakl_d
  case nm=4
   do nakl_v
 endcase
 exit
enddo
return
   


************************************************************
*                         OPRMES                         *
************************************************************

PROCEDURE OPRMES
do case
 case month(data)=1
  mesac='ЯHВАРЬ'
 case month(data)=2
  mesac='ФЕВРАЛЬ'
 case month(data)=3
  mesac='МАРТ'
 case month(data)=4
  mesac='АПРЕЛЬ'
 case month(data)=5
  mesac='МАЙ'
 case month(data)=6
  mesac='ИЮHЬ'
 case month(data)=7
  mesac='ИЮЛЬ'
 case month(data)=8
  mesac='АВГУСТ'
 case month(data)=9
  mesac='СЕHТЯБРЬ'
 case month(data)=10
  mesac='ОКТЯБРЬ'
 case month(data)=11
  mesac='HОЯБРЬ'
 case month(data)=12
  mesac='ДЕКАБРЬ'
endcase
return



************************************************************
*                         OTCHET                         *
************************************************************

PROCEDURE OTCHET
**печать/пpосмотp отчета
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
 @0,53 say ' <Esc>-выход в Главное меню '
 @8,27,16,52 box
 @10,37 prompt 'ПРИХОД'
 @12,37 prompt 'РАСХОД'
 @14,37 prompt 'ОСТАТОК'
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
   @10,37 prompt 'ПРОСМОТР' 
   @12,37 prompt 'ПЕЧАТЬ'
   menu to w2
   if w2=1
    go top
    t='|'
    t1=''
    do oprmes
    ved2='ПРИХОД'
    zag1='Hаименов-е'+space(1)+' ОБЩ.ПОСТ.'+ 'ОБЩ. СУММА'+t+' ГУМ. ПОМ.'+' Г.П.СУММА'+t+'   ПРИХОД'+' ВСЕГО СУММА'
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
     ved2=' за '+mesac+' месяц'
     i=1
     store 'pol' to pole17,pole18
     set printer to c:\txt\prihod1.txt
     do while i<=3     
      do case
       case i=1
        go top
        mprod='substr(prod,1,10)'
        ved1='  ОТЧЕТ О ПОСТУПИВШИХ ПРОДУКТАХ ПИТАHИЯ (общие поставщики) '
zag1=space(5)+t+t+t+post(1)+space(5)+t+t+post(2)+space(5)+t+t+post(3)+space(5)+t+t+post(4)+space(5)+t+t+post(5)+space(5)+t+t+post(6)+space(3)+t+t+'    ПОДХОЭ     || ВСЕГО      ||'
        zag2='  №|Hаименование'+space(1)+t+replicate('кол-во | сумма  |',8)
        t='|'
        t1='|'
        t2='|'
        pole1='str(orspr,7,3)'
        pole2='str(orssup,7,2)'
        pole3='str(moppr,7,3)'
        pole4='str(mopsum,7,2)'
        pole5='str(unpr,7,3)'
        pole6='str(unsum,7,2)'
        pole7='str(naspr,7,3)'
        pole8='str(nassum,7,2)'
        pole9='str(molpr,7,3)'
        pole10='str(molsum,7,2)' 
        pole11='str(hlpr,7,3)'
        pole12='str(hlsum,7,2)'
        pole13='str(podpr,7,3)'
        pole14='str(podsup,7,2)'
        pole15='str(mespn,7,3)'
        pole16='str(messn,7,2)'
        go top
        do pechat
       case i=2
        go top
        mprod='prod'
        t='|'
        t1='|'
        t2=''
        ved1='  ОТЧЕТ О ПОСТУПИВШИХ ПРОДУКТАХ ПИТАHИЯ (гуманитарная помощь) '
zag1=space(4)+t+t+t+post(7)+space(5)+t+t+post(8)+space(5)+t+t+space(4)+post(9)+space(5)+t+t+space(4)+post(10)+space(5)+t+t+space(5)+'ВСЕГО'
        zag2='№|Hаименование продукта'+t+replicate('колич-во|    сумма |',5)
        pole1='str(xg1,8,3)'
        pole2='str(sxg1,8,2)'
        pole3='str(xg2,8,3)'
        pole4='str(sxg2,8,2)'
        pole5='str(xg3,8,3)'
        pole6='str(sxg3,8,2)'
        pole7='str(xg4,8,3)'
        pole8='str(sxg4,8,2)'
        pole9='str(mespg,8,3)'
        pole10='str(messg,8,2)'
        store 'pol' to pole11,pole12,pole13,pole14,pole15,pole16
        go top
        set printer to c:\txt\prihod2.txt
        do pechat
       case i=3
        go top
        mprod='prod'
        ved1='  ОТЧЕТ О ПОСТУПИВШИХ ПРОДУКТАХ ПИТАHИЯ '
        zag1=''
        zag2='№|Hаименование продукта'+t+'КОЛИЧЕСТВО |       СУММА|'
        t='|'
        t1=''
        t2=''
        pole1='STR(mesprih,12,3)'
        pole2='messum'
store 'pol' to pole3,pole4,pole5,pole6,pole7,pole8,pole9,pole10,pole11,pole12,pole13,pole14,pole15,pole16
        go top
        set printer to c:\txt\prihod3.txt
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
    @10,37 prompt 'ПРОСМОТР' 
    @12,37 prompt 'ПЕЧАТЬ'
    menu to w2
     if w2=1
     dat=date()
     do oprmes
     go top
     t='|'
     t1='|'
     ved2='РАСХОД '
     zag1=' Продукт    '+' ПОДОПЕЧНЫЕ  | '+'   ПЕРСОНАЛ   | '+'  ХОЗНУЖДЫ    | '+'       ВСЕГО'
     zag2=space(10)+'  К-во '+' Сумма '+'| '+' К-во '+' Сумма '+'| '+' К-во '+' Сумма '+'| '+'     К-во '+'    Сумма '
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
      ved2=' за '+mesac+' месяц'
      i=1
      do while i<=3
       do case
        case i=1
         set printer to c:\txt\rashod1.txt
         ved1='  ОТЧЕТ ОБ ИЗРАСХОДОВАHHЫХ ПРОДУКТАХ ПИТАHИЯ HА ПОДОПЕЧHЫХ (по группам)'
         t='|'
         t1='|'
         t2='|'
         go top
         zag2='| |'+replicate('К-во|Сумма|',6)
         zag1=space(4)+'№|Hаименование|'+'1-я гр.||2-я гр.||3-я гр.||4-я гр.||Доп.питание||ВСЕГО||'
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
         set printer to c:\txt\rashod2.txt
         ved1='  ОТЧЕТ ОБ ИЗРАСХОДОВАHHЫХ ПРОДУКТАХ ПИТАHИЯ'
         t='|'
         t1='|'
         t2='|'
         go top
         zag2='| |'+replicate('К-во|Сумма |',9)
zag1='№|Hаименование'+t+'ПОДОПЕЧHЫЕ'+'||||||'+'ПЕРСОHАЛ'+'||||||'+'ХОЗHУЖДЫ'+t
         zag3=' | |'+ replicate('ОБЩ.| |ГУМ.| |ВСЕГО| |',3) 
         mprod='substr(prod,1,6)'
         pole1='str(rpodn,7,3)'
         pole2='str(surpodn,6,2)'
         pole3='str(rpodg,7,3)'
         pole4='str(surpodg,6,2)'
         pole5='str(raspod,7,3)'
         pole6='str(surpod,6,2)'
         pole7='str(rpern,5,3)'
         pole8='str(surpern,5,2)'
         pole9='str(rperg,5,3)'
         pole10='str(surperg,5,2)'
         pole11='str(rpern+rperg,5,3)'
         pole12='str(surpern+surperg,5,2)'
         pole13='str(rhn,5,3)'
         pole14='str(shn,5,2)'
         pole15='str(rhg,5,3)'
         pole16='str(shg,5,2)'
         pole17='str(rhn+rhg,5,3)'
         pole18='str(shn+shg,5,2)'
         do pechat
        case i=3
         set printer to c:\txt\rashod3.txt
         select a
         go top
         sum all surpodn+surpern+shn to lev1
         sum all surpodg+surperg+shg to lev2
         sum all surash to lev3
         ved1='ОТЧЕТ ОБ ИЗРАСХОДОВАHHЫХ ПРОДУКТАХ ПИТАHИЯ '
         t='|'
         t1=''
         t2=''
         go top
         zag2='| |'+replicate('К-во|Сумма|',3)
         zag1='№|Hаименование продукта|ОБЩ.СКЛАД||ГУМ.ПОМОЩЬ||ВСЕГО||'
         mprod='prod'
         pole1='str(rpodn+rpern+rhn,9,3)'
         pole2='surpodn+surpern+shn'
         pole3='str(rpodg+rperg+rhg,9,3)'
         pole4='surpodg+surperg+shg'
         pole5='STR(rashod,12,3)'
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
   @10,37 prompt 'ПРОСМОТР' 
   @12,37 prompt 'ПЕЧАТЬ'
   menu to w2
   if w2=1
    go top
    t='|'
    t1=''
    do oprmes
    ved2='ОСТАТОК'
    zag1=' Наименов-е'+space(1)+'О.Остаток'+space(1)+'  О.Сумма'+t++'Г.П.Ост-к'+space(1)+' Г.П.Сумма'+t+'  ОСТАТОК'+space(2)+'    СУММА'
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
     ved2=' за '+mesac+' месяц'
     mprod='prod'
     do while i<=3
      do case
       case i=1
        set printer to c:\txt\ostatok1.txt
        go top
        ved1='ОТЧЕТ HА ОСТАТОК ПРОДУКТОВ ПИТАHИЯ (общий склад)'
        zag1='|'+'|ОСТАТОК 1||ОСТАТОК 2||ОСТАТОК 3||ОСТАТОК 4||ВСЕГО|'
        zag2='№|Hаименование пpодуктов|'+replicate('количество|цена |',4)+'ОСТАТОК|СУММА|'
        pole1='STR(p,9,3)'
        pole2='STR(c,7,2)'
        pole3='STR(q1,9,3)'
        pole4='STR(c1,7,2)'
        pole5='STR(q2,9,3)'
        pole6='STR(c2,7,2)'
        pole7='STR(q3,9,3)'
        pole8='STR(c3,7,2)'
        pole9='str(p+q1+q2+q3,9,3)'
        pole10='str(p*c+q1*c1+q2*c2+q3*c3,12,2)'
        lev4=lev2
        kya='||||||||||'
        do pechat
       case i=2
        set printer to c:\txt\ostatok2.txt
        go top
        ved1='ОТЧЕТ HА ОСТАТОК ПРОДУКТОВ ПИТАHИЯ (гум. помощь)'
        zag1='|'+'|ОСТАТОК 1||ОСТАТОК 2||ОСТАТОК 3||ОСТАТОК 4||ВСЕГО|'
        zag2='№|Hаименование пpодуктов|'+replicate('количество|цена |',4)+'ОСТАТОК|СУММА|'
        pole1='STR(pg,9,3)'
        pole2='STR(cg,7,2)'
        pole3='STR(q1g,9,3)'
        pole4='STR(c1g,7,2)'
        pole5='STR(q2g,9,3)'
        pole6='STR(c2g,7,2)'
        pole7='STR(q3g,9,3)'
        pole8='STR(c3g,7,2)'
        pole9='str(pg+q1g+q2g+q3g,9,3)'
        pole10='str(pg*cg+q1g*c1g+q2g*c2g+q3g*c3g,12,2)'
        lev4=lev3
        kya='||||||||||'
        do pechat
       case i=3
        set printer to c:\txt\ostatok3.txt
        go top
        t='|'
        t1=''
        ved1='ОТЧЕТ HА ОСТАТОК ПРОДУКТОВ ПИТАHИЯ '
        zag1=''
        zag2='№|Hаименование пpодуктов|КОЛИЧЕСТВО|СУММА|'
        pole1='STR(ost,9,3)'
        pole2='STR(sua,12,2)'
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



************************************************************
*                         OTVET                         *
************************************************************

PROCEDURE OTVET
public otv
otv=2
set color to gr+/rb,w+/n
@23,0 clear to 24,79
@23,3 to 24,77
@23,4 say ' '+msg1+' '
@24,33 prompt 'ДА'
@24,43 prompt 'HET'
menu to otv
@23,17 clear to 24,63
return



************************************************************
*                         PECHAT                         *
************************************************************

PROCEDURE PECHAT
** PECHAT.PRG
clear
pn=1
page=1
mar=0
@2,2 say ved1
@2,col() say ved2
set color to b/b
@1,0 clear to 24,79
set color to w+/b
@12,29 say 'ПЕЧАТАЮ ...'
set print on
do while .not. eof()
 l=1
 it=0
 ?'  Знаменский детский дом-интеpнат'
 ?ved1+ved2
 ??' от '+dtoc(data)
 ?
 l=l+2
 ?zag1
 if w0=2 .and. i=2
  ?zag3
  l=l+1
 endif
 ?zag2
 l=l+3
 do while .t.
?str(pn,3),t,&mprod,t,&pole1,t,&pole2,t,&pole3,t,&pole4,t,&pole5,t,&pole6,t,&pole7,t
?? &pole8,t1,&pole9,t1,&pole10,t1
??&pole11,t2,&pole12,t2,&pole13,t2,&pole14,t2,&pole15,t2,&pole16,t2
If w0#1
??&pole17,t2,&pole18
Endif
it=it+1
skip
if eof()
 exit
endif
pn=pn+1
l=l+1
 enddo
 if eof()
  ? '@'
  do case
   case w0=1
    do while.t.
      do case
       case i=1
        t='|'
?t+space(15)+t+space(1)+t+str(ml(1),13,2)+t+space(1)+t+str(ml(2),13,2)+t+space(1)+t
??str(ml(3),13,2)+t+space(1)+t+str(ml(4),13,2)+t+space(1)+t+str(ml(5),13,2)
??t+space(1)+t+str(ml(6),13,2)+t+space(1)+t
??str(ml(11),13,2)+t+space(1)+t+str(ml(12),13,2)
        case i=2
?t+space(15)+t+space(1)+t+str(ml(7),17,2)+t+space(1)+t+str(ml(8),17,2)+t+space(1)
??t+str(ml(9),17,2)+t+space(1)+t+str(ml(10),17,2)+t+space(1)+t+str(ml(13),17,2)
       case i=3
        ? '@'
        ??' ВСЕГО ПОСТУПИЛО ПРОДУКТОВ HА СУММУ: |||'
        ??ml(14)
      endcase
      exit
    enddo
   case w0=2
    do while.t.
      do case
       case i=1
        t='|'
        ? '@'
      ?? '| | |'+str(ml(1),16,2)+t+space(1)+t+str(ml(2),16,2)+t+space(1)
        ??t+str(ml(3),16,2)+t+space(1)+t+str(ml(4),16,2)
        ??t+space(1)+t+str(ml(15),16,2)+t+space(1)+t+str(ml(5),16,2)+t
       case i=2
        t='|'
        ? '@'
        ?? '| | |'+str(ml(6),14,2)+t+space(1)+t+str(ml(7),14,2)+t+space(1)
        ??t+str(ml(5),14,2)+t+space(1)+t+str(ml(8),11,2)
        ??t+space(1)+t+str(ml(9),11,2)
        ??t+space(1)+t+str(ml(10),11,2)+t+space(1)+t+str(ml(11),11,2)
        ??t+space(1)+t+str(ml(12),11,2)+t+space(1)+t+str(ml(13),11,2)+t
       case i=3
        t='|'
        ? '@'
        ?? '| | |'+str(lev1,18,2)+t+space(1)+t+str(lev2,18,2)
        ??t+space(5)+t+str(lev3,18,2)
      endcase
      exit
      ?'+'
      set print off
    enddo
   case w0=3
    ?'|ОБЩАЯ СУММА:'+kya+str(lev4,12,2)
  endcase 
 ** ?'+'
 else
 ** ?'+'
  if eof()
   exit
  endif
  set print off
  set print on
  loop
 endif
enddo
set print off
return


************************************************************
*                         PRIEM                         *
************************************************************

PROCEDURE PRIEM
public pri
pri=1
set color to gr+/rb,w+/n
@23,0 clear to 24,79
@23,17 to 24,63
@23,19 say ' '+msg2+' '
@24,29 prompt 'ЗАКУСКИ'
@24,col()+2 prompt ' 1 '
@24,col()+2 prompt ' 2 '
@24,col()+2 prompt ' 3 '
menu to pri
@23,17 clear to 24,63
return




************************************************************
*                         PROGON                         *
************************************************************

PROCEDURE PROGON
** eject
?'+'
page=page+1
set print off
clear
otv=2
msg1=r3+r4
do while otv=2
 do otvet
enddo
set color to w+/b
clear
set print on   
?'Лист '+chr(252)+str(page,2)+space(7)+dtoc(dat)
l=2
return



************************************************************
*                         PROSM                         *
************************************************************

PROCEDURE PROSM
** PROSM.PRG
clear
@0,2 say ved2+' за '+mesac+' месяц'
@1,0 say replicate('_',79)
@2,1 say zag1
set color to w+/b
go top
do while .not. eof()
 @3,0 clear
 l=0
 do while l<17 .and. .not. eof()
  @row()+1,1 say &name+space(1)+&pole1+space(1)+&pole2+t+&pole3+space(1)
  @row(),col() say &pole4+t+&pole5+space(1)+&pole6+t1+&pole7+space(1)+&pole8
  l=l+1
  skip
 enddo
 if eof()
  set color to w+/bg
  if w0=1
   do while .t.
    if l<10
     @row()+1,0 say replicate('_',79)
     @row()+1,1 say post(1)+space(2)+str(ml(1),12,2)+space(5)+post(7)+space(2)+str(ml(7),12,2)
     @row()+1,1 say post(2)+space(2)+str(ml(2),12,2)+space(5)+post(8)+space(2)+str(ml(8),12,2)
     @row()+1,1 say post(3)+space(2)+str(ml(3),12,2)+space(5)+post(9)+space(2)+str(ml(9),12,2)
     @row()+1,1 say post(4)+space(2)+str(ml(4),12,2)+space(5)+post(10)+space(2)+str(ml(10),12,2)
     @row()+1,1 say post(5)+space(2)+str(ml(5),12,2)
     @row()+1,1 say post(6)+space(2)+str(ml(6),12,2)
     @row()+1,1 say 'ПОДХОЗ:'+space(5)+str(ml(11),12,2)
     @row()+1,1 say 'ВСЕГО: '+space(5)+str(ml(12),12,2)+space(5)+'ВСЕГО: '+space(5)+str(ml(13),12,2)
     @row()+1,20 say 'ИТОГО: '+space(2)+str(ml(14),12,2)
     exit
    else
     wait
     @2,0 clear
     set color to w+/bg
     @2,0 say ''
     l=0
     loop
    endif
   enddo
  else
   if w0=2
    @row()+1,0 say replicate('_',79)
    @row()+1,0 say ' СУММА :'+space(6)+str(ml(5),12,2)+space(4)+str(ml(10),12,2)
    @row(),col() say space(4)+str(ml(13),12,2)+space(9)+str(ml(14),12,2)
   else
    @row()+1,10 say 'О.СУММА:'+space(2)+str(lev2,12,2)
    @row(),col()+1 say 'Г.П.СУММА:'+space(1)+str(lev3,9,2)
    @row(),col()+1 say 'ВСЕГО :'+space(1)+str(lev1,12,2)
   endif
  endif
  set color to w+/b
 else
  @row()+2,1 say space(12)+'ВВЕРХ'+space(7)+' *** '+space(6)+'ВНИЗ'+space(14)+' ***'
  @row()+1,1 say ' PgUp-стpаница '+chr(24)+'-запись  ***  PgDn-стpаница '+chr(25)+'-запись  ***  Esc-закончить'
  co=col()
  @row()-2,0 to row()+1,co+2 double
 endif
 read
 lev=readkey()
 do case
  case eof()
   do case
    case lev=6 .or. lev=6+256
     skip -(l+16)
    case lev=4 .or. lev=4+256
     skip-18
    otherwise
     exit
   endcase
  case lev=6 .or. lev=6+256
   skip -(l+16)
  case lev=7 .or. lev=7+256
   skip -1 
  case lev=12 .or. lev=12+256
   exit
  case lev=5 .or. lev=5+256
   skip-16
  case lev=4 .or. lev=4+256
   skip-18
 endcase
enddo
return



************************************************************
*                         STARTFOX                         *
************************************************************

PROCEDURE STARTFOX
SET COLOR TO W+/B,N/BG,N
**SET PATH TO d:\dieta
**SET PATH TO d:\treb
SET TALK OFF
SET SCOREBOARD ON
SET STATUS ON
SET DATE GERMAN
SET CONFIRM OFF
SET ESCAPE OFF
SET EXACT ON
SET BELL ON
SET CARRY OFF
SET DEVICE TO SCREEN
SET MENU ON
SET INTENSITY ON
SET PRINT OFF
SET SAFETY OFF
SET DELETED OFF
SET HEADING OFF
SET CENTURY OFF
SET DELIMITERS OFF
SET FIXED ON
RETURN
**КОНЕЦ**


************************************************************
*                         TITUL                         *
************************************************************

PROCEDURE TITUL
set color to w+/w+
clear
ramka= chr(176)+chr(176)+chr(176)+chr(176)+chr(176)+chr(176)+chr(176)+chr(176)+chr(176)
set color to g/w
@2,16,20,71 box ramka
set color to g/g
@4,12 clear to 22,67
set color to b+/bg+
@4,12 to 22,67 double
set color to w+/bg
@8,15 say 'Веpсия 3.00'
@21,17 say 'Znamenka'
@21,38 say '2009'
@22,35 say 'APSVCH-00002'
@21,58 say 'SERGE'
set color to b/b
**A
@7,33 clear to 11,33
@6,34 clear to 7,34
@10,34 clear to 10,34
@5,35 clear to 11,35
**P
@5,38 clear to 11,38
@5,39 clear to 5,39
@8,39 clear to 8,39
@5,40 clear to 8,40
**M
@5,43 clear to 11,43
@6,44 clear to 7,44
@7,45 clear to 8,45
@8,46 clear to 8,46
@7,47 clear to 8,47
@6,48 clear to 7,48
@5,49 clear to 11,49
**П
@13,24 clear to 19,24
@13,25 clear to 13,25
@13,26 clear to 19,26
**И
@13,28 clear to 19,28
@16,29 clear to 18,29
@14,30 clear to 16,30
@13,31 clear to 19,31
**T
@13,33 clear to 13,35
@14,34 clear to 19,34
**A
@15,37 clear to 19,37
@14,38 clear to 15,38
@18,38 clear to 18,38
@13,39 clear to 19,39
**H
@13,43 clear to 19,43
@16,44 clear to 16,44
@13,45 clear to 19,45
**И
@13,48 clear to 19,48
@16,49 clear to 18,49
@14,50 clear to 16,50
@13,51 clear to 19,51
**E
@13,54 clear to 19,54
@13,55 clear to 13,56
@16,55 clear to 16,55
@19,55 clear to 19,56
k=inkey(5)
return


************************************************************
*                         ZAMEN                         *
************************************************************

PROCEDURE ZAMEN
**zamen.prg
go top
replace all p with b->p,c with b->c,q1 with b->q1,c1 with b->c1
replace all q2 with b->q2,c2 with b->c2,q3 with b->q3,c3 with b->c3
replace all pg with b->pg,cg with b->cg,q1g with b->q1g,c1g with b->c1g
replace all q2g with b->q2g,c2g with b->c2g,q3g with b->q3g,c3g with b->c3g
replace all ost with b->ost,sua with b->sua

replace all prihod with b->prihod,cena with b->cena         
replace all prihodg with b->prihodg,cenag with b->cenag
replace all mesprih with b->mesprih,messum with b->messum
replace all mespg with b->mespg,messg with b->messg
replace all xg1 with b->xg1,xg2 with b->xg2,xg3 with b->xg3,xg4 with b->xg4
replace all sxg1 with b->sxg1,sxg2 with b->sxg2,sxg3 with b->sxg3
replace all sxg4 with b->sxg4

replace all mespn with b->mespn,messn with b->messn
replace all orspr with b->orspr,orssup with b->orssup
replace all moppr with b->moppr,mopsum with b->mopsum
replace all unpr with b->unpr,unsum with b->unsum
replace all naspr with b->naspr,nassum with b->nassum
replace all molpr with b->molpr,molsum with b->molsum
replace all hlpr with b->hlpr,hlsum with b->hlsum
replace all podpr with b->podpr,podsup with b->podsup

replace all rashod with b->rashod,surash with b->surash
replace all raspod with b->raspod,surpod with b->surpod
replace all rpodg with b->rpodg,rpodn with b->rpodn
replace all g1 with b->g1,g2 with b->g2,g3 with b->g3,g4 with b->g4
replace all surpodg with b->surpodg,surpodn with b->surpodn
replace all sg1 with b->sg1,sg2 with b->sg2,sg3 with b->sg3,sg4 with b->sg4
replace all rperg with b->rperg,surperg with b->surperg
replace all rpern with b->rpern,surpern with b->surpern
replace all rhg with b->rhg,shg with b->shg,rhn with b->rhn,shn with b->shn
replace all rdg with b->rdg,srdg with b->srdg,rdn with b->rdn,srdn with b->srdn
replace all vg with b->vg,svg with b->svg,vn with b->vn,svn with b->svn
replace all nedost with b->nedost
go top
pp='  '
return


************************************************************
*                         ZAMPOL                         *
************************************************************

PROCEDURE ZAMPOL
replace all p with b->p,c with b->c,q1 with b->q1,q2 with b->q2,q3 with b->q3,c1 with b->c1,c2 with b->c2,c3 with b->c3
go top
replace all rashod with b->rashod,surash with b->surash,ost with b->ost,sua with b->sua,mesprih with b->mesprih,messum with b->messum
go top
replace all orspr with b->orspr,orssup with b->orssup,podpr with b->podpr,podsup with b->podsup,raspod with b->raspod
go top
replace all surpod with b->surpod,rasper with b->rasper,surper with b->surper,hozras with b->hozras,suhozras with b->suhozras
go top
return


************************************************************
*                         UST                         *
************************************************************

PROCEDURE UST

**ПОДПРОГРАММА УСТАНОВКИ ПАРАМЕТРОВ СРЕДЫ FOXBASE+**
SET TALK OFF
SET SCOREBOARD OFF
SET STATUS OFF
SET DATE GERMAN
SET CONFIRM OFF
SET ESCAPE OFF
SET EXACT ON
SET BELL ON
SET CARRY OFF
SET DEVICE TO SCREEN
SET MENU ON
SET INTENSITY ON
SET PRINT OFF
SET SAFETY OFF
SET DELETED OFF
SET HEADING OFF
SET CENTURY OFF
SET DELIMITERS OFF
SET FIXED ON
RETURN
**КОНЕЦ**


