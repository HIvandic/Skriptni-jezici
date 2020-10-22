#!/bin/bash
#prebaciti slike u kazala po mjesecima
#argumenti ime izvornog kazala i kazala unutar kojeg ce se kreirati podkazala po mj


izvorno_kazalo=$1
odredisno_kazalo=$2


if [ ! -d $odredisno_kazalo ] #provjera ako ne postoji
then
	mkdir $odredisno_kazalo
fi

for slika in `ls $izvorno_kazalo`
do
	date=$(stat $izvorno_kazalo/$slika | grep 'Modify:' | grep -E -o '[0-9]{4}-[0-9]{2}') 
	mapa="$odredisno_kazalo/$date"
	if [ ! -d $mapa ] #provjera ako jos ne postoji takva mapa
	then
		mkdir $mapa
	fi
	mv "$izvorno_kazalo/$slika" "$mapa/$slika"
done
