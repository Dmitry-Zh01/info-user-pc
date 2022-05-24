# info-user-pc
This repository includes a PowerShell + Windows Forms script concerned with getting info about user and pc

0. Before using: this script is applicable for computers in the same domain

1. Firstly, it is necessary to prepare the script execution.
You can create a new notepad file, which will be saved as .bat and consist of the following:

_@echo off
powershell -executionpolicy RemoteSigned -file "**file location**"
timeout /t 0 /nobreak_

2. Secondly, you shall be awared that additional utilities have been installed: 
- PSExec
- PSService

3. Thirdly, it is necessary to change domain name in 334 line:

_$username = $users1 -replace "**DOMAIN**\W" _

4. Finally, the script should be launched (from .bat file) via administrator credentials.

Good luck, have a nice day!
