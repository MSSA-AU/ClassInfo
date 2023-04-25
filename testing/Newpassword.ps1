'Name,Password' | Out-File  E:\NewPasswords.txt
Get-ADUser -Filter * -Properties department,city | 
 Where-Object {$_.Department -eq 'Sales' -and $_.City -eq 'London'} | 
 ForEach-Object {
   $PasswordArray = 'q','w','e','r','t','y','u','A','S','D','F','G','H','J','K',1,2,3,4,5,6,7,'!','#' | Get-Random -Count 10
   $Passwd = $PasswordArray -join ''
   $EncryptedPwd = $Passwd | ConvertTo-SecureString -AsPlainText -Force
   Set-ADAccountPassword -Identity $_ -NewPassword $EncryptedPwd -Reset
   $_.Name + ',' + $Passwd | Out-File e:\NewPasswords.txt -Append
 }