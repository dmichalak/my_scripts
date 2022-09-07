# Rename positive tilt angles
Get-ChildItem "L:\AA_DJM\data\KAS_Krios_202206\frames\*_[0-9].0*.mrc" | ForEach-Object {
    $file = $_.BaseName + ".mrc"
    $filearray = $file.Split("_")
    $filearray[1] = "0" + $filearray[1]
    Rename-Item -Path $_ -NewName ($filearray -join "_") #-WhatIf
}

# Rename negative tilt angles
Get-ChildItem "L:\AA_DJM\data\KAS_Krios_202206\frames\*_-[0-9].0*.mrc" | ForEach-Object {
    $file = $_.BaseName + ".mrc"
    $filearray = $file.Split("_")
    $filearray[1] = "0" + $filearray[1]
    Rename-Item -Path $_ -NewName ($filearray -join "_") #-WhatIf
}