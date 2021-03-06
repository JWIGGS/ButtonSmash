/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    output reg [13:0] ledPlayerScore,
    output reg [5:0] ledPlayerSize,
    output reg [15:0] ledSequence,
    output reg [7:0] ledSegment,
    input [5:0] button
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  
  wire [6-1:0] M_module_buttons_buttonPressedOut;
  reg [6-1:0] M_module_buttons_buttonRaw;
  reg [6-1:0] M_module_buttons_buttonSeen;
  button_manager_2 module_buttons (
    .clk(clk),
    .rst(rst),
    .buttonRaw(M_module_buttons_buttonRaw),
    .buttonSeen(M_module_buttons_buttonSeen),
    .buttonPressedOut(M_module_buttons_buttonPressedOut)
  );
  
  wire [6-1:0] M_module_control_alufn;
  wire [16-1:0] M_module_control_a;
  wire [16-1:0] M_module_control_b;
  wire [6-1:0] M_module_control_buttonSeenOut;
  wire [256-1:0] M_module_control_regfileRead;
  reg [16-1:0] M_module_control_wd;
  reg [6-1:0] M_module_control_buttonPressed;
  control_unit_3 module_control (
    .clk(clk),
    .rst(rst),
    .wd(M_module_control_wd),
    .buttonPressed(M_module_control_buttonPressed),
    .alufn(M_module_control_alufn),
    .a(M_module_control_a),
    .b(M_module_control_b),
    .buttonSeenOut(M_module_control_buttonSeenOut),
    .regfileRead(M_module_control_regfileRead)
  );
  
  wire [16-1:0] M_module_alu_result;
  reg [6-1:0] M_module_alu_alufn;
  reg [16-1:0] M_module_alu_a;
  reg [16-1:0] M_module_alu_b;
  alu_whole_4 module_alu (
    .alufn(M_module_alu_alufn),
    .a(M_module_alu_a),
    .b(M_module_alu_b),
    .result(M_module_alu_result)
  );
  
  wire [8-1:0] M_module_segment_ledSegment;
  reg [16-1:0] M_module_segment_regfileCountdown;
  segment_manager_5 module_segment (
    .regfileCountdown(M_module_segment_regfileCountdown),
    .ledSegment(M_module_segment_ledSegment)
  );
  
  reg [255:0] regfile;
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    M_module_alu_alufn = M_module_control_alufn;
    M_module_alu_a = M_module_control_a;
    M_module_alu_b = M_module_control_b;
    M_module_control_wd = M_module_alu_result;
    M_module_control_buttonPressed = M_module_buttons_buttonPressedOut;
    regfile = M_module_control_regfileRead;
    M_module_buttons_buttonRaw = button;
    M_module_buttons_buttonSeen = M_module_control_buttonSeenOut;
    ledPlayerScore[0+6-:7] = regfile[80+0+6-:7];
    ledPlayerScore[7+6-:7] = regfile[96+0+6-:7];
    ledPlayerSize[0+2-:3] = regfile[176+0+2-:3];
    ledPlayerSize[3+2-:3] = regfile[192+0+2-:3];
    ledSequence[0+7-:8] = regfile[208+0+7-:8];
    ledSequence[8+7-:8] = regfile[224+0+7-:8];
    M_module_segment_regfileCountdown = regfile[32+15-:16];
    ledSegment = M_module_segment_ledSegment;
  end
endmodule
