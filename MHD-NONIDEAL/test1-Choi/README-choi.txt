This is the Choi damping test from Wurster, Ayliffe & Price (2015)
Tests the damping of an Alfven wave by ion-neutral diffusion

Type "make" to compile the 1DSPMHD binary
Type "make edit" to see the setup for this problem.

To run the problem in ideal MHD, use:

./1DSPMHD idealmhd.in

To run the problem with ambipolar diffusion, use:

./1DSPMHD ambipolar.in

The wave is in v_z and B_z, so to visualise it, plot v_z (or B_z) against x:

splash ambipolar_0*.dat -y 4 -x 1 -dev /xw

The main interesting aspect is to compare the kinetic energy as a function of time:

export ASPLASH_COLUMNSFILE=${NDSPMHD_DIR}/scripts/columns

splash -e *.ev -y 2 -x 1 -dev /xw

You can run the problem in more than one dimension by typing "make 2D" or "make
3D" and running the corresponding binary (2DSPMHD or 3DSPMHD). To keep
the lattice stable in more than 1D you should use the Wendland kernel with
an appropriate neighbour number for this kernel:

               hfact =       1.800    ! h in units of mean particle spacing
                tolh =       0.001    ! tolerance on h-rho iterations
             ikernel =          62    ! kernel type (0: cubic spline, 3:quintic)
             ikernav =           3    ! type of kernel averaging (1:average h, 2:average grad wab 3:springel/hernqu

Added by Daniel Price for v2.1, May 2015
