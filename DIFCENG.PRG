*** DIFCENG.prg
set color to w+/b,w+/bg
** public SG
if mitog=0
  SG=0
  if prihodg#0
    do case
      case q3g#0
       replace c3g with (q3g*c3g+q2g*c2g)/(q3g+q2g),q3g with q3g+q2g,q2g with q1g
       replace c2g with c1g,q1g with pg,c1g with cg,pg with prihodg,cg with cenag
       replace prihodg with 0,cenag with 0
      otherwise
        replace q3g with q2g,c3g with c2g,q2g with q1g,c2g with c1g,q1g with pg,c1g with cg
       replace pg with prihodg,cg with cenag,prihodg with 0,cenag with 0
    endcase
  endif
else
 if (q3g-mitog)>0
  s3=mitog*c3g
  SG=s3
  if prihodg=0
    replace q3g with q3g-mitog
  else
    replace c3g with ((q3g-mitog)*c3g+q2g*c2g)/((q3g-mitog)+q2g),q3g with(q3g-mitog)+q2g
    replace q2g with q1g,c2g with c1g,q1g with pg,c1g with cg,pg with prihodg,cg with cenag
    replace prihodg with 0,cenag with 0
  endif
  mitog=0
 else
  s3=q3g*c3g
  mitog=mitog-q3g
  if q2g-(mitog)>0
    s2=mitog*c2g
    SG=s3+s2
    if prihodg=0
       replace q2g with q2g-mitog,q3g with 0,c3g with 0
    else
       replace q3g with q2g-mitog,c3g with c2g,q2g with q1g
       replace c2g with c1g,q1g with pg,c1g with cg,pg with prihodg,cg with cenag
       replace prihodg with 0,cenag with 0
    endif
   mitog=0
  else
   s2=q2g*c2g
   mitog=mitog-q2g
   if q1g-mitog>0
    s1=mitog*c1g
    SG=s3+s2+s1
    if prihodg=0
     replace q1g with q1g-mitog,q2g with 0,c2g with 0
     replace q3g with 0,c3g with 0
    else
     replace q3g with 0,c3g with 0,q2g with q1g-mitog
     replace c2g with c1g,q1g with pg,c1g with cg,pg with prihodg,cg with cenag
     replace prihodg with 0,cenag with 0
    endif
    mitog=0
   else
    s1=q1g*c1g
    mitog=mitog-q1g
    if pg-mitog>0
     s0=mitog*cg
     SG=s3+s2+s1+s0
     if prihodg=0
      replace pg with pg-mitog,q1g with 0,c1g with 0
      replace q2g with 0,c2g with 0,q3g with 0,c3g with 0
     else
      replace q1g with pg-mitog,c1g with cg,pg with prihodg
      replace cg with cenag,prihodg with 0,cenag with 0,q2g with 0,c2g with 0
      replace q3g with 0,c3g with 0
     endif
     mitog=0
    else
     s0=pg*cg
     mitog=mitog-pg
     if prihodg-mitog>0
      s=mitog*cenag
      SG=s+s3+s2+s1+s0
      replace prihodg with prihodg-mitog
      replace pg with prihodg,cg with cenag,prihodg with 0,cenag with 0 
      replace q1g with 0,c1g with 0,q2g with 0,c2g with 0,q3g with 0,c3g with 0
      mitog=0
     else
      s=prihodg*cenag
      mitog=mitog-prihodg
      SG=s+s3+s2+s1+s0
      replace pg with 0,cg with 0,prihodg with 0,cenag with 0 
      replace q1g with 0,c1g with 0,q2g with 0,c2g with 0,q3g with 0,c3g with 0
     endif
    endif
   endif
  endif
 endif
endif
return

