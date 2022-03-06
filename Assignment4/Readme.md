# cs220-programming-assignmen-4
## Q-1
## 3-bit gray code Counter


### Input: clk and reset

Whenever the 8th posedge is reached output is high otherwise zero

Finite state machine is used for implementation in which whoever posedge is detected current state is changed as transitions: S0: 000, S1:001, S2:011, S3:010, S4:110, S5:111, S6:101, S7:100 --> S0

Testbench “A4Q1_gray_counter_tb.v” calls for gray_counter in file “A4Q1_gray_counter.v”

Thus output is high i.e., 1 only in transition S7->S0 otherwise low i.e., 0.



## Q-2
## 8-bit Adder/Subtractor

### Inputs:
8 bit two inputs are given which are stored in a,b two 8-bit registers 

along with opcode to store the type of operation addition 0 or subtraction 1  

Also carry input is stored as 1-bit reg “cin” which depends only upon opcode likewise 1 if subtraction or 0 if addition

The inputs from testbench “A4Q2_B8_Adder_tb.v” are used to call eightBit_Adder from the file “A4Q2_eightBit_adder.v” which further calls oneBit_Adder from the file “A4Q2_oneBit_Adder.v”

“ct” 7-bits register meanwhile stores carry outs after bit wise addition 

### Output:

8-bits sum is given output carrying the result obtained.

Carry out at the final 8th bit addition as cout
Overflow as wire containing the result so obtained is overflow or not
