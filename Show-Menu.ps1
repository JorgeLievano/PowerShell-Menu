Import-Module -Name .\Search-Bigger-Size-Files.psm1
Import-Module -Name .\Get-Process-MostUseCPU.psm1
Import-Module -Name .\Show-Filesystem-Disks.psm1
Import-Module -name .\Show-Established-Connections.psm1

function Show-Menu
{
    Write-Host "================ Opciones ================"
    
    Write-Host "1: Presione '1' Para Obtener los 5 procesos que mas usan tiempo de cpu ."
    Write-Host "2: Presione '2' Para ver los FileSystems actuales."
    Write-Host "3: Presione '3' Para Buscar el archivo mas grande en el filesystem indicado"
    Write-Host "4: Opcion 4"
    Write-Host "5: Presione '5' Para ver el numero de conexciones activa y opcionalmente la lista"
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

function remove-all-OnExit{
    Remove-Module Get-Process-MostUseCPU,Search-Bigger-Size-Files,Show-Filesystem-Disks,Show-Established-Connections
}


do{
Show-Menu 
$selection = Read-Host "Introduzca la opcion"
switch ($selection)
 {
     '1' {
            $numberProcces = 5
            Get-Process-MostUseCPU -numberProcces $numberProcces
            break
            
     } '2' {
         Show-FileSystem-Disks
         break
     } '3' {
        $filesystemPath = Read-Host "Introduzca la ruta del filesystem donde desea buscar"
        Search-High-Lenght-File -path $filesystemPath -numberFiles 1
         break
     } '5'{
         $showList = Read-Host "Presione 's' si desea incluir la lista, cualquier otro si solo desea el numero de conexiones"
         if($showList -eq 's'){
            Show-Established-Connections -ShowList $true
         }else{
            Show-Established-Connections
         }

         break
     }'q' {
         remove-all-OnExit
         return
     }  
 }
 Pause
}until($selection -eq 'Q')


