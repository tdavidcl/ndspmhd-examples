#!/usr/bin/perl
#print "# res  L1  L2  Linf" 
while (<STDIN>) {
  if ( m/L1 err = (.*) L2 err = (.*) L\(inf\) err = (.*) \(used (.*)\// ) {
     print "$4 $1 $2 $3\n"
  }
}