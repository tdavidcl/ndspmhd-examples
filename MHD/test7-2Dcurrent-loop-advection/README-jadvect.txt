This problem simply involves the advection of a loop of current across
the computational domain (with periodic boundaries). Because advection
is done perfectly in SPH, the problem can be solved exactly (that is,
with no change in the loop). This problem is extremely difficult for
grid-based codes.

Type "make clean" and "make" to re-compile the 2DSPMHD binary.

Run the code using ./2DSPMHD jadvect.in
Or with output to a file: ./2DSPMHD jadvect.in >& jadvect.out &

Plot the results using "nsplash jadvect_0*.dat"

Things to try
--------------
- Run the problem:

  jadvect.in

  When you get bored, plot the results with:

  "nsplash jadvect_0*.dat -render 22"

  Verify that it can be run for as long as your patience allows with
  the loop always returning to it's starting position unchanged.

Added by Daniel Price, July 2010
Updated and checked for v2.1, April 2015
