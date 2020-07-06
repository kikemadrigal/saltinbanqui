



1 '------------------------------------'
1 '     Pantalla presentación / Splash screen '
1 '------------------------------------'
1 ' Se muestra la pantalla de presentación
40 'gosub 30000

1 ' Al pulsar 1 tecla continuará la ejecución'
50 'a$=inkey$: if a$="" goto 50 


1 '------------------------------------'
1 '     Pantalla 1 / Screen 1 ' 
1 '------------------------------------'

80 screen 0:cls
90 color 11,1,1
100 locate 10,5
110 print "Level 1"
120 locate 0,10
130 print "Que no te caguen encima los pajaros"
160 locate 0,21
1 ' Esto es un peueño retraso para mostrar la información de lo que va la pantalla 1'
170 for i=0 to 2000: next i

1 ' 1 necesitamos ddecirle que es screen 5 y algunas cosas más'
180 gosub 31000
1 ' Inicializcacion del personje
185 gosub 10000
1 ' Inicialización enemigos'
186 gosub 20000
1 ' Inicializar objetos sólidos sx(num_object), sy(num_object),sw(num_object), sh(num_object)'
195 gosub 22000
1 ' Pintar objetos sólidos'
196 gosub 23000
1 ' Volcado de datos del archivo binario a la page 1 VRAM'
200 gosub 32000
1 ' Copys de la page 1 a la page o par apintar los objetos sólidos de la pantalla level 1'
210 gosub 23000
1 ' Copys de la page 1 a la page 0 para pintar el fondo de la pantalla level 1
220 gosub 32100
1 ' Cargamos los sprites de la pantalla 1'
230 gosub 33000
1 ' Creamos un flujo para poder pintar en la pantalla, esto afectará a los input y print que tenga #numero'
240 open "grp:" for output as #1
1 ' Como habíamos activados las interrupciones de los intervalos de tiempo, en la pantalla 1 podemos poner que el virus redondo cambie de posición cada cierto tiempo solo'
250 on interval=120 gosub 21100
1 ' Subrutina mostrar información del juego'
260 gosub 7000
1 ' Sistema de renderer'
310 gosub 2000


1 '------------------------------------'
1 '     Pantalla final / Game over '
1 '------------------------------------'
1' Dibujamos el texto de la pantalla game over
900 gosub 30300
1 ' Otra partida s/n,es posible borrar la interrogación con for i=0 to 7: vpoke base(2)+(63*8)+i,0: next i
910 locate 0,100
930 input "¿Otra partida S/N ";a$
940 if a$="s" or a$="S" then goto 80
950 if a$="n" or a$="N" then print "adios":for i=0 to 500: next i:cls:end
960 goto 930


990 end



























   





 
1 '-----------------------------------------------------------------'
1 '---------------------General rutines------------------------------'
1 '-----------------------------------------------------------------'

1 ' ----------------------'
1 '   Sistema de renderer
1 ' ----------------------'
    1' Inicio blucle
        1 ' Comprobar vidas '
        2000 'gosub 3000
        1 'Llamamos a la subrutina pintar player'
        2020 gosub 10500
        1 ' Subrutinas actualizar sprites enemigos'
        2030 gosub 21000
        1 ' Llamamos a la subrutina de los cursores / joystick
        2040 gosub 6000 
        1 'Rutina comprobar colosiones'
        2050 gosub 5000
    1 ' El goto es como una especie de while para que vuelva  capturar el teclado y dibujar'
    2060 goto 2000
2090 return


1 ' Chequeo Vida juegador / personaje'
    1 ' Si se termina la energía vamos a la rutina de finalización pantalla 1'
    3000 if pe=0 then gosub 31300
3040 return

1 ' ----------------------'
1 '   Sistema de colisiones
1 ' ----------------------'

1 'Rutina comprobar colisiones https://developer.mozilla.org/es/docs/Games/Techniques/2D_collision_detection'
    1' Si hay colisión con el enemigo a perseguir vamos a la subrutina 5100
    5000 if px < ex(0) + ew(0) and  px + pw > ex(0) and py < ey(0) + eh(0) and ph + py > ey(0) then gosub 5100 
    1 ' Rutina de colisión con el enemigo que te persigue'
    5010 if px < ex(1) + ew(1) and  px + pw > ex(1) and py < ey(1) + eh(1) and ph + py > ey(1) then gosub 5200 
    1 ' Colisiones con objetos sólidos, rutina gravedad'
    5020 for i=0 to 10
        1 ' Si el alto del cuadrado del jugador es menor que el suelo y la esquina inferior izquierda (py) es menor que la esquina superior izquierda del suelo'
        5030 if ph + py < sy(i) then py=py+1
    5040 next i
