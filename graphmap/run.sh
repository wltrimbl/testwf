#!/bin/bash

REF=Phi-mut.fasta
QUERY=Phix_R1_sample.fasta
cwl-runner graphmap.cwl --input_ref $REF --input_query ${QUERY}  --output_sam ${QUERY}_vs_${REF}.sam

