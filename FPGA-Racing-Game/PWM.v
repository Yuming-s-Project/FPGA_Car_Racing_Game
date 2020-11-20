`timescale 1ns / 1ps
module PWM(
input clk,
input [7:0] duty,
output reg pwm);

reg [7:0] counter=0;

//simple pwm at 100MHZ/256, with variable duty
always@(posedge clk)
begin
counter <= counter +1;
if(counter<duty)
pwm <= 1;
else
pwm <= 0;
end



endmodule
