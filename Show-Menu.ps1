Import-Module -Name .\Search-Bigger-Size-Files.psm1
Import-Module -Name .\Get-Process-MostUseCPU.psm1

function Show-Menu
{
    Write-Host "================ Opciones ================"
    
    Write-Host "1: Presione '1' Para Obtener los 5 procesos que mas usan tiempo de cpu ."
    Write-Host "2: Presione '2' Para ver los FileSystems actuales."
    Write-Host "3: Presione '3' Para Buscar el archivo mas grande en el filesystem indicado"
    Write-Host "3: Opcion 4"
    Write-Host "3: Opcion 5"
    Write-Host "Q: Press 'Q' to quit."

    
}

function continue-Menu
{
    $continue= Read-Host "Presione R para volver a menu o Q para salir"

    switch($continue){
        'R'{
            Show-Menu
            break; 
        }'Q'{
            return
        
        }
    }
}

Show-Menu 
$selection = Read-Host "Introduzca la opcion"
switch ($selection)
 {
     '1' {
            $numberProcces = 5
            Get-Process-MostUseCPU -numberProcces $numberProcces
            break
            
     } '2' {
         .\Show-FileSystems-Function.ps1
         break
     } '3' {
        $filesystemPath = Read-Host "Introduzca la ruta del filesystem donde desea buscar"
        Search-High-Lenght-File -path $filesystemPath -numberFiles 1
         break
     } 'q' {
         return
     }  
 }
