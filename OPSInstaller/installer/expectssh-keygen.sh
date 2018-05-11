#!/usr/bin/expect
set timeout 10

set argv1 [lindex $argv 0]
set argv2 [lindex $argv 1]
#spawn ssh -q -o StrictHostKeyChecking=no vasabi@10.0.0.11

spawn ssh-keygen -t rsa
expect { 
  timeout{ send_user "\nfailed to get ssh keygen prompt\n\n"; exit 1}
  eof{ send_user "\nSSH failed on host \n"; exit 1}
  "Enter file in which to save the key"
}
send "\r"

expect { 
  timeout{ send_user "\nfailed to get ssh keygen prompt\n\n"; exit 1}
  eof{ send_user "\nSSH failed on host \n"; exit 1}
  "Enter passphrase (empty for no passphrase)"
}
send "\r"

expect { 
  timeout{ send_user "\nfailed to get ssh keygen prompt\n\n"; exit 1}
  eof{ send_user "\nSSH failed on host \n"; exit 1}
  "Enter same passphrase again"
}
send "\r"

interact
#expect "*$"
#send "pwd\r"
