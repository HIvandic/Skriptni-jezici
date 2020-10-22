#!/bin/bash
#ime kazala i uzorak imena datoteka kao argument
#prolazi kroz sva podkazala i broji ukupan br redaka u dat s imenima ciji je oblik kao uzorak

kazalo=$1
ime=$2
echo Kazalo je $kazalo
echo Ime je "$ime"

brojac=0
for datoteka in `(find $kazalo -name "$ime")`
do
	brojac=$((brojac+$(wc -l $datoteka | cut -d " " -f 1)))
done
echo $brojac
