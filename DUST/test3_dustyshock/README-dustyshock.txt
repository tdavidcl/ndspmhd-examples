This is a test of a shock propagating in a dust-gas medium
Described in Laibe & Price (2012a,b) and Laibe & Price (2014b)

Type "make clean" and "make" to re-compile the 1DSPMHD binary.

Run the code using ./1DSPMHD twof-nodrag.in
Or with output to a file: ./1DSPMHD twof-nodrag.in >& twof-nodrag.out &

Plot the results:

splash twof-nodrag_0*.dat -y 18

You can also run all the tests in this directory using ./1DSPMHD *.in
Type "make cleanallfiles" to remove all runtime files from the directory

Things to try
--------------
-The first example is a shock with no drag between the fluids. Try adding
 some coupling by setting the drag coefficient K:
# options affecting dust
               idust =           2    ! dust (0:off 1:one-f 2:two-f 3:diff-onef-1st 4:diff-onef-2ndderivs)
        idrag_nature =           1    ! drag type (0=none 1=const K 2=const ts 3=Epstein)
               Kdrag =       1.000    ! drag coeff (idrag=1) or ts (idrag=2) or grain size in cm (idrag=3)

 this is already done in the file "twof-K1.in"
 
 ./1DSPMHD twof-K1.in
 splash -p K1 twof-K1_0*.dat -y 18 -dev /xw

- Next, try a shock with a very large drag:
# options affecting dust
               idust =           2    ! dust (0:off 1:one-f 2:two-f 3:diff-onef-1st 4:diff-onef-2ndderivs)
        idrag_nature =           1    ! drag type (0=none 1=const K 2=const ts 3=Epstein)
               Kdrag =    1000.000    ! drag coeff (idrag=1) or ts (idrag=2) or grain size in cm (idrag=3)

 this is already done in the file "twof-K1000.in"

 ./1DSPMHD twof-K1000.in
 splash -p highdrag twof-K1000*.dat -y 18 -dev /xw
 
 You should see that the numerical solution in this case is nowhere near the exact solution
 To get a good answer with the two-fluid method here you need around 10,000 particles
 This can be achieved by decreasing the particle separation...

# options affecting setup
                psep =   1.000E-04    ! particle separation

 ./1DSPMHD twof-K1000hires.in
 splash -p highdrag twof_K1000hires*.dat -y 18 -dev /xw

 ...but it is more interesting to compare the result with the one-fluid method:
 
-Now try using the one-fluid dust formulation, by setting idust=1
# options affecting dust
               idust =           1    ! dust (0:off 1:one-f 2:two-f 3:diff-onef-1st 4:diff-onef-2ndderivs)
        idrag_nature =           1    ! drag type (0=none 1=const K 2=const ts 3=Epstein)
               Kdrag =       1000.    ! drag coeff (idrag=1) or ts (idrag=2) or grain size in cm (idrag=3)
 
 this is already done in the file "onef-K1000.in":
 
 ./1DSPMHD onef-K1000.in
 splash -p highdrag onef-K1000*.dat -y 22 -dev /xw
 
 compare this to the exact solution (red line) and also to the two-fluid solution:
 
 splash -p highdrag onef-K1000_00020.dat twof-K1000_00020.dat -y 22 -dev /xw

-Try also the one fluid formulation with K=1 and compare this to the two-fluid result
 
 ./1DSPMHD onef-K1.in
 splash -p K1 onef-K1_00020.dat twof-K1_00020.dat -y 22 -dev /xw
 
 In this case you should see that the two methods give nearly identical results.

-Finally, try the one fluid formulation with K=0

 ./1DSPMHD onef-nodrag.in
 splash onef-nodrag_*.dat -y 22 -dev /xw
 
 This is the hardest problem for the one-fluid method, but the solution is still reasonable

- A better solution can be obtained using the "non-conservative" dissipation terms
  described in Laibe & Price (2014). To use these, set iav=4 instead of 2 in the input file:
  
                 iav =           4    ! type of artificial viscosity
            alphamin =       1.000    ! minimum alpha (viscosity)
           alphaumin =       1.000    ! minimum alphau (conductivity)
           alphaBmin =       0.000    ! minimum alphaB (resistivity)
                beta =       2.000    ! beta in artificial viscosity

 This is already done in the file "onef-nodragalt.in":

 ./1DSPMHD onef-nodragalt.in
 splash onef-nodrag_*.dat -y 22 -dev /xw
 
 - Finally, you can run the high drag case with the "dust diffusion" algorithm
   as described in Price & Laibe (2015)
 
 ./1DSPMHD diffusion-K1000.in
 
 # options affecting dust
               idust =           4    ! dust (0:off 1:one-f 2:two-f 3:diff-onef-1st 4:diff-onef-2ndderivs)
        idrag_nature =           1    ! drag type (0=none 1=const K 2=const ts 3=Epstein)
               Kdrag =       1000.    ! drag coeff (idrag=1) or ts (idrag=2) or grain size in cm (idrag=3)
    use_sqrtdustfrac =           F    ! evolve s=sqrt(rho*eps) instead of eps?

 This requires only explicit timestepping to get the solution correct
  
Added by Daniel Price, Feb 2014
Updated for v2.1, April 2015
