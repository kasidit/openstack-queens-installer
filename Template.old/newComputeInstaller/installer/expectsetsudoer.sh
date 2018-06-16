#!/usr/bin/expect
set timeout 10

set argv1 [lindex $argv 0]
set argv2 [lindex $argv 1]
set argv3 [lindex $argv 2]
#spawn ssh -q -o StrictHostKeyChecking=no vasabi@10.0.0.11

spawn ssh -t $argv1@$argv2 sudo /home/vasabi-1234loginname4321-ibasav/adjustsudoer.sh
expect { 
  timeout{ send_user "\nfailed to get yesno prompt\n\n"; exit 1}
  eof{ send_user "\nSSH failed on host \n"; exit 1}
  "*assword"
}
send "$argv3\r"
interact
#
#cp /etc/sudoers /tmp/sudoers.save
#echo "vasabi ALL=NOPASSWD: ALL" >> /etc/sudoers

