hdr='# n_{x}  L_1   L_2   Linf'
ext="00100.dat";
out="errors.txt";
echo "$hdr" > $out;
splash -y 2 -x 1 -dev /null wave1_$ext wave2_$ext wave3_$ext wave4_$ext wave5_$ext | grep L1 | ./match.pl >> $out
