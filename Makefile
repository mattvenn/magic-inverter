NAME=inverter

all: sim

magic:
	# for rcfile to work PDKPATH must be set correctly
#	magic -rcfile sky130A.magicrc $(NAME).mag
	magic -rcfile sky130A.magicrc /home/matt/work/asic-workshop/pdks/skywater-pdk/libraries/sky130_fd_sc_hd/latest/cells/inv/sky130_fd_sc_hd__inv_1.gds
	# now in the command window type:
	# extract
	# ext2spice

simulation.spice: $(NAME).spice
	# build a simulation with pre and post.spice
	cat pre.spice inverter.spice post.spice > $@

sim: simulation.spice
	# run the simulation
	ngspice $^

clean:
	rm -f $(NAME).spice model.spice $(NAME).ext

phony: clean
