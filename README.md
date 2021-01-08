# Sky130 dflop sweep simulation

Simulation setup to look at metastability in setup time in a d flop:

* inv reset, keep high
* d input, sweep the delay time of a low going pulse
* q output,
* clock input, keep clock pulse constant

# Setup

clone this repo recusively to get the spice models from https://foss-eda-tools.googlesource.com/skywater-pdk/libs/sky130_fd_pr

You will also need to get your $PDK_ROOT & $PDKPATH set correct for the .magicrc file to work and load the tech file. See https://github.com/efabless/openlane/#setting-up-the-pdk-skywater-pdk for details.

The simulation is quite slow to run because there are a lot of models to include. If you want to speed things up you can comment out (add a * at the start of the line) every line from 55 onewards in sky130_fd_pr/models/sky130.lib.spice

You will need imagemagick for the convert utility.

# Run

    make sims           # uses sequence.py to replace DELAY and PLOT placeholders, writes 1000 ps files into ./pss
    make png            # uses imagemagic convert to convert all ps to png in ./pngs
    make animation.gif  # use imagemagic convert to make a gif

If you get imagemagic permission problems, check this: https://stackoverflow.com/questions/52998331/imagemagick-security-policy-pdf-blocking-conversion

# List of cells in the PDK

https://antmicro-skywater-pdk-docs.readthedocs.io/en/test-submodules-in-rtd/contents/libraries/sky130_fd_sc_hd/README.html
https://antmicro-skywater-pdk-docs.readthedocs.io/en/test-submodules-in-rtd/contents/libraries/sky130_fd_sc_hd/cells/dfrtp/README.html
