# CS220 Programming Assignment 2

## Question 1

## Sequence Detector (1010):

We have implemented this FSM using Mealy machine.

The FSM is implemented using three always blocks, one block for changing the state on
getting input ( combinational logic ), one for changing the current state whenever the
clock (clk) has positive edge (sequential logic) and one for giving output ( output logic)
#### Implementation

In the module ``` seq_detector ```, we are taking``` clk, reset ``` and 1 bit ``` in ```(which is part of 8 bit input)  as the input and then 

We are using 3 different always blocks as described above to work out the next state and the output.

## Question 2


## 3-bit odd parity bit generator

We have implemented this FSM using Moore machine.

We are changing reset to high before each input change in order to change the current state to IDLE state.

Also, we are keeping our states as number of 0s and 1s encountered till now. 


#### Implementation

In the module ``` parity_gen ```, we are taking ``` clk ``` , ``` reset ``` and 1 bit ``` in ``` (which is part of 3 bit sequence) as the input.

Here also we have used 3 diffrenet always blocks like in the ``` Sequence Detector``` to work out the next state and the output.