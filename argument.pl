#!/usr/bin/perl -w
if(scalar(@ARGV)>0)
{
	foreach(@ARGV)
	{
		print "Option given by you is $_\n";
		if($_ eq '-name')
		{
			system('whoami');
		}
	}
}
		
