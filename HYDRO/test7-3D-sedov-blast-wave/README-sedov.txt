This is a test of a 3D Sedov blast wave problem.

Type "make clean" and "make" to re-compile the 3DSPMHD binary.

Run the code using ./3DSPMHD sedov.in
Or with output to a file: ./3DSPMHD sedov.in >& sedov.out &

Plot the results using "nsplash sedov_0*.dat"
(the splash.* files in the directory are already setup
 to plot the exact solution for this problem)

Things to try
--------------
- Run the code at with the default parameters:

 ./3DSPMHD sedov.in >& sedov.out &

  (being 3D, this problem takes a while to run, so best to run it in
   the background: follow the output using "tail -f sedov.out")
   
  (really we are getting to the limits of the code with this problem
   as it starts to need parallelisation, individual timesteps, etc...)

- Plot the density as a function of radius, alongside the exact solution

 nsplash -y 8 -x 1 sedov_0*.dat

- Plot a rendered plot of the column density. First change the coordinate
  system in splash back to cartesian:
  (o menu, option 7), then plot the density rendered 
  by selecting 2, 1 and 8 as the y, x and rendered data.

  nsplash -render 6 sedov_0*.dat

- Plot a slice of the density:

 (type x then choose option 1 in the splash menu to change to a slice view
  or just type "x1" from the main menu)

- make a movie of any of the above
  
  (choose /png instead of /xw at the PGPLOT prompt, this will produce a
   series of images called pgplot.png_1 pgplot.png_2 etc. Run the script
   in ~/splash/scripts/fixpgplotnames.bash to fix the silly filenames,
   then use your favourite movie-making tool to combine the sequence
   of images into a movie)
   
  (just a hint: movies look better with minimal annotation: so remove the
   axes and the colour bar by pressing backspace with the mouse over them
   in splash's interactive mode)

- Try a calculation that includes artificial conductivity

 ./3DSPMHD sedovcond.in >& sedovcond.out &

  (As for our 1D shock tubes, adding thermal conductivity improves the
  treatment of the contact discontinuity. In this case the radial profiles
  of density and thermal energy also look much less noisy.)

- Try a calculation at higher resolution (up to around 100^3 is manageable
  if you leave it for a few hours), by changing the initial particle separation:

  0.010000000                      ! particle separation

Added by Daniel Price, July 2010
