function Get-Memory{
	Get-WmiObject win32_operatingSystem | 
		select @{n="free physical memory (Bytes)";e={$_.FreePhysicalMemory}}, @{n="free physical memory (%)";e={([math]::Round(($_.FreePhysicalMemory / $_.TotalVisibleMemorySize) * 100,2))}}, 
			@{n="Swap available (Bytes)";e={$_.FreeVirtualMemory}}, @{n="Swap used (%)";e={([math]::Round((1-($_.FreeVirtualMemory / $_.TotalVirtualMemorySize))* 100,2))}}
}
Export-ModuleMember -Function Get-Memory