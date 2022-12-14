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


tomogramPattern = "*.mrc"


run(session, "artiax start")
run(session, "hide #1.1")

for tomogram in Path().glob(tomogramPattern):
    run(session, f"artiax open tomo {tomogram.name}")
