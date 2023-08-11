This is the Orszag-Tang Vortex test. The setup is a uniform density box,
with a single, periodic vortex in the velocity field of the form:

vx = -v0 sin(2 pi y)
vy =  v0 sin(2 pi x)

The magnetic field has a "double vortex" in the x direction:
Bx = -B0 sin(2 pi y)
By =  B0 sin(4 pi x)

The velocities are set up to be initially supersonic, so the interaction
between the shock waves from the velocity field and the vortex structure
in the magnetic field gets very complicated (and eventually turbulent).

Type "make clean" and "make" to re-compile the 2DSPMHD binary.

Run the code using ./2DSPMHD morstang.in
Or with output to a file: ./2DSPMHD morstang.in >& morstang.out &

Plot the results using "splash morstang_0*.dat"

Things to try
--------------
- Run the problem with the default parameters:

  ./2DSPMHD morstang.in

  Plot the results with:

  "splash morstang_0*.dat -render 7"

  or to see the magnetic field:

  "splash morstang_0*.dat -r 7 -vec 13"
 
 (this setup is at a resolution of 128^3, uses B as the evolved
  magnetic variable, and applies viscosity thermal conductivity
  and resistivity in appropriate amounts)
  
- Better results can be obtained on this test problem using the
  vector potential as the main variable, so rerun the problem
  using this at the same resolution.

  ./2DSPMHD mvecp128.in

  (type "diff mvecp128.in morstang.in" to see the difference in input options)

- Also, things look much nicer at higher resolution, especially later on (t>0.5)

  ./2DSPMHD mvecp256.in

  (compare this with the lower resolution calculations)

Added by Daniel Price, July 2010
Updated and checked for v2.1, April 2015
