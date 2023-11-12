# Connect to the ESXi host
$esxiHost = "r730xd-esxi"
$user = "root"
$pass = "Zbear!1015"

# It's better to use SecureString for passwords
$securePass = ConvertTo-SecureString $pass -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($user, $securePass)

# Skip certificate check - only for testing, not recommended for production
Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false

# Connect to the ESXi Server
Connect-VIServer -Server $esxiHost -Credential $credential

# Get host information
$hostInfo = Get-VMHost
Write-Output "Host Name: $($hostInfo.Name)"
Write-Output "Product Version: $($hostInfo.Version)"

# Get a list of all VMs on the host
$vmList = Get-VM
Write-Output "List of VMs on the Host:"
$vmList | ForEach-Object {
    Write-Output "$($_.Name)"
}

# Disconnect from the ESXi Server
Disconnect-VIServer -Server $esxiHost -Confirm:$false

