This is a test of waves propagating in a dust-gas medium
Described in Laibe & Price (2011, 2012a,b) and Laibe & Price (2014b)

Type "make clean" and "make" to re-compile the 1DSPMHD binary.

The input files in this directory run the dustywave test with
five different drag coefficients

This directory uses the ONE FLUID dust algorithm

As previously, just run all the tests at once:

./1DSPMHD *.in

then plot all the results together:

nsplash -y 2 -x 1 -dev /xw

Compare this to the solution obtained with the twofluid approach
(in the ../twofluid directory) and with the exact solution given by
the red lines

Note: To automatically read the drag for each input file correctly,
and hence plot the right exact solution, you will need to have
splash v2.5.2 or later
  
Added by Daniel Price, Feb 2014
Updated and checked for v2.1, April 2015
