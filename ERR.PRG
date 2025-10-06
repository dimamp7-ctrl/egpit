set color to w+/b
clear
set color to w+/r
er=error()
mes=message()
mes1=message(1)
@12,29 say '˜ˆŠ€ !!!'
if er=56
 @12,col() say '…’ ‘‚„ƒ Œ…‘’€ € „ˆ‘Š… '+kk
else
 if er=1002
  @12,col()+2 say '… —ˆ’€…’‘Ÿ „ˆ‘Š ‚ „ˆ‘Š‚„… '+kk
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
