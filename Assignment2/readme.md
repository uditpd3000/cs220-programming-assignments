# CS220 Programming Assignment 2

## Question 1

## Carry look ahead Adder

We have used 8 bit intermediate carries register to store the carry-ins of all 8 bits addition, the method to do this is described in the report file.

It was indeed a long implementation but the main motive of it was to not rely on previous output for addition of other bits.

So, we have not used any smaller modules like 4-bit carry look ahead adder to design the bigger module.

#### Implementation

In the module ``` lookahead_adder ```, we are taking two 8 bit numbers ``` a ``` and ``` b ``` and carry ``` cin ``` as the input and then claculating and storing the intermediate 
carries in an 8 bit register ``` carries ```.

After that we are calculating sum bitwise using for loop.

## Question 2


## Johnson Counter

We have kept our reset as low in our program so that we can get all the states of the counter.

If one change it to high, the output will be reset to 0.


#### Implementation

In the module ``` johnson_counter ```, we are taking ``` clk ``` and ``` reset ``` as the input.
We are storing the state of the counter in an 8 bit register ``` out ``` which is initially set to 0.
And then on each rising edge of the clock we are changing the state  of the counter as described in the report.


