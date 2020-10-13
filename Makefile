NAME=inverter

all: sim

%.spice: %.ext
	# convert extracted netlist from magic into spice model
	ext2spice $^ -o model.spice
	# convert nmos to nfet and pmos to pfet as the library I have only has these transistors
	sed -i -e 's/nmos/nfet/;s/pmos/pfet/' model.spice
	# build a simulation with pre and post.spice
	cat pre.spice model.spice post.spice > $@

sim: $(NAME).spice
	# run the simulation
	ngspice $^

clean:
	rm -f $(NAME).spice model.spice

phony: clean
