#!/usr/bin/perl

if (@ARGV != 1) {
	die "Potrebno je navesti datoteku kao argument.\n";
}
while (<>) {
	#print "$_";
	if ($_ =~ m/<h1>(.*)<\/h1>/g) {
		$ime = $1;
		$br++;
		print "$br. $ime\n";
		$br2 = 0;
	}
	if ($_ =~ m/<h2>(.*)<\/h2>/g) {
		$ime = $1;
		$br2++;
		print "	$br.$br2. $ime\n";
	}
}
