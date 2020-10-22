#!/usr/bin/perl
#ucitava niz brojeva u listu
#ispis aritmeticke sredine

print "Unesite niz brojeva (prekid s ctrl-D):\n";
@list = <STDIN>;

foreach $one (@list) {
	$sum += $one;
	$elem += 1;
}
$rez = $sum / $elem;
print "Aritmeticka sredina je $rez\n";
