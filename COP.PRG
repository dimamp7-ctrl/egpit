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

