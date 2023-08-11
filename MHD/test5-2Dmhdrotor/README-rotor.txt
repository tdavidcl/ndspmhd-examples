This is a test of a spinning, overpressured blob in a uniform magnetic field.
The problem shows how the magnetic field prevents expansion in the y
direction, giving an asymmetric appearance.

Type "make clean" and "make" to re-compile the 2DSPMHD binary.

Run the code using ./2DSPMHD mrotor.in
Or with output to a file: ./2DSPMHD mrotor.in >& mrotor.out &

Plot the results using "splash mrotor_0*.dat"

Things to try
--------------
- Run the problem with the default parameters:

  ./2DSPMHD mrotor.in

  Plot the results with:

  "splash mrotor_0*.dat -y 31"
  
  (I have set up plots of density, pressure, Mach number and Magnetic pressure)

- Try running the problem with no magnetic fields to see what difference MHD
  makes:

                imhd =           0    ! MHD (0:no 1-10:B/rho >10:B <0:A)
           imagforce =           0    ! MHD force type(1:vector 2:tensor)

Added by Daniel Price, July 2010
Updated and checked for v2.1, April 2015
