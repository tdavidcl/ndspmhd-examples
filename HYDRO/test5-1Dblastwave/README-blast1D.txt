This is a test of 1D strong blast wave in SPH, as used e.g. by Monaghan 1997
The main point is that it is a much more difficult problem than
the Sod shock tube, and non-conservative schemes usually break on it.

Type "make clean" and "make" to re-compile the 1DSPMHD binary.

Run the code using ./1DSPMHD blast.in
Or with output to a file: ./1DSPMHD blast.in >& blast.out &

Plot the results using "nsplash blast_0*.dat"

For these shock tube-type problems the file blast.shk sets the left and
right states of the Riemann problem, so edit this file to change the problem.
The .shk file is also read by splash in order to plot the exact solution.

Things to try
--------------
- Run the code with the default parameters:

 ./1DSPMHD blast.in
 
  and plot the results against the exact solution with splash:
  
 nsplash blast_0*.dat -y 17

Here we have applied viscosity using a switch (with alphamin = 0.1), and
a small amount of thermal conductivity:
                 iav =           2    ! type of artificial viscosity
            alphamin =       0.100    ! minimum alpha (viscosity)
           alphaumin =       0.100    ! minimum alphau (conductivity)
                beta =       2.000    ! beta in artificial viscosity
              iavlim =           2    ! use viscosity switch
             iavlimu =           0    ! use conductivity switch
        avdecayconst =       0.100    ! decay constant in av switch (0.1-0.2)

In this case it is easy to over-smear the contact discontinuity by adding
too much thermal conductivity.

- As previously, you can see the blip that occurs in the absence of thermal
conductivity:
                 iav =           2    ! type of artificial viscosity
            alphamin =       0.100    ! minimum alpha (viscosity)
           alphaumin =       0.000    ! minimum alphau (conductivity)
                beta =       2.000    ! beta in artificial viscosity
              iavlim =           2    ! use viscosity switch
             iavlimu =           0    ! use conductivity switch
        avdecayconst =       0.100    ! decay constant in av switch (0.1-0.2)

 (Another way to avoid this used by many authors is to smooth the profiles
  across the initial discontinuity -- this is effectively "manually" 
  smearing the contact discontinuity from the start. There are long
  arguments in the literature about whether or not one should do this --
  centreing on whether or not discontinuous initial conditions are "solutions"
  to the hydro equations or not. As you will have seen from our earlier test
  problems, using unsmoothed initial conditions does present problems for
  equations that are not in integral form -- including in this case the thermal
  energy evolution. However, adding dissipative terms "captures" these
  discontinuous solutions, so you can start problems with purely unsmoothed
  initial conditions and still get the correct result).

- The strong blast also starts to show up some differences between evolving the
total energy equation and the thermal energy equation, so try a run evolving
the total energy:
               iener =           3    ! type of energy equation

 (this shows a minor improvement around the pressure "blip" at the contact
 discontinuity)

 Note that with standard SPH with viscosity applied using a switch, the shock
jump in velocity can be resolved by as little as 3 particles.

Added by Daniel Price, July 2010
Updated for v2.1, April 2015
