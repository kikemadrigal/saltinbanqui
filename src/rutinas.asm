        output "rutinas.bin"

    db   #fe               ; ID archivo binario, siempre hay que poner el mismo 0FEh
    dw   INICIO            ; dirección de inicio
    dw   FINAL - 1         ; dirección final
    dw   INICIO             ; dircción del programa de ejecución (para cuando pongas r en bload"nombre_programa", r)

    org 50000 ; o #f230, org se utiliza para decirle al z80 en que posición de memoria RAM empieza nuestro programa en ensamblador

CHGMOD equ #005F   ; Cambia el modo de screen pero previamente necesita que se le asigne el modo en el registro a
LDIRVM equ #005C   ;Tansfiere bloques de la RAM a la VRAM, es la más importante, necesita previamente asignar valor al registro bc con la longitud, dc con la dirección de inicio de la VRAM y hl con la dirección de inicio de la RAM:
GTSTCK equ #00D5   ;si le pasas al registro a un 0 detectará los cursores,un 1 para el joystick 1 y 2 para el joystick 2
                   ;devuelve en a 1 arriba, 2 diagonal arriba derecha,3 derecha, asi hasta 7

INICIO:
    call volcar_sprites_de_disco_a_vram
    call volcar_colores_sprites_de_disco_a_vram
    ret



volcar_sprites_de_disco_a_vram:
    ld hl, sprites ; la rutina LDIRVM necesita haber cargado previamente la dirección de inicio de la RAM, para saber porqué he puesto 0000 fíjate este dibujo https://sites.google.com/site/multivac7/files-images/TMS9918_VRAMmap_G2_300dpi.png ,así es como está formado el VDP en screen 2
    ld de, #7800 ; la rutina necesita haber cargado previamente con de la dirección de inicio de la VRAM          
    ld bc, 32*29; son 383 bytes a copiar
    call  LDIRVM ; Mira arriba, pone la explicación
    ret
volcar_colores_sprites_de_disco_a_vram:
    ld hl, color_sprites ; la rutina LDIRVM necesita haber cargado previamente la dirección de inicio de la RAM, para saber porqué he puesto 0000 fíjate este dibujo https://sites.google.com/site/multivac7/files-images/TMS9918_VRAMmap_G2_300dpi.png ,así es como está formado el VDP en screen 2
    ld de, #7400 ; la rutina necesita haber cargado previamente con de la dirección de inicio de la VRAM          
    ld bc, 16*29; son 1024 bytes a copiar
    call  LDIRVM ; Mira arriba, pone la explicación
    ret
 


