#!/usr/bin/perl

$wordcount = 0;
$line = <STDIN>;
while($line ne "")
{
	chomp($line);
	@words = split(/ +/,$line);
	$wordcount += @words;
$line = <STDIN>;
}
print "Total number of words are $wordcount\n";
