This is a test of a 1D Sod shock tube in SPH. The important things
are using integral forms of the SPH equations where possible, and
applying appropriate dissipative terms to treat discontinuities

Type "make clean" and "make" to re-compile the 1DSPMHD binary.

Run the code using ./1DSPMHD sshk.in
Or with output to a file: ./1DSPMHD sshk.in >& sshk.out &

Plot the results using "splash sshk_0*.dat -y 18"

For the shock tube problem the file sshk.shk sets the left and
right states of the Riemann problem, so edit this file to change the problem.
The .shk file is also read by splash in order to plot the exact solution.

Things to try
--------------
-Run the default setup in the sshk.in file and plot the results using splash.
 (I have already set up the "multiplot" to plot this problem together with
  the exact solution, so use:

  "splash sshk_0*.dat -y 18" to plot this.

 The default setup uses "standard" artificial viscosity settings:
                 iav =           2    ! type of artificial viscosity
            alphamin =       1.000    ! minimum alpha (viscosity)
           alphaumin =       0.000    ! minimum alphau (conductivity)
                beta =       2.000    ! beta in artificial viscosity
              iavlim =           0    ! use viscosity switch
             iavlimu =           0    ! use conductivity switch
 (in other words, constant coefficients, with alpha=1, beta=2 and
  no artificial thermal conductivity)

 You will notice that the density and velocity profiles look OK, but there is
 a blip at the contact discontinuity in the thermal energy that is also
 reflected in the pressure profile.

- First of all, try running this problem solving the SPH continuity equation
  instead of the density summation:
  
  ./1DSPMHD sshkcty.in
  
  The differences are the setting of the density evolution:
                icty =           1    ! type of cty equation (0:direct sum 1:time deriv)

  and to use this we also need to change the type of kernel averaging and the way h is computed:
             ikernav =           2    ! type of kernel averaging (1:average h, 2:average grad wab 3:springel/hernquist)
               ihvar =           2    ! type of variable smoothing length prediction

 If you like, you can plot the results together with the first calculation using
 
  "splash sshk*_00020.dat -y 18"
  
 (to get them on the same page, use option 1 in the p menu of splash)

 You will now notice that both density *and* thermal energy are not well treated
 across the contact discontinuity. This is because they both use the continuity equation
 drho/dt, in which the density has been assumed to be differentiable (thus excluding
 discontinuities). With the density computed by summation, the density at least is solved
 in integral form, so as you saw in the first calculation, discontinuities in density are
 handled well if the summation is used. However, the thermal energy equation *always* relies
 on drho/dt, because it comes from the first law of thermodynamics du/dt = P/rho^2 drho/dt.
 
- Verify that the shock tube solution is essentially unchanged regardless of whether the
  thermal energy, total energy or entropy is the evolved variable. Going back to the original input

  ./1DSPMHD sshk.in

where, to evolve the thermal energy, use:
               iener =           2    ! type of energy equation
for total energy, use:
               iener =           3    ! type of energy equation
and for entropy use:
               iener =           1    ! type of energy equation

  There is no difference, because total energy is spatially conserved in all 3 cases, provided that
 the equations are formulated consistently. The only remaining differences are due to the 
 timestepping scheme and will *always* get smaller as you decrease the Courant factor C_cour.

- Next, go back to using the thermal energy equation:

                iener =           2    ! type of energy equation

 but now turn on some artificial thermal conductivity, using:
 
                 iav =           2    ! type of artificial viscosity
            alphamin =       1.000    ! minimum alpha (viscosity)
           alphaumin =       1.000    ! minimum alphau (conductivity)
                beta =       2.000    ! beta in artificial viscosity
              iavlim =           0    ! use viscosity switch
             iavlimu =           0    ! use conductivity switch

 This is given in the input file "sshkcond.in"

 Notice now that the thermal energy is now smoothed across the contact discontinuity, and the
 pressure 'blip' is gone. This issue is very important for simulations of things like the
 Kelvin-Helmholtz instability across large jumps in density (see Price 2008).

- Finally, we can try to "tune" the viscosity (and conductivity) to act only at the discontinuities.
  We will use the time-variable alpha's proposed by Morris & Monaghan (1997)
  (see Price & Monaghan 2005 for the implementation used in this code).
  In this case we specify only the *minimum* values for alpha_viscous and alpha_conductivity:

                 iav =           2    ! type of artificial viscosity
            alphamin =       0.100    ! minimum alpha (viscosity)
           alphaumin =       1.000    ! minimum alphau (conductivity)
                beta =       2.000    ! beta in artificial viscosity
              iavlim =           2    ! use viscosity switch
             iavlimu =           0    ! use conductivity switch

 and turn the switches "on". Note that we use a non-zero alpha(min) = 0.1 as recommended by M&M97
 (if you like, compare with a calculation using alpha_min = 0). These settings are set if you use:
 
 ./1DSPMHD sshkswitches.in
 
 For this case, try plotting the "alpha" values (appearing as columns 9 and 10 in splash). Notice
 how they are "tuned" to the shock position.

 The key point is that the shock should be treated just as well, but we have succeeded in reducing the
viscosity in the simulation in regions where we want the flow to be inviscid.

- For the adventurous, you may also wish to try "Godunov SPH". For this, set the viscosity to negative
                 iav =          -1    ! type of artificial viscosity
            alphamin =       0.000    ! minimum alpha (viscosity)
           alphaumin =       0.000    ! minimum alphau (conductivity)
           alphaBmin =       0.000    ! minimum alphaB (resistivity)

 ./1DSPMHD sshkgsph.in

 This is the "simplest" Godunov-SPH scheme from Cha & Whitworth (2004). Notice how there are
 still problems at the contact discontinuity, because the thermal energy is still evolved in
 non-integral form. Notice also that the shock is not treated "better" in this version of GSPH 
 than with well-tuned artificial viscosity terms (in fact I have found that the overall 
 dissipation can be significantly worse). The "2nd order" Godunov scheme discussed in that paper 
 performs better, because they attempt to formulate and integral form of the thermal energy evolution
 (and the equations of motion). However (in my opinion) the differences are more due to this integral
 formulation (which is complicated and costly) than they are to do with the use of the Riemman solver
 in place of viscosity terms.

Added by Daniel Price, July 2010
Updated for v2.1, April 2015
