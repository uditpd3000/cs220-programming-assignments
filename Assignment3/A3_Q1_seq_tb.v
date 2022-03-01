`include "A3_Q1_seq_detector.v"

module seq_tb();

reg clk, reset, inp;
reg [7:0] in; //reg to store 7-bit input
reg [7:0]out; //reg to store 7-bit output
wire outp; //to store 1-bit after each 1-bit input
integer i;


always #2 clk=~clk; //oscilation in clock

seq_detector x(clk,reset,inp,outp);

initial begin
  clk= 1'b0; //setting clock to 0 initially
  reset = 1'b0; //setting reset to 0 initially and after each input case changing to 1 to get again IDLE state
  in = 8'b10101010; #35 $display("input = %b output= %b",in,out);
  reset = 1'b1;
  #5 reset =1'b0;
  in = 8'b01110110; #35 $display("input = %b output= %b",in,out);
  reset = 1'b1;
  #5 reset =1'b0;
  in = 8'b01010010; #35 $display("input = %b output= %b",in,out);
  reset = 1'b1;
  #5 reset =1'b0;
  in = 8'b10100010; #35 $display("input = %b output= %b",in,out);
  reset = 1'b1;
  #5 reset =1'b0;
  in = 8'b01011010; #35 $display("input = %b output= %b",in,out);
  reset = 1'b1;
  #5 reset =1'b0;
  in = 8'b01010110; #35 $display("input = %b output= %b",in,out);
  reset = 1'b1;
  #5 reset =1'b0;
  in = 8'b00010010; #35 $display("input = %b output= %b",in,out);
  reset = 1'b1;
  #5 reset =1'b0;
  in = 8'b00010110; #35 $display("input = %b output= %b",in,out);
  reset = 1'b1;
  #5 reset =1'b0;
  in = 8'b11001010; #35 $display("input = %b output= %b",in,out);
  reset = 1'b1;
  #5 reset =1'b0;
  in = 8'b01110011; #35 $display("input = %b output= %b",in,out);
  reset = 1'b1;
  #5 reset =1'b0;
  in = 8'b01110100; #35 $display("input = %b output= %b",in,out);
  reset = 1'b1;
  #5 reset =1'b0;
  in = 8'b11010010; #35 $display("input = %b output= %b",in,out);
  reset = 1'b1;
  #5 reset =1'b0;
  in = 8'b01010110; #35 $display("input = %b output= %b",in,out);
  reset = 1'b1;
  #5 reset =1'b0;
  in = 8'b00010010; #35 $display("input = %b output= %b",in,out);
  reset = 1'b1;
  #5 reset =1'b0;
  in = 8'b01010000; #35 $display("input = %b output= %b",in,out);
  
  #5 $finish;


end


//giving input bit-wise whenever the 7-bit input changes
always @(in) begin
  for(i=7;i>=0;i-=1) begin
      #2
      inp= in[i];
      #2
      out[i]= outp;
    end
  
end

endmodule
