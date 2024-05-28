[org 0x0100]
jmp start



;;;;;;;;;;;;;;;;;;;;;;;;

print4:
push di
mov ax,0xb800
mov es,ax
mov ax,0
mov di,340
mov ah,0x0A
mov si,timesup_mssg
mov cx,18
cld
nextchar33:
lodsb
stosw
loop nextchar33
pop di
ret
;;;;;;;;;;;;;;;;;;;;;;;;

print_coll:
push di
mov ax,0xb800
mov es,ax
mov ax,0
mov di,462
mov ah,0x0A
mov si,collision_mssg
mov cx,26
cld
nextchar3c:
lodsb
stosw
loop nextchar3c
pop di
ret
;;;;;;;;;;;;;;;;;;;;;;;;
print5:
push di
mov ax,0xb800
mov es,ax
mov ax,0
mov di,462
mov ah,0x0A
mov si,message4
mov cx,6
cld
nextchar3:
lodsb
stosw
loop nextchar3
pop di
ret
;;;;;;;;;;;;;;;;;;;;;;;;
fin_score:
push ax
push dx
push bx
push di
push cx
mov ax,[score]
mov bx,10
mov cx,0
nextdigit_scoree:
mov dx,0
div bx
add dl,0x30
push dx
inc cx
cmp ax,0
jnz nextdigit_scoree
mov di,472
nextpos_scoree:
pop dx
mov dh,0x07
mov [es:di],dx
add di,2
loop nextpos_scoree
;;;;;;;;;;;;;;;;;;;;;;;;
ClearBuffer:
    xor ax, ax
    in al, 0x60   
    
    
    test al, 0x80
    jnz ClearBuffer
ret
;;;;;;;;;;;;;;;;;;;;;;;;

clrscr:
push es
push ax
push di

mov ax, 0xb800
mov es, ax ; point es to video base
xor di, di ; point di to top left column
mov ax, 0x0720 ; space char in normal attribute
mov cx, 2000 ; number of screen locations
cld ; auto increment mode
rep stosw ; clear the whole screen


pop di
pop ax
pop es
ret

;;;;;;;;;;;;;;;;;;;;;;;;
continue:
    push es 
    push ax 
    push cx 
    push si 
    push di 
    
    jmp doo
    PressanyKey:dw 'Press any key to continue...';28
    doo:
    mov  ax, 0xb800 
    mov  es, ax
    mov si,PressanyKey
    mov di,3938
    mov cx,28
    mov ah,0x07
    
    cld 
    nextcharPressanykey:
        lodsb                 
        stosw                 
    loop nextcharPressanykey  
 
    pop  di 
    pop  si 
    pop  cx 
    pop  ax 
    pop  es 

ret
;;;;;;;;;;;;;;;;;;;;;;;;

PrintMyName:
    push es 
    push ax 
    push cx 
    push si 
    push di 
    
    jmp doooo
    myName:dw 'Developed by :Taha';18
    doooo:
    mov  ax, 0xb800 
    mov  es, ax
    mov si,myName
    mov di,3570
    mov cx,18
    mov ah,0x09
    
    cld 
    nextcharMyName:
        lodsb                 
        stosw                 
    loop nextcharMyName       
 
    pop  di 
    pop  si 
    pop  cx 
    pop  ax 
    pop  es 

