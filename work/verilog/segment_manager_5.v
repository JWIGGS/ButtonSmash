/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module segment_manager_5 (
    input [15:0] regfileCountdown,
    output reg [7:0] ledSegment
  );
  
  
  
  always @* begin
    
    case (regfileCountdown[12+3-:4])
      default: begin
        ledSegment = 8'h40;
      end
      1'h0: begin
        ledSegment = 8'h3f;
      end
      1'h1: begin
        ledSegment = 8'h06;
      end
      2'h2: begin
        ledSegment = 8'h5b;
      end
      2'h3: begin
        ledSegment = 8'h4f;
      end
      3'h4: begin
        ledSegment = 8'h66;
      end
      3'h5: begin
        ledSegment = 8'h6d;
      end
      3'h6: begin
        ledSegment = 8'h7d;
      end
      3'h7: begin
        ledSegment = 8'h07;
      end
      4'h8: begin
        ledSegment = 8'h7f;
      end
      4'h9: begin
        ledSegment = 8'h6f;
      end
    endcase
  end
endmodule