#!/bin/bash
list='dust3 dust1 dust2 dust4';
#list='dust3'
for prefix in $list; do
   echo "starting ${prefix} writing to ${prefix}.output";
   cp "relax_00010.dat" "${prefix}_00000.dat";
   ./2DSPMHD "${prefix}_00000.dat";
done
