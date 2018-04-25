{
    "class": "CommandLineTool", 
    "baseCommand": "pfam-annotate.sh", 
    "hints": [
        {
            "class": "DockerRequirement", 
            "dockerPull": "wltrimbl/pfamlite"
        }
    ], 
    "requirements": [
        {
            "listing": [
                "$(inputs.h3m)", 
                "$(inputs.h3i)", 
                "$(inputs.h3f)", 
                "$(inputs.h3p)"
            ], 
            "class": "InitialWorkDirRequirement"
        }
    ], 
    "inputs": [
        {
            "id": "#main/input_file", 
            "type": "File", 
            "inputBinding": {
                "position": 1, 
                "valueFrom": "$(inputs.input_file)"
            }
        }, 
        {
            "id": "#main/h3f", 
            "type": "File", 
            "inputBinding": {
                "position": 2, 
                "valueFrom": "$(self.nameroot)"
            }
        }, 
        {
            "id": "#main/h3i", 
            "type": "File"
        }, 
        {
            "id": "#main/h3m", 
            "type": "File"
        }, 
        {
            "id": "#main/h3p", 
            "type": "File"
        }
    ], 
    "outputs": [
        {
            "id": "#main/outputfile", 
            "type": "File", 
            "outputBinding": {
                "glob": "$(inputs.input_file.basename).pfam.csv"
            }
        }
    ], 
    "id": "#main", 
    "cwlVersion": "v1.0"
}