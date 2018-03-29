#!/usr/bin/env cwl-runner --debug
cwlVersion: cwl:draft-3
class: CommandLineTool
baseCommand: pfam-annotate.sh 
hints:
  - class: DockerRequirement
    dockerPull: wltrimbl/pfam3lite

inputs:
  - id: input_file
    type: File
    inputBinding:
      position: 1
      valueFrom: $(inputs.input_file)

  - id: db_stem
    type: File
    inputBinding:   
      position: 2
      valueFrom: $(inputs.db_stem)

outputs:
  - id: outputfile
    type:  File
    outputBinding:
      glob:   $(inputs.input_file.basename).pfam.csv


