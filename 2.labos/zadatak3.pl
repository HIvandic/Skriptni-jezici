#!/usr/bin/perl
#za svaki sat ispis broj pristupa posluzitelju
#argument imena dat koje se analiziraju (ako nema arg stdin)

%month2number = (Jan, 1, Feb, 2, Mar, 3, April, 4, May, 5, Jun, 6, Jul, 7, Aug, 8, Sep, 9, Oct, 10, Nov, 11, Dec, 12);

while (<>) {
	chomp;
	@line = split /\[/, $_;
	@date_time = split /:/, $line[1];
	@date = split /\//, $date_time[0];
	$time = $date_time[1];
	@datum = split /\//, $previous;

	if ($date[0] != $datum[0] || $month2number{$date[1]} != $month2number{$datum[1]} || $date[2] != $datum[2]) { #krece nova datoteka
		#kad bi naziv uzimali iz imena datoteke
		#tu ne u zbog slucaja bez ulaznih arg
		#@name = split /\./, $ARGV;
		#$date = $name[1]; #uzima datum iz naziva datoteke
		if ($first == 1) {
			printf "\n Datum: %d-%02d-%d\n", $datum[2], $month2number{$datum[1]}, $datum[0];
			print " sat : broj pristupa\n";
			print "-------------------------------\n";
			foreach $sat (0..23) {
				printf "  %02d : %d\n", $sat, $sum[$sat];
				$sum[$sat] = 0;
			}
		}
		$first = 1;
		$previous = $date_time[0];
	}
	$sum[$time] += 1;
}
printf "\n Datum: %d-%02d-%d\n", $date[2], $month2number{$date[1]}, $date[0];
print " sat : broj pristupa\n";
print "-------------------------------\n";
foreach $sat (0..23) {
	printf "  %02d : %d\n", $sat, $sum[$sat];
	$sum[$sat] = 0;
}
