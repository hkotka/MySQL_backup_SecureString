$hash = "SecureString-hash goes here"
$password = ConvertTo-SecureString -string $hash
$user = "backup"

$cred = New-Object System.Net.NetworkCredential($user, $password, "")

$date = Get-Date
$dateString = $date.Year.ToString() + "-" + $date.Month.ToString() + "-" + $date.Day.ToString()
$backupDest = "C:\backups\MySQL\mysql_backup_"+ $dateString + ".sql"
$mysqldumpLocation = ".\mysqldump.exe"
$execute = $mysqldumpLocation+" -u"+$cred.UserName+" -p"+$cred.Password +" --all-databases > " + $backupDest

invoke-expression $execute