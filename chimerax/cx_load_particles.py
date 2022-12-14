import os
from pathlib import Path
from contextlib import contextmanager
from chimerax.core.commands import run

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

run(session, "hide #1.2")

K = 16
T = "*"
tilt = "*"




classJobNames = Path().absolute().glob(f"K{K}_T{T}_2.5Apx_rand500")
modelID = 2
particleListID = 1

for classJobPath in classJobNames:
    with cd(classJobPath):
        for particleFile in Path().absolute().glob(f"{classJobPath.name}_tilt{tilt}_*.star"):
            run(session, f"open {particleFile}")
            run(session, "wait")
            classNumber = particleFile.stem.split("_")[-1][5:]
            #run(session, f"log text classNumber = {classNumber}")
            if int(classNumber) < 10:
                classModel = Path(f"run_it025_class00{classNumber}.mrc")
            else:
                classModel = Path(f"run_it025_class0{classNumber}.mrc")
            
            run(session, f"open {classModel}")
            #run(session, "wait")

            run(session, f"artiax attach #{modelID} to #1.2.{particleListID}")
            #run(session, "wait")


            particleListID = particleListID + 1
            #if particleListID == 4:
            #    break

run(session, f"artiax hide")
run(session, f"artiax show surfaces")
run(session, "artiax particles originScaleFactor 2.5")
