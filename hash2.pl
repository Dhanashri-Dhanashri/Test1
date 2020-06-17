#!/usr/bin/perl

%machine = (user1=>'yogi',
			user2=>'booboo',
			user3=>'rupeert',
			user4=>'teddy',
			user5=>'hair',
			user6=>'greppy',
			user8=>'padders',
			user9=>'polars',
			user10=>'grizzly',
			user11=>'baloo',
			user12=>'bungle');

undef $machine{'user5'};
if(exists $machine{'user6'})
{
	$machine{'user6'}='Usra';
}
if(exists $machine{'user12'})
{
	$mach = $machine{'user12'};
	delete $machine{'user12'};
	$machine{'user13'}=$mach;
}
@unallocated = @machine{qw(user4 user6 user7)};

while(($key,$value)=each (%machine))
{
	print "$key=>$value\n";
}
@sorted =  sort values %machine;
print "@sorted\n";
