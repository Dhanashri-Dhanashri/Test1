#!/usr/local/bin/perl

 while ($line = <STDIN>) {
  $line =~ tr/A-Z/a-z/;
   print ($line);
    }

