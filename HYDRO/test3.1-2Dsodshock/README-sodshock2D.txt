This identical to the 1D sod shock tube tests, but in 2D:

 make clean (be SURE to do this if you do this after the 1D test)
 make

 ./2DSPMHD sshk.in

To see the plots against the exact solutions, use:
  splash sshk_0*.dat -y 18

Things to note/try
------------------
The main differences are that in 2D the particles have to "rearrange"
themselves behind the shock, leading to some noise in the velocity
profile due to the particle "re-meshing" motions. You will notice
that artificial conductivity also improves things.

- Try plotting the particle positions to see exactly how
  the particles remesh themselves behind the shock. I have
  setup some splash files to show this plot.
  
  splash -p parts sshk_0*.dat -y 2 -x 1


Note that I have started these calculations using a close packed
lattice -- the results are much worse with a cubic lattice:

- So try using a cubic lattice:

  Type "make edit" and change the call on lines 209 and 217 to
       call set_uniform_cartesian(1,psep...)
  instead of
       call set_uniform_cartesian(2,psep...)

  Then re-run the calculations.
  
 (The reason the cubic lattice is worse is that it is NOT a minimum
  energy state for the particles, so there is "double-remeshing" 
  going on, as the particles rearrange themselves both before and
  after the shock.)

- One final thing, it *is* possible to greatly reduce this "noise".
  To do so, we take the "correct" approach to achieving convergence
  in SPH, and use the quintic kernel that extends to a larger radius
  (as we have already noted, this is NOT the same thing as running
   the cubic spline with more neighbours):
   
  ./2DSPMHD sshkquintic.in

  (you will see now that the results are in fact very close to the
   one dimensional version)

Added by Daniel Price, July 2010
Revised Feb 2014
Updated for v2.1, April 2015
