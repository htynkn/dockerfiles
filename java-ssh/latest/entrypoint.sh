#!/bin/bash

USER_NAME="${SSH_USER_NAME:-benchmark}"

echo "Preparing ssh user with name: ${USER_NAME}"

useradd ${USER_NAME}
mkdir -p /home/${USER_NAME}/.ssh
chown -R ${USER_NAME}:${USER_NAME} /home/${USER_NAME}/.ssh


file="/opt/id_rsa.pub"
if [ -f "$file" ]
then
	echo "$file found."
    cp ${file} /home/${USER_NAME}/.ssh/authorized_keys
else
    echo "Can't find ${file}"
    touch /home/${USER_NAME}/.ssh/authorized_keys
fi

chmod 0700 /home/${USER_NAME}/.ssh
chmod 0600 /home/${USER_NAME}/.ssh/authorized_keys

service ssh start
echo "Ready"

exec "$@"