































80 screen 0:cls:key off

90 color 15,4,4
100 locate 10,5
110 print "Level 1"
120 locate 0,10
130 print "Que no te caguen encima los pajaros"
160 locate 0,21

170 for i=0 to 2000: next i


180 gosub 31000

190 gosub 10000

200 gosub 20000

210 gosub 21500

220 gosub 22000

230 gosub 23000

240 gosub 32000

250 gosub 23000

260 gosub 32100

270 gosub 33000

280 open "grp:" for output as #1

290 'on interval=120 gosub 21100

300 gosub 7000

310 'on sprite gosub 5200: sprite on

320 on strig gosub 5200

330 strig(0) on

340 gosub 2000






900 gosub 30300

910 locate 0,100
930 input "¿Otra partida S/N ";a$
940 if a$="s" or a$="S" then goto 80
950 if a$="n" or a$="N" then print "adios":for i=0 to 500: next i:cls:end
960 goto 930


990 end



























   





 









        2000 gosub 3000

        2020 gosub 10500

        2030 gosub 21000

        2040 gosub 21700 

        2050 gosub 6000 

        2060 gosub 5000

    2070 goto 2000
2080 return




    3000 'if pe=0 then gosub 31300
3040 return








    5000 if px < dx(0) + dw(0) and  px + pw > dx(0) and py < dy(0) + dh(0) and ph + py > dy(0) then gosub 5200

    5040 'for i=0 to 10

        5050 if ph + py < sy(0) then py=py+g
    5060' next i
5070 return








    5100 beep

    5110 pc=pc+1

    5120 pe=pe+10

    5150 gosub 7000
5170 return





    5200 'sprite off

    5210 pe=pe-10
    5220 beep

    5250 gosub 7000
5260 return





    5300 if pd=3 then px=px-pv
    5310 if pd=7 then px=px+pv
    5320 if pd=1 then py=py+pv
    5330 if pd=5 then py=py-pv

    5340 'pz=1
5350 return











6000 on stick(0) gosub 11130,6000,11050,6000,11170,6000, 11090
6010 return





    7000 'line (0,0)-(w, 10), 14, bf
    7010 preset (20,10)
    7020 print #1, "Vidas: "pe
    7030 preset (120,10)
    7040 print #1, "Capturas: "pc
7050 return



    7100 preset (30,0)
    7110 print #1, "   "pe"     "
7120 return



























    10000 let px=100: let py=h-64: let pw=16: let ph=16: let pd=3



    10010 let ps=0: let pp=1

    10020 let pv=10: let pe=100: let pc=0'
10040 return





    10500 put sprite ps,(px,py),,pp
10990 return



11040 'Subrutinas mover '




    11050 px=px+pv

    11060 pp=1

    11065  pc=pc+1
    11070 if pc>0 then pp=pp+1 else pc=0


    11075 if px>=w-pw then px=w-pw
11080 return

    11090 px=px-pv
    11100 pp=3
    11105 pc=pc+1
    11110  if pc>0 then pp=pp+1 else pc=0

    11115 if px<0 then px=0
11120 return

    11130 'nada' 
    11135 py=py-10
    11140 pp=7
    11145 if pc=0 then pp=pp+1 else pc=0
    11150 pc=pc+1


    11155 if py<=30 then py=30
    11156 if py>200 then py=200
11160 return

    11170 'py=py+pv
    11180 'pp=5
    11182 'ps=ps+1
    11185 'if ps>1 then pp=pp+1: ps=0
    11187 'if py >=212-ph then py=212-ph
    11188 'pe=pe-1

    11189 'pd=5

    11190 'gosub 7100
11200 return









































    20000 ee=0: en=0





    20010 dim ex(en),ey(en),ew(en),eh(en),es(en),ep(en),ev(en),ec(en),ed(en)
    20030 for i=0 to en

        20040 ey(i)=rnd(1)*100

        20050 if ey(i)<30 then goto 20030

        20060 ed(i)=7
        20070 if ed(i)>5 then ed(i)=3 else ed(i)=7
        20080 ex(i)=-20*i: ew(i)=16: eh(i)=16: es(i)=(2*i)+9: ep(i)=(2*i)+9: ev(i)=10: ec(i)=0
    20090 next i
20100 return






    21000 for i=0 to en

        21010 if ed(i)=3 then ex(i)=ex(i)+ev(i) 

        21020 if ed(i)=7 then ex(i)=ex(i)-ev(i) 

        21030 'if ex(i)>255 then ee=i: gosub 21300

        21040 'if ex(i)<0 then ee=i: gosub 21400

        21060 ec(i)=ec(i)+1 

        21070 if ec(i)=10 and i=0 then ec(i)=0: dx(0)=ex(i)-pv(i): dy(0)=ey(i)+5: da(0)=1: ex(i)=ex(i)-ev(i): gosub 50000
        21080 'if ec(i)=17 and i=1 then ec(i)=0: dx(1)=ex(i)-pv(i): dy(1)=ey(i): da(1)=1: ex(i)=ex(i)-ev(i): play "t230o4c#"
        21090 'if ec(i)=23 and i=2 then ec(i)=0: dx(2)=ex(i)-pv(i): dy(2)=ey(i): da(2)=1: ex(i)=ex(i)-ev(i): play "t230o3bg#"
        21100 'if ec(i)=25 and i=2 then ec(i)=0: dx(3)=ex(i)-pv(i): dy(3)=ey(i): da(3)=1: ex(i)=ex(i)-ev(i): play "t230o4e"

        21110 put sprite es(i),(ex(i),ey(i)),,ep(i)

        21120 if ep(i)=es(i) then ep(i)=es(i)+1 else ep(i)=es(i)
    21130 next i
