        output "rutinas.bin"

    db   #fe               ; ID archivo binario, siempre hay que poner el mismo 0FEh
    dw   INICIO            ; dirección de inicio
    dw   FINAL - 1         ; dirección final
    dw   INICIO             ; dircción del programa de ejecución (para cuando pongas r en bload"nombre_programa", r)

    org 60000  ; o #f230, org se utiliza para decirle al z80 en que posición de memoria RAM empieza nuestro programa en ensamblador

CHGMOD equ #005F   ; Cambia el modo de screen pero previamente necesita que se le asigne el modo en el registro a
LDIRVM equ #005C   ;Tansfiere bloques de la RAM a la VRAM, es la más importante, necesita previamente asignar valor al registro bc con la longitud, dc con la dirección de inicio de la VRAM y hl con la dirección de inicio de la RAM:
GTSTCK equ #00D5   ;si le pasas al registro a un 0 detectará los cursores,un 1 para el joystick 1 y 2 para el joystick 2
                   ;devuelve en a 1 arriba, 2 diagonal arriba derecha,3 derecha, asi hasta 7

INICIO:
    call volcar_sprites_de_disco_a_vram
    ret



volcar_sprites_de_disco_a_vram:
    ld hl, sprites ; la rutina LDIRVM necesita haber cargado previamente la dirección de inicio de la RAM, para saber porqué he puesto 0000 fíjate este dibujo https://sites.google.com/site/multivac7/files-images/TMS9918_VRAMmap_G2_300dpi.png ,así es como está formado el VDP en screen 2
    ld de, #7800 ; la rutina necesita haber cargado previamente con de la dirección de inicio de la VRAM          
    ld bc, 2048; son 383 bytes a copiar
    call  LDIRVM ; Mira arriba, pone la explicación
    ret
;volcar_colores_sprites_de_disco_a_vram:
    ;ld hl, color_sprites ; la rutina LDIRVM necesita haber cargado previamente la dirección de inicio de la RAM, para saber porqué he puesto 0000 fíjate este dibujo https://sites.google.com/site/multivac7/files-images/TMS9918_VRAMmap_G2_300dpi.png ,así es como está formado el VDP en screen 2
    ;ld de, #7400 ; la rutina necesita haber cargado previamente con de la dirección de inicio de la VRAM          
    ;ld bc, 1024; son 1024 bytes a copiar
    ;call  LDIRVM ; Mira arriba, pone la explicación
    ;ret
 

;Esta es la pantalla con la foto
sprites:
    incbin "./src/SPR.BIN"
;color_sprites:
    ;incbin "./src/CLRSPR.BIN"




FINAL:
