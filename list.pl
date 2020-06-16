#!/usr/bin/perl

@array=(0,1..4,5);
@another = @array;
#printing array elements 
print "@array\n";
print "@another\n";

@another = undef;
if(scalar(@another))
{
	print "Array exists: @another\n";
}
$highest_index = $#array;
print "The highest index of the array is $highest_index\n";
$count = @array;
print "The size of the array is $count\n";

#pop operation
pop @array;

#push operation
push(@array,20..25);

#shift operation
$first = shift @array;
print "$first\n";
#unshift operation
$first1 = unshift(@array,5..9);
print "$first1\n";

print "@array\n";
@sorted = sort(@array);
print "The sorted array is @sorted\n"; 

@reversed = reverse(@array);
print "The reversed array is @reversed\n";

@removedarray = splice @array,1,3,50..55 ;
print "The elements removed from array are @removedarray\n";

print "The final array is @array\n";







#undef @another;
#if(scalar(@another))
#{
#	print "Array exists: @another\n";
#}
#using foreach loop to print each element
#foreach $var (@array)
#{
#	print("$var\n");
#}
