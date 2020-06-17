#!/usr/bin/perl
use File::Basename;
my @extns = qw(.doc .txt .pl);
my $filepath="/home/user/dir1/dir2/file.txt";
my ($base,$path,$ext) = fileparse($filepath,@extns);

print("Path:$path\nBase:$base\nExtension:$ext");
#($base,$path,$ext)= fileparse($filepath,'\..*');
#print("Path:$path\nBase:$base\nExtensions:$ext");

print "\nFile name:",basename($filepath);
print "\nDirectory name:\n",dirname($filepath);
