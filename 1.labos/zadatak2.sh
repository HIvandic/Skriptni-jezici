#retci u kojima se pojavljuju nazivi ovih voca neovisno o mala/velika slova
grep -i 'banana\|jabuka\|jagoda\|dinja\|lubenica' namirnice.txt

#ispis samo redaka u kojima nema zadanih rijeci u dat ne-voce.txt
grep -v -i 'banana\|jabuka\|jagoda\|dinja\|lubenica' namirnice.txt > ne-voce.txt

#u kazalu projekti i svim njegovim podkazalima pronaci dat sa sifrom u obliku 3 velika slova i sesteroznamenkasti broj, ispisati retke pojave
grep -E -r '[A-Z]{3}[0-9]{6}' ~/projekti/

#ispis imena i detaljnih pod svih dat u tekucem kazalu i njihovim podkazalima (promjena prije 7 do 14 dana)
find . -mtime -14 -mtime +7 -ls

#ispis br od 1 do 15, naredba seq ili izraz za generiranje sekevnce
for i in $(seq 15); do echo $i; done
#for i in {1..15}; do echo $i; done
#echo $(seq 15)

