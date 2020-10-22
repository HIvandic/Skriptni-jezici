#!/usr/bin/perl
#za svakog studenta provjera je li zakljucao izlazni test unutar prvih 1h
#ispis stud koji nisu
#ime datoteke kao argument, ako ne stdin

while (<>) {
	@line = split /;/, $_;

	@start = split / /, $line[3];
	@start_date = split /-/, $start[0]; 
	@start_time = split /:/, $start[1];
	$start_time_sum =  60*$start_time[1] + 60*60*$start_time[0]; #u sekundama

	@end = split / /, $line[4];
	@end_date = split /-/, $end[0];
	@end_time = split /:/, $end[1];
	$end_time_sum = $end_time[2] + 60*$end_time[1] + 60*60*$end_time[0]; #u sekundama
 
	$dif_d = abs($end_date[0] - $start_date[0]) + abs($end_date[1] - $start_date[1]) + abs($end_date[2] - $start_date[2]); #razlika u datumu
	$dif_t  = $end_time_sum  - $start_time_sum; #razlika u satima
	if ($dif_d == 1 && ($end_date[2]-$start_date[2]) == 1 && $start_time[0]==23 && $end_time_sum + 24*60*60 < $start_time_sum + 60*60) { #slucaj kad lab pocinje iza 23 sata i ulazi u iduci datum
		$dif_d = 0;
		$dif_t = 0;
	}
	if ($dif_d != 0 || $dif_t > 60*60) { #problem ako drukcija god/dat/datum (a nije nakon 23h) ili vise od sat vemena
		print "$line[0] $line[1] $line[2] - PROBLEM: $start[0] $start[1] --> $line[4]";
	}
}
