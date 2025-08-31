<powershell>

Install-WindowsFeature -Name Web-Server -IncludeManagementTools

# Create a simple HTML page with the VM hostname
$hostname = hostname
"VM Name: $hostname" | Out-File -FilePath "C:\inetpub\wwwroot\index.html" -Encoding utf8

# Start IIS Service
Start-Service W3SVC
</powershell>
