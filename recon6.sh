#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <target_ip_or_url>"
  exit 1
fi

target="$1"
output_directory="./scan6_results"
timestamp=$(date +"%Y%m%d%H%M%S")

mkdir -p "$output_directory"

echo "----Performing DNS resolution for $target----"
nslookup "$target" > "$output_directory/dns_resolution_$timestamp.txt"

echo "----Performing Nmap port scan on $target----"
nmap -T4 -A -p- "$target" > "$output_directory/nmap_scan_$timestamp.txt"

echo "----Performing Nikto web scan on $target----"
nikto -h "$target" > "$output_directory/nikto_scan_$timestamp.txt"

echo "----Performing WhatWeb scan on $target----"
whatweb "$target" > "$output_directory/whatweb_scan_$timestamp.txt"

echo "----Performing Enum4linux scan on $target----"
enum4linux "$target" > "$output_directory/enum4linux_scan_$timestamp.txt"

echo "Reconnaissance completed. Results saved in $output_directory."
