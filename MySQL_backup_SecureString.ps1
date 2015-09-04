$hash = "SecureString-hash goes here"
$password = ConvertTo-SecureString -string $hash
$user = "backup"
$cred = New-Object System.Net.NetworkCredential($user, $password, "")

$date = Get-Date
$dateString = $date.Year.ToString() + "-" + $date.Month.ToString() + "-" + $date.Day.ToString()

# Create symbolic link for mysqldump.exe in the script folder
$mysqldumpLocation = ".\mysqldump.exe"
$backupDest = "C:\backups\MySQL\mysql_backup_"+ $dateString + ".sql"

$execute_mysqldump = $mysqldumpLocation+" -u"+$cred.UserName+" -p"+$cred.Password +" --all-databases > " + $backupDest

invoke-expression $execute_mysqldump

# use 7zip to compress and encrypt the backup with same password as used to autheticate the mysql backup user
# removes the unencrypted .sql file afterwards
# create symbolic link for 7z.exe in the script folder
$sevenzip = ".\7z.exe"
$zipfile = $backupDest.Replace(".sql",".7z")
$execute7zip = $sevenzip+" a -t7z "+$zipfile+" "+$backupDest+" -p"+$cred.Password
invoke-expression $execute7zip
Remove-Item $backupDest