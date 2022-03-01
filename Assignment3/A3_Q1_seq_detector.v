module seq_detector(clk,reset,in,out);

input clk,reset,in;
output out;

wire clk,reset;
wire in; //1-bit input
reg out; //1-bit output
parameter SIZE = 2; //setting parameter SIZE as 2

//setting parameters as different states
parameter IDLE = 2'b00,//initially 
state1 = 2'b01, //state when it gets 10 from idle state
state2= 2'b10, //state when it gets 101
state3= 2'b11; //state when it gets 1010


reg [SIZE-1:0] state; //current state
reg [SIZE-1:0] next_state; //next state
initial begin
  state = IDLE;
end

always @(state or in) begin
    next_state= IDLE; 
    case (state)

        //when it gets input after it is at IDLE state
        IDLE: if (~in) begin
         
            next_state= IDLE;    
        end
        else begin
          next_state = state1;
        end

        //when it gets input after it is at state1
        state1: if(~in) begin
          
          next_state = state2;
        end
        else begin
          next_state= state1;
     
        end

        //when it gets input after it is at state2
        state2: if(~in) begin
      
          next_state = IDLE;
        end
        else begin
          next_state = state3;
        end
        
        //when it gets input after it is at state3
        state3: if(~in) begin
          next_state= state2;
        end
        else begin  
          next_state = state1;
        end

        default:  begin
        next_state = IDLE;
        end
        
        
    endcase
    
end

always @(posedge clk) begin

    if(reset == 1'b1) begin
      
      state = IDLE; //new (8-bit) input
    end
    else begin
     
      state = next_state; //continuation of the input
    end
    
end

always @(state or in) begin 

    if(reset == 1'b1) begin
      out = 1'b0;
    end

    else begin
      if(state == state3) begin
        if(in == 1'b0) begin
          out = 1'b1; //output when it finds the sequence of 1010
        end
        else begin
          out = 1'b0; ////output when it is at any other state
        end
      end
      else begin
        out = 1'b0;
      end
    end
    
end




endmodule