ret
;;;;;;;;;;;;;;;;;;;;;;;;
IntroSnakeGame:
    push es
    push di
    push ax

    mov ax,0xb800
    mov es,ax
    mov ax,0xE620

    ;S of Snake
    mov di,200
    SnakeSUpper:
        mov [es:di],ax
        sub di,2
        call slowPrinting
        cmp di,180
    jne SnakeSUpper

    SnakeSdown1:
        mov [es:di],ax
        add di,160
        call slowPrinting
        cmp di,820
    jne SnakeSdown1
    
    SnakeSright:
        mov [es:di],ax
        add di,2
        call slowPrinting
        cmp di,840
    jne SnakeSright

    SnakeSdown2:
        mov [es:di],ax
        add di,160
        call slowPrinting
        cmp di,1480
    jne SnakeSdown2

    SnakeSleft:
        mov [es:di],ax
        sub di,2
        call slowPrinting
        cmp di,1458
    jne SnakeSleft


    ;N of Snake
    mov di,1484
    Nleft:
        mov [es:di],ax
        sub di,160
        call slowPrinting
        cmp di,204
    jne Nleft
    mov [es:di],ax
    add di,2

    Nmiddle:
        mov [es:di],ax
        add di,162
        call slowPrinting
        cmp di,1502
    jne Nmiddle
    mov [es:di],ax
    mov di,1504
    N_right:
        mov [es:di],ax
        sub di,160
        call slowPrinting
        cmp di,64
    jne N_right


    ;A of Snake
    mov di,1508
    Snake_Aleft:
        mov [es:di],ax
        sub di,160
        call slowPrinting
        cmp di,228
    jne Snake_Aleft
    SnakeA_up:
        mov [es:di],ax
        add di,2
        call slowPrinting
        cmp di,252
    jne SnakeA_up
    SnakeA_right:
        mov [es:di],ax
        add di,160
        call slowPrinting
        cmp di,1692
    jne SnakeA_right
    mov di,1050
    SnakeA_middle:
        mov [es:di],ax
        sub di,2
        call slowPrinting
        cmp di,1028
    jne SnakeA_middle



    ;K of Snake
    mov di,256
    SnakeK_left:
        mov [es:di],ax
        add di,160
        call slowPrinting
        cmp di,1696
    jne SnakeK_left
    mov di,898
    SnakeK_Upper:
        mov [es:di],ax
        add di,2
        mov [es:di],ax
        sub di,158 
        call slowPrinting
        cmp di,118
    jne SnakeK_Upper
    mov di,1062
    SnakeK_Lower:
        mov [es:di],ax
        add di,2
        mov [es:di],ax
        add di,162
        call slowPrinting
        cmp di,1718
    jne SnakeK_Lower

    ;E of Snake
    mov di,280
    SnakeEleft:
        mov [es:di],ax
        add di,160
        call slowPrinting
        cmp di,1720
    jne SnakeEleft
    mov di,282
    SnakeEup:
        mov [es:di],ax
        add di,2
        call slowPrinting
        cmp di,300
    jne SnakeEup

    mov di,922
    SnakeEmiddle:
        mov [es:di],ax
        add di,2
        call slowPrinting
        cmp di,940
    jne SnakeEmiddle
    mov di,1562
    SnakeEdown:
        mov [es:di],ax
        add di,2
        call slowPrinting
        cmp di,1580
    jne SnakeEdown


    ;G of Game
    mov di,1960
    GameGUpper:
        mov [es:di],ax
        sub di,2
        call slowPrinting
        cmp di,1940
    jne GameGUpper

    GameGdown:
        mov [es:di],ax
        add di,160
        call slowPrinting
        cmp di,2900
    jne GameGdown
    
    GameGleft:
        mov [es:di],ax
        add di,2
        call slowPrinting
        cmp di,2920
    jne GameGleft

    GameGup:
        mov [es:di],ax
        sub di,160
        call slowPrinting
        cmp di,2440
    jne GameGup

    GameGleft2:
        mov [es:di],ax
        sub di,2
        call slowPrinting
        cmp di,2428
    jne GameGleft2

    ;A of Game
    mov di,2924
    GameAleft:
        mov [es:di],ax
        sub di,160
        call slowPrinting
        cmp di,1964
    jne GameAleft
    GameAup:
        mov [es:di],ax
        add di,2
        call slowPrinting
        cmp di,1988
    jne GameAup
    GameAright:
        mov [es:di],ax
        add di,160
        call slowPrinting
        cmp di,3108
    jne GameAright
    mov di,2466
    GameAmiddle:
        mov [es:di],ax
        sub di,2
        call slowPrinting
        cmp di,2444
    jne GameAmiddle

    ;M of game
    mov di,2952
    GameMleft:
        mov [es:di],ax
        sub di,160
        call slowPrinting
        cmp di,1992
    jne GameMleft
    GameMMiddleLeft:
        mov [es:di],ax
        add di,2
        mov [es:di],ax
        add di,162
        call slowPrinting
        cmp di,2976
    jne GameMMiddleLeft
    mov [es:di],ax
    sub di,158
    GameMMiddleRight:
        mov [es:di],ax
        add di,2
        mov [es:di],ax
        call slowPrinting
        sub di,158
        cmp di,2038
    jne GameMMiddleRight
    mov [es:di],ax
    add di,2
    GameMright:
        mov [es:di],ax
        add di,160
        call slowPrinting
        cmp di,3160
    jne GameMright


    ;E of Game
    mov di,2044
    GameEleft:
        mov [es:di],ax
        add di,160
        call slowPrinting
        cmp di,3164
    jne GameEleft
    mov di,2046
    GameEup:
        mov [es:di],ax
        add di,2
        call slowPrinting
        cmp di,2060
    jne GameEup

    mov di,2526
    GameEmiddle:
        mov [es:di],ax
        add di,2
        call slowPrinting
        cmp di,2540
    jne GameEmiddle
    mov di,3006
    GameEdown:
        mov [es:di],ax
        add di,2
        call slowPrinting
        cmp di,3020
    jne GameEdown

    call PrintMyName
    call continue

    pop ax
    pop di
    pop es
