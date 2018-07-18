#!/usr/bin/env cwl-runner --debug
cwlVersion: cwl:v1.0
class: CommandLineTool

baseCommand: graphmap 
hints:
  - class: DockerRequirement
    dockerPull: dnadocker/graphmap

requirements:
  InitialWorkDirRequirement:
    listing: 
      - $(inputs.input_ref)

arguments: ["align"]

inputs:
  - id: input_query
    type: File
    inputBinding:
      position: 1
      valueFrom: $(inputs.input_query)
      prefix: -d 
  - id: input_ref
    type: string 
    inputBinding:
      position: 2
      valueFrom: $(inputs.input_ref.basename)
      prefix: -r 
  - id: output_sam
    type: string
    inputBinding:
      position: 3
      valueFrom: $(inputs.input_query.basename)_vs_$(inputs.input_ref.basename).sam
      prefix: -o 

outputs:
  - id: outputfile
    type:  File
    outputBinding:
      glob:   $(inputs.input_query.basename)_vs_$(inputs.input_ref.basename).sam 


