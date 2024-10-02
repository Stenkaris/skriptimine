#!/bin/bash
# Sten Karis
# Skript kasutajate tunnuste ja e-mailide loomiseks failist "inimesed"
# Kontrolli, kas fail "inimesed" on olemas ja saada failinimi parameetrina
if [ "$#" -ne 1 ]; then
    echo "Kasutus: $0 <failinimi>"
    exit 1
fi

inimesed_fail="$1"

if [ ! -f "$inimesed_fail" ]; then
    echo "Viga: Faili '$inimesed_fail' ei leitud!"
    exit 1
fi

# Loo vajalik kataloog
mkdir -p konveier
# 6. Eesnimed (peale koma), salvestamine faili eesnimed
cut -d',' -f2 "$inimesed_fail" | tr -d ' ' > konveier/eesnimed.txt
# 7. Perenimed (peale :), salvestamine faili perenimed
cut -d',' -f1 "$inimesed_fail" | tr -d ' ' > konveier/perenimed.txt
# 8. Domeenid (peale "-"), salvestamine faili domeenid
cut -d'-' -f2 "$inimesed_fail" > konveier/domeenid.txt
# 9. Muuda eesnimed väikesteks
tr '[:upper:]' '[:lower:]' < konveier/eesnimed.txt > konveier/eesnimed_lc.txt
# 10. Muuda perenimed väikesteks
tr '[:upper:]' '[:lower:]' < konveier/perenimed.txt > konveier/perenimed_lc.txt
# 11. Loo kasutajate fail kujul eesnimi.perenimi
paste -d'.' konveier/eesnimed_lc.txt konveier/perenimed_lc.txt > konveier/kasutajad.txt
# 12. Loo e-mailide fail kujul eesnimi.perenimi@domeen
paste -d'.' konveier/eesnimed_lc.txt konveier/perenimed_lc.txt | paste -d'@' - konveier/domeenid.txt > konveier/meilid.txt

echo "Töö tehtud! Failid 'kasutajad.txt' ja 'meilid.txt' on loodud kaustas 'konveier'."

