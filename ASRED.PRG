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
