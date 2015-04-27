This is a test showing how a random particle distribution will relax to an
ordered arrangement because of the Hamiltonian nature of SPH.

Type "make clean" and "make" to re-compile the 2DSPMHD binary.

Run the code using ./2DSPMHD random.in
Or with output to a file: ./2DSPMHD random.in >& random.out &

Plot the results using "nsplash random_0*.dat"

Things to try
--------------
-look at the particle distribution (x-y plot of particle positions)
 as a function of time
-look at the density as a function of x (fix the plot limits)
-try a calculation without any artificial viscosity
 (set alpha(min) to 0.000 instead of 1.000)
-plot the kinetic energy as a function of time in both cases
 (use asplash -e random.ev)

-Now try using a more "accurate" pressure term, by using iprterm=-2:
 -2  ! type of pressure term
 
 this is already done in the file "rpsph.in":
 
 ./2DSPMHD rpsph.in
 
 (this corresponds to a gradient term that vanishes when the pressure is
  constant, e.g. Morris 1996: This particular one is the "rpSPH" from Abel 2010)
 ...and notice how the random particle distribution never sorts itself out!
    This is because the method is no longer Hamiltonian.

Added by Daniel Price, July 2010
Updated for v2.1, April 2015
