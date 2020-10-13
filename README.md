# Inverter demo with magic

to create the extracted netlist:

    magic inverter.mag
    then type 'ext' to extract

then type 

    make

to run the simulation

![inverter](inverter.png)

![simulation](sim.png)

# PDK

* pdk install instructions here

# Questions / Todo

* where does the spice model come from? https://foss-eda-tools.googlesource.com/skywater-pdk/libs/sky130_fd_pr
* how to extract as before? ext2spice on cli doesn't work anymore (have to do from inside magic)
* how to get something I can simulate?

# Attribution

min2.tech and the lib files come from [VLSI course](https://www.udemy.com/course/vlsi-academy-custom-layout/) by Kunal Ghosh
