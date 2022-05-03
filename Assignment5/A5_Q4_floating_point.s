# printf("Enter p");
#scanf("%d",p);
#i = 0;
#sum=0;
#a[p]
#while(i<p)
#{
#cin >> a[i]
#if((i%2) == 0 && i>=2)
#{
#sum = sum + a[i];
#}
#else{
#sum = sum - a[i];
#}
#i++;
#}

.data 
    arr: .space 4 
    takeInput: .asciiz "Number of elements p: "
.text 

.globl main

main:
    #ask user to input p (t0)
    li $v0, 4 # syscall number for printing string
    la $a0, takeInput # passing the string as argument to be printed
    syscall
 
    li $v0, 5 # syscall number for taking integer input from user
    syscall
    
    move $t0, $v0 # storing the input integer, 
   
    # allocates space : a[p]
    li  $v0, 9 # dynamic allocation
    li $t7, 4 # the size of each  element 
    mult $t0, $t7     # Calculates how big the allocated memory has to be in bytes : p*4
    mflo $a0          # Loads this value into $a0 
    syscall           # Allocates memory and returns address into $v0
    la $s0, arr       # load address of arr into $s0
    sw $v0, 0($s0)     # saves allocated memory address into the space reserved

    li $t1, 0  #i=0
    li.s $f2, 0.0  #sum=0
    li $t6, 0  #index for array

loop1:
    beq $t0, $t1, exit #if i=p then exit the loop

    li $v0, 6 # reading input of elements in array
    syscall
    
    swc1 $f0, arr($t6)  # storing the value read into array 
    lwc1 $f5, arr($t6) # loading the value insertes in array

    # Check if index odd or even
    addi $t3, $zero, 2    # Store 2 in $t3
    div $t3, $t1, $t3     # Divide index by 2
    mfhi $s1              # Save remainder in $s1
    
    bne $s1, $zero, loop2 # if the remainder is not zero go to loop2

    add.s $f2, $f2, $f5 # else update sum

    addi $t6, $t6, 4 # changing index 
    addi $t1, $t1, 1 # i = i+1
    j loop1

loop2:
    sub.s $f2, $f2, $f5 # sum -= number;

    addi $t6, $t6, 4 # changing index 
    addi $t1, $t1, 1 # i = i+1
    j loop1

exit:
    li $v0, 2 # syscall to print float
    mov.s $f12, $f2 # to give argument sum
    syscall

    li $v0, 10 # syscall number to exit
    syscall  