#postavljanje varijable proba
proba="Ovo je proba" 

#ispis vrijednosti postavjene varijable
echo $proba

#upis liste svih datoteka tekuceg kazala
lista_datoteka=*
echo $lista_datoteka

#3 puta nadovezena vrij proba, na svaku rec dodati tocku i razmak
proba3="$proba. $proba. $proba. "

#upotreba sirenja aritmetickih izraza
a=4
b=3
c=7
d=$(((a+4)*b%c))

#ukupan br rijeci u .txt datotekama tekuceg kazala
broj_rijeci=$(cat *.txt | wc -w)

#sadrzaj maticnog kazala
ls ~

#info o kor imenu, maticnom kazalu i login ljusci svakog pojedinog korisnika procitanu iz daat /etc/passwd
cut -f 1,5,6 -d: /etc/passwd

#izrezati dio ispisa koji se odnosi na prikaz UID,PID i naredbe koja je pokrenula proces
ps -f | tr -s " " | cut -f 1,2,8 -d " "
