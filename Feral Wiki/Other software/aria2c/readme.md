
aria2 is a lightweight multi-protocol & multi-source command-line download utility. It supports HTTP/HTTPS, FTP, BitTorrent and Metalink. aria2 can be manipulated via built-in JSON-RPC and XML-RPC interfaces.

[aria2c command documentation](http://aria2.sourceforge.net/manual/en/html/aria2c.html)

### Using the aria2c Windows Command line binary with the Web Gui

**1:** Getting the [aria2c](http://aria2.sourceforge.net/) executable.

**Important note:** This is required for use with the Web Gui. The Web Gui does not come with the binary.

[aria2c 1.17.1 x86](http://sourceforge.net/projects/aria2/files/stable/aria2-1.17.1/aria2-1.17.1-win-32bit-build1.zip/download) or [aria2c 1.17.1 x64](http://sourceforge.net/projects/aria2/files/stable/aria2-1.17.1/aria2-1.17.1-win-64bit-build1.zip/download) - Windows command line executable. 

**2:** Getting [Aria2c Web Gui](https://github.com/ziahamza/webui-aria2/) - A very simple Web application that you can download and run in any browser.

[Aria2c Web Gui download](https://github.com/ziahamza/webui-aria2/archive/master.zip)

**3:** Unpacking the files and set-up:

### aria2c.exe

**Important note:** This section is aimed at getting the aria2c process running as simply as possible for use with the Web Gui. In the Web Gui you can configure many of aria2c's options and settings per session. Please see the custom set-up section for a more advanced set-up using a custom `.conf` file, if you want certain settings to persist like username or site specific settings.

Extract the `aria2c.exe` the the root of your C drive.

~~~
C:\aria2c.exe
~~~

**Important note:** The command below uses this location to start aria2c.

**Important note:** A note on download paths: aria2c will download files to the location from which the `aria2c.exe` from executed by default. 

To deal with this you can:

1: You can set a path in the Web Gui once `aria2c.exe`. This will stick for this session only (until aria2c.exe is restarted)

2: Using the arguments `--dir=some/path` or `-d some/path` when starting `aria2c.exe`. When used like this:

~~~
-d downloads
~~~

or 

~~~
--dir=downloads
~~~

aria2c will create a new folder relative (in the same place) to the `aria2c.exe` when you start a download and use this location to store downloads.

**Important note:** I tried using dynamic Windows paths using `%UserProfile%` in the start up parameters. While this seems to work at first, on restart aria2c gets confused about this path refuses to work. You will need to use direct links to folders or paths relative to the `aria2c.exe` (paths relative to the `aria2c.exe`).

Press and hold the `Windows Key` then press `R` to open the run prompt.

If you copy and paste this command into the prompt it will load and run aria2c in the command prompt window.

~~~
C:\aria2c.exe --enable-rpc=true --check-certificate=false -d downloads -x 16 -s 16 -j 10
~~~

For a full list of options and their defaults please refer to this page:

[aria2c command documentation](http://aria2.sourceforge.net/manual/en/html/aria2c.html)

**Important note:** If you close the command prompt window that opens you will terminate the `aria2c.exe` process. See the custom set-up below to avoid this.

Now jump to the aria Web Gui section

### aria2c custom setup

`aria2c.exe` or the Web Gui do not remember your configuration settings if you restart `aria2c.exe` The `aria2c.bat` or `aria2.conf`  files are easily edited to add or remove command line options that suit your needs. This means it will always start with the settings you want. Also to have the program run in the background (no command prompt window) making it set and forget you need to use this custom set-up:

This set-up will allow you to easily download from password protected http/s folders and ftp by using a custom `.conf`.

**What is this custom set-up then? **

This is the aria2c v1.17.1 x64 exe, in a folder that includes a `aria2c.bat`, a `runme.vbs` file and a custom `aria2.conf` with some pre configured settings.

The `aria2c.bat` file contains the command we use to run aria2c. In this case, executing it and loading our custom `aria2.conf`. You can tweak the `aria2c.bat` or the `aria2.conf` to decide start-up parameters

The `aria2.conf` contains our unique settings in a way that is easily customisable.

Apart from some Windows specific things like the `.bat` and `.vbs` file, the start-up command used and `.conf` settings should apply to any platform.

This is the start-up command used in the custom set-up.

~~~
aria2c.exe --conf-path=settings/aria2.conf
~~~

You should be able to use the included `.conf` on Mac or Linux.

**Important note:** Where a setting has not been included in the `aria2.conf` it is because the default setting is more than fine for almost all needs. For a full list of options and their defaults please refer to this page:

[aria2c command documentation](http://aria2.sourceforge.net/manual/en/html/aria2c.html)

The `runme.vbs` checks to see if aria is already running before executing the bat file to prevent duplicate running processes.

**1:** Download the zip, extract the `aria2c` inside it to anywhere you like.

**2:** Navigate to this extracted directory and double click on the `runme.vbs`.

**Important note:** You can customise the `aria2c.exe` settings from with the Web Gui that will stick as long as the `aria2c.exe` does not restart. For permanent settings you will need to customise the `aria2c.bat`.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/aria2c/aria2ccustom.png)

[Download the aria2c x64 custom set-up zip](http://git.io/aNq7DA)

[Download the aria2c x86 custom set-up zip](http://git.io/YBHVGA)

You can create multiple `.conf` files that have different settings as templates for various needs.

This custom set-up has been tested and works with this FAQ including with _h5ai: [Putting your WWW folder to use](https://www.feralhosting.com/faq/view?question=20)

You will need to edit the `aria2.conf` and add your credentials before you start the `aria2c.exe`

~~~
# Credentials
# http/s like your rutorrent login and pass
http-user=
http-passwd=
# You ftp details. Either from feral or from the proftpd FAQ
ftp-user=
ftp-passwd=
~~~

### aria2c Web Gui

This can literally be run from anywhere you want.

So extract the folder somewhere and then browse into it.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/aria2c/webgui.png)

You should see this:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/aria2c/webguisuccess.png)

If you see this, aria2c is not running.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/aria2c/webguifail.png)

For each session you can configure settings via the Web Gui. 

**Important note:** These settings will last until you close or restart the `aria2c.exe` process.
 
### uget a front end for aria2c Linux or Windows

[Uget download Manager](http://ugetdm.com/) is a cross platform program download manager. It is also a useful front end for aria2c.

**Important note:** This program uses aria2c v1.16 x86

1: Download [uget](http://sourceforge.net/projects/urlget/files/latest/download?source=files) for Windows.

2: Extract the contents of the archive to a folder.

Inside this folder you will see this, navigate into the `bin` folder

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/aria2c/uget1.png)

Find and run the `uget.exe`

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/aria2c/uget2.png)

This is what you will see:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/aria2c/uget3.png)

Go to `Edit` and then click on `Settings...`

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/aria2c/uget4.png)

Click on the `Plug in` tab:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/aria2c/uget5.png)

Activate the use of aria2c. Customise the commands if needed.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/aria2c/uget6.png)

You are now ready to use aria2c with uget.



