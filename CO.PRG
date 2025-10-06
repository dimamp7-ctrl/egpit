**co.prg
on error do err
kkk=katalog+'\'+fn
@24,0 clear to 24,79
@24,25 say 'Šˆ‚€ˆ… '+fn+' € '+kkk
copy file &fn to &kkk
if er#0
 return
endif
on error 
return

