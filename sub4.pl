#!/usr/bin/perl

sub add_to_list
{
	my ($value,@list) = @_;
	print "$value\n";
	print "@list\n";
	foreach $i (0..$#list)
	{
		print "$list[$i]\n";
		$new = $value + $list[$i];
		$list[$i]=$new;
		print "$list[$i]\n";
		$i++;
	}
return @list;
}

@new_list = add_to_list(4,qw(1,2,3,4));
print "@new_list\n";
