#!/usr/bin/perl

$count=0;
while($count<=10)
{
	if($count==5)
	{
		$count++;
		next;
	}
	print "The count is $count\n";
	$count++;
}
