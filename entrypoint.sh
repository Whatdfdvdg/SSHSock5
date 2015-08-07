#!/bin/bash

func_cmd_need_password(){
   local password=$1
   shift 1
   expect -c "
       spawn $*
       expect {
           \"*password:\" {set timeout 300; send \"${password}\r\";}
           \"*yes/no\" {send \"yes\r\"; exp_continue;}
       }
   expect eof"
}

CMD="ssh -p ${SSHPROXYPORT} -C -f -N -g -D 1111 root@${SSHPROXYADDR}"

func_cmd_need_password "${SSHPROXYPASS}" "${CMD}"

while true;do sleep 10; done