ret


;;;;;;;;;;;;;;;;
slowPrinting:
    push cx
    push dx
    mov cx,0xFFFF
    slowPrintingLoop:
    Loop slowPrintingLoop
    pop dx
    pop cx
ret

;;;;;;;;;;;;;;;;;;;;;;;;
loading:
    pusha
    mov ax,0xb800
    mov es,ax
    mov di,1480
    mov cx,40
    elel:
        mov word[es:di],0x4420
        mov word[es:di+160],0x3320
        mov word[es:di+320],0x3320
        mov word[es:di+480],0x4420
        add di,2
        call slowPrinting
        call slowPrinting
    loop elel
    popa
ret
;;;;;;;;;;;;;;;;;;;;;;;;
sub_clrscr:
mov ax,0xb800
mov es,ax
xor di,di
mov ax,0x0720;//////////////////////////22
mov cx,2000
cld 
rep stosw
ret
;;;;;;;;;;;;;;;;;;;;;;;
sub_initialize:
mov ax,0xb800
mov es,ax
mov ah,0x70
mov al,' '
mov di,0
mov cx,80
cld
rep stosw
mov cx,80



mov di,3040
cld
rep stosw
mov cx,19
mov di,160
leftborder:
mov [es:di],ax
add di,160
loop leftborder
mov cx,19
mov di,158
rightborder:
mov [es:di],ax
add di,160
loop rightborder

print_score.time_mssg:
mov ah,0x13
mov al,1
mov bh,0;;/////////
mov bl,4
mov dx,0x0043
mov cx,6
push cs
pop es
mov bp,score_display
int 0x10

mov ah,0x13
mov al,1
mov bh,0
mov bl,4
mov dx,0x0001
mov cx,7




push cs
pop es
mov bp,time_display
int 0x10

print_snake:
push si
push di
mov ax,0xb800
mov es,ax
mov ah,0x07;;;//////////////////07//24
mov al,'*'
mov cx,6
mov si,0
mov di,[cs:axes+si]
print_loop:
mov [es:di],ax
add si,2
mov di,[cs:axes+si]
loop print_loop
pop di
pop si

show_score:
push ax
push dx
push bx
push di
push cx
mov ax,[score]
mov bx,10
mov cx,0
nextdigit_score:
mov dx,0
div bx
add dl,0x30
push dx
inc cx
cmp ax,0




jnz nextdigit_score
mov di,156;;/////////////
nextpos_score:
pop dx
mov dh,0x74
mov [es:di],dx
add di,2
loop nextpos_score

show_time:
mov ax,[seconds]
mov bx,10
mov cx,0
nextdigit_time:
mov dx,0
div bx
add dl,0x30
push dx
inc cx
cmp ax,0
jnz nextdigit_time
mov di,18
nextpos_time:




pop dx
mov dh,0x74
mov [es:di],dx
add di,2
loop nextpos_time
pop cx
pop di
pop bx
pop dx
pop ax
ret 

print_food:
mov cx,10
Sfood_loop:
sub sp, 2
push 1440
call randG
pop dx
shl dx,1
mov di,dx
mov bx,[es:di]
cmp bl,' '
je sfood_next
jmp sfood_end

sfood_next:
cmp bh,0x07
jne sfood_end
mov al,'S'
mov ah,0x07
mov [es:di],ax
sub cx,1
sfood_end:



cmp cx,0
jne Sfood_loop

mov cx,10
Bfood_loop:
sub sp, 2
push 1440
call randG
pop dx
shl dx,1
mov di,dx
mov bx,[es:di]
cmp bl,' '
je Bfood_next
jmp Bfood_end

Bfood_next:
cmp bh,0x07
jne Bfood_end
mov al,'B'
mov ah,0x07;;;;;;;;;;bbbbb
mov [es:di],ax
sub cx,1
Bfood_end:
cmp cx,0
jne Bfood_loop
ret 
;;;;;;;;;;;;;;;;;;;;
up_move:
cmp word[direction],3
jne continueU
ret
continueU:




mov word[count],0
push ax
push di
push si
push cx
mov di,10
mov si,8
mov cx,5
mov dx,[axes+10]
loop_up:
mov bx,dx
mov dx,[axes+si]
mov word [axes+si],bx
sub si,2
sub di,2
loop loop_up
sub word[axes+10],160
mov word [direction],1
mov di,dx
mov ah,0x00;;/////////////////00//22
mov al,' '
mov [es:di],ax
call check_end
call check_food
call print_snake
pop cx
pop si
pop di
pop ax
ret
;;;;;;;;;;;;;;;;;;;;
right_move:
cmp word [direction],4
jne continueR
ret
continueR:
mov word[count],0
push ax
push di
push si
push cx
mov di,10




mov si,8
mov cx,5
mov dx,[axes+10]
loop_right:
mov bx,dx
mov dx,[axes+si]
mov word [axes+si],bx
sub si,2
sub di,2
loop loop_right
add word[axes+10],2
mov word [direction],2
mov di,dx
mov ah,0x00;;/////////////////00//22
mov al,' '
mov [es:di],ax
call check_end
call check_food
call print_snake
pop cx
pop si
pop di
pop ax
ret
;;;;;;;;;;;;;;;;;;;;
left_move:;;///////////////:
cmp word [direction],2
jne continueL
ret
continueL:
mov word[count],0
push ax
push di
push si
push cx
mov di,10
mov si,8
mov cx,5
mov dx,[axes+10]
loop_left:
mov bx,dx
mov dx,[axes+si]
mov word [axes+si],bx
sub si,2
sub di,2
loop loop_left
sub word[axes+10],2
mov word [direction],4
mov di,dx
mov ah,0x00;;///////////////////////////////////00//22
mov al,' '
mov [es:di],ax
call check_end
call check_food
call print_snake
pop cx
pop si
pop di
pop ax
ret
;;;;;;;;;;;;;;;;;;;;
down_move:
cmp word [direction],1
jne continueD
ret
continueD:
mov word[count],0
push ax
push di
push si
push cx
mov di,10
mov si,8
mov cx,5
mov dx,[axes+10]
loop_down:


mov bx,dx
mov dx,[axes+si]
mov word [axes+si],bx
sub si,2
sub di,2
loop loop_down
add word[axes+10],160
mov word [direction],3
mov di,dx
mov ah,0x00;;//////////////00//22
mov al,' '
mov [es:di],ax
call check_end
call check_food
call print_snake
pop cx
pop si
pop di
pop ax
ret
;;;;;;;;;;;;;;;;;;;;;
sub_defaultmovement:
cmp word [direction],1
jne skipU
call up_move
skipU: cmp word [direction],2
jne skipR
call right_move


skipR: cmp word [direction],3
jne skipD
call down_move
skipD: cmp word [direction],4
jne skipL
call left_move
skipL: ret
;;;;;;;;;;;;;;;;;;;;
timer:
push cs
pop ds
push bx
add word [cs:seconds_dub],1
add word [cs:count],1
mov bx,[speed]
cmp word [cs:count],bx
jb skip_defaultMovement
call sub_defaultmovement
;call print_snake
mov word [cs:count],0
skip_defaultMovement:
cmp word [seconds_dub],18
jb exitT
add word [cs:seconds],1
mov word[seconds_dub],0
exitT:
pop bx
mov al, 0x20
out 0x20, al
iret
;;;;;;;;;;;;;;;;;;;;
kbisr:
push cs
pop ds
push ax
mov ax,0xb800
mov es,ax
in al ,0x60
cmp al,0x4B
jne input1 
call left_move
jmp exit
input1: cmp al,0x4D
jne input2
call right_move
jmp exit
input2: cmp al,0x48
jne input3


call up_move
jmp exit
input3: cmp al,0x50
jne exit
call down_move
jmp exit
exit: ;call print_snake
mov al,0x20
out 0x20,al
pop ax
iret
;;;;;;;;;;;;;;;;;;;;;;
check_end:
push bx
push ax
push di
cmp word[score],100
je TW      ;;terminate_win
cmp word [seconds],31
je TS;;terminate_seconds
mov di,[axes+10]
mov bx,[es:di]
cmp bl,' '
jne dont_terminate
cmp  bh,0x70
jne dont_terminate
jmp terminate_collision
dont_terminate:
pop di
pop ax
pop bx
ret
;;;;;;;;;;;;;;;;;;;;;
check_food:
push di
push bx
mov di,[axes+10]
mov bx,[es:di]
cmp bl,'S'
jne next_check
add word [score],5
jmp skipF
next_check:
cmp bl,'B'
jne skipF
add word [score],10
skipF:
pop bx
pop di
ret

TS:
jmp terminate_seconds

TW:
;jmp terminate_win
;;;;;;;;;;;;;;;;;;;;;;
randG:
   push bp
   mov bp, sp
   pusha
   cmp word [rand], 0
   jne next

  MOV     AH, 00h  
  INT     1AH
  inc word [rand]
  mov     [randnum], dx
  jmp next1

  next:
  mov     ax, 25173         
  mul     word  [randnum]    
  add     ax, 13849          
  mov     [randnum], ax     

 next1:xor dx, dx
 mov ax, [randnum]
 mov cx, [bp+4]
 inc cx
 div cx
 
 mov [bp+6], dx
 popa
 pop bp
 ret 2
;;;;;;;;;;;;;;;;;;;;;;
terminate_seconds:
call clrscr
call print4
call print5
call fin_score
jmp quit
;;;;;;;;;;;;;;;;;;;;
terminate_collision:

call clrscr
call print_coll
call print5
call fin_score
jmp quit
;;;;;;;;;;;;;;;;;;;;
start:

call clrscr
call loading
call  clrscr
call IntroSnakeGame
call ClearBuffer
mov ah,0
int 0x16

xor ax, ax
mov es, ax
mov ax, [es:9*4]
mov word [oldisr], ax 
mov ax, [es:9*4+2]
mov word [oldisr+2], ax 

cli
mov word [es:9*4], kbisr
mov [es:9*4+2], cs 
mov word [es:8*4], timer
mov [es:8*4+2], cs 
sti 


call sub_clrscr
call sub_initialize
call print_food



quit:
mov dx, start
add dx,15
mov cl,4
shr dx, cl

mov ax, 0x4c00
int 0x21


;;;;;;;;;;;;;;;;;;;;;;;;;
timesup_mssg:dw "game over time's up" 
win_mssg: dw "you win !"
time_display:dw "seconds"
score_display:dw "score"
message4: db "Score:$"
rand:dw 0
randnum:dw 0
axes:dw 1822,1824,1826,1828,1830,1832
direction: dw 2
count: dw 0
end: dw 0
seconds: dw 0
seconds_dub:dw 0
speed:dw 5
score: dw 0
oldisr: dd 0
collision_mssg: dw "game over border collision"