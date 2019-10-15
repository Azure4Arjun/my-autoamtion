$checklist = import-csv checklist.csv
$OutArray = @()
Import-Csv checklist.csv |`
ForEach-Object { 
    try {
        $rh = $_.remoteHost
        $p = $_.port
        $socket = new-object System.Net.Sockets.TcpClient($rh, $p)
    } catch [Exception] {
        $myobj = "" | Select remoteHost, port, status
        $myobj.remoteHost = $rh
        $myobj.port = $p
        $myobj.status = "failed"
        Write-Host $myobj
        $outarray += $myobj
        $myobj = $null
        return
    }

      return
}
if (!$outarray){ Write-Host "All port are enable" }
return
if (!$outarray){ Write-Host "All port are desable" }
$outarray | export-csv -path "D:\result.csv" -NoTypeInformation
$Username ="rahul.belokar@fendahl.com"
$Password = ConvertTo-SecureString "APR@2018" -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential $Username, $Password
$SMTPServer = "smtp.gmail.com"
$EmailFrom = "rahul.belokar@fendahl.com"
$EmailTo = "rahul.belokar@fendahl.com"
$Body = "SendGrid testing successful"
$Subject = "SendGrid test"
$log = "D:\result.csv" 
Send-MailMessage -smtpServer $SMTPServer -Credential $credential -Usessl -Port 587 -from $EmailFrom -to $EmailTo -subject $Subject -Body $Body  -attachment $log

