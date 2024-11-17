# Function to check if a computer is reachable via ping
function Test-ConnectionPing {
    param (
        [string]$ComputerName
    )
    Test-Connection -ComputerName $ComputerName -Count 1 -Quiet
}

# Function to set registry value
function Set-RegistryValue {
    param (
        [string]$ComputerName,
        [string]$Key,
        [string]$Name,
        [string]$Value
    )
    
    if (Test-ConnectionPing -ComputerName $ComputerName) {
        Invoke-Command -ComputerName $ComputerName -ScriptBlock {
            param ($Key, $Name, $Value)
            Set-ItemProperty -Path $Key -Name $Name -Value $Value
        } -ArgumentList $Key, $Name, $Value
        Write-Output "Registry key set successfully on $ComputerName"
    } else {
        Write-Output "Cannot reach $ComputerName. Skipping..."
    }
}

# Define the registry key and value to enable macros
$registryKey = "HKCU:\Software\Policies\Microsoft\Office\16.0\Word\Security"
$registryName = "DisableVBA"
$registryValue = 0

# Get a list of all computers in the domain
$computers = Get-ADComputer -Filter * | Select-Object -ExpandProperty Name

# Apply the registry setting to all reachable computers
foreach ($computer in $computers) {
    Set-RegistryValue -ComputerName $computer -Key $registryKey -Name $registryName -Value $registryValue
}