sprites:
    ;incbin "./src/SPR.BIN"
     ; 0-vacío
    db #00,#00,#00,#00,#00,#00,#00,#00
    db #00,#00,#00,#00,#00,#00,#00,#00
    db #00,#00,#00,#00,#00,#00,#00,#00
    db #00,#00,#00,#00,#00,#00,#00,#00
    ; 0-Personaje 0
    db #03,#07,#04,#04,#07,#07,#03,#FC
    db #9B,#9C,#97,#F6,#04,#04,#07,#05
    db #C0,#C0,#80,#80,#C0,#C0,#00,#80
    db #C0,#70,#F0,#80,#00,#80,#60,#20
    ; 1-Personaje 1
    db #03,#07,#04,#04,#07,#07,#03,#FC
    db #9B,#9C,#97,#F6,#00,#09,#18,#12
    db #C0,#C0,#80,#80,#C0,#C0,#00,#80
    db #C0,#70,#F0,#80,#40,#20,#98,#48
    ; 2-Personaje 2
    db #03,#03,#01,#01,#03,#03,#00,#01
    db #03,#0E,#0F,#01,#00,#01,#06,#04
    db #C0,#E0,#20,#20,#E0,#E0,#C0,#3F
    db #D9,#39,#E9,#6F,#20,#20,#E0,#A0
    ; 3-Personaje 3
    db #03,#03,#01,#01,#03,#03,#00,#01
    db #03,#0E,#0F,#01,#02,#04,#19,#12
    db #C0,#E0,#20,#20,#E0,#E0,#C0,#3F
    db #D9,#39,#E9,#6F,#00,#90,#18,#48
    ; 4-Personaje 4
    db #01,#03,#02,#02,#03,#03,#00,#02
    db #06,#06,#07,#01,#01,#01,#04,#04
    db #C0,#E0,#20,#20,#E0,#E0,#C0,#10
    db #18,#18,#F8,#E8,#20,#20,#C8,#C8
    ; 5-Personaje 5
    db #00,#01,#01,#01,#01,#01,#00,#02
    db #06,#06,#07,#05,#03,#07,#07,#00
    db #E0,#F0,#10,#10,#F0,#F0,#60,#10
    db #18,#18,#F8,#E0,#20,#A0,#70,#70
    ; 6-Personaje 6
    db #01,#03,#03,#03,#03,#03,#00,#02
    db #06,#06,#07,#01,#01,#01,#01,#03
    db #C0,#E0,#E0,#E0,#E0,#E0,#C0,#10
    db #18,#18,#F8,#E8,#20,#20,#E0,#F0
    ; 7-Personaje 7
    db #00,#01,#01,#01,#01,#01,#00,#02
    db #06,#06,#07,#05,#01,#03,#07,#00
    db #E0,#F0,#F0,#F0,#F0,#F0,#60,#10
    db #18,#18,#F8,#E0,#20,#20,#60,#60


    ; 8-Pajara 0
    db #00,#00,#00,#00,#C0,#30,#1C,#FC
    db #FF,#1F,#2F,#5F,#7E,#FC,#F8,#E0
    db #00,#00,#00,#00,#00,#70,#F8,#80
    db #80,#00,#00,#00,#00,#00,#00,#00
    ; 9-Pajaro 1-plano 2 de pajaro 0
    db #00,#00,#00,#00,#00,#00,#00,#00
    db #FF,#1F,#FF,#FF,#00,#00,#00,#00
    db #00,#00,#00,#00,#00,#70,#F8,#80
    db #80,#00,#00,#00,#00,#00,#00,#00

    ; 10-Pajara 2
    db #00,#00,#01,#01,#41,#73,#7B,#3F
    db #3F,#7F,#FF,#7F,#F8,#00,#00,#00
    db #00,#00,#80,#80,#C0,#C0,#C0,#C0
    db #F8,#BC,#8C,#00,#00,#00,#00,#00
    ; 11-plano 2 de pajaro 2
    db #00,#00,#00,#00,#00,#00,#00,#00
    db #00,#7F,#FF,#0F,#1F,#00,#00,#00
    db #00,#00,#00,#00,#00,#00,#00,#00
    db #00,#BC,#EC,#B8,#98,#00,#00,#00

    ; 12-Pajara 3
    db #04,#04,#06,#03,#03,#01,#E1,#3F
    db #3F,#E1,#01,#03,#03,#06,#04,#04
    db #00,#00,#00,#00,#80,#80,#C0,#F0
    db #F0,#C0,#80,#80,#00,#00,#00,#00
    ; 13-Plano 2 de pákaro 3
    db #00,#00,#00,#00,#0F,#7F,#E1,#3F
    db #3F,#E1,#7F,#0F,#00,#00,#00,#00
    db #00,#00,#00,#00,#00,#80,#C0,#F0
    db #F0,#C0,#80,#00,#00,#00,#00,#00

    ; 14- pájaro 4
    db #00,#00,#00,#00,#00,#1C,#1C,#1C
    db #07,#0F,#0C,#18,#01,#01,#00,#00
    db #00,#00,#00,#00,#0C,#1C,#10,#10
    db #F0,#E0,#E0,#C0,#80,#80,#00,#00
    ; 15- plano 2 de pájaro 4
    db #00,#00,#00,#00,#01,#1D,#1C,#1F
    db #07,#0F,#0C,#18,#00,#00,#00,#00
    db #00,#00,#00,#00,#CC,#DC,#F0,#F0
    db #F0,#E0,#00,#00,#00,#00,#00,#00

    ; 16- pajaro 5
    db #00,#00,#00,#00,#07,#23,#33,#1F
    db #1F,#33,#23,#07,#00,#00,#00,#00
    db #00,#00,#00,#00,#00,#80,#80,#E0
    db #E0,#C0,#80,#00,#00,#00,#00,#00
    ; 17-Plano 2 de pájaro 5
    db #00,#00,#00,#00,#00,#20,#37,#1F
    db #1F,#37,#20,#00,#00,#00,#00,#00
    db #00,#00,#00,#00,#00,#00,#C0,#E0
    db #E0,#C0,#00,#00,#00,#00,#00,#00

    ; 18- pajaro 6
    db #02,#03,#01,#00,#00,#00,#00,#7F
    db #1F,#00,#00,#00,#00,#01,#03,#02
    db #00,#80,#C0,#C0,#C0,#E0,#E0,#F8
    db #F0,#E0,#E0,#C0,#C0,#C0,#00,#00
    ; 19- plano 2 de pajaro 6
    db #00,#00,#00,#00,#00,#03,#0F,#7F
    db #1F,#0F,#03,#00,#00,#00,#00,#00
    db #00,#00,#00,#00,#00,#C0,#E0,#F8
    db #F0,#E0,#C0,#00,#00,#00,#00,#00

    ; 20- pájaro 7
    db #00,#00,#00,#01,#01,#79,#7D,#07
    db #7D,#7D,#00,#00,#00,#00,#00,#00
    db #00,#38,#FC,#F8,#F0,#C0,#87,#FE
    db #FE,#C7,#F8,#7C,#3C,#00,#00,#00
    ; 21- plano 2 de pajaro 7
    db #00,#00,#00,#00,#00,#79,#7D,#07
    db #7D,#7D,#00,#00,#00,#00,#00,#00
    db #00,#00,#00,#00,#00,#C0,#87,#FE
    db #FE,#F7,#F8,#3C,#00,#00,#00,#00

    ; 22- pájaro 8
    db #00,#00,#00,#00,#00,#01,#03,#3B
    db #3F,#03,#03,#01,#01,#00,#00,#00
    db #00,#1F,#7F,#FF,#FC,#F0,#C7,#FF
    db #FC,#CF,#C0,#C0,#E0,#F8,#7C,#3E
    ; 23- plano 2 de pájaro 8
    db #00,#00,#00,#00,#00,#00,#03,#3B
    db #3F,#03,#03,#01,#01,#00,#00,#00
    db #00,#00,#00,#00,#00,#00,#C7,#FF
    db #FC,#CF,#F0,#DE,#E7,#FA,#7C,#3E



    ; 24-
    db #01,#01,#01,#01,#01,#01,#01,#01
    db #01,#01,#01,#01,#03,#0F,#3F,#FF
    db #00,#00,#00,#00,#00,#00,#00,#00
    db #00,#00,#00,#00,#80,#F0,#FC,#FF
    ; 25-
    db #C0,#C0,#00,#00,#00,#00,#00,#00
    db #00,#00,#00,#00,#00,#00,#00,#00
    db #00,#00,#00,#00,#00,#00,#00,#00
    db #00,#00,#00,#00,#00,#00,#00,#00
    ; 26-
    db #40,#40,#40,#40,#40,#40,#40,#E0
    db #E0,#40,#00,#00,#00,#00,#00,#00
    db #00,#00,#00,#00,#00,#00,#00,#00
    db #00,#00,#00,#00,#00,#00,#00,#00
    ; 27-
    db #F8,#50,#00,#00,#00,#00,#00,#00
    db #00,#00,#00,#00,#00,#00,#00,#00
    db #00,#00,#00,#00,#00,#00,#00,#00
    db #00,#00,#00,#00,#00,#00,#00,#00



