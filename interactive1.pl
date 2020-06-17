#!/usr/bin/perl -w
my $command = 'whoami';
my $result = system($command);
print "$result\n";

my $result1 = exec($command);
if($result1)
{
	print "$result1\n";
}
else
{
	print "No return code\n";
}

open(CMD,"ls -l |") or die "Shell command not found";
while(<CMD>)
{
	print "From code $_";
}
