# info-user-pc
This repository includes a PowerShell + Windows Forms script concerned with getting info about user and pc

0. Before using: this script is applicable for computers in the same domain

1. Firstly, it is necessary to prepare the script execution.
You can create a new notepad file, which will be saved as .bat and consist of the following:

_@echo off_

_powershell -executionpolicy RemoteSigned -file "**file location**"_

_timeout /t 0 /nobreak_

2. Secondly, you shall be awared that additional utilities have been installed: 
- PSExec
- PSService

4. Finally, the script should be launched (from .bat file) via administrator credentials.

Good luck, have a nice day!

![ps](https://user-images.githubusercontent.com/106164393/196054750-d36887c0-3837-43c1-8159-88d8730b6b80.PNG)
