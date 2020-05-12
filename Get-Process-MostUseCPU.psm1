function Get-Process-MostUseCPU{
    param(
        [parameter(Mandatory=$true)]
        [int]$numberProcces
    )
    
Get-Process| sort -Property CPU -Descending | select -Property Id,Name,CPU -First $numberProcces |` 
ft Id, @{n='Nombre';e={$_.Name}},CPU
}

Export-ModuleMember -Function Get-Process-MostUseCPU 