21140 return



    21300 ex(ee)=32

    21330 ey(ee)=rnd(1)*100

    21340 if ey(ee)<20 then goto 21330

    21350 ev(ee)=rnd(1)*10
21360 return



    21400 ex(ee)=220

    21430 ey(ee)=rnd(1)*100

    21440 if ey(ee)<20 then goto 21430

    21450 ev(ee)=rnd(1)*10
21460 return





















    21500 let dn=en
    21510 dim dx(dn), dy(dn), dw(dn), dh(dn), da(dn), ds(dn)

    21520 for i=0 to dn
        21530 dx(i)=20*i: dy(i)=-16: dw(i)=16: dh(i)=16: da(i)=0: ds(i)=0: dv(i)=10
    21540 next i
21550 return


    21700 for i=0 to dn

        21710 if da(i)=1 then dy(i)=dy(i)+dv(i)
        21720 if dy(i)>=212 then dy(i)=-16: da(i)=0
        21730 if i=0 then put sprite 25,(dx(i),dy(i)),,25
        21740 if i=1 then put sprite 26,(dx(i),dy(i)),,26
        21750 if i=2 then put sprite 27,(dx(i),dy(i)),,27
        21760 if i=1 then put sprite 28,(dx(i),dy(i)),,28
    21770 next i    
21780 return



































        22000 sn=20

        22010 dim sx(sn), sy(sn),sw(sn),sh(sn)
        22020 for i=0 to sn

            22030 sx(i)=16*i: sy(i)=212-32: sw(i)=16: sh(i)=16
        22040 next i
    22050 return

    
 




        23000 for i=0 to sn
            23050 copy (4*16,0)-((4*16)+sw(1),0+sh(1)),1 to (sx(i), sy(i)),0
        23060 next i
    23070 return














































    30000 'SCREEN 5
    30020 'DATA 0,0,0,2,2,2,2,4,2,5,0,0,0,0,5,4,3,2,2,3,5,0,7,0
    30030 'DATA 7,3,0,4,0,7,2,5,6,6,5,2,5,4,5,2,6,7,7,6,2,7,7,6
    30040 'FOR C=0 TO 15:READ R,G,B:COLOR=(C,R,G,B):NEXT
    30050 'BLOAD"FONDO.SC5",S
30080 return






    30300 screen 0
    30320 'color 11,1,1
    30330 locate 0,10
    30340 print " Te han matado!!"
    30350 erase ex,ey,ew,eh,es,ep,ev,ec,ed
    30360 erase dx, dy, dw, dh, da, ds
    30370 erase sx, sy,sw,sh
30380 return















    31000 cls

    31120 'color 15,1,1


    31130 screen 5,2

    31140 key off

    31150 defint a-z

    31160 interval on

    31170 let w=256: let h=212 

    31180 let g=4
31190 return


    31300 interval off
    31310 close #1

    31320 goto 900
31380 return






    32000 restore 32000
    32010 'DATA 0,0,0,3,1,1,2,2,2,1,4,0,4,2,1,5,1,1,3,5,0,4,4,2
    32020 'DATA 3,6,0,7,0,0,6,4,2,7,3,3,4,7,2,2,4,7,6,6,4,2,7,7
    32030 'FOR C=0 TO 15:READ R,G,B:COLOR=(C,R,G,B):NEXT

    32040 BLOAD"SCR1P1.SC5",S,32768 
    32060 color=restore
    32070 'color 15,4,4
32080 return





    32100 fx(0)=0: fy(0)=0: fw(0)=16: fh(0)=16
    32105 for i=0 to w-fw(0) step fw(0)

        32110 copy (0,0)-(0+fw(0),0+fh(0)),1 to (i, 10),0
        32120 copy (2*16,0)-((2*16)+fw(0),0+fh(0)),1 to (i, h-fh(0)),0
    32130 next i

    32140 'for i=0 to h-fh(0) step fh(0)
        32150 'copy (3*16,0)-((3*16)+fw(0),0+fh(0)),1 to (0, i),0
        32160 'copy (1*16,0)-((1*16)+fw(0),0+fh(0)),1 to (w-fw(0), i),0
    32170 'next i

    32180 'copy (32,32)-(256,120),1 to (16,28),0
32190 return








 





    33000 bload "rutinas.bin"
    33010 defusr=50000
    33020 a=usr(0)
33990 return













































50000 SOUND 0,0:SOUND 7,198:SOUND 8,16:SOUND 12,2:SOUND 13,3
50010 return

50100 play "t230o3e"
50110 return
