#C Program
##include <stdio.h>

#int main()
#{
#    int c, d, i, t;
#   int array[10];
#   for (i = 0; i < 10; i++)
#   {
#       scanf("%d", &array[i]);
#   }
#   for (c = 1; c <= 9; c++)
#   {
#       d = c;
#       while (d > 0 && array[d] < array[d - 1])
#       {
#           t = array[d];
#           array[d] = array[d - 1];
#           array[d - 1] = t;
#           d--;
#       }
#   }
#    for (c = 0; c <= 9; c++)
#   {
#       printf("%d\n", array[c]);
#   }
#    return 0;
#}

#MIPS Program

.data 
    Array: .space 40
    arrayToBeSorted: .asciiz "Enter the numbers: "
    nextLine: .asciiz "\n"
    result: .asciiz "Here is the harmonic"

.text 

.globl main

main: 
    #ask user to input numbers of the arrayToBeSorted
    li $v0, 4
    la $a0, arrayToBeSorted
    syscall

    addi $t7, $zero, 10

    li $t6, 0 
    #used to index array at insertion
    
    j loop0

#read the numbers 
loop0:        
#loop successfully reads in n integers and stores them in a list
    
     #check if 0 == input;
     beq $t7, 0, loop
     #take in user input
     li $v0, 5
     syscall
     #store user input into list
     sw $v0, Array($t6)
     #add 4 to the index of the list
     addi $t6, $t6, 4
     #sub 1 from the number of items to add to list
     addi $t7, $t7, -1
     #loop
     j loop0
    
loop:
     li $t6, 0   #c
     #address of c
     li $t7, 0      
     j loop1

loop1:
     # c<9
     beq $t6, 9, next
     # c=1   
     addi $t6, $t6, 1   
     addi $t7, $t7, 4
     addi $t0, $t6, 0
     addi $t2, $t7, 0
     # d
     addi $t3, $t0, -1   
     addi $t1, $t2, -4   
     j loop2
        
loop2:
     # load the value of Array[d] in $t4
     lw $t4, Array($t1)
     # load the value of Array[d-1] in $t5
     lw $t5, Array($t2)
     # d>0
     blt $t3, $zero, loop1
     # Array[d] < Array[d-1]
     blt $t4, $t5, loop1
     # swap Array[d] and Array[d-1]
     sw $t4, Array($t2)
     sw $t5, Array($t1)
     # d--
     addi $t3, $t3, -1
     addi $t0, $t0, -1
     addi $t2, $t2, -4
     addi $t1, $t1, -4
     j loop2

next: #success print
     # $t0 stores the address of the last index
     move $t0, $t7
     li $v0, 4
     la $a0, result
     syscall
     addi $t3, $zero, 0
     j while

while: #printer success

     # print space, 32 is ASCII code for space
     li $a0, 32
     li $v0, 11  # syscall number for printing character
     syscall

     blt $t7, $zero, exit
     #dif i is 0 then exit
     lw $t1, Array($t3)
     #load in my array at index i
        
     #printing int at Array[i]
     li $v0, 1
     move $a0, $t1
     syscall  

     addi $t3, $t3, 4
     addi $t7, $t7, -4

     j while 

 exit:
     # to end program
     li $v0, 10
     syscall 