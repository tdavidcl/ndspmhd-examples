This is a 2D test of dust settling in a vertical section of 
a protoplanetary disc, as described in Price & Laibe (2015).

Here we assume physical units and use Epstein drag with mm sized grains

Type "make clean" and "make" to re-compile the 2DSPMHD binary.

To run this problem we need to proceed in two steps:

1) Relax the gas into an equilibrium:

./2DSPMHD relax.in

2) Copy the output file and "restart", adding dust:

cp relax_00010.dat dust4_00000.dat
./2DSPMHD dust4_00000.dat

(this procedure will use the settings in dust4.in)

There is a script in the current directory that runs the problem with all four methods:

./run.sh

where the methods are:

dust1.in -- general one fluid method from Laibe & Price (2014b)
dust2.in -- two fluid method
dust3.in -- diffusion method with two first derivatives (PL15)
dust4.in -- diffusion method with direct second derivatives (PL15)

You can then reproduce Figure 7 of PL15 using:

nsplash -r 7 -dev /xw

(edit splash.filenames to change the list of files being plotted)

A more quantitative comparison of the dust density profile can be obtained by plotting:

nsplash -y 7 -x 2 -dev /xw

Added by Daniel Price for v2.1, May 2015
