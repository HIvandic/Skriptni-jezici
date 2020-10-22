#!/usr/bin/python
# niz hipoteza, svaka niz realnih br
# sortiranje uzlazno, uzima se prema kvantilu
# kvantili od 0.1 do 0.9

import sys

argumenti = sys.argv
if len(argumenti) != 2:
    print("Neispravan broj argumenata")
    exit(0)
ulaz = argumenti[1]
try:
    d = open(ulaz, 'r')
    print("Hyp#Q10#Q20#Q30#Q40#Q50#Q60#Q70#Q80#Q90")
    k = 1
    for line in d:
        line = line.strip()
        if line == "":
            continue
        odvojeno_1 = line.split(' ')
        odvojeno = list()
        for i in range(0, len(odvojeno_1)):
            odvojeno.append(float(odvojeno_1[i]))
        odvojeno.sort()
        print("%03u" % k, end="")
        ispis = ""
        for i in range(1, 10, 1):
            redni = int((i / 10) * len(odvojeno))
            ispis += "#" + str(odvojeno[redni])
        k = k + 1
        print(ispis)

except IOError as x:
    print("Nemoguce procitati datoteku (ne postoji ili nije citljiva)")
    exit(0)
