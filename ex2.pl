#!/usr/bin/perl
$var1 = <STDIN>;
$var2 = <STDIN>;

#if($var2 == 0)
#{
#	print "Divide by zero error\n";
#}
print "Divide by zero error\n" unless($var2!=0);
if($var1==0 && $var2==1)
{
	print "The result is 1\n";
}
else
{
	$res=$var1/$var2;
	print "The result of the division is $res\n";
}
