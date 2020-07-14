/*
MIT License

Copyright (c) 2020 Debtanu Mukherjee

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/


`include "booth.v"
module booth_tb;

localparam size = 5;


reg [2**size-1:0] mcand, mplier;
reg clk, rst, start;
wire [2**(size+1)-1:0] product;
wire done;
reg correct;

initial begin
$dumpfile("wave.vcd");
$dumpvars(0, booth_tb);
end


booth #(size) uut(clk, rst, start, mcand, mplier, product, done);

initial begin
	clk <= 0;
	rst <= 1;
	correct <= 0;
	#10
	rst <= 0;
	start <= 1;
	repeat(10000)
		#5 clk <= ~clk;
end

initial begin
	#10
	mplier <= $random;
	mcand <= $random;
	#(20+(2**size)*10)
	mplier <= $random;
	mcand <= $random;
	#(20+(2**size)*10)
	mplier <= $random;
	mcand <= $random;
	#(20+(2**size)*10)
	mplier <= $random;
	mcand <= $random;
	#(20+(2**size)*10)
	mplier <= $random;
	mcand <= $random;
	#(20+(2**size)*10)
	mplier <= $random;
	mcand <= $random;
	#(20+(2**size)*10)
	mplier <= $random;
	mcand <= $random;
	#(20+(2**size)*10)
	mplier <= $random;
	mcand <= $random;
	#(20+(2**size)*10)
	mplier <= $random;
	mcand <= $random;
	#(20+(2**size)*10)
	mplier <= $random;
	mcand <= $random;
	#(20+(2**size)*10)
	mplier <= $random;
	mcand <= $random;
	#(20+(2**size)*10)
	mplier <= $random;
	mcand <= $random;
	#(20+(2**size)*10)
	mplier <= $random;
	mcand <= $random;
	#(20+(2**size)*10)
	mplier <= $random;
	mcand <= $random;
	#(20+(2**size)*10)
	mplier <= $random;
	mcand <= $random;
	#(20+(2**size)*10)
	mplier <= $random;
	mcand <= $random;
	#(20+(2**size)*10)
	mplier <= $random;
	mcand <= $random;
	#(20+(2**size)*10)
	mplier <= $random;
	mcand <= $random;
	#(20+(2**size)*10)
	mplier <= $random;
	mcand <= $random;
	#(20+(2**size)*10)
	mplier <= $random;
	mcand <= $random;
	#(20+(2**size)*10)
	mplier <= $random;
	mcand <= $random;
	#(20+(2**size)*10)
	mplier <= $random;
	mcand <= $random;
	#(20+(2**size)*10)
	mplier <= $random;
	mcand <= $random;
	#400
	$finish;
end




endmodule