5050 return


1 ' ----------------------'
1 '   Rutina de colisión con el enemigo a perseguir
1 ' ----------------------'
1'Rutina colosión, le ponemos una x y una y aleatoria a los enemigos
    1 ' El movimiento aleatorio del virus redondo es con 1 set interval
    1' Le ponemos un soido
    5100 beep
    1 ' Aumentamos en 1 la captura del player'
    5110 pc=pc+1
    1 ' Aumentamos en 10 la energia del player'
    5120 pe=pe+10
    1' subrutina pintar información en pantalla
    5150 gosub 7000
5170 return

1 ' ----------------------'
1 '   Rutina de colisión con el enemigo que te persigue
1 ' ----------------------'
    1 ' Le ponemos 1 sonido'
    5200 beep
    1 ' Le quitamos la vida al personaje'
    5210 pe=0
5220 return

1 ' ----------------------'
1 '   Rutina de colisión con objetos sólidos
1 ' ----------------------'
    1 ' detectamos la dirección: pd=dirección arriba ^ 1, derecha > 3, abajo v 5, izquierda < 7
    5300 if pd=3 then px=px-pv
    5310 if pd=7 then px=px+pv
    5320 if pd=1 then py=py+pv
    5330 if pd=5 then py=py-pv
    1 ' Le ponemos pz= player colision a 1 como que hay colisión para que le paplique la gravedad'
    5340 'pz=1
5350 return







1 ' ----------------------'
6000 'Subrutina captura movimiento joystick / cursores y boton de disparo'
1 ' ----------------------'
    1'1 Arriba, 2 arriba derecha, 3 derecha, 4 abajo derecha, 5 abajo, 6 abajo izquierda, 7 izquierda, 8 izquierda arriba
    6010 j=stick(0)
    6020 if j=3 and pe<>0 then  gosub 11050
    6030 if j=7 and pe<>0 then  gosub 11090
    6040 if j=1 and pe<>0 then  gosub 11130
    6050 if j=5 and pe<>0 then  gosub 11170 
6080 return

1 ' ----------------------'
1 '   Mostrar información
1 ' ----------------------'
1 ' Pintamos un rectangulo en la parte superior de la pantalla', color 14 gris claro, bf es un rectangulo relleno y mostramos las caputras
    7000 line (0,0)-(w, 10), 14, bf
    7010 preset (0,0)
    7020 print #1, "Vidas: "pe
    7030 preset (150,0)
    7040 print #1, "Capturas: "pc
7050 return


1 ' Mostramos la vida
    7100 preset (30,0)
    7110 print #1, "   "pe"     "
7120 return






















1 ' ------------------------------------------------------------------------------'
1 ' -------------------------Rutinas player --------------------------------------'
1 ' ------------------------------------------------------------------------------'
1 ' Inicializacion del personaje
    1 ' parámteros personaje, posición x e y, anho  24y alto35, dirección arriba ^ 1, derecha > 3, abajo v 5, izquierda < 7
    10000 let px=100: let py=20: let pw=16: let ph=16: let pd=3
    1 ' variables para manejar los sprites, np=numero de paso; para hacer el movimeinto, p=plano; para cambiarlo en el put sprite
    10010 let np=0: let p=0
    1 ' Parametros del player o personaje de velocidad, energia y de caputras 
    10020 let pv=10: let pe=100: let pc=0'
10030 return


1 '------------------------'
1 'Subrutina actualizar player'
1 '------------------------'
    10500 'if pz=0 then py=py+5 else py=py
    
    10980 put sprite 0,(px,py),15,p

10990 return


