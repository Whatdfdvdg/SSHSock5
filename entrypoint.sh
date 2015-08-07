#!/bin/bash
/usr/sbin/ssh -p  ${SSHPROXYPORT} -C -f -N -g -D 1111 root@${SSHPROXYADDR}
while true;do sleep 10; done
