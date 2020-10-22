#!/usr/bin/python
# unos 2 rijetke matrice iz datoteke (razdvojene praznim redom)
# ispis umnoska i pohrana u rijetkom obliku

import sys


def unos(matrice):
    global koja
    rj = dict()
    r = s = 0
    linija = matrice[koja]
    linija = linija.split('\n')
    first = True
    for one in linija:
        one = one.split(' ')
        if one[0] == '':
            break
        if first:
            r = int(one[0])
            s = int(one[1])
            first = False
            for k in range(0, r):
                for p in range(0, s):
                    rj[(k, p)] = 0
        else:
            test = rj.get((int(one[0]), int(one[1])))
            if int(one[1]) >= s:  # >= jer indeksiranje pocinje od 0
                print("Broj stupca veci je od zadanog (indeksi od 0), gasim")
                exit(0)
            elif int(one[0]) >= r:
                print("Broj reda veci je od zadanog (indeksi od 0), gasim")
                exit(0)
            elif test != 0:
                print("Element na toj poziciji vec je unesen, ignoriram")
                break
            rj[(int(one[0]), int(one[1]))] = float(one[2])
    koja = koja + 1
    return rj, r, s


def umnozak(matrica1, matrica2):
    global r1, s1, s2
    rj = dict()
    for i in range(0, r1):
        for j in range(0, s2):
            clan = 0.0
            for k in range(0, s1):
                a = b = 0
                if matrica1.get((i, k)):
                    a = matrica1.get((i, k))
                if matrica2.get((k, j)):
                    b = matrica2.get((k, j))
                clan = clan + a * b
            rj[(i, j)] = clan
    return rj


def upis_ispis(rj, umn):
    global r1, s2
    umn.write(str(r1) + " " + str(s2) + "\n")
    # print(str(r1) + " " + str(s2))
    for i in range(0, r1):
        for j in range(0, s2):
            clan = rj.get((i, j))
            if clan != 0:
                umn.write("%-3d %-3d %-6.3f\n" % (i, j, clan))
            print("%-7.3f" % clan, end="")
        print("\n")


argumenti = sys.argv
ulaz = argumenti[1]
izlaz = argumenti[2]
d = open(ulaz, 'r').read()
matrice = d.split("\n\n")
koja = 0
matrica1, r1, s1 = unos(matrice)
matrica2, r2, s2 = unos(matrice)

if s1 != r2:
    print("Dimenzije nisu usklađene za operaciju mnozenja")
    exit(0)

rj = umnozak(matrica1, matrica2)
umn = open(izlaz, 'w')
upis_ispis(rj, umn)
umn.close()
