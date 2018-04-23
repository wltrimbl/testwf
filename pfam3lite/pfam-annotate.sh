#!/bin/bash
# takes amino acid fasta and searches against pfams

# pfam-annotate.sh   <input.faa>  <databasestem>
# pfam-annotate.sh   input.faa   /Pfam-A.hmm.30  

# Requires:  four HMM profile files, extensions A
# curl -H "Authorization: mgrast $MGRKEY"  'http://shock.mg-rast.org/node/6fa12ee7-8cb6-421e-b6ed-02188cf7117b?download' > Pfam-A.hmm.30.h3f
# curl -H "Authorization: mgrast $MGRKEY"  'http://shock.mg-rast.org/node/6e41f4bd-48f3-481f-8e4d-ee5f0ed8ba52?download' > Pfam-A.hmm.30.h3i
# curl -H "Authorization: mgrast $MGRKEY"  'http://shock.mg-rast.org/node/9d65a4f2-0eaa-4f72-b8c7-77eadf297e5a?download' > Pfam-A.hmm.30.h3m
# curl -H "Authorization: mgrast $MGRKEY"  'http://shock.mg-rast.org/node/282fecf7-66ba-4917-a9b0-efded02e86ae?download' > Pfam-A.hmm.30.h3p

CPU=4
file=$1
db=$2
filestem=$(basename $file)

if [ "$db_" == "_" ] ; then
  echo "Missing second arguemnt, the database prefix"
  exit 1 
fi

if [ ! -e $db.h3f ] ; then
  echo "Can't find database file $db.h3f!"
  exit 1 
fi


if [ ! -e $file ] ; then
  echo "Input faa file $file is missing"
  exit 1
fi  

  
echo "Searching $file for Pfam-A"
time hmmscan --cpu $CPU --tblout $filestem.pfam.out $db $file > /dev/null

if [ ! -e $filestem.pfam.out ] ; then
  echo "File missing: $filestem.pfam.out"
  exit 1 
fi
  
# the last field has variable numbers of spaces in it, so we have to count the field separators..
cat $filestem.pfam.out      | grep -v '#'   | perl -ple 's/\s* - \s*/\t/; for($i=0; $i<16; $i++){ s/ \s*/\t/;}   ' > $filestem.pfam.out2

if [ ! -e $filestem.pfam.out ] ; then
  echo "File missing: $filestem.pfam.out2"
  exit 1 
fi
# rank by column 8 (best 1 domain evalue), then take one for each new value of column 3 (query name)
cat $filestem.pfam.out2  | sort -k8,8 -r | sort    -u  -k3,3 > $filestem.pfam.csv

if [ ! -e $filestem.pfam.out ] ; then
  echo "File missing: $filestem.pfam.csv"
  exit 1 
fi
  


