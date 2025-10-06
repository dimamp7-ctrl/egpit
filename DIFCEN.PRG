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

