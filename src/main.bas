































80 screen 0:cls:key off

90 color 15,4,4
100 locate 10,5
110 print "Level 1"
120 locate 0,10
130 print "Un pajaro lanza una caca que te mata, al otro le tienes que coger 10 veces la caca roja"
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







700 screen 0

710 erase ex,ey,ew,eh,es,ep,ev,ec,ed
720 erase dx, dy, dw, dh, da, ds
730 erase sx, sy,sw,sh

    740 COLOR 1,1,1:SCREEN 3
    750 OPEN "GRP:"AS#1
    760 FOR I=1 TO 10
        770 M$="Ganaste!"

        780 Y=24:X=0
        790 FOR K=1 TO 2
            800 FOR J=1 TO LEN(M$)
                810 COLOR RND(1)*14+2
                812 PRESET(X,Y)
                813 PRINT#1,MID$(M$,J,1)
                814 X=X+32
            815 NEXT J
        820 M$="":Y=120:X=4
    830 NEXT K,I
    835 close #1
840 screen 0: cls: color 15,1,1

850 input "¿Otra partida S/N ";a$
860 if a$="s" or a$="S" then :goto 80
870 if a$="n" or a$="N" then print "adios": for i=0 to 500: next i:cls:end
880 goto 875






900 screen 0
910 erase ex,ey,ew,eh,es,ep,ev,ec,ed
920 erase dx, dy, dw, dh, da, ds
930 erase sx, sy,sw,sh

940 locate 0,10
960 print " Te han matado!!"
970 input "¿Otra partida S/N ";a$
875 close #1
980 if a$="s" or a$="S" then goto 80
990 if a$="n" or a$="N" then print "adios":for i=0 to 500: next i:cls:end
995 goto 980


990 end



























   





 









        2000 gosub 3000

        2020 gosub 10500

        2030 gosub 21000

        2040 gosub 21700 

        2050 gosub 6000 

        2060 gosub 5100

        2070 gosub 5000

    2080 goto 2000
2090 return




    3000 if pe=0 then interval off: close: gosub 900
    3010 if pc=10 then interval off: close: gosub 700
3040 return







    5000 if dx(0) < px + pw and  dx(0) + dw(0) > px and dy(0) < py + ph and dh(0) + dy(0) > py then gosub 5200

    5010 if dx(1) < px + pw and  dx(1) + dw(1) > px and dy(1) < py + ph and dh(1) + dy(1) > py then gosub 5300

    5020 if zx < px + pw and  zx + zw > px and zy < py + ph and zh+ zy > py then gosub 5200
5070 return



    5100 if ph + py < sy(0) then py=py+g: pu=1 else pu=0
5110 return







    5200 ' nada'

    5210 pe=pe-10
    5220 beep

    5250 gosub 7000
5260 return








    5300 pc=pc+1

    5350 gosub 7000
5360 return












6000 on stick(0) gosub 11130,6000,11050,6000,11170,6000, 11090
6010 return





    7000 'line (0,0)-(w, 10), 14, bf
    7010 preset (20,10)
    7020 print #1,  chr$(205)" "pe", capturas: "pc
    7030 'preset (120,10)
    7040 'print #1, "z: x"zx", y" zy
7050 return
































    10000 let px=100: let py=h-64: let pw=16: let ph=16: let pd=3: let pu=0: let pv=10: let pe=100: let pc=0



    10010 let ps=0: let pp=1
10040 return





    10500 put sprite ps,(px,py),,pp
10990 return



11040 'Subrutinas mover '




    11050 px=px+pv

    11060 pp=1

    11065  'nada'
    11070 'if pc>0 then pp=pp+1 else pc=0


    11075 if px>=w-pw then px=w-pw
    11076 'gosub 7000
11080 return

    11090 px=px-pv
    11100 pp=3
    11105 'pc=pc+1
    11110  'if pc>0 then pp=pp+1 else pc=0

    11115 if px<0 then px=0
    11116 'gosub 7000
11120 return


    11130 if pu<>1 then py=py-35
    11140 pp=7
    11145 'if pc=0 then pp=pp+1 else pc=0
    11150' pc=pc+1


    11155 if py<=30 then py=30
    11156 if py>200 then py=200
    11157 'gosub 7000
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









































    20000 ee=0: en=1





    20010 dim ex(en),ey(en),ew(en),eh(en),es(en),ep(en),ev(en),ec(en),ed(en)

    20020 zx=0:zy=w-90:zw=16:zh=16:zs=18:zs=17:zp=17:zv=10:zc=0   
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

        21030 'if ex(i)>256 then ex(i)=-17
        21040 if ey(i)>212 then ey(i)=-17

        21050 if ex(i)>255 then ee=i: gosub 21300

        21060 'if ex(i)<0 then ee=i: gosub 21400

        21070 ec(i)=ec(i)+1 

        21080 if ec(i)=10 and i=0 then ec(i)=0: dx(0)=ex(i)-pv(i): dy(0)=ey(i)+5: da(0)=1: ex(i)=ex(i)-ev(i): gosub 50000
        21090 if ec(i)=17 and i=1 then ec(i)=0: dx(1)=ex(i)-pv(i): dy(1)=ey(i): da(1)=1: ex(i)=ex(i)-ev(i): play "t230o4c#"
        21100 'if ec(i)=23 and i=2 then ec(i)=0: dx(2)=ex(i)-pv(i): dy(2)=ey(i): da(2)=1: ex(i)=ex(i)-ev(i): play "t230o3bg#"
        21110 'if ec(i)=25 and i=2 then ec(i)=0: dx(3)=ex(i)-pv(i): dy(3)=ey(i): da(3)=1: ex(i)=ex(i)-ev(i): play "t230o4e"

        21120 put sprite es(i),(ex(i),ey(i)),,ep(i)

        21130 if ep(i)=es(i) then ep(i)=es(i)+1 else ep(i)=es(i)
    21140 next i

    21150 zx=zx+zv
    21160 if zx>256 then zx=0

    21170 'if zp=zs then zp=zs+1 else zp=zs
    21180 put sprite zp,(zx,zy),,zs
21190 return



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
    21550 next i
21560 return


    21700 for i=0 to dn

        21710 if da(i)=1 then dy(i)=dy(i)+dv(i)
        21720 if dy(i)>=200 then dy(i)=-16: da(i)=0
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





















































    31000 cls

    31120 'color 15,1,1


    31130 screen 5,2

    31140 key off

    31150 defint a-z

    31160 interval on

    31170 let w=256: let h=212 

    31180 let g=4
31190 return








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
