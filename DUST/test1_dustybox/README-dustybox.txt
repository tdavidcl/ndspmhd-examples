This is a test of the drag between dust and gas in a two-fluid medium
Described in Laibe & Price (2011, 2012a,b) and Laibe & Price (2014b)

Type "make clean" and "make" to re-compile the 1DSPMHD binary.

Run the code using ./1DSPMHD boxK*.in
Or with output to a file: ./1DSPMHD boxK*.in >& box.out &

Plot the kinetic energy as a function of time:

splash -e -y 2 -x 1 -dev /xw *.ev

and compare with the exact solution (red lines; specified in evsplash.func).

Type "make cleanallfiles" to remove all runtime files from the directory

Things to try
--------------
-You can run this test with both the two-fluid and one-fluid methods:
# options affecting dust
               idust =           2    ! dust (0:off 1:one-f 2:two-f 3:diff-onef-1st 4:diff-onef-2ndderivs)
        idrag_nature =           1    ! drag type (0=none 1=const K 2=const ts 3=Epstein)
               Kdrag =       0.100    ! drag coeff (idrag=1) or ts (idrag=2) or grain size in cm (idrag=3)

or:

# options affecting dust
               idust =           1    ! dust (0:off 1:one-f 2:two-f 3:diff-onef-1st 4:diff-onef-2ndderivs)
        idrag_nature =           1    ! drag type (0=none 1=const K 2=const ts 3=Epstein)
               Kdrag =       0.100    ! drag coeff (idrag=1) or ts (idrag=2) or grain size in cm (idrag=3)

 this is already done in the files "onefK*.in"
 
 ./1DSPMHD onefK*.in
 splash -e -y 2 -x 1 -dev /xw onef*.ev
 
You should see that both the one fluid and the two fluid methods match
the exact solution to very high accuracy.

You can also look at the velocities on all the particles as a function of time:
 splash onefK0.1_0*.dat -y 2 -x 1 -dev /xw
 
Notice that for the one fluid method the "gas" and "dust" are both just fake copies
of the mixture particles, with gas and dust properties. That is, only one set of
particles is actually used for the calculation
  
Added by Daniel Price, Feb 2014
Updated for v2.1, April 2015
