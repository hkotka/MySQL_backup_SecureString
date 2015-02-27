$password = read-host -prompt "Enter password to be secured"
$hash = ConvertTo-SecureString $password -force -asPlainText

$data = ConvertFrom-SecureString $hash
write-host "Password to be encrypted is:" $password
write-host "Secured hash is:" $data

$data | out-file .\secure_pw.txt