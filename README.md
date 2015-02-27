Powershell script for MySQL database backup, using hashed password
==============

The point of this script is to excecute backups from MySQL database without revealing plaintext password for the backup user account.

Script uses SecureString function provided by Powershell to encrypt the plaintext password into a hash form. Nice thing abut this function is that the hash is only convertable back to plaintext on a same Windows account that created the original hash. So it's not perfectly secure or anything, but it is a lot better than having the password in plain text on a script.

You can use [a create_secure_password.ps1](/create_secure_password.ps1) to create hashed password.

**Script needs to be run on a account that created the SecureString password hash**

*For added security, account for logging into MySQL should have minimal rights for excecuting backup. You easily can crete backup user from MySQL Workbench 'Users and Privileges' section and granting the 'BackupAdmin' Administrative Role to it.*
