#!/bin/bash
passwd <<EOF
${ROOTPASS}
${ROOTPASS}
EOF

/usr/sbin/sshd-keygen
/usr/sbin/sshd -E /root/sshd_log  -f /root/sshd_config -p 22
SSHPROXYADDR=172.17.0.1
SSHPROXYPORT=22
SSHPROXYPASS=dd13427
func_cmd_need_password(){
   local password=$1
   shift 1
   expect -c "
       spawn $*
       expect {
           \"*yes/no\" {send \"yes\r\"; exp_continue;}
           \"*password:\" {set timeout 300; send \"${password}\r\";}
       }
   expect eof"
}

CMD="ssh -p ${SSHPROXYPORT} -C -f -N -g -D 1111 root@${SSHPROXYADDR}"

func_cmd_need_password "${SSHPROXYPASS}" "${CMD}"

while true;do sleep 10;  done


