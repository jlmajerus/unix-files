#!/usr/bin/ksh

# Run as root on the global servers in scope for upcoming disaster recovery tests.
#

DR=/export/home/ujxm108/DR
HN=`hostname`

[[ -d $DR/$HN ]] || mkdir $DR/$HN

      for z in `/usr/sbin/zoneadm list | grep -v global`
         do
             /usr/sbin/zonecfg -z $z export > $DR/$HN/$z.export
         done

for fs in `grep special $DR/$HN/*.export | awk -F\= '{print $2}'`
  do
      df -h | grep $fs >> $DR/$HN/localfssize.out
  done

/usr/sbin/zpool list > $DR/$HN/zpoolsize.out
df -h 2>/dev/null | grep zones > $DR/$HN/zonesize.out