1 '------------------------'
11040 'Subrutinas mover '
1 '------------------------'
1 'pd=dirección arriba ^ 1, derecha > 3, abajo v 5, izquierda < 7
1 'Mover derecha
    1' 1 se suma a la posición x la velocidad del player
    11050 px=px+pv
    1 ' Le ponemos como plano el 0'
    11060 p=0
    1 '  Para conseguir un movimeinto tenemos que crear la variable np=número de plano'
    11065 np=np+1
    11070 if np>1 then p=p+1: np=0
    1 ' Si la posición en x del player es mayor que el ancho de la pantalla la dejamos en esa posición'
    11075 if px>=w-pw then px=w-pw
    1 ' Descruento de energía cada vez que ande en todo el juego'
    11076 'pe=pe-1
    1 ' Le ponemos al player la dirección derecha'
    11077 pd=3
    1 ' Mostramos la vida'
    11078 'gosub 7100
11080 return
 1 ' Mover izquierda'
    11090 px=px-pv
    11100 p=2
    11105 np=np+1
    11110 if np>1 then p=p+1: np=0
    11115 if px<0 then px=0
    11116 'pe=pe-1
    1 ' Le ponemos al player la dirección izquierda'
    11117 pd=7
    1 ' Mostramos la vida'
    11118 'gosub 7100
11120 return
1 ' Mover arriba
    11130 'nada'
    11135 py=py-30
    11140 p=6
    11145 np=np+1
    11150 if np>1 then p=p+1: np=0
    11155 if py<=0 then py=0
    11156 'pe=pe-1
    1 ' Le ponemos al player la dirección como que está en salto'
    11157 pd=1
    1 ' Mostramos la vida'
    11158 'gosub 7100
11160 return
1 ' Mover abajo'
    11170 'py=py+pv
    11180 'p=4
    11182 'np=np+1
    11185 'if np>1 then p=p+1: np=0
    11187 'if py >=212-ph then py=212-ph
    11188 'pe=pe-1
    1 ' Le ponemos al player la dirección abajo'
    11189 'pd=5
    1 ' Mostramos la vida'
    11190 'gosub 7100
11200 return



































1 ' ------------------------------------------------------------------------------'
1 ' ----------------Rutinas enemigos --------------------------------------'
1 ' ------------------------------------------------------------------------------'
1 ' Inicialización de variables enemigos
    1 ' Creamos 4 enemigos (los pájaros)'
    20000 dim ex(3),ey(3),ew(3),eh(3)
    20010 for i=0 to 3
        1 ' Inicialización de enemigo a capturar, ep es el plano del enemigo para hacer una animación'
        20020 ex(i)=20*i: ey(i)=40: ew(i)=16: eh(i)=16: ep(i)=0
    20030 next i
20040 return


1 '------------------------'
21000 'Subrutinas actualizar sprites enemigos'
1 '------------------------'
    1 ' Estois son los pájaros
    21020 put sprite 8,(ex(0),ey(0)),15,8
    21030 put sprite 9,(ex(1),ey(1)),15,9
    21040 put sprite 10,(ex(2),ey(2)),15,10
    21050 put sprite 11,(ex(3),ey(3)),15,11
21060 return



1 ' Rutina movimiento enemigo'
    21100 'n'
    21120 for i=0 to 3
        21130 ex(i)=ex(i)+rnd(1)*10
    21140 next i
21150 return































1 ' ------------------------------------------------------------------------------'
1 ' ----------------Rutinas Obtjetos pantalla------------------------------'
1 ' ------------------------------------------------------------------------------'

1 '------------------------'
1 ' Inicializar objetos sólidos
1 '------------------------'
        22000 for i=0 to 10
            1 '  Alamcenamos las coordenadas para las colisiones, los vamos a poner en una altura de 120px 
            22020 sx(i)=16*i: sy(i)=140: sw(i)=16: sh(i)=16
        22030 next i
    22040 return

    


1 '------------------------'
1 ' Inicializar y pintar objetos sólidos en pantalla
1 '------------------------'             
        23000 for i=0 to 10
            23050 copy (4*16,0)-((4*16)+sw(1),0+sh(1)),1 to (sx(i), sy(i)),0
        23060 next i
    23070 return




































1 ' ------------------------------------------------------------------------------'
1 ' ----------------Pantallas / Niveles --------------------------------------'
1 ' ------------------------------------------------------------------------------'




