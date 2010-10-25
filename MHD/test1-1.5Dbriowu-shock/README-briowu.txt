This is a test of the 1.5D Brio-Wu MHD shock tube problem in SPH, which
is a widely used test problem for MHD codes. For MHD there is no
such thing as a truly one dimensional problem, since the divergence
constraint implies Bx = constant in 1D. So instead we allow the
magnetic and velocity fields to be 2 or 3 dimensional whilst
allowing the particles to move only in the x direction (that is,
we compute vy but do not use it to move the particles).

The important things for SPH are stabilising the MHD force term and applying
appropriate dissipative terms to treat discontinuities.

Type "make clean" and "make" to re-compile the 1DSPMHD binary.

Run the code using ./1DSPMHD mshk1.in
Or with output to a file: ./1DSPMHD mshk1.in >& mshk1.out &

Plot the results using "nsplash mshk1_0*.dat"

For the shock tube problem the .shk sets the left and
right states of the Riemann problem, so edit this file to change the problem.

Things to try
--------------
-Run the default setup in the mshk.in file and plot the results using nsplash.
 (I have already set up the "multiplot" to plot this problem together with
  the exact solution at t=0.1, so use:

  "nsplash mshk1_0*.dat -y 27" to plot this.
  
 (This problem is unusual because the solution contains a "compound wave"
  consisting of a slow shock attached to a rarefaction wave, seen in both
  the exact solution plot and the SPMHD results. It has been
  shown by other authors that this unusual wave is partly an artifact of
  restricting the dimensionality of the problem to 1.5D -- in 2 and 3D 
  such waves are generally unstable).
  
 The default setup applies artificial viscosity using a switch, and fixed
 parameters for artificial thermal conductivity (1.0) and resistivity (0.5):
 2 0.100  1.000  0.500  2.000       ! viscosity type, alpha(min), alphau(min), alphab(min), beta
       2      0      0  0.100       ! use av, au, ab limiter, constant for this(0.1-0.2)

 (Resistivity treats the "shearing" discontinuities that occur because
  of jumps in the transverse B field. An alternative (that does give nicer
  looking vy profiles) is to explicitly add a shear viscosity to treat
  the vy discontinuities. However this would be a horrible thing 
  to do in more than 1D as shear viscosity is the main thing we want to avoid!
  Applying resistivity at jumps in the B field (current sheets) is
  a much nicer thing to do, but it is not always perfect at getting the vy
  profile right.)
  
 (The fast rarefaction wave -- the rightmost discontinuity --
  is the hardest to get right in SPH -- it is highly sensitive to the amount
  of resistivity you apply and propagates in the lowest density part of
  the domain, which in SPH corresponds to a very low resolution region).
 
 By default we have run this problem with the conservative MHD force ("2" below)
 and by using the magnetic field B as the evolved variable ("11" below):
11    2                             ! magnetic field (0:off 1:on) and force algorithm(1:vector 2:tensor)

 The conservative MHD force is unstable for this problem (since 
 magnetic pressure exceeds gas pressure), but the
 negative stress is easily fixed by subtracting off the constant 
 Bx field from the stress, indicated by the warnings:

 stress correction =   0.75000000000000000     
 stress correction =   0.75000000000000000     
 (...)

- Try running the problem evolving B/rho as the evolved variable instead of B:
  1    2                             ! magnetic field (0:off 1:on) and force algorithm(1:vector 2:tensor)

 (basically there should be very little difference here)

- Also try running with the Morris force instead of the stress subtraction
  (see Price & Monaghan 2005 for details of this):
  11    5                             ! magnetic field (0:off 1:on) and force algorithm(1:vector 2:tensor)

  This is implemented in the "mshk1morris.in" file:
  
  ./1DSPMHD mshk1morris.in
  
- Try some experiments changing the viscosity, thermal conductivity
  and resistivity parameters:
 2 0.100  1.000  0.500  2.000       ! viscosity type, alpha(min), alphau(min), alphab(min), beta
       2      0      0  0.100       ! use av, au, ab limiter, constant for this(0.1-0.2)

  for example, using time-dependent parameters for all 3:
 2 0.100  0.000  0.000  2.000       ! viscosity type, alpha(min), alphau(min), alphab(min), beta
       2      2      2  0.100       ! use av, au, ab limiter, constant for this(0.1-0.2)

  or fixed parameters for all 3:
 2 1.000  1.000  1.000  2.000       ! viscosity type, alpha(min), alphau(min), alphab(min), beta
       0      0      0  0.100       ! use av, au, ab limiter, constant for this(0.1-0.2)

- Finally you might like to see how using the vector potential does on this problem:
  (see e.g. Rosswog & Price 2007, Price 2010):
  -2    2                             ! magnetic field (0:off 1:on) and force algorithm(1:vector 2:tensor)

  This is implemented in the "mshk1vecp.in" file:
  
  ./1DSPMHD mshk1vecp.in
  
  (the results are a slight improvement. Note that the Euler Potentials
   and Vector potential formulations are equivalent in <= 2D, and there
   is no particular reason to use them in 1D since div B = 0 is already
   constrained in 1D by simply Bx = const. However it shows that you
   can obtain similar results with a potential-based formulation on 
   these kind of test problems).

Added by Daniel Price, July 2010
