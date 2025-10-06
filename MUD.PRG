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
