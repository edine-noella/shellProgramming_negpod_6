#!/bin/bash

#local directory to backup
local_directory="negpod_6-q1"

#remote server details

host="64293e56bc62.3a2627c1.alu-cod.online"
username="64293e56bc62"
password="328d3b338a4ced526c9a"
remote_directory="/summative/1023-2024j"


rsync -avz -e "sshpass -p $password ssh -o StrictHostKeyChecking=no" "$local_directory" "$username@$host:$remote_directory"

echo "Backup completed successfully for group $local_directory!"
