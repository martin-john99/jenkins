#!/usr/bin/python3

import os
import subprocess
import sys

def run_racadm_command(ip_address):
    try:
        # Retrieve the iDRAC credentials from environment variables
        username = os.environ.get('iDRAC_USER')
        password = os.environ.get('iDRAC_PASSWORD')

        # Check if both username and password are available
        if not username or not password:
            raise ValueError("iDRAC credentials not found in environment variables")

        # Define the racadm command with credentials and IP address
        command = ["/opt/dell/srvadmin/sbin/racadm", "-r", ip_address, "-u", username, "-p", password, "getsysinfo", "--nocertwarn"]

        # Execute the command
        result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

        # Check if the command was successful
        if result.returncode == 0:
            print(f"Command executed successfully for server {ip_address}:")
            print(result.stdout)
        else:
            print(f"Error in executing command for server {ip_address}:")
            print(result.stderr)
            return False

    except Exception as e:
        print(f"An error occurred for server {ip_address}: {e}")
        return False
    return True

# Initialize a flag to track overall success
all_success = True

# Retrieve the server IPs or hostnames from an environment variable
server_ips = os.environ.get('SERVER_IPS')
if server_ips:
    ip_list = server_ips.split(',')  # Or your chosen delimiter
    for ip in ip_list:
        run_racadm_command(ip.strip())
else:
    print("No server IPs or hostnames found in the environment variable.")

# If any command failed, exit with a non-zero status code
if not all_success:
    sys.exit(1)
