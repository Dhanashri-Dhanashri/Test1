#!/usr/bin/perl

@coin = ("Ram","Sham","Bham");
print "1. Coins= @coin\n";

#push new element into the array
push(@coin,"monk");
print "2. Coins=@coin\n";

#push new element to the start of the array
unshift(@coin,"alchemist");
print "3. Coins=@coin\n";

#popping the elements from the array
pop(@coin);
print "4. Coin=@coin\n";

#removing one element from the array
shift(@coin);
print "5. Coin=@coin\n";