color_sprites:
    ;incbin "./src/CLRSPR.BIN"
    ; 0-vacío
    db #0F,#0F,#07,#07,#0F,#0F,#0F,#08
    db #08,#08,#08,#08,#08,#08,#0F,#0F
    ; 0-Personaje 0
    db #0F,#0F,#07,#07,#0F,#0F,#0F,#08
    db #08,#08,#08,#08,#08,#08,#0F,#0F 
    ; 1-Personaje 1
    db #0F,#0F,#47,#47,#0F,#0F,#0F,#48
    db #48,#48,#48,#48,#48,#48,#0F,#0F
    ; 2-Personaje 2
    db #0F,#0F,#0F,#0F,#0F,#0F,#08,#08
    db #08,#08,#08,#08,#08,#08,#0F,#0F
    ; 3-Personaje 3
    db #0F,#0F,#07,#07,#0F,#0F,#08,#08
    db #08,#08,#08,#08,#08,#08,#0F,#0F
    ; 4-Personaje 4
    db #0F,#07,#07,#07,#0F,#0F,#0F,#08
    db #08,#08,#08,#08,#08,#08,#0F,#0F
    ; 5-Personaje 5
    db #0F,#07,#07,#07,#07,#0F,#0F,#08
    db #08,#08,#08,#08,#08,#08,#0F,#0F
    ; 6-Personaje 6
    db #0F,#0F,#0F,#0F,#0F,#0F,#08,#08
    db #08,#08,#08,#08,#08,#08,#0F,#0F
    ; 7-Personaje 7
    db #0F,#0F,#0F,#0F,#0F,#0F,#08,#08
    db #08,#08,#08,#08,#08,#08,#0F,#0F

    ; 8-pájaro 1
    db #0F,#0F,#0F,#0F,#02,#02,#02,#07
    db #07,#07,#02,#02,#02,#02,#02,#02
    ; 9-plano 2 pájaro 1
    db #0F,#0F,#0F,#0F,#02,#02,#02,#07
    db #07,#07,#02,#02,#02,#02,#02,#02
    ; 10-pájaro 2
    db #0F,#09,#09,#09,#09,#09,#09,#09
    db #09,#0A,#0A,#09,#09,#0F,#0F,#0F
    ; 11-plano 2
    db #0F,#09,#09,#09,#09,#09,#09,#09
    db #09,#0A,#0A,#09,#09,#0F,#0F,#0F
    ; 12-pájaro 3
    db #0E,#0E,#0E,#0E,#0E,#0E,#07,#07
    db #07,#07,#0E,#0E,#0E,#0E,#0E,#0E
    ; 13-plano 2
    db #0E,#0E,#0E,#0E,#0E,#0E,#07,#07
    db #07,#07,#0E,#0E,#0E,#0E,#0E,#0E
    ; 14-pájaro 4
    db #0F,#0F,#0F,#0F,#08,#08,#08,#08
    db #09,#09,#08,#08,#08,#08,#0F,#0F
    ; 15-plano 2
    db #0F,#0F,#0F,#0F,#08,#08,#08,#08
    db #09,#09,#08,#08,#08,#08,#0F,#0F
    ; 16-pájaro 5
    db #0F,#0F,#0F,#0F,#03,#02,#02,#04
    db #04,#02,#02,#02,#0F,#0F,#0F,#0F
    ; 17-plano 2
    db #0F,#0F,#0F,#0F,#03,#02,#02,#04
    db #04,#02,#02,#02,#0F,#0F,#0F,#0F
    ; 18-pájaro 6
    db #0E,#0E,#0E,#0E,#0E,#0E,#0E,#0D
    db #0D,#0E,#0E,#0E,#0E,#0E,#0E,#0E
    ; 19-plano 2
    db #0E,#0E,#0E,#0E,#0E,#0E,#0E,#0D
    db #0D,#0E,#0E,#0E,#0E,#0E,#0E,#0E
    ; 20-pájaro 7
    db #0F,#0A,#0A,#0A,#0A,#0C,#0C,#0C
    db #0C,#0C,#0B,#0B,#0A,#0F,#0F,#0F
    ; 21-plano 2
    db #0F,#0A,#0A,#0A,#0A,#0C,#0C,#0C
    db #0C,#0C,#0B,#0B,#0A,#0F,#0F,#0F
    ; 22-pájaro 8
    db #0F,#0A,#0A,#0A,#0A,#0A,#09,#09
    db #09,#09,#0A,#0A,#0A,#0A,#0A,#0A
    ; 23-plano 2
    db #0F,#0A,#0A,#0A,#0A,#0A,#09,#09
    db #09,#09,#0A,#0A,#0A,#0A,#0A,#0A

    ; 24-
    db #0B,#0B,#0B,#0B,#0B,#0B,#0B,#0B
    db #0B,#0B,#0B,#0B,#0B,#0B,#0A,#09
    ; 25-
    db #09,#09,#0F,#0F,#0F,#0F,#0F,#0F
    db #0F,#0F,#0F,#0F,#0F,#0F,#0F,#0F
    ; 26-
    db #09,#09,#09,#09,#09,#09,#09,#08
    db #08,#08,#0F,#0F,#0F,#0F,#0F,#0F
    ; 27-
    db #09,#09,#0F,#0F,#0F,#0F,#0F,#0F
    db #0F,#0F,#0F,#0F,#0F,#0F,#0F,#0F


FINAL:
