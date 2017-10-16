jmp start

disp db 0
ctr db 6
num db 48
op1d1 db 0
op1d2 db 0
opr db 0
op2d1 db 0
op2d2 db 0
op1 db 0
op2 db 0
equal db 0
answer1 db 0
answer2 db 0
answer3 db 0
answer4 db 0
carry db 0
answer db 0
prodd1 db 0
prodd2 db 0
prodd3 db 0
prodd11 db 0
prodd12 db 0
prodd13 db 0
divd db 0
divs db 0
quo db 0
rmdr db 0
rmdr1 db 0 
rmdr2 db 0

start:
	mov ah, 0h
	mov al, 0Dh	;320x200
	int 10h

	mov cx, 30			;column
	mov ah,0Ch
	mov al,5h
	mov bh,0
	mov dx, 201			;row
	writeVerticalLine01:	;leftmost
		dec dx
		int 10h
		cmp dx,0
	jne writeVerticalLine01

	mov dx,201			;row
	mov cx, 260			;column
	writeVerticalLine02:	;rightmost
		dec dx
		int 10h
		cmp dx,0
	jne writeVerticalLine02		

	mov dx,197
	mov cx,255
	writeVerticalLine03:	;2nd rightmost
		dec dx
		int 10h
		cmp dx,2
	jne writeVerticalLine03

	mov dx,197
	mov cx,35
	writeVerticalLine04:	;2nd leftmost
		dec dx
		int 10h
		cmp dx,2
	jne writeVerticalLine04

	mov dx, 197
	mov cx,90
	writeVerticalLine05:	;column
		dec dx
		int 10h
		cmp dx,35
	jne writeVerticalLine05

	mov dx, 197
	mov cx,145
	writeVerticalLine06:	;column
		dec dx
		int 10h
		cmp dx,35
	jne writeVerticalLine06

	mov dx, 197
	mov cx,200
	writeVerticalLine07:	;column
		dec dx
		int 10h
		cmp dx,35
	jne writeVerticalLine07

	mov dx, 201
	mov cx, 31
	writeBarLine01:
		innerWriteBarLine01:	;left bar
			dec dx
			int 10h
			cmp dx,0
		jne innerWriteBarLine01
		mov dx, 201
		inc cx
		cmp cx,36
	jne writeBarLine01

	mov dx, 201
	mov cx, 255
	writeBarLine02:		;right bar
		innerWriteBarLine02:
			dec dx
			int 10h
			cmp dx,0
		jne innerWriteBarLine02
		mov dx, 201
		inc cx
		cmp cx,261
	jne writeBarLine02

	mov dx,0
	mov cx, 260
 	writeHorizontalBar01:
 		innerWriteHorizontalBar01:
 			dec cx
 			int 10h
 			cmp cx, 30						;top horizonatal bar
 		jne innerWriteHorizontalBar01
 		mov cx,260
 		inc dx
 		cmp dx, 3
 	jne writeHorizontalBar01

	mov dx,197
	mov cx, 260
 	writeHorizontalBar02:
 		innerWriteHorizontalBar02:
 			dec cx							;bottom horizontal bar 
 			int 10h
 			cmp cx, 30
 		jne innerWriteHorizontalBar02
 		mov cx,260
 		inc dx
 		cmp dx, 201
 	jne writeHorizontalBar02 	

 	mov dx, 34
	mov cx, 255
	writeHorizontalLine00: ;thicken horizontal bar
		dec cx
		int 10h
		cmp cx, 35
	jne writeHorizontalLine00


	mov dx, 2
	mov cx, 255
	writeHorizontalLine01: ;top line
		dec cx
		int 10h
		cmp cx, 35
	jne writeHorizontalLine01

	mov dx, 197
	mov cx, 255
	writeHorizontalLine02: ;bot line
		dec cx
		int 10h
		cmp cx, 35
	jne writeHorizontalLine02

	mov dx, 35
	mov cx, 255
	writeHorizontalLine03:	;display line
		dec cx
		int 10h
		cmp cx, 35
	jne writeHorizontalLine03

	mov dx, 75
	mov cx, 255
	writeHorizontalLine04:	;rows
		dec cx
		int 10h
		cmp cx, 35
	jne writeHorizontalLine04

	mov dx, 115
	mov cx, 255
	writeHorizontalLine05:	;rows
		dec cx
		int 10h
		cmp cx, 35
	jne writeHorizontalLine05

	mov dx, 155
	mov cx, 255
	writeHorizontalLine06:	;rows
		dec cx
		int 10h
		cmp cx, 35
	jne writeHorizontalLine06

	mov ah, 02
	mov bh,0
	mov dh, 6	;row
	mov dl, 7	;col
	int 10h

	mov ah, 09h
	mov al, 49
	mov bl, 14	;write 1
	mov bh, 0	
	mov cx, 1
	int 10h

	mov ah, 02
	mov bh,0	
	mov dh, 6	;row
	mov dl, 14	;col
	int 10h

	mov ah, 09h
	mov al, 50
	mov bl, 14	;write 2
	mov bh, 0
	mov cx, 1
	int 10h

	mov ah, 02
	mov bh,0	
	mov dh, 6	;row
	mov dl, 21	;col
	int 10h

	mov ah, 09h
	mov al, 51
	mov bl, 14	;write 3
	mov bh, 0
	mov cx, 1
	int 10h

	mov ah, 02
	mov bh,0	
	mov dh, 11	;row
	mov dl, 21	;col
	int 10h

	mov ah, 09h
	mov al, 54
	mov bl, 14	;write 6
	mov bh, 0
	mov cx, 1
	int 10h

	mov ah, 02
	mov bh,0	
	mov dh, 11	;row
	mov dl, 14	;col
	int 10h

	mov ah, 09h
	mov al, 53
	mov bl, 14	;write 5
	mov bh, 0
	mov cx, 1
	int 10h

	mov ah, 02
	mov bh,0	
	mov dh, 11	;row
	mov dl, 7	;col
	int 10h

	mov ah, 09h
	mov al, 52
	mov bl, 14	;write 4
	mov bh, 0
	mov cx, 1
	int 10h

	mov ah, 02
	mov bh,0	
	mov dh, 16	;row
	mov dl, 7	;col
	int 10h

	mov ah, 09h
	mov al, 55
	mov bl, 14	;write 7
	mov bh, 0
	mov cx, 1
	int 10h

	mov ah, 02
	mov bh,0	
	mov dh, 16	;row
	mov dl, 14	;col
	int 10h

	mov ah, 09h
	mov al, 56
	mov bl, 14	;write 8
	mov bh, 0
	mov cx, 1
	int 10h

	mov ah, 02
	mov bh,0	
	mov dh, 16	;row
	mov dl, 21	;col
	int 10h

	mov ah, 09h
	mov al, 57
	mov bl, 14	;write 9
	mov bh, 0
	mov cx, 1
	int 10h

	mov ah, 02
	mov bh,0	
	mov dh, 22	;row
	mov dl, 14	;col
	int 10h

	mov ah, 09h
	mov al, 48
	mov bl, 14	;write 0
	mov bh, 0
	mov cx, 1
	int 10h

	mov ah, 02
	mov bh,0	
	mov dh, 22	;row
	mov dl, 21	;col
	int 10h

	mov ah, 09h
	mov al, 61
	mov bl, 4	;write =
	mov bh, 0
	mov cx, 1
	int 10h

	mov ah, 02
	mov bh,0	
	mov dh, 22	;row
	mov dl, 7	;col
	int 10h

	mov ah, 09h
	mov al, 67
	mov bl, 4	;write C
	mov bh, 0
	mov cx, 1
	int 10h

	mov ah, 02
	mov bh,0	
	mov dh, 22	;row
	mov dl, 28	;col
	int 10h

	mov ah, 09h
	mov al, 47
	mov bl, 11	;write /
	mov bh, 0
	mov cx, 1
	int 10h

	mov ah, 02
	mov bh,0	
	mov dh, 16	;row
	mov dl, 28	;col
	int 10h

	mov ah, 09h
	mov al, 42
	mov bl, 11	;write *
	mov bh, 0
	mov cx, 1
	int 10h

	mov ah, 02
	mov bh,0	
	mov dh, 11	;row
	mov dl, 28	;col
	int 10h

	mov ah, 09h
	mov al, 45
	mov bl, 11	;write -
	mov bh, 0
	mov cx, 1
	int 10h

	mov ah, 02
	mov bh,0	
	mov dh, 6	;row
	mov dl, 28	;col
	int 10h

	mov ah, 09h
	mov al, 43
	mov bl, 11	;write +
	mov bh, 0
	mov cx, 1
	int 10h

	;logic 


	mov ax,01	;enable mouse
	int 33h

	mov ax, 7		;set horizontal boundary
	mov cx, 72		;minimum 
	mov dx, 489		;max
	int 33h

	mov ax, 8		;set vertical boundary
	mov cx, 36		;minimum
	mov dx, 181		;maximum
	int 33h

	
	mov ax,0
	check:
		mov bx, 0			;check if clicked
		mov ax, 3
		int 33h	
		cmp bx, 1
		if e jmp clicked 
	jmp check

int 20h

setNum1:
	mov num, 49
jmp exitrow1check

setNum2:
	mov num, 50
jmp exitrow1check

setNum3:
	mov num, 51
jmp exitrow1check

setNumPlus:
	mov num, 43
jmp exitrow1check

row1:
	cmp cx, 179
	if l jmp setNum1

	cmp cx, 289
	if l jmp setNum2

	cmp cx, 399
	if l jmp setNum3

	cmp cx, 509
	if l jmp setNumPlus

	exitrow1check:
	call display
jmp exitRowCheck

setNum4:
	mov num, 52
jmp exitrow2check

setNum5:
	mov num, 53
jmp exitrow2check

setNum6:
	mov num, 54
jmp exitrow2check

setNumMinus:
	mov num, 45
jmp exitrow2check

row2:
	cmp cx, 179
	if l jmp setNum4

	cmp cx, 289
	if l jmp setNum5

	cmp cx, 399
	if l jmp setNum6

	cmp cx, 509
	if l jmp setNumMinus

	exitrow2check:

	call display
jmp exitRowCheck

setNum7:
	mov num, 55
jmp exitrow3check

setNum8:
	mov num, 56
jmp exitrow3check

setNum9:
	mov num, 57
jmp exitrow3check

setNumMultiply:
	mov num, 42
jmp exitrow3check

row3:
	cmp cx, 179
	if l jmp setNum7

	cmp cx, 289
	if l jmp setNum8

	cmp cx, 399
	if l jmp setNum9

	cmp cx, 509
	if l jmp setNumMultiply
	
	exitrow3check:
	
	call display
jmp exitRowCheck

setNumC:
	mov num, 67
jmp clearDisp

setNum0:
	mov num, 48
jmp exitrow3check

setNumEqual:
	mov num, 61
jmp exitrow3check

setNumDivision:
	mov num, 47
jmp exitrow3check

row4:
	cmp cx, 179
	if l jmp setNumC

	cmp cx, 289
	if l jmp setNum0

	cmp cx, 399
	if l jmp setNumEqual

	cmp cx, 509
	if l jmp setNumDivision
	
	exitrow4check:
	call display
jmp exitRowCheck

clicked:
	cmp dx, 76
	if l jmp row1		;row1 check

	cmp dx, 116
	if l jmp row2		;row2 checks

	cmp dx, 156
	if l jmp row3		;row3 check

	cmp dx, 186			;row4 check
	if l jmp row4

	exitRowCheck:
	

	mov dx, 3		
	BiggerDelaylol:
		mov cx,	0FFFF
		BigDelay:
			mov cl, 0FF
			delay:
				sub cl,1
				cmp cl, 0
			jne delay

			sub ch,1
			cmp ch, 0
		jne BigDelay
		sub dx,1
		cmp dx, 0
	jne BiggerDelaylol

jmp check
	
clearDisp:
	mov ctr, 6
	mov op1d1, 0
	mov op1d2, 0
	mov op2d1, 0
	mov op2d2, 0
	mov opr, 0
	mov equal, 0
	mov answer4, 0
	mov answer3, 0
	mov answer2, 0
	mov answer1, 0
	mov op1, 0
	mov op2, 0


	mov ah, 02
	mov bh, 0
	mov dh, 2
	mov dl,6
	int 10h

	mov ah, 09h
	mov al, 32
	mov bl, 15
	mov bh, 0
	mov cx, 20
	int 10h	
jmp check

transferop1:
	cmp num, 43	;check if operator
	if e jmp toOperator

	cmp num, 45
	if e jmp toOperator

	cmp num, 42
	if e jmp toOperator

	cmp num, 47
	if e jmp toOperator

	cmp opr, 0 ; check if operator is empty
	if ne jmp toOp2

	mov al, op1d2
	mov op1d1, al
jmp fromTransferop1

transferop2:
	cmp num, 61
	if e jmp toEqual

	mov al, op2d2
	mov op2d1, al
jmp fromTransferop2

operatorCheck:
	cmp num, 43
	if e jmp storeToOpr

	cmp num, 45
	if e jmp storeToOpr

	cmp num, 42
	if e jmp storeToOpr

	cmp num, 47
	if e jmp storeToOpr
jmp check

storeToOpr:
	mov al, num
	mov opr, al
jmp dispProper

display:
	cmp op1d1, 0	;check empty
	if ne jmp toOperator

	cmp op1d2, 0	;check empty
	if ne jmp transferop1 

	fromTransferop1:
	mov al, num ;store to op1d2
	mov op1d2, al
	jmp dispProper

	toOperator:
	cmp opr, 0	;check empty
	if e jmp operatorCheck

	toOp2:
	cmp op2d1, 0	;check empty
	if ne jmp toEqual

	cmp op2d2, 0	;check empty
	if ne jmp transferop2

	fromTransferop2:
	cmp num, 43	;check if operator
	if e jmp check

	cmp num, 45
	if e jmp check

	cmp num, 42
	if e jmp check

	cmp num, 47
	if e jmp check

	mov al, num
	mov op2d2, al
	jmp dispProper

	toEqual:
	cmp equal, 0; empty
	if e jmp calculate	
	;if e jmp checkParameters

	dispProper:
	mov dl, ctr
	mov ah, 02
	mov bh,0	
	mov dh, 2	;row
	int 10h	

	mov ah, 09h
	mov al, num
	mov bl, 15	;write 
	mov bh, 0
	mov cx, 1
	int 10h

	cmp ctr, 30
	if ne add ctr, 2 ; increment ctr	
ret

Addition:
	mov al, op1d2 ;add 2nd of op1d2 and op2d2
	add al, op2d2
	
	mov ah,0
	mov bl, 10		;get answer4 and carry
	div bl
	mov carry, al
	mov answer4, ah

	mov al, op1d1	;add 1st of op1 and op2
	add al, op2d1
	add al, carry

	mov ah,0
	mov bl,10
	div bl
	mov answer2, al	;get answer3 and answer 2
	mov answer3, ah
jmp displayAnswer
;jmp checkAnswers

addNegative:
	mov answer2, 45
jmp fromAddNegative

negativeSubtract:
	mov al, op2
	mov ah, op1
	sub al, ah

	mov answer, al

	mov ah,0
	mov al,answer
	mov bl, 10
	div bl
	mov answer3, al
	mov answer4, ah

	cmp answer3, 0
	if ne jmp addNegative

	mov answer3, 45
	fromAddNegative:
jmp displayAnswer

Subtraction:
	mov ah,0
	mov al, op1d1
	mov bl, 10
	mul bl
	add al, op1d2	;combine min
	mov op1, al

	mov ah, 0
	mov al, op2d1
	mov bl, 10
	mul bl
	add al, op2d2;combine sub
	mov op2, al

	mov al, op2
	cmp op1, al
	if l jmp negativeSubtract

	mov al, op1
	mov ah, op2	;subtract
	sub al,ah

	mov answer,al		;mov to diff

	mov ah,0
	mov al,answer
	mov bl, 10
	div bl
	mov answer3, al
	mov answer4, ah
jmp displayAnswer

Multiplication:
	mov al, op1d2
	mov bl,	op2d1;multiply 2nd digit
	mul bl

	mov ah, 0
	mov bl, 10	;get carry and 3rd digit of product
	div bl
	mov carry,al
	mov prodd3,ah

	mov al, op1d1
	mov bl, op2d1	;multiply 1st digit
	mul bl

	add al,carry ; add carry digit to product

	mov ah, 0
	mov bl, 10
	div bl
	mov prodd1,al
	mov prodd2,ah

	;2nd multiplicand 

	mov al, op1d2
	mov bl, op2d2;multiply 2nd digit
	mul bl

	mov ah, 0
	mov bl, 10	;get carry and 3rd digit of product
	div bl
	mov carry,al
	mov prodd13,ah

	mov al, op1d1
	mov bl, op2d2;multiply 1st digit
	mul bl

	add al,carry ; add carry digit to product

	mov ah, 0
	mov bl, 10
	div bl
	mov prodd11,al
	mov prodd12,ah

	addProd:
	mov al, prodd13	;bring down last digit of 1st
	mov answer4, al

	mov al, prodd12		;add 2nd of 1st and 3rd of 2nd
	add al, prodd3
	
	mov ah,0
	mov bl, 10
	div bl				;gets 3rd digit final product
	mov carry, al
	mov answer3,ah

	mov al, prodd11		;add 1nd of 1st and 2nd of 2nd
	add al, prodd2
	add al, carry

	mov ah,0
	mov bl, 10
	div bl				;gets 2nd digit final product
	mov carry, al
	mov answer2,ah	

	mov al, prodd1   ;adds 1st of 2nd and carry
	add al, carry
	mov answer1,al

