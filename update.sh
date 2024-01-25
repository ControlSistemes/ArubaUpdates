#!/bin/bash

# Set non-interactive mode for apt
export DEBIAN_FRONTEND=noninteractive

# GitHub URL for the raw script file
github_url="https://raw.githubusercontent.com/ControlSistemes/zabbix/7af940f7342745a7058d5488bae95dfc6e47e7e3/update_zabbix_proxy.sh"

# Personal access token for authentication
token="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"

# Local directory
local_dir="/cgupdate"

# Filename of the script to download
script_filename="update_zabbix_proxy.sh"

# Function to create the local directory if it doesn't exist
create_local_directory() {
    if [ ! -d "$local_dir" ]; then
        echo "Creating local directory: $local_dir"
        mkdir -p "$local_dir"
    fi
}

# Function to download and update Zabbix Proxy
update_zabbix_proxy() {
    # Download the script from GitHub to the local directory using the personal access token
    wget --header="Authorization: token $token" -O "${local_dir}/${script_filename}" "$github_url"

    # Make the script executable
    chmod +x "${local_dir}/${script_filename}"

    # Run the script
    "${local_dir}/${script_filename}"
}

# Check if local directory exists, create if not
create_local_directory

# Always perform Zabbix Proxy update
update_zabbix_proxy
