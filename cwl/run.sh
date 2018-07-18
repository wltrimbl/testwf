#!/bin/bash

#cwl-runner pfam.cwl --input_file sample.faa --db_stem /Pfam-A.hmm.30

#cwl-runner pfam.cwl --input_file NC_000913-fgs.faa --db_stem /Pfam-A.hmm.30

cwl-runner pfam.cwl --input_file sample.faa --h3f ~/noarchive/Pfam-A.hmm.30.h3f --h3i ~/noarchive/Pfam-A.hmm.30.h3i --h3m ~/noarchive/Pfam-A.hmm.30.h3m --h3p ~/noarchive/Pfam-A.hmm.30.h3p 
