Get-WmiObject win32_logicaldisk  |`
select  @{n='Nombre';e={$_.Name}},@{n='Nombre de Volumen';e={$_.VolumeName}},`
@{n="Tamaño (bytes)";e={$_.Size }},@{n="Espacio Libre (bytes)";e={$_.freespace}}|ft -AutoSize