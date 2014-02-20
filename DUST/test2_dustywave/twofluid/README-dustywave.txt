This is a test of waves propagating in a dust-gas medium
Described in Laibe & Price (2011, 2012a,b) and Laibe & Price (2014b)

Type "make clean" and "make" to re-compile the 1DSPMHD binary.

The input files in this directory run the dustywave test with
five different drag coefficients

Best thing to do is just to run all the tests at once:

./1DSPMHD *.in

then plot all the results together:

nsplash -y 2 -x 1 -dev /xw

(note that the filenames are automatically read from the file splash.filenames)
Press space to advance between timesteps.

Note: To automatically read the drag for each input file correctly,
and hence plot the right exact solution, you will need to have
splash v2.4.0 or later
  
Added by Daniel Price, Feb 2014
