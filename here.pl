#!/usr/bin/perl
print <<EOF;
This is 
a
string
EOF

$string = <STDIN>;
chop($string);
print $string;

$str = "This is a string\n";
$result = chomp($str);
print "$result\n";

$var = 1;
$var1;
$def1 = defined($var);
$def2 = defined($var1);
print "Var is defined :$def1\n";
print "Var1 is defined :$def2\n";
