Forked from <https://github.com/AonCyberLabs/Windows-Exploit-Suggester>

# Features
- Compares a targets patch levels against the Microsoft vulnerability database to detect potential missing patches.
- Notifies if there are public exploits and Metasploit modules available.
- Automatically download the security bulletin database from Microsoft.

# Installation
```bash
sudo apt install pipenv
make
```

# Usage
```bash
# update 
pipenv run ./windows-exploit-suggester.py --update

# run, The output shows either public exploits (E), or Metasploit modules (M) as indicated by the character value
pipenv run ./windows-exploit-suggester.py --database 2014-06-06-mssb.xlsx --systeminfo systeminfo.txt 

# possible exploits for an operating system can be used without hotfix data
pipenv run ./indows-exploit-suggester.py --database 2014-06-06-mssb.xlsx --ostext 'windows server 2008 r2' 
```

# Limitations
- Currently, if the 'systeminfo' command reveals 'File 1' as the output for the hotfixes, it will not be able to determine which are installed on the target. If this occurs, the list of hotfixes will need to be retrieved from the target host and passed in using the --hotfixes flag
- It currently does not seperate 'editions' of the Windows OS such as 'Tablet' or 'Media Center' for example, or different architectures, such as Itanium-based only
- False positives also occur where it assumes EVERYTHING is installed on the target Windows operating system. 
- If you receive the 'File 1' output, try executing 'wmic qfe list full' and feed that as input with the --hotfixes flag, along with the 'systeminfo'

# License
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

