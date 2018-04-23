#!/usr/bin/env cwl-runner --debug
cwlVersion: cwl:v1.0
class: CommandLineTool
baseCommand: pfam-annotate.sh 
hints:
  - class: DockerRequirement
    dockerPull: wltrimbl/pfamlite

inputs:
  - id: input_file
    type: File
    inputBinding:
      position: 1
      valueFrom: $(inputs.input_file)
      
  - id: h3f
    type: File
    default:
      class: File
      location: "http://shock.mg-rast.org/node/6fa12ee7-8cb6-421e-b6ed-02188cf7117b?download"
      basename: Pfam-A.hmm.30.h3f
    inputBinding:   
      position: 2
      valueFrom: $(inputs.h3f.basename)
      
      
  - id: h3i
    type: File
    default: 
      class: File
      location: "http://shock.mg-rast.org/node/6e41f4bd-48f3-481f-8e4d-ee5f0ed8ba52?download"
      basename: Pfam-A.hmm.30.h3i
      
  - id: h3m
    type: File
    default: 
      class: File
      location: "http://shock.mg-rast.org/node/9d65a4f2-0eaa-4f72-b8c7-77eadf297e5a?download"
      basename: Pfam-A.hmm.30.h3m
  
  - id: h3p
    type: File
    default: 
      class: File
      location: "http://shock.mg-rast.org/node/282fecf7-66ba-4917-a9b0-efded02e86ae?download"
      basename: Pfam-A.hmm.30.h3p
    
    
    

outputs:
  - id: outputfile
    type:  File
    outputBinding:
      glob:   $(inputs.input_file.basename).pfam.csv


