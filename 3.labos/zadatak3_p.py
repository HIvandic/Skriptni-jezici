#!/usr/bin/python
#pod o studentima i lab vjezbama
#ispis rez po studentima
#studenti zapisani u obliku jmbag prezime ime

import os
import re
import sys

path = sys.argv
datoteke = os.listdir(path[1])
studenti_d = open(path[1] + "/studenti.txt", 'r')
studenti = dict()
labosi = list()
studenti_l = dict()

for line in studenti_d:
    pod = line.strip()
    if pod == "":
        continue
    pod = pod.split()
    studenti[pod[0]] = (pod[1], pod[2])

for one in datoteke:
    if re.match('(Lab[0-9]+_g[0-9]+.txt)', one):
        vjezba = one.split('_')[0]
        vjezba = int(vjezba[3:])
        d = open(path[1] + "/" + one, 'r')
        for line in d:
            line = line.strip()
            if line == "":
                break
            line = line.split(' ')
            if (vjezba, line[0]) in studenti_l:
                print("Student je zapisan vise puta za istu vjezbu, gasim program")
                exit(0)
            else:
                studenti_l[(vjezba, line[0])] = float(line[1])
        if vjezba not in labosi:
            labosi.append(vjezba)
labosi.sort()
print("{:<12s} {:<25s}".format("JMBAG", "Prezime, Ime"), end="")
for one in labosi:
    ispis = "L" + str(one)
    print("{:<6s}".format(ispis), end="")
for student in studenti:
    print("\n", end="")
    prez, ime = studenti.get(student)
    print("{:<12s} {:<25s}".format(student, prez + ", " + ime), end="")
    for vjezba in labosi:
        bodovi = studenti_l.get((vjezba, student))
        if bodovi is None:
            print("{:<6s}".format("0.0"), end="")
        else:
            print("{:<6.1f}".format(float(bodovi)), end="")
print()
