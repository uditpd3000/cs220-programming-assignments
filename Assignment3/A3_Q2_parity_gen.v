module parity_gen(clk,reset,in,out);

input clk,reset,in;
output out;

wire clk,reset;
wire in; //1-bit input
reg out; //1-bit output
parameter SIZE = 4; //setting parameter SIZE as 4

//setting parameters as different states
parameter IDLE = 4'b0000, //initial state
odd0_even0 = 4'b1000, //state when there are zero 1s and zero 0s
odd0_even1 = 4'b0010, //state when there are zero 1s and one 0s
odd1_even0 = 4'b0001, //state when there are one 1s and zero 0s
odd0_even2 = 4'b0110, //state when there are zero 1s and two 0s
odd1_even1 = 4'b0011, //state when there are one 1s and one 0s
odd2_even0 = 4'b0101, //state when there are two 1s and zero 0s
odd0_even3 = 4'b1110, //state when there are zero 1s and three 0s
odd1_even2 = 4'b0111, //state when there are one 1s and two 0s
odd2_even1 = 4'b1011, //state when there are two 1s and one 0s
odd3_even0 = 4'b1101; //state when there are three 1s and zero 0s


reg [SIZE-1:0] state; //current state
reg [SIZE-1:0] next_state; //next state
initial begin
  state = IDLE;
end

always @(state or in) begin
     
    next_state= IDLE; 
    case (state)
        IDLE: next_state= odd0_even0;

        //when it gets input after it is at odd0_even0 state
        odd0_even0 :if (in) begin
            next_state= odd1_even0;
        end
        else begin
          next_state= odd0_even1;
        end
        
        //when it gets input after it is at odd0_even1 state
        odd0_even1 : if (in) begin
            next_state= odd1_even1;
        end
        else begin
          next_state= odd0_even2;
        end

        //when it gets input after it is at odd1_even0 state
        odd1_even0: if(in) begin
          next_state= odd2_even0;
        end
        else begin
          next_state= odd1_even1;
        end

        //when it gets input after it is at odd0_even2 state
        odd0_even2: if(in) begin
          next_state= odd1_even2;
        end
        else begin
          next_state= odd0_even3;
        end 

        //when it gets input after it is at odd1_even1 state
        odd1_even1: if(in) begin
          next_state= odd2_even1;
        end
        else begin
          next_state= odd1_even2;
        end

        //when it gets input after it is at odd2_even0 state
        odd2_even0: if(in) begin
          next_state= odd3_even0;
        end
        else begin
          next_state= odd2_even1;
        end

        //when it gets input after it is at odd0_even3 state
        odd0_even3: if(in) begin
          next_state= IDLE;
        end
        else begin
          next_state= IDLE;
        end

        //when it gets input after it is at odd1_even2 state
        odd1_even2: if(in) begin
          next_state= IDLE;
        end
        else begin
          next_state= IDLE;
        end

        //when it gets input after it is at odd2_even1 state
        odd2_even1: if(in) begin
          next_state= IDLE;
        end
        else begin
          next_state= IDLE;
        end

        //when it gets input after it is at odd3_even0 state
        odd3_even0: if(in) begin
          next_state= IDLE;
        end
        else begin
          next_state= IDLE;
        end
        default: next_state = IDLE;
    endcase
    
end

always @(posedge clk ) begin
    if(reset) begin
      state = #1 IDLE; //new (3-bit) input
    end
    else begin
      state = #1 next_state; //continuation of the input
    end
end

always @(in or state ) begin
    //output when it is at state with odd number of ones
    if(state == odd2_even1) begin
      out = #1 1'b1; 
    end
    else if(state == odd0_even3) begin
      out = #1 1'b1;
    end
    else  begin
      out = #1 1'b0; //otherwise condition
    end
    
end



endmodule
