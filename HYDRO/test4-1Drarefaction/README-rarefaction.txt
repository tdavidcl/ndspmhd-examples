This is a test of a 1D rarefaction wave in SPH (the Einfeldt rarefaction
problem). This can be a difficult test for grid-based codes but 
rarefactions need no special treatment in SPH.

Type "make clean" and "make" to re-compile the 1DSPMHD binary.

Run the code using ./1DSPMHD einfeldt.in
Or with output to a file: ./1DSPMHD einfeldt.in >& einfeldt.out &

Plot the results using "nsplash einfeldt_0*.dat"

For these shock tube-type problems the file sshk.shk sets the left and
right states of the Riemann problem, so edit this file to change the problem.
The .shk file is also read by splash in order to plot the exact solution.

Things to try
--------------
- Run the code with the default parameters:

 ./1DSPMHD einfeldt.in
 
  and plot the results with splash:
  
 nsplash einfeldt_0*.dat -y 18

Note that this problem has been run without *any* artificial viscosity terms:
 0 0.000  0.000  0.000  2.000       ! viscosity type, alpha(min), alphau(min), alphab(min), beta
       0      0      0  0.100       ! use av, au, ab limiter, constant for this(0.1-0.2)

...because artificial viscosity is off in any case for receding particles.

Thus, SPH needs no special treatment of rarefaction waves (there is
perhaps a case to be made for using a small amount of viscosity where
rarefaction runs into the surrounding medium -- you may observe some
small oscillations in velocity at this point which can be damped using
some viscosity). If you like, see what difference adding artificial 
viscosity makes here:

e.g.
 2 1.000  0.000  0.000  2.000       ! viscosity type, alpha(min), alphau(min), alphab(min), beta

Added by Daniel Price, July 2010
