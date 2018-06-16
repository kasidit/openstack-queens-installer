# OpenStack ocata installation script on Ubuntu 16.04.2 
# by kasidit chanchio
# vasabilab, dept of computer science, 
# Thammasat University, Thailand
#
# Copyright 2018  Kasidit Chanchio
#
#!/bin/bash -x
#
intype=full
full=full
#
cmd=${1}
helpcmd=help
#
# help option
#
if [ "$cmd" == "$helpcmd" ]
then
  echo "OS-cluster-btrfs-snapshot.sh <cmd> [<snapshotname>]"
  echo "OS-cluster-btrfs-snapshot.sh list"
  echo "  -- lists btrfs snapshots on every node. "
  echo "OS-cluster-btrfs-snapshot.sh defrag"
  echo "  --> perform btrfs defrag on every node. "
  echo "OS-cluster-btrfs-snapshot.sh snapshot <snapshotname>"
  echo "  --> create btrfs snapshot <snapshotname> on every node. "
  echo "OS-cluster-btrfs-snapshot.sh restore <snapshotname>"
  echo "  --> restore btrfs snapshot <snapshotname> and create badroot and badhome volumes on every node. "
  echo "  --> IMPORTANT! you MUST reboot every node after this command finish! "
  echo "  --> E.g. ./run OS-cluster-reboot.sh"
  echo "OS-cluster-btrfs-snapshot.sh cleanbad <snapshotname>"
  echo "  --> clean bad btrfs volume of the restored <snapshotname> snapshots on every node. "
  echo "OS-cluster-btrfs-snapshot.sh restoreoriginal"
  echo "  --> restore the original snapshot of every node."
  echo "OS-cluster-btrfs-snapshot.sh delallsnapshots"
  echo "  --> delete all snapshots made by this OS-cluster-btrfs-snapshot.sh command."
