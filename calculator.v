`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Boston University
// Engineer: Marybel and Victoria
// 
// Create Date: 04/26/2022 07:45:32 PM
// Design Name: 
// Module Name: calculator
// Project Name: ALU calculator
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module calculator(
    input [3:0] A,B,
    input type, 
    input [1:0] select,
    output overflow,
    output [3:0] out
    );
    
    reg [3:0] result;
    wire [4:0] tmp;
    assign out = result; 
    assign tmp = {1'b0,A} + {1'b0,B};
    assign overflow = tmp[4];
    
    always @(*)
    begin
    if (type == 0)
    
    begin
    case (select)
    2'b00: result = A + B;
    2'b01: result = A - B; 
    2'b10: result = A * B;
    2'b11: result = A<<1;
    default: result = A+B;
    endcase
    end
    
    else if (type == 1)
    begin
    case(select)
    2'b00: result = A&B;
    2'b01: result = A|B;
    2'b10: result = ~A; 
    2'b11: result = A^B;
    default result = A&B;
    endcase
    end
    end
endmodule
