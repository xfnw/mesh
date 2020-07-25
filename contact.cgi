#!/usr/bin/env python3


print("""Content-Type: text/plain
""")



import cgi, sys, subprocess
form = dict(cgi.FieldStorage())

for i in form:
    form[i] = form[i].value

if "address" in form and "reply" in form and "peers" in form and ',' not in form['address']:
        with open('peers.txt','r') as f:
            peers = [i.split('\t')[0] for i in f.readlines()]
        if form['address'] not in peers:
            subprocess.run(['./forward.sh',form['address'],form['reply'],form['peers']])
        pob = form['address']+"\t"+form['reply']+"\t"+form['peers']
        print(pob)
        with open('peers.txt','a') as f:
            f.write(pob+'\n')


        sys.exit()

print('fill out the address and reply fields')

