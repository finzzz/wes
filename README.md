# DESCRIPTION
This tool compares a targets patch levels against the Microsoft vulnerability
database in order to detect potential missing patches on the target. It also
notifies the user if there are public exploits and Metasploit modules
available for the missing bulletins.

It requires the 'systeminfo' command output from a Windows host in order to
compare that the Microsoft security bulletin database and determine the 
patch level of the host.

It has the ability to automatically download the security bulletin database
from Microsoft with the --update flag, and saves it as an Excel spreadsheet.

When looking at the command output, it is important to note that it assumes
all vulnerabilities and then selectively removes them based upon the hotfix
data. This can result in many false-positives, and it is key to know what
software is actually running on the target host. For example, if there are
known IIS exploits it will flag them even if IIS is not running on the
target host.

The output shows either public exploits (E), or Metasploit modules (M) as
indicated by the character value. 

It was heavily inspired by Linux_Exploit_Suggester by Pentura.

Blog Post: "Introducing Windows Exploit Suggester", https://blog.gdssecurity.com/labs/2014/7/11/introducing-windows-exploit-suggester.html

# INSTALL
```
sudo apt install pipenv
make
```

# USAGE
```
# update 
pipenv run ./windows-exploit-suggester.py --update

# run
pipenv run ./windows-exploit-suggester.py --database 2014-06-06-mssb.xlsx --systeminfo win7sp1-systeminfo.txt 

# possible exploits for an operating system can be used without hotfix data
pipenv run ./indows-exploit-suggester.py --database 2014-06-06-mssb.xlsx --ostext 'windows server 2008 r2' 
```

# LIMITATIONS
Currently, if the 'systeminfo' command reveals 'File 1' as the output for
the hotfixes, it will not be able to determine which are installed on
the target. If this occurs, the list of hotfixes will need to be 
retrieved from the target host and passed in using the --hotfixes flag

It currently does not seperate 'editions' of the Windows OS such as
'Tablet' or 'Media Center' for example, or different architectures, such as
Itanium-based only

False positives also occur where it assumes EVERYTHING is installed
on the target Windows operating system. If you receive the 'File 1'
output, try executing 'wmic qfe list full' and feed that as input
with the --hotfixes flag, along with the 'systeminfo'

# LICENSE
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

