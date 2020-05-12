function Show-Established-Connections{

param(
[ValidateSet($true,$false)]
[boolean] $ShowList=$false
)

$connections= Get-NetTCPConnection -State Established
$ShowList
if($ShowList){
    $connections | ft LocalAddress, LocalPort,RemoteAddress,RemotePort,AppliedSetting 
}

$connections | measure -Line | fl @{n='Conexiones Activas';e={$_.Lines}}
}
Export-ModuleMember -Function Show-Established-Connections