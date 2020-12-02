/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_boolean_9 (
    input [5:0] alufn,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] result
  );
  
  
  
  always @* begin
    
    case (alufn[0+3-:4])
      4'h8: begin
        result = a & b;
      end
      4'he: begin
        result = a | b;
      end
      4'h6: begin
        result = a ^ b;
      end
      4'ha: begin
        result = a;
      end
      default: begin
        result = 16'h0000;
      end
    endcase
  end
endmodule
