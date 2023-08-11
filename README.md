# ndspmhd-examples
Example problems for the ndspmhd code. Documentation can be found at:

https://users.monash.edu.au/~dprice/ndspmhd/#examples

Getting a copy of ndspmhd
--------------------------
Download the code
```
wget https://users.monash.edu.au/~dprice/ndspmhd/releases/ndspmhd-v2.1.tar.gz
```
Uncompress the tar file:
```
tar xvfz ndspmhd-v2.0.tar.gz
```
and enter the directory
```
cd ndspmhd
```
and then set two environment variables necessary to compile the code in the example directories:
```
export SYSTEM=gfortran
export NDSPMHD_DIR=$PWD
```
now proceed to downloading the examples below


Preliminaries
--------------
Move into another directory (e.g. your home space):
```
   cd
```
After cloning the repo:
```
   git clone https://github.com/danieljprice/ndspmhd-examples
```
and entering the examples directory,
```
   cd ndspmhd-examples/
```
you will see three subdirectories for hydrodynamical, MHD (both ideal and non-ideal) and dusty-gas tests:
```
   $ ls
   DUST/	HYDRO/	MHD/  MHD-NONIDEAL/
```
For hydrodynamics (in the HYDRO directory), there are 7 tests:
```
   test1-2Drandom-settling/	test3.1-2Dsodshock/		test6-2Dkhinstability/
   test2-2Dpairing-instability/	test4-1Drarefaction/		test7-3Dsedov-blast-wave/
   test3-1Dsodshock/		test5-1Dblastwave/
```
While for MHD there are 7:
```
test1-1.5Dbriowu-shock/		test3-1.5Dtoth-strong-mhdshock/	test5-2Dmhdrotor/		test7-2Dcurrent-loop-advection/
test2-1.75Dmhd-shock/		test4-2.5Dalfvenwave/		test6-2Dorszag-tang-vortex/
```
and for dust-gas (in the DUST directory) there are 5:
```
test1_dustybox/		test2_dustywave/	test3_dustyshock/	test4_dustdiffusion/	test5_dustsettle/
```
These are all standard test problems in the computational astrophysics literature and appropriate references can be found along side these tests in my papers on SPH and SPMHD algorithms. The reference list gives the most useful of these.

Running the tests
------------------
It is preferable to go through the examples in the order given. For each test there is a README-blah.txt file in the subdirectory describing how to run the code step-by-step, so things are fairly self-explanatory.

For example, entering the first test directory
```
cd test1-2Drandom-settling/
```
you will find the following files:
```
$ ls
Makefile		random.in		rpsph.in		splash.limits
README-settling.txt	randomav.in		splash.defaults
```
...so simply follow the instructions in the README-settling.txt file...
```
$ more README-settling.txt
```
This is a test showing how a random particle distribution will relax to an
ordered arrangement because of the Hamiltonian nature of SPH.

Type:
```make clean``` and ```make``` to re-compile the 2DSPMHD binary.

Run the code using ```./2DSPMHD random.in```
Or with output to a file: ```./2DSPMHD random.in >& random.out &```

Plot the results using ```splash random_0*.dat```

Note that you will need to have [SPLASH](https://github.com/danieljprice/splash) installed to view the code output.
