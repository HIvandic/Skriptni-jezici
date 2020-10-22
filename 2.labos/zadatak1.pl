#!/usr/bin/perl
#unos niza znakova i broja ponavljanja
#ispis niza znakova n puta

print "Unesite niz znakova:\n";
chomp($niz = <STDIN>);

while ($n == /\d/) { #petlja kako bi se unio broj
	print "Unesite broj ponavljanja:\n";
	chomp($n = <STDIN>);
}
while ($n) {
	print "$niz\n";
	$n -= 1;
}
