#!/usr/bin/perl
#broji riječi sa zajedničkim prefiskom
#zanemaruje velika/mala slova
#lista pref po abecedi, iz asvakog pref broj ponavljanja
#imena datoteka kao argument, ako ne stdin
#duljina prefiksa kao zadnji argument

use open ':locale';
use locale;

if (@ARGV < 1) {
	die "Potrebno je navesti duljinu prefiksa.\n";
}
$pref = pop(@ARGV);
while (<>) {
	tr/A-Z/a-z/;
	chomp;
	@list = ($_ =~ m/\w{$pref}/g);
	foreach $one (@list){
		$prefiks{$one}++;
	} 
}	
foreach $one (sort keys %prefiks) {
	print "$one : $prefiks{$one}\n";
}
