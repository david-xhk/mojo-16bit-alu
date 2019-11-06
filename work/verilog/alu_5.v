/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_5 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg z,
    output reg v,
    output reg n,
    output reg [15:0] out
  );
  
  
  
  wire [16-1:0] M_adder_out;
  wire [1-1:0] M_adder_z;
  wire [1-1:0] M_adder_v;
  wire [1-1:0] M_adder_n;
  reg [16-1:0] M_adder_a;
  reg [16-1:0] M_adder_b;
  reg [6-1:0] M_adder_alufn;
  adder_3 adder (
    .a(M_adder_a),
    .b(M_adder_b),
    .alufn(M_adder_alufn),
    .out(M_adder_out),
    .z(M_adder_z),
    .v(M_adder_v),
    .n(M_adder_n)
  );
  
  wire [16-1:0] M_boolean_out;
  reg [16-1:0] M_boolean_a;
  reg [16-1:0] M_boolean_b;
  reg [6-1:0] M_boolean_alufn;
  boolean_2 boolean (
    .a(M_boolean_a),
    .b(M_boolean_b),
    .alufn(M_boolean_alufn),
    .out(M_boolean_out)
  );
  
  wire [16-1:0] M_compare_out;
  reg [1-1:0] M_compare_z;
  reg [1-1:0] M_compare_v;
  reg [1-1:0] M_compare_n;
  reg [6-1:0] M_compare_alufn;
  compare_4 compare (
    .z(M_compare_z),
    .v(M_compare_v),
    .n(M_compare_n),
    .alufn(M_compare_alufn),
    .out(M_compare_out)
  );
  
  wire [16-1:0] M_shifter_out;
  reg [16-1:0] M_shifter_a;
  reg [16-1:0] M_shifter_b;
  reg [6-1:0] M_shifter_alufn;
  shifter_1 shifter (
    .a(M_shifter_a),
    .b(M_shifter_b),
    .alufn(M_shifter_alufn),
    .out(M_shifter_out)
  );
  
  always @* begin
    z = M_adder_z;
    v = M_adder_v;
    n = M_adder_n;
    M_adder_a = a;
    M_adder_b = b;
    M_adder_alufn = alufn;
    M_boolean_a = a;
    M_boolean_b = b;
    M_boolean_alufn = alufn;
    M_shifter_a = a;
    M_shifter_b = b;
    M_shifter_alufn = alufn;
    M_compare_z = M_adder_z;
    M_compare_v = M_adder_v;
    M_compare_n = M_adder_n;
    M_compare_alufn = alufn;
    out = 1'h0;
    
    case (alufn[4+1-:2])
      2'h0: begin
        out = M_adder_out;
      end
      2'h1: begin
        out = M_boolean_out;
      end
      2'h2: begin
        out = M_shifter_out;
      end
      2'h3: begin
        out = M_compare_out;
      end
    endcase
  end
endmodule