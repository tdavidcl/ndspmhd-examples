Here is another MHD shock test, this one with a very strong shock.

Type "make clean" and "make" to re-compile the 1DSPMHD binary.

Run the code using ./1DSPMHD mshk7.in
Or with output to a file: ./1DSPMHD mshk7.in >& mshk7.out &

Plot the results using "nsplash mshk7_0*.dat"

Things to try
--------------
-Run the default setup in the mshk7.in file and plot the results using nsplash.
 (I have already set up the "multiplot" to plot this problem together with
  the exact solution at the end time, so use:

  "nsplash mshk7_0*.dat -y 26" to plot this.
  
- As previously try playing around with the viscosity,
  thermal conductivity and resistivity parameters.
  
- For this problem I have used B/rho as the evolved variable:
                imhd =           1    ! MHD (0:no 1-10:B/rho >10:B <0:A)
           imagforce =           2    ! MHD force type(1:vector 2:tensor)

  but you could try with the vector potential:
                imhd =           -2    ! MHD (0:no 1-10:B/rho >10:B <0:A)
           imagforce =           2    ! MHD force type(1:vector 2:tensor)

  or using B:
                imhd =          11    ! MHD (0:no 1-10:B/rho >10:B <0:A)
           imagforce =           2    ! MHD force type(1:vector 2:tensor)

  (in the latter case there is an error in the By jump at the shock:
   this is because the "dB/dt" uses the non-integral form of the
   density, i.e. drho/dt. The B/rho evolution uses the "integral"
   form of rho, i.e., the density sum, to get the result, so
   gives more accurate results when there is a large jump in
   density coincident with the jump in the magnetic field).

Added by Daniel Price, July 2010
Updated and checked for v2.1, April 2015