fi
#
if [ $# -eq 0 ]
then
  echo "OS-cluster-btrfs-snapshot.sh <cmd> [<snapshotname>]"
  echo "OS-cluster-btrfs-snapshot.sh list"
  echo "  -- lists btrfs snapshots on every node. "
  echo "OS-cluster-btrfs-snapshot.sh defrag"
  echo "  --> perform btrfs defrag on every node. "
  echo "OS-cluster-btrfs-snapshot.sh snapshot <snapshotname>"
  echo "  --> create btrfs snapshot <snapshotname> on every node. "
  echo "OS-cluster-btrfs-snapshot.sh restore <snapshotname>"
  echo "  --> restore btrfs snapshot <snapshotname> and create badroot and badhome volumes on every node. "
  echo "  --> IMPORTANT! you MUST reboot every node after this command finish! "
  echo "  --> E.g. ./run OS-cluster-reboot.sh"
  echo "OS-cluster-btrfs-snapshot.sh cleanbad <snapshotname>"
  echo "  --> clean bad btrfs volume of the restored <snapshotname> snapshots on every node. "
  echo "OS-cluster-btrfs-snapshot.sh restoreoriginal"
  echo "  --> restore the original snapshot of every node."
  echo "OS-cluster-btrfs-snapshot.sh delallsnapshots"
  echo "  --> delete all snapshots made by this OS-cluster-btrfs-snapshot.sh command."
fi
#
cmd=${1}
listcmd=list
#
# list option
#
if [ "$cmd" == "$listcmd" ]
then
echo "On controller:"
ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/admintools/btrfs-list.sh 
echo "On network:"
ssh -t openstack@network sudo /bin/bash -x ./OPSInstaller/network/admintools/btrfs-list.sh 
echo "On compute:"
ssh -t openstack@compute sudo /bin/bash -x ./OPSInstaller/compute/admintools/btrfs-list.sh 
if [ "$intype" == "$full" ]
then
  echo "On compute1:"
  ssh -t openstack@compute1 sudo /bin/bash -x ./OPSInstaller/compute1/admintools/btrfs-list.sh 
fi
fi
#
cmd=${1}
restoreorigcmd=restoreoriginal
#
# list option
#
if [ "$cmd" == "$restoreorigcmd" ]
then
echo "On network:"
ssh -t openstack@network sudo /bin/bash -x ./OPSInstaller/network/admintools/btrfs-restore-original.sh.sh 
echo "On compute:"
ssh -t openstack@compute sudo /bin/bash -x ./OPSInstaller/compute/admintools/btrfs-restore-original.sh.sh 
if [ "$intype" == "$full" ]
then
  echo "On compute1:"
  ssh -t openstack@compute1 sudo /bin/bash -x ./OPSInstaller/compute1/admintools/btrfs-restore-original.sh.sh 
fi
echo "On controller:"
ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/admintools/btrfs-restore-original.sh.sh 
fi
#
cmd=${1}
delallsnapcmd=delallsnapshots
#
# list option
#
if [ "$cmd" == "$delallsnapcmd" ]
then
echo "On controller:"
ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/admintools/btrfs-delete-all-snapshots.sh.sh 
echo "On network:"
ssh -t openstack@network sudo /bin/bash -x ./OPSInstaller/network/admintools/btrfs-delete-all-snapshots.sh.sh 
echo "On compute:"
ssh -t openstack@compute sudo /bin/bash -x ./OPSInstaller/compute/admintools/btrfs-delete-all-snapshots.sh.sh 
if [ "$intype" == "$full" ]
then
  echo "On compute1:"
  ssh -t openstack@compute1 sudo /bin/bash -x ./OPSInstaller/compute1/admintools/btrfs-delete-all-snapshots.sh.sh 
fi
fi
#
# take volume snapshot option
#
snapshotname=${2}
snapshotcmd=snapshot
#
if [ "$cmd" == "$snapshotcmd" ]
then
if [[ $# -ne 2 ]] ; then
    echo 'Need two arguments: $cmd <snapshotname>'
    exit 1
fi
echo "On controller:"
ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/admintools/btrfs-snapshot.sh $snapshotname
echo "On network:"
ssh -t openstack@network sudo /bin/bash -x ./OPSInstaller/network/admintools/btrfs-snapshot.sh $snapshotname
echo "On compute:"
ssh -t openstack@compute sudo /bin/bash -x ./OPSInstaller/compute/admintools/btrfs-snapshot.sh $snapshotname
if [ "$intype" == "$full" ]
then
  echo "On compute1:"
  ssh -t openstack@compute1 sudo /bin/bash -x ./OPSInstaller/compute1/admintools/btrfs-snapshot.sh $snapshotname 
fi
echo "Done!"
fi
#
# delete snapshot option
#
snapshotname=${2}
deletecmd=delete
#
if [ "$cmd" == "$deletecmd" ]
then
if [[ $# -ne 2 ]] ; then
    echo 'Need two arguments: $cmd <snapshotname>'
    exit 1
fi
echo "On controller:"
ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/admintools/btrfs-delete.sh $snapshotname
echo "On network:"
ssh -t openstack@network sudo /bin/bash -x ./OPSInstaller/network/admintools/btrfs-delete.sh $snapshotname
echo "On compute:"
ssh -t openstack@compute sudo /bin/bash -x ./OPSInstaller/compute/admintools/btrfs-delete.sh $snapshotname
if [ "$intype" == "$full" ]
then
  echo "On compute1:"
  ssh -t openstack@compute1 sudo /bin/bash -x ./OPSInstaller/compute1/admintools/btrfs-delete.sh $snapshotname 
fi
echo "Done!"
fi
#
defragcmd=defrag
#
# list option
#
if [ "$cmd" == "$defragcmd" ]
then
echo "On controller:"
ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/admintools/btrfs-defrag.sh 
echo "On network:"
ssh -t openstack@network sudo /bin/bash -x ./OPSInstaller/network/admintools/btrfs-defrag.sh 
echo "On compute:"
ssh -t openstack@compute sudo /bin/bash -x ./OPSInstaller/compute/admintools/btrfs-defrag.sh 
if [ "$intype" == "$full" ]
then
  echo "On compute1:"
  ssh -t openstack@compute1 sudo /bin/bash -x ./OPSInstaller/compute1/admintools/btrfs-defrag.sh 
fi
fi
#
# restore snapshot option
#
snapshotname=${2}
restorecmd=restore
#
if [ "$cmd" == "$restorecmd" ]
then
if [[ $# -ne 2 ]] ; then
    echo 'Need two arguments: $cmd <snapshotname>'
    exit 1
fi
echo "On network:"
ssh -t openstack@network sudo /bin/bash -x ./OPSInstaller/network/admintools/btrfs-restore.sh $snapshotname
echo "On compute:"
ssh -t openstack@compute sudo /bin/bash -x ./OPSInstaller/compute/admintools/btrfs-restore.sh $snapshotname
if [ "$intype" == "$full" ]
then
  echo "On compute1:"
  ssh -t openstack@compute1 sudo /bin/bash -x ./OPSInstaller/compute1/admintools/btrfs-restore.sh $snapshotname 
fi
echo "On controller:"
ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/admintools/btrfs-restore.sh $snapshotname
echo "Done!"
echo "IMPORTANT! you MUST reboot every node after this command finish! "
echo "E.g. ./run OS-cluster-reboot.sh"
fi
#
# cleanbad snapshot option
#
snapshotname=${2}
cleanbadcmd=cleanbad
#
if [ "$cmd" == "$cleanbadcmd" ]
then
if [[ $# -ne 2 ]] ; then
    echo 'Need two arguments: $cmd <snapshotname>'
    exit 1
fi
echo "On network:"
ssh -t openstack@network sudo /bin/bash -x ./OPSInstaller/network/admintools/btrfs-clean-bad.sh $snapshotname
echo "On compute:"
ssh -t openstack@compute sudo /bin/bash -x ./OPSInstaller/compute/admintools/btrfs-clean-bad.sh $snapshotname
if [ "$intype" == "$full" ]
then
  echo "On compute1:"
  ssh -t openstack@compute1 sudo /bin/bash -x ./OPSInstaller/compute1/admintools/btrfs-clean-bad.sh $snapshotname 
fi
echo "On controller:"
ssh -t openstack@controller sudo /bin/bash -x ./OPSInstaller/controller/admintools/btrfs-clean-bad.sh $snapshotname
echo "Done!"
fi
