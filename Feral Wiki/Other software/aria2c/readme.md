
aria2 is a lightweight multi-protocol & multi-source command-line download utility. It supports HTTP/HTTPS, FTP, BitTorrent and Metalink. aria2 can be manipulated via built-in JSON-RPC and XML-RPC interfaces.

[aria2c command documentation](http://aria2.sourceforge.net/manual/en/html/aria2c.html)

### Using the aria2c Windows Command line binary with the Web Gui

1: Getting the [aria2c](http://aria2.sourceforge.net/) executable.

**Important note:** This is required for use with the Web Gui. The Web Gui does not come with the binary.

[aria2c 1.17.1 x86](http://sourceforge.net/projects/aria2/files/stable/aria2-1.17.1/aria2-1.17.1-win-32bit-build1.zip/download) or [aria2c 1.17.1 x64](http://sourceforge.net/projects/aria2/files/stable/aria2-1.17.1/aria2-1.17.1-win-64bit-build1.zip/download) - Windows command line executable. 

2: Getting [Aria2c Web Gui](https://github.com/ziahamza/webui-aria2/) - A very simple Web App that you can download and run in any browser.

[Aria2c Web Gui download](https://github.com/ziahamza/webui-aria2/archive/master.zip)

3: Unpacking the files and set-up:

**aria2c.exe**

Extract the `aria2c.exe` the the root of your C drive.

~~~
C:\aria2c.exe
~~~

**Important note:** The command below uses this location.

Press and hold the `Windows Key` then press `R` to open the run prompt.

If you copy and paste this command into the prompt it will load and run aria2c in the command prompt window.

~~~
C:\aria2c.exe --enable-rpc=true --check-certificate=false -d "%UserProfile%\My Documents\aria2c" -x 16
~~~

To have the program run in the background you will need to run this command from directly within a Command prompt window:

~~~
C:\aria2c.exe --enable-rpc=true --check-certificate=false -d "%UserProfile%\My Documents\aria2c" -x 16
~~~

Or execute is as a `.bat` file.

**Important note:** What is this? This is basically a file that when executed performs a pre-formatted command for you on windows using the command shown above.

aria2c or the Web Gui do not remember your configuration settings if you restart `aria2c.exe` The bat file is easily edited to add or remove command line options that suit your needs. This means it will always start with the settings you want

[aria2c.bat](https://github.com/feralhosting/feralfilehosting/raw/master/Feral%20Wiki/Other%20software/aria2c/scripts/aria2c.bat)

**aria2c Web Gui**

This can literally be run from anywhere you want.

So extract the folder somewhere and then browse into it.

### uget a cross platform front end for aria2c.

1: Download [uget](http://sourceforge.net/projects/urlget/files/latest/download?source=files)

