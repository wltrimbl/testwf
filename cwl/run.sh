#!/bin/bash
cwl-runner pfam.cwl --input_file sample.faa --db_stem /Pfam-A.hmm.30
cwl-runner pfam.cwl --input_file NC_000913-fgs.faa --db_stem /Pfam-A.hmm.30
