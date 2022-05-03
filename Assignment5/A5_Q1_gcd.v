module gcd(u,v,out);

input[7:0] u,v;       // u and v are the 2 inputs 
output reg[7:0] out;  // out will store the gcd 

reg [7:0] x,y,t;       //x and y will be used to carry out calculations and t is used for temporary work.
integer count=0;

    always @(u or v) begin
      x=u;
      y=v;
      if(x==0)begin          // if x will be 0 then gcd will be y 
        x=y;
      end
      else if(y==0) begin    
        
      end
      else begin
        while(x!=y ) begin
        
      if(x[0]==0 && y[0]==0) begin     // If both are even
       x = x >> 1;
       y = y >> 1;
       count =count+1;

      end
      else if(x[0]==1 && y[0]==0) begin  // if x is odd and y is even
       y = y >> 1;
      end 
      else if(x[0]==0 && y[0]==1) begin  // if x is even and y is odd
       x = x >> 1;
      end
      else if(x>=y) begin                // if both are odd and x is greater than y
       t = x-y;
       x = t >> 1;
      end
      else begin                         // if y is greater than x
       t = y-x;
       y = t >> 1;

      end
     

    end
      end
      

    while(count>0) begin               // then we will multiply x by 2 number of times we divided both the numbers
     x = x << 1;
     count = count-1;
end

out = x;                              // to store the gcd 

      
    end

    


endmodule



