#! /bin/bash

iverilog booth.v
iverilog booth_tb.v
vvp a.out
gtkwave wave.vcd
