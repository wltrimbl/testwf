FROM ubuntu:16.04

# Dockerfile for PFAM-A v 30 via HMMEr3.1 

RUN apt-get update && apt-get install -y make  curl 
RUN apt-get install -y gcc
RUN apt-get install -y libperl4-corelibs-perl

# Install HHMER3 
RUN curl -L -O  http://eddylab.org/software/hmmer3/3.1b2/hmmer-3.1b2-linux-intel-x86_64.tar.gz  &&  tar xvf hmmer-3.1b2-linux-intel-x86_64.tar.gz && cd hmmer-3.1b2-linux-intel-x86_64  && ./configure &&  make && make check && make install

# Download and prepare PFAM-A database  # 250 Mb download expands to 3 Gb on disk
# RUN curl -L -O ftp://ftp.ebi.ac.uk/pub/databases/Pfam/releases/Pfam30.0/Pfam-A.hmm.gz && gunzip  Pfam-A.hmm.gz && mv Pfam-A.hmm Pfam-A.30.hmm  
# RUN hmmpress /Pfam-A.30.hmm

#"Pfam-A.hmm.30.h3f", "6fa12ee7-8cb6-421e-b6ed-02188cf7117b"
#"Pfam-A.hmm.30.h3i", "6e41f4bd-48f3-481f-8e4d-ee5f0ed8ba52"
#"Pfam-A.hmm.30.h3m", "9d65a4f2-0eaa-4f72-b8c7-77eadf297e5a"
#"Pfam-A.hmm.30.h3p", "282fecf7-66ba-4917-a9b0-efded02e86ae,

# curl -H "Authorization: mgrast $MGRKEY"  'http://shock.mg-rast.org/node/6fa12ee7-8cb6-421e-b6ed-02188cf7117b?download' > Pfam-A.hmm.30.h3f
# curl -H "Authorization: mgrast $MGRKEY"  'http://shock.mg-rast.org/node/6e41f4bd-48f3-481f-8e4d-ee5f0ed8ba52?download' > Pfam-A.hmm.30.h3i
# curl -H "Authorization: mgrast $MGRKEY"  'http://shock.mg-rast.org/node/9d65a4f2-0eaa-4f72-b8c7-77eadf297e5a?download' > Pfam-A.hmm.30.h3m
# curl -H "Authorization: mgrast $MGRKEY"  'http://shock.mg-rast.org/node/282fecf7-66ba-4917-a9b0-efded02e86ae?download' > Pfam-A.hmm.30.h3p

COPY pfam-annotate.sh  /usr/local/bin
CMD  pfam-annotate.sh  
