#!/usr/bin/expect
set timeout 10

set argv1 [lindex $argv 0]
set argv2 [lindex $argv 1]
#spawn ssh -q -o StrictHostKeyChecking=no vasabi@10.0.0.11

spawn ssh -q $argv1@$argv2
expect { 
  timeout{ send "exit\r" ; send_user "\nfailed to get yesno prompt\n\n"; exit 1}
  eof{ send_user "\nSSH failed on host \n"; exit 1}
  "yes*no"
}
send "yes\r"
#
set timeout 3
expect {
  timeout{ send_user "\nfailed to get password prompt\n\n"; exit 1}
  "*assword"
}
send "exit\r"
#
close
