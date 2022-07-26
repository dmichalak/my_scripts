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
    $fileArray = $file.Split("_")
    $tiltAngleArray = $fileArray[1].split(".")
    $tiltAngleArray[0] = $tiltAngleArray[0][0] + "0" + $tiltAngleArray[0][1] 
    $fileArray[1] = ($tiltAngleArray -join ".")
    Rename-Item -Path $_ -NewName ($fileArray -join "_") #-WhatIf
}