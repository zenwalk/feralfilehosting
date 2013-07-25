
### Installing cygwin on Windows

First you will need to download and run the Cygwin setup file: [Cygwin setup-x86.exe](http://cygwin.com/setup-x86.exe)

There is a `x64` version but it does not have all the programs we need. Also it installs alongside, in a separate location, from the `x86` files if you want to install it.

### Step 1: Run the setup-x86.exe

Upon running the setup exe you will be presented with this screen. You will have to navigate through these screens as shown in the images.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Cygwin%20-%20Linux%20tools%20on%20Windows/1.png)

Leave it as is and then click next:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Cygwin%20-%20Linux%20tools%20on%20Windows/2.png)

It is recommended to leave the installation directory as the default and for all users. Then click next.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Cygwin%20-%20Linux%20tools%20on%20Windows/3.png)

This is where Cygwin will install the temp files/packages of the core files and the programs your select. Then click next:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Cygwin%20-%20Linux%20tools%20on%20Windows/4.png)

Leave as `Direct Connection` unless you have special requirements for connecting to the internet. Then click next:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Cygwin%20-%20Linux%20tools%20on%20Windows/5.png)

Here you can select a mirror for the files and files list. I always just use the first one. Then click next:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Cygwin%20-%20Linux%20tools%20on%20Windows/6.png)

Cygwin will now download the files lists.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Cygwin%20-%20Linux%20tools%20on%20Windows/7.png)

### Step 2: Select out packages

This is what you will see once you have completed Step 1. This screen can seem quite overwhelming at first, but it is quite simple.

**Important note:**By default Cygwin will only install the basic and critical files it needs to run. 

We want to install these programs:

~~~
cygrunsrv
lftp
cron
openssh
openssl
nano
~~~

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Cygwin%20-%20Linux%20tools%20on%20Windows/apps.1.png)

This is the first program we want to install:

~~~
cygrunsrv
~~~

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Cygwin%20-%20Linux%20tools%20on%20Windows/apps.cygrunsrv.png)

~~~
lftp
~~~

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Cygwin%20-%20Linux%20tools%20on%20Windows/apps.lftp.png)

~~~
cron
~~~

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Cygwin%20-%20Linux%20tools%20on%20Windows/apps.cron.png)

~~~
openssh
~~~

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Cygwin%20-%20Linux%20tools%20on%20Windows/apps.openssh.png)

~~~
openssl
~~~

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Cygwin%20-%20Linux%20tools%20on%20Windows/apps.openssl.png)

~~~
nano
~~~

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Cygwin%20-%20Linux%20tools%20on%20Windows/apps.nano.png)

Once you have selected all the programs above for installation click on `Next` to start the installation process.

### Step 3: Installing the programs

You will see this screen about installing the required dependencies for any programs you have selected.

**Important note:** You need to make sure `Select required packages (RECOMMENDED)` is checked.

Then click on `Next`

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Cygwin%20-%20Linux%20tools%20on%20Windows/finish.1.png)

It will now download an install the programs. This can take some time so be patient.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Cygwin%20-%20Linux%20tools%20on%20Windows/finish.2.png)

Check both options here so it is easier to start the Cygwin terminal.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Cygwin%20-%20Linux%20tools%20on%20Windows/finish.3.png)

You have now successfully installed Cygwin and are ready to start using LFTP.

**Important note:** Re run the setup-x86.exe at any time to add new programs or revome them

### Notes:

I like to use nano in bash as the default editor (for things like crontab).

You can do this per session:

~~~
export "EDITOR=nano"
~~~

Or make it permanent by adding it to your `.bashrc` file.

Your `.bashrc` is located here in a default installation, where `username` if your Windows username:

~~~
C:/cygwin/home/username/.bashrc
~~~

~~~
echo "export EDITOR=nano" >> ~/.bashrc
~~~

~~~
source ~/.bashrc
~~~



