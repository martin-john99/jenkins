#!/bin/bash

# ESXi server details
ESXI_HOST="r730xd-esxi"
ESXI_USER="root"

# Command to list all VMs on the ESXi server
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no ${ESXI_USER}@${ESXI_HOST} "esxcli vm process list"

