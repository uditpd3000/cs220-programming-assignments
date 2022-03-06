module oneBit_Adder(input a, input b, input cin, input opcode, output sum, output cout);
    wire bInv=opcode?~b:b; //storing b as per the operation
    
      assign sum= a^bInv^cin; //adding input bits and carry input
      assign cout = a&bInv | (cin & (a|bInv)); //for carry out when any two of a,b,cin are one

    
endmodule