module gray_counter(clk,reset,out);

input wire clk,reset; //clock and reset as input

output reg out; //output

//defining eight different states
parameter S0 = 3'b000,
S1 = 3'b001,
S2 = 3'b011,
S3 = 3'b010,
S4 = 3'b110,
S5 = 3'b111,
S6 = 3'b101,
S7 = 3'b100;

reg [2:0] state,next_state; //reg storing current and next state

initial begin
    state = S0; //initial state
end

always @(posedge clk ) begin //at every posedge the state changes

    if(reset==1'b1) begin //again to start count from begining
       state = S0;
       out= 1'b0;
    end
    else begin
      case (state)
        S0: begin 
            #1state <= S1;
            out= 1'b0;
        end
        S1: begin #1state <= S2; 
            out= 1'b0; 
        end
        S2: begin #1state <= S3; 
            out= 1'b0; 
        end
        S3: begin #1state <= S4; 
            out= 1'b0; 
        end
        S4: begin #1state <= S5;
            out= 1'b0;
        end 
        S5: begin #1state <= S6;
            out= 1'b0; 
        end
        S6: begin #1state <= S7; //to the last state after which the output is high showing count reached to 7
            out= 1'b1;   
        end
        default: begin #1state <= S0;
        out = 1'b0;
        end 
    endcase
    
    end

    
end

always @(state) begin
$display("Present state= %b output = %b",state,out);   //displaying output after change of states
end
endmodule
