#!/usr/bin/perl
$string= "Dhanashri";
$reversed= scalar reverse("$string");

print "\nThe reverse value is $reversed\n";
if($string eq $reversed)
{
	print "\nThe string is a palindrome\n";
}
else
{
	print "\nThe string is not a palindrome\n";
}
