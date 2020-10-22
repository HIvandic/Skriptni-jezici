#!/usr/bin/python
# ispis ucitane web stranice
# ispis linkova na druge stranice, lista hostova, broj referenciranja za svaki host
# pronalazak svih e-mail adresa
# broj linkova na slike

import sys
import urllib.request
import re
import webbrowser

if len(sys.argv) != 2:
    print("Neipravan broj argumenata")
    exit(0)
ulaz = sys.argv[1]
webbrowser.open(ulaz)
stranica = urllib.request.urlopen(ulaz)
stranica_read = stranica.read().decode("utf8")
print(stranica_read)

linkovi = re.findall('href="[^"]+"', stranica_read)
print("\nLinkovi:")
hostovi = dict()
hostovi_l = list()
for one in linkovi:
    one = one[6:-1]  # mice href= i navodnike linka
    print(one)
    if "http://" in one or "https://" in one:
        host = one.split("/")
        host_upis = host[2]
        # ako se zeli bez www host_upis = host[2].replace("www.", "")
        previous = hostovi.get(host_upis)
        if previous is None:
            hostovi[host_upis] = 1
            hostovi_l.append(host_upis)
        else:
            hostovi[host_upis] += 1
print("\nLista hostova kojima se moze pristupiti (bez ponavljanja):")
for one in hostovi_l:
    print(one)
print("\nHostovi i broj referenciranja u stranici:")
for one in hostovi:
    print(one + " === > " + str(hostovi[one]))

e_mailovi = re.findall('[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z]{2,}', stranica_read)
print("\nE-mailovi:")
for one in e_mailovi:
    print(one)

slike = re.findall('<img .*src=".*?".*>', stranica_read)
print("\nBroj slika: " + str(len(slike)))
