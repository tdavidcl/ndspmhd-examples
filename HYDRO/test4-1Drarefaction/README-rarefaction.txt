This is a test of a 1D rarefaction wave in SPH (the Einfeldt rarefaction
problem). This can be a difficult test for grid-based codes but 
rarefactions need no special treatment in SPH.

Type "make clean" and "make" to re-compile the 1DSPMHD binary.

Run the code using ./1DSPMHD einfeldt.in
Or with output to a file: ./1DSPMHD einfeldt.in >& einfeldt.out &

Plot the results using "splash einfeldt_0*.dat"

For these shock tube-type problems the file sshk.shk sets the left and
right states of the Riemann problem, so edit this file to change the problem.
The .shk file is also read by splash in order to plot the exact solution.

Things to try
--------------
- Run the code with the default parameters:

 ./1DSPMHD einfeldt.in
 
  and plot the results with splash:
  
 splash einfeldt_0*.dat -y 17 -dev /xw

Note that this problem has been run without *any* artificial viscosity terms:
                 iav =           0    ! type of artificial viscosity
            alphamin =       0.000    ! minimum alpha (viscosity)
           alphaumin =       0.000    ! minimum alphau (conductivity)
           alphaBmin =       0.000    ! minimum alphaB (resistivity)
                beta =       0.000    ! beta in artificial viscosity
              iavlim =           0    ! use viscosity switch
             iavlimu =           0    ! use conductivity switch
             iavlimB =           0    ! use resistivity switch

...because artificial viscosity is off in any case for receding particles.

Thus, SPH needs no special treatment of rarefaction waves (there is
perhaps a case to be made for using a small amount of viscosity where
rarefaction runs into the surrounding medium -- you may observe some
small oscillations in velocity at this point which can be damped using
some viscosity). If you like, see what difference adding artificial 
viscosity makes here:

e.g.
                iav =            2    ! type of artificial viscosity
            alphamin =       1.000    ! minimum alpha (viscosity)
           alphaumin =       0.000    ! minimum alphau (conductivity)
           alphaBmin =       0.000    ! minimum alphaB (resistivity)
                beta =       2.000    ! beta in artificial viscosity
              iavlim =           0    ! use viscosity switch
             iavlimu =           0    ! use conductivity switch
             iavlimB =           0    ! use resistivity switch

which are preset in "einfeldtav.in":

 ./1DSPMHD einfeldtav.in

Added by Daniel Price, July 2010
Update for v2.1, April 2015
