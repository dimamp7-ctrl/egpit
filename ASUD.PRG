
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

