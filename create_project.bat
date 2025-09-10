@echo off
set /p id="Enter Project Name:"
mkdir "%id%"\Codes(Github)\Archive
mkdir "%id%"\Codes(Github)\L1_Nameit
mkdir "%id%"\Codes(Github)\L2_Nameit

mkdir "%id%"\DataFiles\Archive
mkdir "%id%"\DataFiles\L1_Name_R1W1
mkdir "%id%"\DataFiles\L2_Name_R1W2

mkdir "%id%"\"Documents %id%"\Archive
mkdir "%id%"\"Documents %id%"\Reports(Docs)
mkdir "%id%"\"Documents %id%"\"Trackings&Summaries"

mkdir "%id%"\ExtraFiles\Archive

echo Directory is created for Project: %id%

pause
