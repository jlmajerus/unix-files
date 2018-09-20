#!/usr/bin/ksh

case "$1"
in
p)
/usr/bin/echo | /usr/sbin/format | grep PURE 2>/dev/null
;;
n)
/usr/bin/echo | /usr/sbin/format | grep NETAPP 2>/dev/null
;;
*)
echo "Enter either p (PURE) or n (NETAPP)"
;;
esac
