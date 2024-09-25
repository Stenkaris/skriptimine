#!/bin/bash

# Muutuja kataloogiga
DIR=~/skriptimine/konveier

# Eesnimed
cat $DIR/inimesed | cut -d"," -f2 | cut -d";" -f1 | tr '[:upper:]' '[:lower:]' > $DIR/eesnimed.txt

# Perenimed
cat $DIR/inimesed | cut -d"," -f1 | tr '[:upper:]' '[:lower:]' > $DIR/perenimed.txt

# Domeenid
cat $DIR/inimesed | cut -d":" -f2 > $DIR/domeenid.txt

# Kasutajate tunnused
paste -d"." $DIR/eesnimed.txt $DIR/perenimed.txt > $DIR/kasutajad.txt

# Meilide koostamine
paste -d"@" $DIR/kasutajad.txt $DIR/domeenid.txt > $DIR/meilid.txt
