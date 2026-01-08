. $PSScriptRoot\env.ps1

echo $env:DOOM2

echo "Starting the host"
uzdoom -iwad $env:DOOM2 -file .\ -HOST 2

echo "Starting client 1"
uzdoom -iwad $env:DOOM2 -file .\ -JOIN 127.0.0.1
