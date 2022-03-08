NAME=inverter

all: sim

magic:
	# PDK_ROOT env var must be set correctly for this to work
	magic -rcfile $(PDK_ROOT)/sky130A/libs.tech/magic/sky130A.magicrc $(NAME).mag
	# now in the command window type:
	# extract
	# ext2spice lvs
	# ext2spice cthresh 0
	# ext2spice

simulation.spice: pre.spice $(NAME).spice post.spice
    # magic puts subckt and end around extract, so remove it
	sed -i -e 's/.ends//' $(NAME).spice
	sed -i -e 's/.subckt inverter//' $(NAME).spice
	# build a simulation with pre and post.spice
	cat $^ > $@

sim: simulation.spice
	# run the simulation
	ngspice $^

clean:
	rm -f $(NAME).spice model.spice $(NAME).ext

phony: clean
