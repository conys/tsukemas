# -*- coding: utf-8 -*-
# makelist.py
# make data/idollist.js from idollist.txt

f = open("idollist.txt", "r")
lines = f.readlines()
f.close()

cvreg = []
cvindex = []
cvcha = []

for line in lines:
    mem = line.strip().split(",")
    if(len(mem) < 3):
        continue
    cvindex.append(mem[0])
    cvreg.append(mem[1])
    cvcha.append(mem[2])

fo = open("data/idollist.js", "w")

string = 'var cvReg = [\n'
for i in range(len(cvreg)):
    if i != 0:
        string += ',\n'
    string += '"%s"' % (cvreg[i])
string += '];\n'

fo.write(string)

string = 'var cvMap = {\n'
for i in range(len(cvindex)):
    if i != 0:
        string += ',\n'
    string += '"%s": "%s"' % (cvindex[i], cvcha[i])
string += '};\n'

fo.write(string)

fo.close()

print "convert idollist.txt to data/idollist.js"
