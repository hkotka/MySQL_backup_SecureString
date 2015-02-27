$password = read-host -prompt "Enter password to be secured"
write-host "Secure password hash is:" $password
$hash = ConvertTo-SecureString $password -force -asPlainText
$data = ConvertFrom-SecureString $hash
$data | out-file .\secure_pw.txt