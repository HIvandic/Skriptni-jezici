#!/bin/bash
#za sve datoteke generirane tokom veljace ispisati pod o obavljanim akcijama -> datum, za svaku akciju koliko puta tog dana
#akcije sortitati prema silaznom br ponavljanja, ispis br pon prije same akcije

for file in `ls | grep -E '[0-9]{4}-02-[0-9]{2}'` 
do 
	name=""
	date=`echo $file | cut -d "." -f 2`

	for i in $(echo $date | tr "-" "\n")
	do
		name="$i-$name"
	done	
	name="datum: $name"
	echo "${name%?}" #bez zadnjeg znaka (visak -)
	echo "------------------------------------------------"
	cut $file -d '"' -f 2 | sort | uniq -c | sort -nr
done

