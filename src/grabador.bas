1 ' Program MSX Murcia 2020'

1 ' Este programa genera los archivos binarios para que puedas cargar tus sprites mas rápidos desde MSX basic'
1 ' 1. Se carga con load"cargador.bas',r
1 ' 2. Elegir la opcion
1 ' 3. Una vez obtenido el archivo binario spr.bin o clrspr.bin
1 ' En el código para cargarlos (rutinas.bin carga desde ensablador spr.bin y sprclr.bin):
1 '     10 bload "rutinas.bin"
1 '     20 defusr=60000
1 '     30 a=usr(0)


1 ' Main / Menú principal'
10 screen 5,2
15 color 15,4,4
1 '  Close (sin nada, se le suele poner #número), cierra todos los ficheros abiertos'
20 close
30 open "grp:" for output as #1
40 cls
50 preset (0,0)
60 print #1,"         Elija una opcion"
70 preset (0,20)
80 print #1,"1. Cargar sprites a VRAM"
90 'preset (0,40)
100 print #1,"2. Cargar colores sprites da VRAM"
120 'preset (0,50)
130 print #1,"3. Pasar sprites de VRAM a RAM"
140 'preset (0,60)
150 print #1,"4. Pasar color sprites de VRAM a RAM"
160 'preset (0,80)
170 print #1,"5. Crear archivo binario con datos de sprites de RAM" 
180 'preset (0,90)
190 print #1,"6. Crear archivo binario con datos de color sprites de RAM" 
200 'preset (0,110)
210 print #1,"7. Cargar juego" 

220 a$=inkey$
230 if a$="1" then gosub 10000
240 if a$="2" then gosub 20000
250 if a$="3" then gosub 30000
260 if a$="4" then gosub 40000
270 if a$="5" then gosub 50000
280 if a$="6" then gosub 60000
290 if a$="7" then gosub 70000
300 goto 220 









1 ' 1. Rutina grabar sprites en VRAM'
    10000 print #1,"1. Grabando sprites a VRAM"
    1' En MSX2, es decir en screen 5, tenemos un espacio en la tabla de sprites de 2048 bytes,
    1' esto da para 64 definiciones sprites, cada definición son 32 bytes, nosotros solo vamos a definir 12
    1' La dirección de la tabla de sprites en VRAM es 30720 o &h7800
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



    1 ' Sprite 8, pájaro 1
    10370 DATA &H00,&H00,&H00,&H00,&HC0,&H30,&H1C,&HFC
    10380 DATA &HFF,&H1F,&H2F,&H5F,&H7E,&HFC,&HF8,&HE0
    10390 DATA &H00,&H00,&H00,&H00,&H00,&H70,&HF8,&H80
    10400 DATA &H80,&H00,&H00,&H00,&H00,&H00,&H00,&H00
    1 ' Sprite 9, pájaro 2
    10410 DATA &H00,&H00,&H01,&H01,&H41,&H73,&H7B,&H3F
    10420 DATA &H3F,&H7F,&HFF,&H7F,&HF8,&H00,&H00,&H00
    10430 DATA &H00,&H00,&H80,&H80,&HC0,&HC0,&HC0,&HC0
    10440 DATA &HF8,&HBC,&H8C,&H00,&H00,&H00,&H00,&H00 
    1 ' Sprite 10, pájaro 3
    10450 DATA &H04,&H04,&H06,&H03,&H03,&H01,&HE1,&H3F
    10460 DATA &H3F,&HE1,&H01,&H03,&H03,&H06,&H04,&H04
    10470 DATA &H00,&H00,&H00,&H00,&H80,&H80,&HC0,&HF0
    10480 DATA &HF0,&HC0,&H80,&H80,&H00,&H00,&H00,&H00
    1 ' Sprite 11, pájaro 4
    10490 DATA &H00,&H00,&H00,&H00,&H00,&H1C,&H1C,&H1C
    10500 DATA &H07,&H0F,&H0C,&H18,&H01,&H01,&H00,&H00
    10510 DATA &H00,&H00,&H00,&H00,&H0C,&H1C,&H10,&H10
    10520 DATA &HF0,&HE0,&HE0,&HC0,&H80,&H80,&H00,&H00





    10530 print #1,"Datos pasados de los datos leidos del disco y que estaban escritos como instrucciones en la direccion 32768 la RAM a VRAM "
10580 return








