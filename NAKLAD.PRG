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
   set margin to 9
   msg1='Запpавьте бумагу.Включите пpинтеp.Готово ?'
   do otvet
   if otv=2
    loop
   endif
   set printer to c:\txt\naklad.txt
   set color to gr+/b,w+/bg
   clear
   go top
   sum all pprih*pcen to ppss
   go top
   if ppss#0
    clear
    set print on
**    ?chr(27)+'G'
    ?'\д'
    ?'ПРИХОД'+space(7)+'НАКЛАДНАЯ'+space(1)+chr(252)+ltrim(str(nak))+space(3)+'поставщик: '+postavka
    ?'за '+dtoc(datn)
**    ?chr(27)+'H'
    ?'\о'
    ?' Наименование пpодукта '+space(2)+'ед'+space(4)+'пpиход'
    ??space(6)+'цена'+space(6)+'СУММА'
    list all off prod,'кг',pprih,pcen,pprih*pcen for pprih#0 to print
    ?space(29)+'ОБЩАЯ СУММА: '+str(ppss,10,2)
    ?
    ?'----------------------------------------------------------------------'
**    ?chr(10)
    set print off
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
