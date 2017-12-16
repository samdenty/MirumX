## What is MirumX? ##
MirumX is an open-source batch application system that simplifies the process of making batch applications by using custom APIs. 

MirumX was inspired from a previous project I had worked on, [SD-Security](http://mirum.weebly.com/sd-security.html). My vision of MirumX, was to make Batch File app system that isn't totally reliant on itself, but instead on updatable APIs. This means that the same launcher can look and run totally different, because the APIs can be customized and updated, without changes to the main launcher.

## What kind of APIs are there? ##
There are all sort of APIs available, from **Lists** to **Crash helpers** to **AppEngines**, they all make writing Batch programs fast, easy and scalable. APIs are called by appending `%API%` before the API name and parameter(s). Any type of executable can be used, including:

- **VBScripts** (.vbs)
- **Powershell scripts** (.vb1)
- **Batch files** (.bat)
- **Executables** (.exe)
- **Shell scripts** (.sh)
- **C scripts** (.c)<br>**...**

<h4>Some included APIs:</h4>

- AdvAuth
- Crypt
- Download
- Email
- FileSegment
- Header
- HiddenProcess
- Sha3<br> **...**


## How to use APIs ##
APIs are accessible by using the `%API%APIName` format. Some examples:

> Basic script to print a header
> 
	%API%Header "This is a test page" "Test page"
> Output:<br><br>
> <img src="https://s10.postimg.org/pdexmv4o9/image.png" width=450px>
> 
## ##

> Script to print a header and then display a list:
> 
	%API%Header Example
	%API%List "Option 1" command "Option 2" command "Option 3" command
> Output:<br><br>
> <img src="https://s31.postimg.org/nkgyfnh57/image.png" width=450px>
## ##

> Script to print a header and then display a switch list:
> 
 	%API%Header "Example 2"
 	%API%Switch /list "Switch one" sw1 "Switch two" sw2 "Switch three" sw3
 	%API%Switch /check sw1 "echo checked" "echo Not checked"
 	%API%Switch /check sw2 "echo checked" "echo Not checked"
 	%API%Switch /check sw3 "echo checked" "echo Not checked"
> Output:<br><br>
> <img src="https://s31.postimg.org/kp3ep9r0r/image.png" width=450px>

[![Analytics](https://ga-beacon.appspot.com/UA-85426772-5/MirumX/?pixel)](https://github.com/igrigorik/ga-beacon)
