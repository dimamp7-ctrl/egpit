
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

