This is a 3D test of the diffusion of dust in a uniform density medium
Described in Price & Laibe (2015). For this problem the total density
and particle positions are fixed while the dust fraction is allowed to evolve.
The problem is not particularly physical (we artificially hold the particles fixed),
but is a test of the discrete solution to the dust diffusion equation.

Type "make clean" and "make" to re-compile the 3DDSPMHD binary.

Run the code using ./3DSPMHD diffuse4.in
Or with output to a file: ./3DSPMHD diffuse4.in >& diffuse4.out &

Plot the results:

nsplash -y 19 -x 1 -dev /xw

You can also run all the tests in this directory using ./3DSPMHD *.in
Type "make cleanallfiles" to remove all runtime files from the directory

Things to try
--------------
-The default solution (diffuse4.in) is computed with the "direct second derivatives"
approach:
# options affecting dust
               idust =           4    ! dust (0:off 1:one-f 2:two-f 3:diff-onef-1st 4:diff-onef-2ndderivs)
        idrag_nature =           4    ! drag type (0=none 1=const K 2=const ts 3=Epstein)
               Kdrag =         0.1    ! drag coeff (idrag=1) or ts (idrag=2) or grain size in cm (idrag=3)


- Compare this to the solution obtained with the "two first derivatives" algorithm in PL15:

 ./3DSPMHD diffuse3.in

 nsplash -y 19 -x 1 -dev /xw diffuse3_0*.dat
 
 or, to plot with the same series of filenames as previously:
 
 emacs splash.filenames

 nsplash -y 19 -x 1 -dev /xw

- Also try evolving s = sqrt(rho*eps) instead of the dust fraction, as described in the appendix of PL15:

# options affecting dust
               idust =           4    ! dust (0:off 1:one-f 2:two-f 3:diff-onef-1st 4:diff-onef-2ndderivs)
        idrag_nature =           4    ! drag type (0=none 1=const K 2=const ts 3=Epstein)
               Kdrag =       0.100    ! drag coeff (idrag=1) or ts (idrag=2) or grain size in cm (idrag=3)
    use_sqrtdustfrac =           T    ! evolve s=sqrt(rho*eps) instead of eps?

 This is already done in the file "diffuse4s.in":

 ./3DSPMHD diffuse4s.in

- Finally, try increasing the numerical resolution (e.g. to 50^3, as in the paper):
# options affecting dust
                psep =     0.02    ! particle separation


- Also try changing the stopping time:

               Kdrag =         0.2    ! drag coeff (idrag=1) or ts (idrag=2) or grain size in cm (idrag=3)

 To change the exact solution plotted by splash, edit the "splash.func" file
 and change the value of "eta":
 
 A*(10*eta*t + B)**(-0.6) - x**2/(10*eta*t + B),eta=0.2,A=e0*B**0.6,B=rc**2/e0,rc=0.25,e0=0.1

Added by Daniel Price for v2.1, April 2015
