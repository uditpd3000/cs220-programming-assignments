# c code
# a=0,b=1
# printf("%d %d ",a,b);
# while(c <= 500)
# { c = a+b;
# printf("%d", c);
# a=b;
# b=c;
# }


.data
.text
main:
        li $s0,0 #a=0
        li $s1,1 #b=1

        #printing the 1st number 'a'
        li $v0, 1  # syscall number for printing integer
        move $a0, $s0 #passing argument
        syscall 

        # printing space, 32 is ASCII code for space
        li $a0, 32
        li $v0, 11  # syscall number for printing character
        syscall

        #printing the 2nd number 'b'
        li $v0, 1  # syscall number for printing integer
        move $a0, $s1 #passing argument
        syscall

        # printing space, 32 is ASCII code for space
        li $a0, 32
        li $v0, 11  # syscall number for printing character
        syscall

        
#while loop
while:  
        add $s2, $s0, $s1 # c = a+b
        bgt $s2, 500, exit # while loop conditioon : if c>500 exit the loop
        
        li $v0, 1 # syscall number for printing integer
        move $a0, $s2 #passing argument 'c'
        syscall

        # printing space, 32 is ASCII code for space
        li $a0, 32 
        li $v0, 11  # syscall number for printing character
        syscall

        move $s0, $s1 # a = b
        move $s1, $s2 # b = c
        # add $s2, $s0, $s1 
        j while

exit:
        li $v0,10 # syscall number to exit
        syscall      


        