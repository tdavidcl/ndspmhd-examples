This is a 2D version of the Brio-Wu MHD shock tube problem.
You may compare this to the results obtained in 1D.

Type "make clean" and "make" to re-compile the 2DSPMHD binary.

Run the code using ./2DSPMHD mshk1.in
Or with output to a file: ./2DSPMHD mshk1.in >& mshk1.out &

Plot the results using "nsplash mshk1_0*.dat"

For the shock tube problem the .shk sets the left and
right states of the Riemann problem, so edit this file to change the problem.

Things to try
--------------
-Run the default setup in the mshk.in file and plot the results using nsplash.
 (I have already set up the "multiplot" to plot this problem together with
  the exact solution at t=0.1, so use:

  "nsplash mshk1_0*.dat -y 27" to plot this.
  
  The key point is the transverse motion in the particles, which is
  absent in the 1D version of this problem. Try using the Morris formulation:
  
  ./2DSPMHD mshk1morris.in
  
- See how the transverse particle motions are much smaller with the quintic:

  ./2DSPMHD mshk1quintic.in

- Finally try with the vector potential + Morris force (Price 2010):
                imhd =           -2    ! MHD (0:no 1-10:B/rho >10:B <0:A)
           imagforce =            5    ! MHD force type(1:vector 2:tensor)

  This is implemented in the "mshk1vecp.in" file:
  
  ./2DSPMHD mshk1vecp.in
  
Added by Daniel Price, July 2010
Updated for v2.1, April 2015
