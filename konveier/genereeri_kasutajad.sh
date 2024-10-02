#!/bin/bash

#suur vaike taht
cut -d' ' -f2 inimesed | cut -f1 -d";" | tr '[:upper:]' '[:lower:]'  > eesnimed.txt
cut -d':' -f1 inimesed | cut -f1 -d',' | tr '[:upper:]' '[:lower:]' > perenimed.txt
cut -f2 -d"-" inimesed > domeenid.txt

#Kõik vajalikud asjad  pasteerib
paste -d"." eesnimed.txt perenimed.txt > kasutajad.txt
paste -d"." eesnimed.txt perenimed.txt | paste -d"@" - domeenid.txt > meilid.txt
