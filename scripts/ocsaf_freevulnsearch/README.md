# freevulnsearch

This NMAP NSE script is part of the Free OCSAF project - https://freecybersecurity.org. In conjunction with the version scan "-sV" in NMAP, the corresponding vulnerabilities are automatically assigned using CVE (Common Vulnerabilities and Exposures) and the severity of the vulnerability is assigned using CVSS (Common Vulnerability Scoring System). For more clarity, the CVSS are still assigned to the corresponding v3.0 CVSS ratings:

* Critical (CVSS 9.0 - 10.0)
* High (CVSS 7.0 - 8.9)
* Medium (CVSS 4.0 - 6.9)
* Low (CVSS 0.1 - 3.9)
* None (CVSS 0.0)

The CVEs are queried by default using the CPEs determined by NMAP via the ingenious and public API of the cve-search.org project, which is provided by circl.lu. For more information visit https://www.cve-search.org/api/.

## Confidentiality information:

The queries are made using the determined CPE via the circl.lu API. For further information on the confidentiality of the circl.lu API, please visit https://www.circl.lu/services/cve-search/ directly.

The best way is to install cve-search (https://github.com/cve-search/cve-search) locally and use your own API with

    nmap -sV --script freevulnsearch --script-args apipath=<URL> <target>

## Installation:

You can either specify the script path directly in the NMAP command, for example

    nmap -sV --script ~/freevulnsearch <target>

or copy the script into the appropriate directory of your NMAP installation.

    In KALI LINUX™ for example: /usr/share/nmap/scripts/

    sudo nmap --script-ubdatedb

Important note: First read the confidentiality information. It is recommended to run freevulnsearch.nse separately without additional NSE scripts. If you do not want to make an assignment to the category safe, vuln and external, then do not execute the nmap --script-updatedb command mentioned above.

## Usage:

The usage is simple, just use NMAP -sV and this script.

    nmap -sV --script freevulnsearch <target>
    
According to my tests, for stability reasons, only http without TLS should be used when querying the API for many simultaneous requests. For this reason, you can optionally disable TLS using an input argument. Important, after that the API query to circl.lu is unencrypted.

    nmap -sV --script freevulnsearch --script-args notls=yes <target>
    
If you scan with the categories safe or vuln then exclude the script or the category external or do not add the script to the NMAP default directory. It is recommended to run freevulnsearch.nse separately without additional NSE scripts.

## CPE exception handling for format:

If a NMAP CPE is not clear, several functions in the freevulnsearch.nse script check whether the formatting of the CPE is inaccurate. For example:

* (MySQL) 5.0.51a-3ubuntu5 -to- 5.0.51a
* (Exim smtpd) 4.90_1  -to-  4.90
* (OpenSSH) 6.6.1p1  -to-  6.6:p1
* (OpenSSH) 7.5p1  -to-  7.5:p1
* ...

Special thanks to the open source community for many useful ideas that accelerated the creation of this script!
Further ideas and suggestions for improvement are very welcome.

*KALI LINUX™ is a trademark of Offensive Security.*

*Translated with www.DeepL.com/Translator - Thanks:-)*
