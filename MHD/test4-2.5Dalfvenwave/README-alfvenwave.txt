This is a test of the propagation of a non-linear circularly polarised
Alfven wave in 2.5D. The circularly polarised Alfven wave is an exact
non-linear solution of the MHD equations, because it does not steepen
into a shock. Thus the wave can be run with an arbitrarily large
amplitude and/or many crossing times, unlike linear waves.

For SPMHD, this problem nicely illustrates how the "tensile instability"
(due to a negative stress when magnetic pressure exceeds gas pressure)
manifests as a spurious force along the magnetic field lines.

Type "make clean" and "make" to re-compile the 2DSPMHD binary.

Run the code using ./2DSPMHD munstable.in
Or with output to a file: ./2DSPMHD munstable.in >& munstable.out &

Plot the results using "splash munstable_0*.dat"

Things to try
--------------
- Run with the "unstable" force in the munstable.in file:

  ./2DSPMHD munstable.in

  Plot the results with:

  "splash munstable_0*.dat -y 27"
  
  (you will observe that with the conservative-but-unstable force,
   the particles rapidly attract each other in "lines" perpendicular
   to the magnetic field, which then disrupt and pretty much
   destroy the calculation)

- Now run with a stable force formulation:

  ./2DSPMHD mstable.in

  (and the wave proceeds happily...)

- The instability is caused by the B(div B) term in the momentum-
  conserving expression for the Lorentz force in MHD:
  
  grad(1/2 B^2 - BB) = (curl B) x B + B(div B)

  The last term is directed along the magnetic field, as opposed
  to the physical J x B force that is always perpendicular to B.
  Whilst this is term is zero in the continuum limit, in discrete
  calculations with truncation error this is never true.
  The issue is that the B(div B) term is required for momentum conservation,
  so if you remove this term, then the equations no longer conserve momentum.

  For example, one way to stabilise the force is simply to subtract this term.
  This is implemented as MHD force 6:
                imhd =           1    ! MHD (0:no 1-10:B/rho >10:B <0:A)
           imagforce =           6    ! MHD force type(1:vector 2:tensor)
  
  which is identical to the conservative force (2 or 3), but explicitly
  subtracts the B(div B) term (have a look in ratesND_mhd.f90 to see
  where these are implemented).
  
  Another way is to use a force such as that proposed by Morris
  which vanishes when the anisotropic part of the stress tensor is
  constant. This is implemented as force number 5:
                imhd =           1    ! MHD (0:no 1-10:B/rho >10:B <0:A)
           imagforce =           5    ! MHD force type(1:vector 2:tensor)

  (note that all of the above approaches do not exactly conserve
   momentum any more)

  Another approach that we have used for the previous problems is to 
  subtract the maximum (constant) value from the stress:
                imhd =           1    ! MHD (0:no 1-10:B/rho >10:B <0:A)
           imagforce =           2    ! MHD force type(1:vector 2:tensor)
 
  where the correction is indicated by the diagnostic output:
 
 ...
 stress correction =   0.86602540378358805     
 stress correction =   0.86602540378358805     
 ...

  This correction conserves momentum but not energy.

Added by Daniel Price, July 2010
Updated and checked for v2.1, April 2015
