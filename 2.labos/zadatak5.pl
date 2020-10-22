#!/usr/bin/perl
#datoteka kao argument
#generira rang listu studenata

if (@ARGV != 1) {
	die "Potrebno je navesti datoteku kao argument.\n";
}
print "Lista po rangu:\n";
print "-------------------\n";


while (<>) {
	chomp;
	if (! /^#/) {
		@line = split /;/, $_;
		if ($first == 0) { #odredivanje faktora iz prvog procitanog reda
			$first = 1;
			@faktori = @line;
		} else {
			$key = $line[1] . ', ' . $line[2] . ' (' . $line[0] . ')';
			$value = 0;
			$i = 0;
			foreach $faktor (@faktori) {
				if ($line[$i+3] != "-") {
					$value += $faktor * $line[$i+3];
				}
				$i++;
			}
			$studenti{$key} = $value;
		}
	}
}
$nmbr = 1;
foreach $student (reverse sort {$studenti{$a} <=> $studenti{$b}} keys %studenti) {
	printf "  %d. %s : %.2f\n", $nmbr++, $student, $studenti{$student};
}
