#!/usr/bin/perl
$number = <STDIN>,$result = --$number+5;
print "$number,$result\n";
print "$.\n";
$compare = $number cmp $result;
$compare2 = $result cmp $number;
$compare3 = $result cmp $result;
print "$compare2,$compare3,$compare\n";

#string operations
$string1 = "Dhanashri";
$string2 = "\tis cool";
$concat = $string1.$string2;
$repeat = $string1 x 2;
$string1 .= $string2;
print "The concatenation of the strings is : $concat\n";
print "The repeatition of the string1 is : $repeat\n";
print "The concatenation and assign operation of the string is : $string1\n";
