This is a test showing when the "particle pairing instability" occurs,
namely when you try to use too many neighbours with the cubic spline
(specifically h > 1.5 (m/rho)^1/ndim 
  -- this corresponds to 100 neighbours in 3D)

Type "make clean" and "make" to re-compile the 2DSPMHD binary.

Run the code using ./2DSPMHD pair.in
Or with output to a file: ./2DSPMHD pair.in >& pair.out &

Plot the results using "nsplash pair_0*.dat"

Things to try
--------------
-look at the particle distribution (x-y plot of particle positions)
 as a function of time
-look at the density as a function of x (fix the plot limits)

-now either adjust the parameter 
 hfact =       1.500    ! h in units of mean particle spacing
 to give
 hfact =       1.200    ! h in units of mean particle spacing

or simply run ./2DSPMHD nopair.in, and show that the pairing does
not occur if you use the "correct" value of h=1.2 (m/rho)^(1/ndim)

-secondly, try using a cubic lattice instead of the close-packed version
 that is the default.

 To do this, type "make edit" to edit the setup file and change the line:
 call set_uniform_cartesian(2,psep,xmin,xmax,fill=.true.)
 to
 call set_uniform_cartesian(1,psep,xmin,xmax,fill=.true.)

 then run the test again.
 
-Try using a very low neighbour number with the cubic lattice,
 e.g. 
  hfact =       1.100    ! h in units of mean particle spacing

 (There is no pairing instability in this case, but notice how the cubic lattice 
  shifts to the close packed lattice after some time -- this is because
  the cubic lattice is *not* a minimum energy state for the particles, 
  so with sufficient time, or sufficient perturbations -- e.g. via a
  large truncation error -- the lattice will "shift" to the minimum
  energy state)

--finally, here is the "right way" to increase the neighbour number
  without making h larger or causing pairing instabilities:
  Change the kernel function from the cubic to the quintic
   ikernel =           3    ! kernel type (0: cubic spline, 3:quintic)
  As previously, keep the ratio of h to particle spacing the same:
  hfact =       1.200    ! h in units of mean particle spacing

 but notice now that in the header, the number of neigbours is given by:
       Number of neighbours =    40.72
 compared to using cubic spline with the same value of h = 1.2*(m/rho)^(1/ndim):
       Number of neighbours =    18.10

 The difference is because the M6 Quintic extends to 3h instead of 2h.

 The important point is that we have increased the "smoothness" of the summations
by using more neighbours, but we have *NOT* changed the value of h. This is
the right way to achieve convergence in SPH, which requires h->0 and summations
that tend towards their integral form. Simply increasing the number of
neighbours with the cubic spline is emphatically the WRONG way.

 Thus in codes like GADGET, the number of neighbours should NOT be a free
parameter. Unfortunately for the world, it is...

Added by Daniel Price, July 2010
Updated for v2.1, April 2015
