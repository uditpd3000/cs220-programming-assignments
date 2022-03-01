`include "A3_Q2_parity_gen.v"

module tstbnch();

reg clk,reset,inp,out;
reg [2:0] in; //input register
wire outp;  //output wire
integer i;

always #1 clk = ~clk; //for clock oscillation

parity_gen x(clk,reset,inp,outp);

initial begin
    clk = 1'b0;  //setting clock to 0 initially
    reset = 1'b0; //setting reset to 0 initially and after each input case changing to 1 to get again IDLE state
    in = 3'b000;
    #10
    $display("input=%b parity_bit=%b",in,outp);
    reset=1'b1; 
    #5 reset=1'b0;
    in = 3'b001;
    #10
    $display("input=%b parity_bit=%b",in,outp);
    reset=1'b1; 
    #5 reset=1'b0;
    in = 3'b010;
    #10
    $display("input=%b parity_bit=%b",in,outp);
    reset=1'b1; 
    #5 reset=1'b0;
    in = 3'b011;
    #10
    $display("input=%b parity_bit=%b",in,outp);
    reset=1'b1; 
    #5 reset=1'b0;
    in = 3'b100;
    #10
    $display("input=%b parity_bit=%b",in,outp);
    reset=1'b1; 
    #5 reset=1'b0;
    in = 3'b101;
    #10
    $display("input=%b parity_bit=%b",in,outp);
    reset=1'b1; 
    #5 reset=1'b0;
    in = 3'b110;
    #10
    $display("input=%b parity_bit=%b",in,outp);
    reset=1'b1; 
    #5 reset=1'b0;
    in = 3'b111;
    #10
    $display("input=%b parity_bit=%b",in,outp);




    

    #3$finish;
    

end

//giving input bit-wise whenever the 3-bit input changes

always @(in) begin

    for(i=0;i<3;i+=1) begin
        #2
        inp= in[i];
      
    end
    
    
        

    
    
end

always @(outp) begin
    // $display("outpchange %d",$time);
    
end

endmodule


