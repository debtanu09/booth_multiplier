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

module booth(clk, rst, start, mcand, mplier, product, done);

parameter size=3;

input [2**size-1:0] mcand, mplier;
output [2**(size+1)-1:0] product;
input clk, rst, start;
output reg done;

reg [size-1:0] counter;
reg [2**size-1:0] A, M, Q;
reg Q_1;

parameter reset = 2'b00;
parameter strt = 2'b01;
parameter op = 2'b10;
parameter dne = 2'b11;

reg [1:0] state;

always @(posedge clk or rst) begin
	if(rst)
		state = reset;
end

always @(posedge clk) begin
	case(state)
		reset: begin
			counter = 2**size-1;
			A = 0;
			M = 0;
			Q = 0;
			Q_1 = 0;
			state = reset;
			if(~rst & start)
				state = strt;
		end
		strt: begin
			counter = 2**size-1;
			A = 0;
			M = mcand;
			Q = mplier;
			Q_1 = 0;
			if(strt)
				state = op;
		end
		op: begin
			if(Q[0] ^ Q_1 == 0) begin
				{A, Q, Q_1} <= {A[2**size-1], A, Q};
			end
			else if({Q[0], Q_1} == 2'b01) begin
				A = A + M;
				{A, Q, Q_1} <= {A[2**size-1], A, Q};
			end
			else begin
				A = A - M;
				{A, Q, Q_1} <= {A[2**size-1], A, Q};
			end
			state = op;
			if(counter == 0)
				state = dne;
			counter = counter - 1;
		end
		dne: begin
			done = 1;
			state = strt;
			if(rst)
				state = reset;
		end
	endcase
end

assign product = {A, Q};

endmodule
