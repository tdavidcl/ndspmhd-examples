Here is another MHD shock test. This one has a magnetic field in the z
direction also (sometimes this is called "1.75D"), and shows all of the
propagating wave families in MHD (3 waves propagating in each direction:
fast, slow and Alfven, plus the contact discontinuity)

This is an easier problem to get right in SPH because the density
does not change strongly, so the resolution across the domain stays
fairly even.

Type "make clean" and "make" to re-compile the 1DSPMHD binary.

Run the code using ./1DSPMHD mshk3.in
Or with output to a file: ./1DSPMHD mshk3.in >& mshk3.out &

Plot the results using "nsplash mshk3_0*.dat"

Things to try
--------------
-Run the default setup in the mshk3.in file and plot the results using nsplash.
 (I have already set up the "multiplot" to plot this problem together with
  the exact solution at the end time, so use:

  "nsplash mshk3_0*.dat -y 26" to plot this.
  
 In ths case we have applied both viscosity and resistivity using switches:
                 iav =           2    ! type of artificial viscosity
            alphamin =       0.100    ! minimum alpha (viscosity)
           alphaumin =       1.000    ! minimum alphau (conductivity)
           alphaBmin =       0.000    ! minimum alphaB (resistivity)
                beta =       2.000    ! beta in artificial viscosity
              iavlim =           2    ! use viscosity switch
             iavlimu =           0    ! use conductivity switch
             iavlimB =           2    ! use resistivity switch

- Try playing around with the parameters for each of these, and have a look
  at which waves are affected by each parameter(specifically viscosity, 
  conductivity and resistivity affect discontinuities in v, u and B respectively)
  
- As with the previous problem you could also try running with 
  different force terms and evolved variables, e.g. to use the Morris force:
                imhd =          11    ! MHD (0:no 1-10:B/rho >10:B <0:A)
           imagforce =           5    ! MHD force type(1:vector 2:tensor)

  or the vector potential + Morris force
                imhd =          -2    ! MHD (0:no 1-10:B/rho >10:B <0:A)
           imagforce =           5    ! MHD force type(1:vector 2:tensor)

  or B/rho using the conservative force
                imhd =           1    ! MHD (0:no 1-10:B/rho >10:B <0:A)
           imagforce =           2    ! MHD force type(1:vector 2:tensor)

Added by Daniel Price, July 2010
Updated for v2.1, April 2015
