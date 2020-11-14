#!/usr/bin/env python3


print("""Content-Type: text/plain
""")



import cgi, sys, subprocess
form = dict(cgi.FieldStorage())

for i in form:
    form[i] = form[i].value

if "callback" in form and "peers" in form and ',' not in form['callback']:
        with open('peers.txt','r') as f:
            peers = [i.split('\t')[0] for i in f.readlines()]
        if form['callback'] not in peers:
            subprocess.run(['./forward.sh',form['callback'],form['peers']])
        pob = form['callback']+"\t"+form['peers']
        print(pob)
        with open('peers.txt','a') as f:
            f.write(pob+'\n')


        sys.exit()

print('fill out callback and peers')

