tyda
====
##### Overview
Get English to Swedish translations from tyda.se from the Linux commandline!<br>
<br>
This is a first prototype. Only swedish to english translation is supported.<br>
This script requires curl and tidy html to be installed and accessible via the PATH variable in the shell.<br>
##### Installation
Clone the repository:<br>
`git clone https://github.com/R4zzM/tyda.git`<br>
<br>
Move into the folder:<br>
`cd tyda`<br>
<br>
Run make install target as root:<br>
`sudo make install`<br>
##### Usage
On the commandline:<br>
`tyda word-to-translate`<br>
##### Troubleshooting
To run tests do:<br>
`make tests`<br>
<br>
Be aware that some of the tests will test that the tyda API has not changed and will thus require a working internet connection.<br>
If you are located behind a proxy make sure that it is active in the shell. To set it do:<br>
`export http_proxy=<proxy>`
