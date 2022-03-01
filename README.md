# cs220-programming-assignment
## Q-1
## 8-bit ripple carry adder



A module named “B8_Adder()” is used in testbench to give inputs in 8 bits as register named “a” and “b” and output in wire as the “sum” and “cout” for carry out after summation.
This module uses the module “eightBit_rippleCarryAdder g(a,b,cin,sum,cout);”  stated in file named “A1Q1_eightBit_rippleCarryAdder.v” to give the output sum and cout by taking input a,b and cin=0 (taking carry input to be zero initaily).

The module “eightBit_rippleCarryAdder” takes 8-bit input a and b and gives result using the module “oneBit_fullAdder” from file “A1Q1_oneBit_fullAdder.v” which gives result in format of “sum and carry out” this sum is bit wise addition of 1-bit inputs and carry out of the same.
This “eightBit_rippleCarryAdder” runs the loop  to store each bit sum into the “sum” and each bit carryout into “ct” the last one carryout is taken as output “cout” and total 8-bit sum as output “sum”.

## Q-2
## 8-bit Comparator

8-bit comparator : The input of the comparator, i.e. the two 8-bit numbers to be compared are stored in 8-bit wide register vectors a and b respectively. The comparator gives output as g ( a>b), e (a=b) and l (a< b). It has been implemented using eight 1-bit comparators. A module named eightBit_comparator is defined which is the top-level module. 

Clearly, a > b, if a[i] > b[i] and (a[j]=0 and b[j]=0 ∀ j>i). The for loop compares each bit of a and b using oneBit_comparator and stores the result in x, y and z i.e, x,y and z are assigned 1 in case (a[i]>b[i]), (a[i]=b[i]) and (a[i]< b[i]) respectively. 

x is assigned 1 if (a>b), y if (a=b) and z if (a< b). Again a for loop is run, where a flag named k is defined with value 0. In each loop, the values of y and k are checked. If value of y is 0, it implies that either a>b or a< b. In this case, k is assigned value 1. The result temporarily stored in registers p, q and r are then assigned to g, e, and l for final output after the loop ends.

## Q-3
## 3 to 8 decoder

### 1) 2-4 decoder 

Here we give en,a and b as input and our output is 4 bit register d.

The gate level implementatio being
```
d[0] = (~a) & (~b) & (en)
```
```
d[1] = (~a) & b & (en)
```
```
d[2] = a & (~b) & (en)
```
```
d[3] = a & b & (en)
```

Now we will use 3 two-to-four decoders to make a 3-8 decoder

Truth table for 3 to 8 decoder is

| a[0] | a[1] | a[2] | b[7] | b[6] | b[5] | b[4] | b[3] | b[2] | b[1] | b[0] |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1    |
| 0    | 0    | 1    | 0    | 0    | 0    | 0    | 0    | 0    | 1    | 0    |
| 0    | 1    | 0    | 0    | 0    | 0    | 0    | 0    | 1    | 0    | 0    |
| 0    | 1    | 1    | 0    | 0    | 0    | 0    | 1    | 0    | 0    | 0    |
| 1    | 0    | 0    | 0    | 0    | 0    | 1    | 0    | 0    | 1    | 0    |
| 1    | 0    | 1    | 0    | 0    | 1    | 0    | 0    | 0    | 0    | 0    |
| 1    | 1    | 0    | 0    | 1    | 0    | 0    | 0    | 0    | 0    | 0    |
| 1    | 1    | 1    | 1    | 0    | 0    | 0    | 0    | 0    | 0    | 0    |

### 2) 3-8 decoder

here we will take enable,a and b as our input and 8 bit wire b as output.

First 2-4 decoder will take enable along with c which we take as '0' and a[2] as input and the output(d).
Second decoder will take d[0] as enable and (a[1], a[0]) as input and will feed first 4 bits of output.
Third decoder will take d[1] as enable and (a[1],a[0]) as input to feed the next 4 bits of output.

## Q-4
## Priority Encoder

we are given a 8 bit number(d) and we need to encode it by giving priority to the first '1' from right.

So we made a truth table according to the priority which is given below
We will store our output in 3 bit register q.

| d[7] | d[6] | d[5] | d[4] | d[3] | d[2] | d[1] | d[0] | q[0] | q[1] | q[2] |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| x    | x    | x    | x    | x    | x    | x    | 1    | 0    | 0    | 0    |
| x    | x    | x    | x    | x    | x    | 1    | 0    | 0    | 0    | 1    |
| x    | x    | x    | x    | x    | 1    | 0    | 0    | 0    | 1    | 0    |
| x    | x    | x    | x    | 1    | 0    | 0    | 0    | 0    | 1    | 1    |
| x    | x    | x    | 1    | 0    | 0    | 1    | 0    | 1    | 0    | 0    |
| x    | x    | 1    | 0    | 0    | 0    | 0    | 0    | 1    | 0    | 1    |
| x    | 1    | 0    | 0    | 0    | 0    | 0    | 0    | 1    | 1    | 0    |
| 1    | 0    | 0    | 0    | 0    | 0    | 0    | 0    | 1    | 1    | 1    |

here x can be either '0' or '1'

According to this we did the gate level implementation for q[0],q[1] and q[2].

``` q[2] = ((d[7]) | (d[6]) | (d[5]) | (d[4])) & ((~d[3]) & (~d[2])) & ((~d[1]) & (~d[0]))```</br>
```
q[1] = ((d[3] | d[2]) & ((~d[1]) & (~d[0]))) | ((d[7] | d[6]) & ((~d[5]) & (~d[4]) & (~d[3]) & (~d[2]) & (~d[1]) & (~d[0])))
```
```
q[0] = (d[1] & (~d[0])) | (d[3] & (~d[2]) & (~d[1]) & (~d[0])) | (d[5] & (~d[4]) & (~d[3]) & (~d[2]) & (~d[1]) & (~d[0])) | (d[7] & (~d[6]) & (~d[5]) & (~d[4]) & (~d[3]) & (~d[2]) & (~d[1]) & (~d[0]))
```







