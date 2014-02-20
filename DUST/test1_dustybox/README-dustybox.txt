This is a test of the drag between dust and gas in a two-fluid medium
Described in Laibe & Price (2011, 2012a,b) and Laibe & Price (2014b)

Type "make clean" and "make" to re-compile the 1DSPMHD binary.

Run the code using ./1DSPMHD boxK*.in
Or with output to a file: ./1DSPMHD boxK*.in >& box.out &

Plot the kinetic energy as a function of time:

asplash -e -y 2 -x 1 -dev /xw *.ev

and compare with the exact solution (red lines; specified in evsplash.func).

Type "make cleanallfiles" to remove all runtime files from the directory

Things to try
--------------
-You can run this test with both the two-fluid and one-fluid methods:
 2  1  1   0.1  0               ! dust (0:off 1:one-f, 2:two-f), drag type,drag form, Kdrag,ismooth

or:

 1  1  1   0.1  0               ! dust (0:off 1:one-f, 2:two-f), drag type,drag form, Kdrag,ismooth

 this is already done in the files "onefK*.in"
 
 ./1DSPMHD onefK*.in
 asplash -e -y 2 -x 1 -dev /xw onef*.ev
 
You should see that both the one fluid and the two fluid methods match
the exact solution to very high accuracy.
  
Added by Daniel Price, Feb 2014
