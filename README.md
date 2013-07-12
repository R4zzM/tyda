tyda
====
##### Overview
Get English to Swedish translations from tyda.se from the Linux commandline!

This is a first prototype. Only swedish to english translation is supported.
This script requires curl and tidy html to be installed and accessible via the PATH variable in the shell.
##### Installation
`git clone https://github.com/R4zzM/tyda.git`

`cd tyda`

`sudo make install`
##### Usage
On the commandline:

`tyda <word-to-translate>`
##### Troubleshooting
There are some tests that can be run to make sure tyda is working as it should:

`make tests`

Be aware that some of the tests will test that the tyda API has not changed and will thus require a working internet connection.<br>
If you are located behind a proxy make sure that it is active in the shell. To set it do:

`export http_proxy=<proxy>`
