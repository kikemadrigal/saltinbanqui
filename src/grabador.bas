1 ' Menú principal'
10 screen 5,2
20 open "grp:" for output as #1
30 'cls
40 preset (0,10)
50 print #1,"Elija una opcion"
60 preset (0,20)
70 print #1,"1. Grabar sprites de disco a VRAM"
80 preset (0,30)
90 print #1,"2. Pasar sprites de VRAM a RAM"
100 preset (0,40)
110 print #1,"3. Crear archivo binario con los sprites que habíamos pasado a RAM" 
100 preset (0,50)
120 print #1,"4. Cargar huego" 

130 a$=inkey$
140 if a$="1" then gosub 10000
150 if a$="2" then gosub 20000
160 if a$="3" then gosub 30000
170 if a$="4" then gosub 40000
180 goto 120 

200 'gosub 10000
300 'gosub 20000
400 'gosub 30000



1 ' Rutina grabar sprites en VRAM'
    10000 print #1,"1. Grabando sprites de disco a VRAM"
    10010 for i=0 to (32*12)-1
        10020 read a
        10030 vpoke 30720+i,a
    10040 next i

    1' Sprite 0, personaje mirando hacia la derecha 0
    10050 data &H03,&H07,&H04,&H04,&H07,&H07,&H03,&HFC
    10060 data &H9B,&H9C,&H97,&HF6,&H04,&H04,&H07,&H05
    10070 data &HC0,&HC0,&H80,&H80,&HC0,&HC0,&H00,&H80
    10080 data &HC0,&H70,&HF0,&H80,&H00,&H80,&H60,&H20
    1' Sprite 1, personaje mirando hacia la derecha 1
    10090 data &H03,&H07,&H04,&H04,&H07,&H07,&H03,&HFC
    10100 data &H9B,&H9C,&H97,&HF6,&H00,&H09,&H18,&H12
    10110 data &HC0,&HC0,&H80,&H80,&HC0,&HC0,&H00,&H80
    10120 data &HC0,&H70,&HF0,&H80,&H40,&H20,&H98,&H48
    1' Sprite 2, personaje mirando hacia la izquierda 0
    10130 data &H03,&H03,&H01,&H01,&H03,&H03,&H00,&H01
    10140 data &H03,&H0E,&H0F,&H01,&H00,&H01,&H06,&H04
    10150 data &HC0,&HE0,&H20,&H20,&HE0,&HE0,&HC0,&H3F
    10160 data &HD9,&H39,&HE9,&H6F,&H20,&H20,&HE0,&HA0
    1' Sprite 3, personaje mirando hacia la izquierda 1
    10170 data &H03,&H03,&H01,&H01,&H03,&H03,&H00,&H01
    10180 data &H03,&H0E,&H0F,&H01,&H02,&H04,&H19,&H12
    10190 data &HC0,&HE0,&H20,&H20,&HE0,&HE0,&HC0,&H3F
    10200 data &HD9,&H39,&HE9,&H6F,&H00,&H90,&H18,&H48
    1 ' Sprite 4, personaje mirando hacia arriba 0'
    10210 data &H01,&H03,&H02,&H02,&H03,&H03,&H00,&H02
    10220 data &H06,&H06,&H07,&H01,&H01,&H01,&H04,&H04
    10230 data &HC0,&HE0,&H20,&H20,&HE0,&HE0,&HC0,&H10
    10240 data &H18,&H18,&HF8,&HE8,&H20,&H20,&HC8,&HC8
    1 ' Sprite 5, personaje mirando hacia arriba 1
    10250 data &H00,&H01,&H01,&H01,&H01,&H01,&H00,&H02
    10260 data &H06,&H06,&H07,&H05,&H03,&H07,&H07,&H00
    10270 data &HE0,&HF0,&H10,&H10,&HF0,&HF0,&H60,&H10
    10280 data &H18,&H18,&HF8,&HE0,&H20,&HA0,&H70,&H70
    1 ' Sprite 6, personaje mirando hacia abajo 0'
    10290 data &H01,&H03,&H03,&H03,&H03,&H03,&H00,&H02
    10300 data &H06,&H06,&H07,&H01,&H01,&H01,&H01,&H03
    10310 data &HC0,&HE0,&HE0,&HE0,&HE0,&HE0,&HC0,&H10
    10320 data &H18,&H18,&HF8,&HE8,&H20,&H20,&HE0,&HF0
    1 ' Sprite 7, personaje mirando hacia abajo 1
    10330 data &H00,&H01,&H01,&H01,&H01,&H01,&H00,&H02
    10340 data &H06,&H06,&H07,&H05,&H01,&H03,&H07,&H00
    10350 data &HE0,&HF0,&HF0,&HF0,&HF0,&HF0,&H60,&H10
    10360 data &H18,&H18,&HF8,&HE0,&H20,&H20,&H60,&H60


    1'  Sprite 8 Pajaro 1
    10370 DATA &H00,&H00,&H0C,&H0E,&H4F,&H67,&H3F,&H0F
    10380 DATA &H3F,&H67,&H07,&H0E,&H00,&H00,&H00,&H00
    10390 DATA &H00,&H00,&H00,&H00,&H00,&H00,&HC0,&HE0
    10400 DATA &H80,&H80,&H00,&H00,&H00,&H00,&H00,&H00
    1'  Sprite 9 Pajaro 2
    10410 DATA &H03,&H01,&H01,&H00,&H00,&H00,&H00,&H7F
    10420 DATA &H1F,&H00,&H00,&H00,&H00,&H01,&H01,&H03
    10430 DATA &H00,&H80,&HC0,&HC0,&HE0,&HE0,&HE0,&HF8
    10440 DATA &HF0,&HE0,&HE0,&HE0,&HC0,&HC0,&H80,&H00
    1'  Sprite 10 Pajaro 3
    10450 DATA &H00,&H00,&H00,&H00,&H00,&H00,&H73,&H7F
    10460 DATA &H0F,&H7F,&H7D,&H00,&H00,&H00,&H00,&H00
    10470 DATA &H00,&H00,&H00,&H00,&H38,&HF0,&HE0,&HC1
    10480 DATA &HFF,&HF0,&HF0,&H78,&H1C,&H04,&H00,&H00
    1'  Sprite 11  Pajaro 4
    10490 DATA &H00,&H00,&H00,&H01,&H01,&H01,&H01,&H1F
    10500 DATA &H1F,&H0F,&H1F,&H3E,&H3C,&H7C,&H78,&H78
    10510 DATA &H3C,&H6C,&HF0,&HF8,&HF8,&HF0,&HEC,&HFC
    10520 DATA &HFC,&H1C,&H0C,&H00,&H00,&H00,&H00,&H00
    10530 print #1,"Datos pasados de disco a VRAM "
10540 return





1 ' Rutina rutina pasa sprites de VRAM a RAM'
1 ' Los guardaremos a partir de la dirección 40720 (&h9f10), leeremos 383 bytes a la 41103 (&ha08f)'
    20000 print #1,"2. Pasando sprites de VRAM a RAM"
    20010 for i=30720 to ((32*12)-1)+30720
        20020 poke 10000+i,vpeek(i)
    20030 next i
    20040 print #1,"Datos pasados de VRAM a RAM a la direccion 40720 en adelante"
20050 return

1 ' rutina crear archivo binario
    30000 print #1,"3. Creando archivo binario"
    30010 bsave"spr.bin", 40720, 41103 
    30020 print #1,"Archivo binario spr.bin creado en disco"
    
30040 return

1 ' Rutina empezar juego'
    40000 print #1,"4. Cargando juego"
    40010 close #1 
    40020 load"main.bas",r
40030 return

1 '  ejecutar programa load"cargador.bas',r
1' ejecutar bsave"sprites.bin" 48900, 48900+((32*12)-1)=49283
1' para recuperarlos bload"sprites.bin",r, 30720
