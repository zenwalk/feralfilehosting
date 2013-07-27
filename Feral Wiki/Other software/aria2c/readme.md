
aria2 is a lightweight multi-protocol & multi-source command-line download utility. It supports HTTP/HTTPS, FTP, BitTorrent and Metalink. aria2 can be manipulated via built-in JSON-RPC and XML-RPC interfaces.

[aria2c command documentation](http://aria2.sourceforge.net/manual/en/html/aria2c.html)

### Using the aria2c Windows Command line binary with the Web Gui

1: Getting the [aria2c](http://aria2.sourceforge.net/) executable.

**Important note:** This is required for use with the Web Gui. The Web Gui does not come with the binary.

[aria2c 1.17.1 x86](http://sourceforge.net/projects/aria2/files/stable/aria2-1.17.1/aria2-1.17.1-win-32bit-build1.zip/download) or [aria2c 1.17.1 x64](http://sourceforge.net/projects/aria2/files/stable/aria2-1.17.1/aria2-1.17.1-win-64bit-build1.zip/download) - Windows command line executable. 

2: Getting [Aria2c Web Gui](https://github.com/ziahamza/webui-aria2/) - A very simple Web App that you can download and run in any browser.

[Aria2c Web Gui download](https://github.com/ziahamza/webui-aria2/archive/master.zip)

3: Unpacking and set-up


Extract the files to a folder somewhere practical. I recommend the root of your C drive.

~~~
C:\aria2c.exe
~~~

**Important note:** The command below uses this location.

Press and hold the `Windows Key` then press `R` to open the run prompt.

IF you copy and paste this command into the promtp it will laod and run aria2c in the command promtp window.

~~~
C:\aria2c.exe --enable-rpc=true --check-certificate=false --rpc-listen-port=6800 -x 16 -d "%UserProfile%\My Documents\aria2c"
~~~

To have the program run in the background you will need to run this command from with Command prompt directly:

~~~
START /MIN C:\aria2c.exe --enable-rpc=true --disable-ipv6=true --check-certificate=false --rpc-listen-port=6800 -x 16 -d "%UserProfile%\My Documents\aria2c"
~~~

Or execute is as a `.bat` file.

2: [uget](http://sourceforge.net/projects/urlget/files/latest/download?source=files)

3: With the command line.

aria2c.exe --enable-rpc=true -D --check-certificate=false --rpc-listen-port=6800