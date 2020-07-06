







40 'gosub 30000


50 'a$=inkey$: if a$="" goto 50 






80 screen 0:cls
90 color 11,1,1
100 locate 10,5
110 print "Level 1"
120 locate 0,10
130 print "Que no te caguen encima los pajaros"
160 locate 0,21

170 for i=0 to 2000: next i


180 gosub 31000

185 gosub 10000

186 gosub 20000

195 gosub 22000

196 gosub 23000

200 gosub 32000

210 gosub 23000

220 gosub 32100

230 gosub 33000

240 open "grp:" for output as #1

250 on interval=120 gosub 21100

260 gosub 7000

310 gosub 2000






900 gosub 30300

910 locate 0,100
930 input "¿Otra partida S/N ";a$
940 if a$="s" or a$="S" then goto 80
950 if a$="n" or a$="N" then print "adios":for i=0 to 500: next i:cls:end
960 goto 930


990 end



























   





 









        2000 'gosub 3000

        2020 gosub 10500

        2030 gosub 21000

        2040 gosub 6000 

        2050 gosub 5000

    2060 goto 2000
2090 return




    3000 if pe=0 then gosub 31300
3040 return







    5000 if px < ex(0) + ew(0) and  px + pw > ex(0) and py < ey(0) + eh(0) and ph + py > ey(0) then gosub 5100 

    5010 if px < ex(1) + ew(1) and  px + pw > ex(1) and py < ey(1) + eh(1) and ph + py > ey(1) then gosub 5200 

    5020 for i=0 to 10

        5030 if ph + py < sy(i) then py=py+1
    5040 next i
5050 return








    5100 beep

    5110 pc=pc+1

    5120 pe=pe+10

    5150 gosub 7000
5170 return





    5200 beep

    5210 pe=0
5220 return





    5300 if pd=3 then px=px-pv
    5310 if pd=7 then px=px+pv
    5320 if pd=1 then py=py+pv
    5330 if pd=5 then py=py-pv

    5340 'pz=1
5350 return








6000 'Subrutina captura movimiento joystick / cursores y boton de disparo'


    6010 j=stick(0)
    6020 if j=3 and pe<>0 then  gosub 11050
    6030 if j=7 and pe<>0 then  gosub 11090
    6040 if j=1 and pe<>0 then  gosub 11130
    6050 if j=5 and pe<>0 then  gosub 11170 
6080 return





    7000 line (0,0)-(w, 10), 14, bf
    7010 preset (0,0)
    7020 print #1, "Vidas: "pe
    7030 preset (150,0)
    7040 print #1, "Capturas: "pc
7050 return



    7100 preset (30,0)
    7110 print #1, "   "pe"     "
7120 return



























    10000 let px=100: let py=20: let pw=16: let ph=16: let pd=3

    10010 let np=0: let p=0

    10020 let pv=10: let pe=100: let pc=0'
10030 return





    10500 'if pz=0 then py=py+5 else py=py
    
    10980 put sprite 0,(px,py),15,p

10990 return



11040 'Subrutinas mover '




    11050 px=px+pv

    11060 p=0

    11065 np=np+1
    11070 if np>1 then p=p+1: np=0

    11075 if px>=w-pw then px=w-pw

    11076 'pe=pe-1

    11077 pd=3

    11078 'gosub 7100
11080 return

    11090 px=px-pv
    11100 p=2
    11105 np=np+1
    11110 if np>1 then p=p+1: np=0
    11115 if px<0 then px=0
    11116 'pe=pe-1

    11117 pd=7

    11118 'gosub 7100
11120 return

    11130 'nada'
    11135 py=py-30
    11140 p=6
    11145 np=np+1
    11150 if np>1 then p=p+1: np=0
    11155 if py<=0 then py=0
    11156 'pe=pe-1

    11157 pd=1

    11158 'gosub 7100
11160 return

    11170 'py=py+pv
    11180 'p=4
    11182 'np=np+1
    11185 'if np>1 then p=p+1: np=0
    11187 'if py >=212-ph then py=212-ph
    11188 'pe=pe-1

    11189 'pd=5

    11190 'gosub 7100
11200 return








































    20000 dim ex(3),ey(3),ew(3),eh(3)
    20010 for i=0 to 3

        20020 ex(i)=20*i: ey(i)=40: ew(i)=16: eh(i)=16: ep(i)=0
    20030 next i
20040 return



21000 'Subrutinas actualizar sprites enemigos'


    21020 put sprite 8,(ex(0),ey(0)),15,8
    21030 put sprite 9,(ex(1),ey(1)),15,9
    21040 put sprite 10,(ex(2),ey(2)),15,10
    21050 put sprite 11,(ex(3),ey(3)),15,11
21060 return




    21100 'n'
    21120 for i=0 to 3
        21130 ex(i)=ex(i)+rnd(1)*10
    21140 next i
21150 return






































        22000 for i=0 to 10

            22020 sx(i)=16*i: sy(i)=140: sw(i)=16: sh(i)=16
        22030 next i
    22040 return

    





        23000 for i=0 to 10
            23050 copy (4*16,0)-((4*16)+sw(1),0+sh(1)),1 to (sx(i), sy(i)),0
        23060 next i
    23070 return














































    30000 COLOR 15,0,0: SCREEN 5
    30020 DATA 0,0,0,2,2,2,2,4,2,5,0,0,0,0,5,4,3,2,2,3,5,0,7,0
    30030 DATA 7,3,0,4,0,7,2,5,6,6,5,2,5,4,5,2,6,7,7,6,2,7,7,6
    30040 FOR C=0 TO 15:READ R,G,B:COLOR=(C,R,G,B):NEXT
    30050 BLOAD"FONDO.SC5",S
30080 return






    30300 screen 0
    30320 color 11,1,1
    30330 locate 0,10
    30340 print " Te han matado!!"
30380 return















    31000 cls

    31120 color 15,1,1


    31130 screen 5,2

    31140 key off

    31150 defint a-z

    31160 interval on

    31170 let w=256: let h=212 

    31180 let g=7
31190 return


    31300 interval off
    31310 close #1

    31320 goto 900
31380 return






    32000 restore 32000
    32010 'DATA 0,0,0,2,2,2,2,3,2,3,1,3,4,3,1,1,4,3,5,1,1,4,4,2
    32020 'DATA 6,3,1,4,7,2,6,3,5,3,4,7,7,5,3,2,6,7,7,7,1,7,7,7
    32030 'FOR C=0 TO 15:READ R,G,B:COLOR=(C,R,G,B):NEXT
    32040 BLOAD"PAGE1.SC5",S,32768 
    32050 color=restore
32060 return





    32100 fx(0)=0: fy(0)=0: fw(0)=16: fh(0)=16
    32105 for i=0 to w-fw(0) step fw(0)

        32110 copy (0,0)-(0+fw(0),0+fh(0)),1 to (i, 10),0
        32120 copy (2*16,0)-((2*16)+fw(0),0+fh(0)),1 to (i, h-fh(0)),0
    32130 next i

    32140 for i=0 to h-fh(0) step fh(0)
        32150 copy (3*16,0)-((3*16)+fw(0),0+fh(0)),1 to (0, i),0
        32160 copy (1*16,0)-((1*16)+fw(0),0+fh(0)),1 to (w-fw(0), i),0
    32170 next i
32180 return








 





    33000 bload "rutinas.bin"
    33010 defusr=60000
    33020 a=usr(0)
33990 return


















