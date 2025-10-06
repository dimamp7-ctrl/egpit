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

