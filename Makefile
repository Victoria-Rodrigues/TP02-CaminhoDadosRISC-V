make run:
	iverilog -o ex testbench.v
	vvp ex
	gtkwave testbench.vcd
