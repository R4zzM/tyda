tyda
====
##### Overview
Get English to Swedish translations from tyda.se from the Linux commandline!

Currently only translations from english to swedish are supported.

##### Dependancies
This program requires that curl is available and accessible via the PATH variable in the shell from which you invoke tyda. 

If curl is not installed, please install it before continuing, either from your distributions package manager or by downloading the source and compiling manually from [here][1].
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
If you are located behind a proxy make sure that it is active in the shell. To set it (in bash) do:

`export http_proxy=<proxy>`

[1]: http://curl.haxx.se
