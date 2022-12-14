#!/bin/bash

# Enforce that script is run with root user
if [[ "${UID}" -ne 0 ]]
then
  echo 'Access denied'
  exit 1
fi

# User input
read -p 'Enter new username: ' USER_NAME
read -p 'Enter your full name: ' COMMENT
read -s -p 'Password: ' PASSWORD

# Create user from input
useradd -c "${COMMENT}" -m ${USER_NAME}

# Add password
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

if [[ "${?}" -ne 0 ]]
then
  echo 'Password could not be set'
  exit 1
fi

# Force password
passwd -e ${USER_NAME}
 