jmp displayAnswer

flagUndefined:
	mov answer2, 37
	mov answer3, 30
	mov answer4, 20
jmp displayAnswer

Division:
	mov al, op1d1 ;----combine Dividend
	mov bl,10
	mul bl
	add al, op1d2
	mov divd,al

	mov al, op2d1 ;----combine Divisor
	mov bl,10
	mul bl
	add al, op2d2
	mov divs,al

	cmp divs,0
	if e jmp flagUndefined

	mov al,divd
	mov ah,0		;-----divide
	div divs
	mov quo,al
	mov rmdr,ah

	mov al,rmdr	
	mov ah,0
	mov bl,10
	div bl
	mov rmdr1,al
	mov rmdr2,ah				;separate remainder

	mov al, quo
	mov ah,0		;----separate quotient
	mov bl,10
	div bl
	mov answer3, al
	mov answer4,ah
jmp displayAnswer

dispAll:
	mov al, answer1
	call displayAnswerDigit

	mov al, answer2
	call displayAnswerDigit

	mov al, answer3
	call displayAnswerDigit
	
	mov al, answer4
	call displayAnswerDigit
jmp afterDisplay

disp2to4:
	mov al, answer2
	call displayAnswerDigit

	mov al, answer3
	call displayAnswerDigit
	
	mov al, answer4
	call displayAnswerDigit
jmp afterDisplay

disp3to4:
	mov al, answer3
	call displayAnswerDigit
	
	mov al, answer4
	call displayAnswerDigit
jmp afterDisplay

clearAndDisp:
	mov ctr, 6
	mov op1d1, 0
	mov op1d2, 0
	mov op2d1, 0
	mov op2d2, 0
	mov opr, 0
	mov equal, 0
	mov answer4, 0
	mov answer3, 0
	mov answer2, 0
	mov answer1, 0
	mov op1, 0
	mov op2, 0


	mov ah, 02
	mov bh, 0
	mov dh, 2
	mov dl,6
	int 10h

	mov ah, 09h
	mov al, 32
	mov bl, 15
	mov bh, 0
	mov cx, 20
	int 10h	
jmp check

displayAnswer:
	add answer1, 48
	cmp answer2, 45
	if ne add answer2, 48

	cmp answer3, 45
	if ne add answer3, 48
	add answer4, 48

	mov al, answer1
	cmp al, 48
	if ne jmp dispAll    
	
	mov al, answer2
	cmp al, 48
	if ne jmp disp2to4
	;call displayAnswerDigit

	mov al,answer3
	cmp al,48
	if ne jmp disp3to4
	;call displayAnswerDigit

	mov al, answer4
	call displayAnswerDigit


	afterDisplay:

	mov dx, 3		
	BiggerDelaylol1:
		mov cx,	0FFFF
		BigDelay1:
			mov cl, 0FF
			delay1:
				sub cl,1
				cmp cl, 0
			jne delay1

			sub ch,1
			cmp ch, 0
		jne BigDelay1
		sub dx,1
		cmp dx, 0
	jne BiggerDelaylol1

	clearAfterClick:
		mov bx, 0			;check if clicked
		mov ax, 3
		int 33h	
		cmp bx, 1
		if e jmp clearAndDisp
	jmp clearAfterClick
jmp check

displayAnswerDigit:
	mov dl, ctr
	mov ah, 02
	mov bh,0	
	mov dh, 2	;row
	int 10h	

	mov ah, 09h
	mov bl, 15	;write 
	mov bh, 0
	mov cx, 1
	int 10h
	add ctr,2
ret

calculate:
	cmp num, 61
	if ne jmp check

	mov dl, ctr
	mov ah, 02
	mov bh,0	
	mov dh, 2	;row
	int 10h	

	mov ah, 09h
	mov al, num
	mov bl, 15	;write 
	mov bh, 0
	mov cx, 1
	int 10h

	cmp ctr, 24
	if ne add ctr,2

	mov equal, 1
	cmp op1d1, 0
	if ne sub op1d1, 48
	
	sub op1d2, 48
	
	cmp op2d1, 0
	if ne sub op2d1, 48
	
	sub op2d2, 48

	cmp opr, 43
	if e jmp Addition

	cmp opr, 45
	if e jmp Subtraction

	cmp opr, 42
	if e jmp Multiplication

	cmp opr, 47
	if e jmp Division