1 ' 2.Rutina grabar color sprites en VRAM'
    1' Rellenamos la tabla de colores del sprite 0 , son 12 sprites a los que le vamos a poner el color
    1 ' la dirección de la tabla de colores sprite es 29696 o &h7400'
    20000 print #1,"2. Grabando color sprites a VRAM"
    20005 restore 20050
    20010 for i=0 to (16*12)-1
        20020 read a
        20030 vpoke 29696+i, a
    20040 next i 
    1' Sprite 0, personaje mirando hacia la derecha 0
    20050 data &H0F,&H0F,&H07,&H07,&H0F,&H0F,&H0F,&H08
    20060 data &H08,&H08,&H08,&H08,&H08,&H08,&H0F,&H0F
    1' Sprite 1, personaje mirando hacia la derecha 1
    20070 data &H0F,&H05,&H0A,&H0A,&H0B,&H0B,&H05,&H0B
    20080 data &H0F,&H05,&H0A,&H0A,&H0B,&H0B,&H05,&H0B
    1' Sprite 2, personaje mirando hacia la izquierda 0
    20090 data &H0F,&H05,&H0A,&H0A,&H0B,&H0B,&H05,&H0B
    20100 data &H0F,&H05,&H0A,&H0A,&H0B,&H0B,&H05,&H0B
    1' Sprite 3, personaje mirando hacia la izquierda 1
    20110 data &H0F,&H05,&H0A,&H0A,&H0B,&H0B,&H05,&H0B
    20120 data &H0F,&H05,&H0A,&H0A,&H0B,&H0B,&H05,&H0B
    1 ' Sprite 4, personaje mirando hacia arriba 0'
    20130 data &H0F,&H05,&H0A,&H0A,&H0B,&H0B,&H05,&H0B
    20140 data &H0F,&H05,&H0A,&H0A,&H0B,&H0B,&H05,&H0B
    1 ' Sprite 5, personaje mirando hacia arriba 1
    20150 data &H0F,&H0F,&H0F,&H0F,&H0F,&H0F,&H0F,&H0F
    20160 data &H0F,&H0F,&H0F,&H0F,&H0F,&H0F,&H0F,&H0F
    1 ' Sprite 6, personaje mirando hacia abajo 0'
    20170 data &H0F,&H0F,&H0F,&H0F,&H0F,&H0F,&H0F,&H0F
    20180 data &H0F,&H0F,&H0F,&H0F,&H0F,&H0F,&H0F,&H0F
    1 ' Sprite 7, personaje mirando hacia abajo 1
    20190 data &H0F,&H0F,&H0F,&H0F,&H0F,&H0F,&H0F,&H0F
    20200 data &H0F,&H0F,&H0F,&H0F,&H0F,&H0F,&H0F,&H0F


    1 ' Pajaro 1
    20210 data &H0F,&H0F,&H0F,&H0F,&H02,&H02,&H02,&H07
    20220 data &H07,&H07,&H02,&H02,&H02,&H02,&H02,&H02
    1 ' Pajaro 2
    20230 data &H0F,&H09,&H09,&H09,&H09,&H09,&H09,&H09
    20240 data &H09,&H0A,&H0A,&H09,&H09,&H0F,&H0F,&H0F
    1 ' Pajaro 3
    20250 data &H0E,&H0E,&H0E,&H0E,&H0E,&H0E,&H07,&H07
    20260 data &H07,&H07,&H0E,&H0E,&H0E,&H0E,&H0E,&H0E
    1 ' Pajaro 4
    20270 data &H0F,&H0F,&H0F,&H0F,&H08,&H08,&H08,&H08
    20280 data &H09,&H09,&H08,&H08,&H08,&H08,&H0F,&H0F
    20290 print #1,"Grabandos sprites a VRAM"
20300 return







1 ' 3.Rutina rutina pasar sprites de VRAM a RAM'
1 ' Los guardaremos a partir de la dirección 40720 (&h9f10), leeremos todo la tabla de sprites 2048 bytes'
    30000 print #1,"3. Pasando sprites de VRAM a RAM"
    30010 for i=30720 to ((32*64)-1)+30720
        30020 poke 10000+i,vpeek(i)
    30030 next i
    30040 print #1,"Datos pasados de VRAM a RAM a la direccion 40720 en adelante"
30050 return

1 ' 4.Rutina pasa color sprites a VRAM'
    40000 print #1,"4. Pasando color sprites de VRAM a RAM"
    1 ' Cada definición de color son 16 bytes, tenemos 64'
    40010 for i=29696 to ((16*64)-1)+29696
        40020 poke 10000+i,vpeek(i)
    40030 next i
    40040 print #1,"Datos pasados de VRAM a RAM a la direccion 39696 en adelante"
40050 return






1 ' 5.Rutina crear archivo binario sprites
    50000 print #1,"5. Creando archivo binario sprites"
    50010 bsave"spr.bin", 40720, 40720+2048 
    50020 print #1,"Archivo binario spr.bin creado en disco"
50040 return
1 ' 6.Rutina crear archivo binario color sprites
    60000 print #1,"6. Creando archivo binario color sprites"
    60010 bsave"clrspr.bin", 39696, 39696+1024
    60020 print #1,"Archivo binario clrspr.bin creado en disco"
60040 return






1 ' Rutina empezar juego'
    70000 print #1,"7. Cargando juego"
    70010 close 
    70020 'load"main.bas",r
70030 return



