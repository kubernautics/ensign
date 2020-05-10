#!/bin/bash -x

hwIface="enp6s0"
intIface="mgmt1"
ovsBridge="internal"

hwAddr=$(cat /sys/class/net/${hwIface}/address)
mgmtAddr=$(echo "${hwIface} ${HOSTNAME} ${ovsBridge} ${intIface}" | md5sum \
  | sed 's/^\(..\)\(..\)\(..\)\(..\)\(..\).*$/02\\:\1\\:\2\\:\3\\:\4\\:\5/')

ovs-clear;
ip addr flush dev ${hwIface}

ovs-vsctl --may-exist                           \
  -- add-br ${ovsBridge}

ovs-vsctl --may-exist                           \
  add-port ${ovsBridge} ${intIface}             \
  -- set interface ${intIface} type=internal    \
  -- set interface ${intIface} mac=${mgmtAddr}  

ip addr add 192.168.16.2/24 dev mgmt1

ip link set ${ovsBridge} up
ip link set ${intIface} up

ovs-vsctl show
ip r add 192.168.16.0/24 via 192.168.16.2 dev mgmt1
ip r add default via 192.168.16.1 dev mgmt1
ip r
