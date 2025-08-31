Install-WindowsFeature -name Web-Server -IncludeManagementTools

$html = @"
<html>
  <head><title>Welcome</title></head>
  <body><h1>Hello from ${env:COMPUTERNAME}</h1></body>
</html>
"@
$html | Out-File "C:\inetpub\wwwroot\index.html" -Encoding utf8

Start-Service W3SVC