NAME=inverter

all: sim

magic:
	# for rcfile to work PDKPATH must be set correctly
	magic -rcfile sky130A.magicrc $(NAME).mag
	# now in the command window type:
	# extract
	# ext2spice lvs
	# ext2spice cthresh 0
	# ext2spice

standardcell:
	magic -rcfile sky130A.magicrc $(PDK_ROOT)/skywater-pdk/libraries/sky130_fd_sc_hd/latest/cells/inv/sky130_fd_sc_hd__inv_1.gds

simulation.spice: pre.spice $(NAME).spice post.spice
    # magic puts an extra .end after extract, so remove it
	sed -i -e 's/.end//' $(NAME).spice
	# build a simulation with pre and post.spice
	cat $^ > $@

sim: simulation.spice
	# run the simulation
	ngspice $^

clean:
	rm -f $(NAME).spice model.spice $(NAME).ext

phony: clean
