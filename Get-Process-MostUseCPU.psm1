function Get-Process-MostUseCPU{
    param(
        [parameter(Mandatory=$true)]
        [int]$numberProcces
    )
    
Get-Process| select -Property Id,Name,CPU|sort -Property CPU -Descending | select -First $numberProcces
}

Export-ModuleMember -Function Get-Process-MostUseCPU 


