<#

#>

[CmdletBinding()]
param(
[Parameter(Mandatory=$True)]
[int]$numerProcces
)

Get-Process| select -Property Id,Name,CPU|sort -Property CPU -Descending | select -First $numerProcces