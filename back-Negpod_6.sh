#!/bin/bash

#local directory to backup
local_directory="negpod_6-q1"

#remote server details

host="2f05c1f8800b.3be8ebfc.alu-cod.online"
username="2f05c1f8800b"
password="d4a1d225d0abda9549d8"
remote_directory="/summative/1023-2024j"


rsync -avz -e "sshpass -p $password ssh -o StrictHostKeyChecking=no" "$local_directory" "$username@$host:$remote_directory"

echo "Backup completed successfully for group $local_directory!"