1 ' ---------------------------------------------------------------------------------------'
1 '                                    Pantalla presentación
1 ' --------------------------------------------------------------------------------------'
    30000 COLOR 15,0,0: SCREEN 5
    30020 DATA 0,0,0,2,2,2,2,4,2,5,0,0,0,0,5,4,3,2,2,3,5,0,7,0
    30030 DATA 7,3,0,4,0,7,2,5,6,6,5,2,5,4,5,2,6,7,7,6,2,7,7,6
    30040 FOR C=0 TO 15:READ R,G,B:COLOR=(C,R,G,B):NEXT
    30050 BLOAD"FONDO.SC5",S
30080 return



1 ' ---------------------------------------------------------------------------------------'
1 '                                    Pantalla Game over
1 ' --------------------------------------------------------------------------------------'
    30300 screen 0
    30320 color 11,1,1
    30330 locate 0,10
    30340 print " Te han matado!!"
30380 return










1 ' ---------------------------------------------------------------------------------------'
1 '                                   Pantalla 1
1 ' --------------------------------------------------------------------------------------'
1' Inicialización pantalla 1
    1 ' Borramos la pantalla' 
    31000 cls
    1 ' Lo 1 es definir el color de caracteres 15 blanco, el fondo 7 azul claro y margen
    31120 color 15,1,1
    1 ' Lo 2 es comfigurar la pantalla con screen modo_video, tamaño_sprites'
    1 ' el tamaño_sprite puede ser 0 (8x8px), 1 (8x8px ampliado), 2 (16x16 x), 3 (16x16px) ampliado'
    31130 screen 5,2
    1 ' Desactivamos el sonido de las teclas
    31140 key off
    1' Defimos a basic que haga que las variables de empiezan desde la a a la z sean enteras de 16 bits, en lugar de las de 32 que asigna por defecto
    31150 defint a-z
    1 ' Activamos las interrupciones de los intervalos de tiempo para que haga algo cuando se cumplan los 60 segundos, cambie la posición del enemigo
    31160 interval on
    1 ' Parametros pantalla
    31170 let w=256: let h=212 
    1 ' La gravedad será compartida por el player y los enemigos'
    31180 let g=7
31190 return

1 ' Finalización pantalla 1'
    31300 interval off
    31310 close #1
    1 ' Después de resetear las cosas en la pantalla, vamos a la pantalla de game over'
    31320 goto 900
31380 return





1' Cargamos la pantalla que está alacenada de un archivo binario a la página 1 dirección 32768
    32000 restore 32000
    32010 'DATA 0,0,0,2,2,2,2,3,2,3,1,3,4,3,1,1,4,3,5,1,1,4,4,2
    32020 'DATA 6,3,1,4,7,2,6,3,5,3,4,7,7,5,3,2,6,7,7,7,1,7,7,7
    32030 'FOR C=0 TO 15:READ R,G,B:COLOR=(C,R,G,B):NEXT
    32040 BLOAD"PAGE1.SC5",S,32768 
    32050 color=restore
32060 return



1 'Pintar en pantalla el fondo'
1' pintamos los bloques que forman el marco de arriba y de abajo, fx=objeto fondo posición x, y=posición y, h=altura, w=anchura
    32100 fx(0)=0: fy(0)=0: fw(0)=16: fh(0)=16
    32105 for i=0 to w-fw(0) step fw(0)
        1' 48 y 66 es la x e y de la page 0 del bloque elegido, 20 es el espacion del titulo de arroba
        32110 copy (0,0)-(0+fw(0),0+fh(0)),1 to (i, 10),0
        32120 copy (2*16,0)-((2*16)+fw(0),0+fh(0)),1 to (i, h-fh(0)),0
    32130 next i
    1' pintamos los bloque blancos de izquierda y derecha
    32140 for i=0 to h-fh(0) step fh(0)
        32150 copy (3*16,0)-((3*16)+fw(0),0+fh(0)),1 to (0, i),0
        32160 copy (1*16,0)-((1*16)+fw(0),0+fh(0)),1 to (w-fw(0), i),0
    32170 next i
32180 return








 


1 '-----------------------------------------------------'
1 'Subrutina cargar sprites y colores sprites pantalla 1'
1 '-----------------------------------------------------'
    33000 bload "rutinas.bin"
    33010 defusr=60000
    33020 a=usr(0)
33990 return









1 ' ---------------------------------------------------------------------------------------'
1 '                                  Final Pantalla 1
1 ' --------------------------------------------------------------------------------------'






