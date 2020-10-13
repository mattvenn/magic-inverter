NAME=inverter

all: sim

magic:
	# for rcfile to work PDKPATH must be set correctly
	magic -rcfile sky130A.magicrc $(NAME).mag

%.spice: %.ext
	# convert extracted netlist from magic into spice model
	ext2spice $^ -o model.spice -p $(PDKPATH)
	# build a simulation with pre and post.spice
	cat pre.spice model.spice post.spice > $@

sim: $(NAME).spice
	# run the simulation
	ngspice $^

clean:
	rm -f $(NAME).spice model.spice

phony: clean
