import os
from pathlib import Path
import pandas as pd
import numpy as np
from contextlib import contextmanager

############
data_star = Path("./run_it025_data.star")
classJobNames = Path().absolute().glob("K*ref1")

useRELION4 = 1
############





column_labels_relion3 = [
    "CoordinateX", #1 
    "CoordinateY", #2 
    "CoordinateZ", #3 
    "AngleRot", #4 
    "AngleTilt", #5 
    "AnglePsi", #6 
    "MicrographName", #7 
    "Magnification", #8 
    "DetectorPixelSize", #9 
    "CtfMaxResolution", #10 
    "ImageName", #11 
    "CtfImage", #12 
    "PixelSize", #13 
    "Voltage", #14 
    "SphericalAberration", #15 
    "GroupNumber", #16 
    "OriginX", #17 
    "OriginY", #18 
    "OriginZ", #19 
    "ClassNumber", #20 
    "NormCorrection", #21 
    "LogLikeliContribution", #22 
    "MaxValueProbDistribution", #23 
    "NrOfSignificantSamples", #24 
]
column_labels_relion4 = [
    "CoordinateX", #1 
    "CoordinateY", #2 
    "CoordinateZ", #3 
    "AngleRot", #4 
    "AngleTilt", #5 
    "AnglePsi", #6 
    "MicrographName", #7 
    "CtfMaxResolution", #8
    "ImageName", #9 
    "CtfImage", #10 
    "PixelSize", #11 
    "OpticsGroup", #12
    "GroupNumber", #13 
    "OriginXAngst", #14 
    "OriginYAngst", #15 
    "OriginZAngst", #16 
    "ClassNumber", #17 
    "NormCorrection", #18 
    "LogLikeliContribution", #19 
    "MaxValueProbDistribution", #20 
    "NrOfSignificantSamples", #21 
]

if useRELION4 == 1:
    # RELION4.0 star format
    skipRows = 42
    columnLabels = column_labels_relion4
else:
    # RELION3.0 star format
    skipRows = 28
    columnLabels = column_labels_relion3

@contextmanager
def cd(path):
    """Changes working directory and returns to previous on exit."""
    prev_cwd = os.getcwd()
    os.chdir(path)
    try:
        yield
    finally:
        os.chdir(prev_cwd)

    return

for classJobPath in classJobNames:
    
    with cd(classJobPath):
        classJobName = classJobPath.name
        print(f"Processing {classJobName}")
        data = pd.read_csv(data_star, delim_whitespace=True, names=columnLabels, skiprows=skipRows)
        
        # One of the slower ways to iterate through a pd.DataFrame
        for row in range(len(data)):
            classNumber = data["ClassNumber"].iloc[row]
            micrograph = data["MicrographName"].iloc[row]
            filename = f"{classJobName}{Path(micrograph).stem.split('.')[0][4:]}_class{classNumber}.star"
            filepath = Path(filename)

            if filepath.is_file() == False:
                with open(filepath,"w") as file:
                    with open(data_star) as star:
                        head = [next(star) for x in range(skipRows)]
                    file.write("".join(str(item) for item in head))
            
            with open(filepath,"a") as file:
                row_to_write = "\t".join(str(item) for item in data.iloc[row].tolist())
                file.write(row_to_write)
                file.write("\n")
                file.close()

    #break






#classList = []
#micrographList = []
#rowDict = {}
#
#micrographName = row["MicrographName"]
#classNumber = row["ClassNumber"]
#
#if micrographName not in micrographList:
#    micrographList.append(micrographName)
#if classNumber not in classList:
#    classList.append(classNumber)
#
#rowDict[[classNumber,micrographName]] = row