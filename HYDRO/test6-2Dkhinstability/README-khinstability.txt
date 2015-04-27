This is a test of 2D Kelvin-Helmholtz instability across a contact discontinuity
A problem which has been the subject of many wasted man-years over the last
few years.

Type "make clean" and "make" to re-compile the 2DSPMHD binary.

Run the code using ./2DSPMHD kh.in
Or with output to a file: ./2DSPMHD kh.in >& kh.out &

Plot the results using "nsplash kh_0*.dat"

Things to try
--------------
- Run the code at low resolution with the default parameters:

 ./2DSPMHD kh.in >& kh.out &

 (this takes a little while to run at the suggested resolution,
  so make sure you put the output to a file:
  Use "tail -f kh.out" to check the progress)

- Plot the density as a rendered 2D plot, e.g.:

 nsplash -render 7 -dev /xw kh_0*.dat

- Now (or at the same time if you have more than one cpu on your
  computer) perform a calculation where the artificial thermal
  conductivity is turned off:

 ./2DSPMHD khnocond.in >& khnocond.out &

  and plot the results as above. You will see the complete lack
  of any development of the Kelvin-Helmholtz instability.
  
  To see what the problem is, have a look at the pressure, either
  in a rendered plot, or by simply plotting pressure against y
  (column 12 against column 2) in splash => you will see the
  "blip" at the contact discontinuity exactly as we found in the
  1D shock tube problems. This pressure blip is exactly what
  prevents the instability from growing properly. Note that it
  would be absent if there is no thermal energy gradient (e.g. for
  KH instabilities between equal density regions, or isothermal
  flows), as it is the thermal energy discontinuity, not the
  density discontinuity that requires treatment.
  
- You may also like to verify that adding viscosity makes very
  little difference to this problem, despite viscosity being
  the first source of blame for most "Why I think SPH is wrong/terrible"
  papers. Adding viscosity merely slows the growth of the instability
  if present, but you can run this problem with NO viscosity, and still
  get no KH instability. Thus, ALWAYS remember that the viscosity term
  *can* be turned off in SPH, whereas for a grid code any dissipation is
  an intrinsic property of the scheme and depends amongst other things
  on the motion relative to the grid. In SPH, viscosity is a term that
  we explicitly add, so it is a term that can also be turned off if
  it is not needed. The problem is that we do need it for any problem
  that involves shocks (this one doesn't -- the velocities are much
  smaller than the sound speed).

For more details on this problem, see Price (2008) J. Comp. Phys. 227, 10040

Added by Daniel Price, July 2010
Checked and updated for v2.1, April 2015
