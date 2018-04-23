#!/usr/bin/env cwl-runner --debug
cwlVersion: cwl:v1.0
class: CommandLineTool
baseCommand: pfam-annotate.sh 
hints:
  - class: DockerRequirement
    dockerPull: wltrimbl/pfamlite

requirements:
    InitialWorkDirRequirement:
        listing:
            - $(inputs.h3m)
            - $(inputs.h3i)
            - $(inputs.h3f)
            - $(inputs.h3p)


inputs:
  - id: input_file
    type: File
    inputBinding:
      position: 1
      valueFrom: $(inputs.input_file)
      
  - id: h3f
    type: File
    inputBinding:   
      position: 2
      valueFrom: $(self.dirname)/$(self.nameroot)
  - id: h3i
    type: File
  - id: h3m
    type: File
  - id: h3p
    type: File
    

outputs:
  - id: outputfile
    type:  File
    outputBinding:
      glob:   $(inputs.input_file.basename).pfam.csv


