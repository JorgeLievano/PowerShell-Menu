function Search-High-Lenght-File{
param(
[parameter(Mandatory=$true)]
[string]$path,
[parameter(Mandatory=$true)]
[int]$numberFiles 
)
Get-ChildItem -Path $path -Recurse  | sort -Property Length -Descending |`
 select -First $numberFiles| ft @{n='Nombre';e={$_.Name}},@{n='Tamaño (kb)';e={$_.Length / 1kb -as [int]}},@{n='Ruta';e={$_.FullName}} -Wrap
}
Export-ModuleMember -Function Search-High-Lenght-File