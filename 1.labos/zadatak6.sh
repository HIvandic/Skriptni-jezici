#!/bin/bash
#radi sigurnosnu kopiju liste datoteka koja se predaje u obliku argumenata
#zadnji arg ime kazala u koje je potrebno pohraniti dat (ako ne postoji treba kreirati)
#za svaku dat provjera postoji li i je li citljiva
#ispis poruke o stvaranju kazala, izvjestaj broja uspjesno kopiranih datoteka

input=$# #broj argumeneta
input="$(($input-1))" #bez zadnjeg jer je to odredisno kazalo

odredisno_kazalo=${!#}
if [ ! -d $odredisno_kazalo ] #provjera ako ne postoji
then	
	mkdir "$odredisno_kazalo"
	echo Kreirano je kazalo $odredisno_kazalo.
fi

brojac=0

for i in $(seq $input)
do
	file=${!i}

	if [[ -f "$file" && -r "$file" ]] #provjera postoji li i moze li se citati
	then
		cp "$file" "$odredisno_kazalo"
		brojac=$(($brojac + 1))
	else
		echo Pogreska kod kopiranje datoteke $file.
	fi
done
echo $brojac datoteka kopirano je u kazalo $odredisno_kazalo.
