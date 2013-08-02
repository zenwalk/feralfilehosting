
This Guide will allow you to mount your Feral slots remote file system as a local file system through SFTP.

To do this you need meet these requirements:

1: You have a Feral slot that has been activated and you can SSH to. This means that your FTP/SFTP/SSH user name and password have been set-up and and are visible from your [**Install Software** link in your Manager](https://www.feralhosting.com/manager/)

2: You downloaded and installed these items in the order listed.

### Step 1

**Important note:** Windows 8 users must use Windows 7 compatibility mode on this installer.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Mount%20Your%20Server%20as%20a%20Local%20Filesystem%20-%20Windows%20and%20Dokan/compat%201.png)

Download and install this: 

[Dokan Libraries](http://dokan-dev.net/wp-content/uploads/DokanInstall_0.6.0.exe) you will need to install this first, reboot if asked.

**Important note:** If you see this box on Windows 8 just click "This program ran correctly" option:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Mount%20Your%20Server%20as%20a%20Local%20Filesystem%20-%20Windows%20and%20Dokan/compat%202.png)

### Step 2

This step requires some pre requisites in order to be installable:

**1:** You will need to install `Net 2.0` if you do not already have it. It comes as part of the `Net 3.5` web installer linked here:

[Net 3.5 x86 and x64](http://www.microsoft.com/en-us/download/details.aspx?id=21)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Mount%20Your%20Server%20as%20a%20Local%20Filesystem%20-%20Windows%20and%20Dokan/sshfs.0.2.0%201.png)

**2:** You must install this Visual C++ 2005 SP1 x86 in order to install Dokan sshfs 0201226. It does not matter if you are on a x64 OS. You must have this x86 runtime.

[Microsoft Visual C++ 2005 SP1 Redistributable Package (x86)](http://www.microsoft.com/en-gb/download/details.aspx?id=5638)

If you do not do this you will get this error when trying to install sshfs 0.2.0:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Mount%20Your%20Server%20as%20a%20Local%20Filesystem%20-%20Windows%20and%20Dokan/sshfs.0.2.0%20error.png)

Once you have installed both of these you can download and install the sshfs 0.2.0 executable.

[Dokan sshfs 0201226](http://dokan-dev.net/wp-content/uploads/dokan-sshfs-0201226.zip)  install this program. (it requires the Dokan library is installed)

### Step 3

Download and unpack the files:

[Dokan sshfs 0.60](http://dokan-dev.net/wp-content/uploads/dokan-sshfs-0.6.0.zip):  

We will use this to update the dokan-sshfs-0201226 to 0.6.0, Why will we do this? 

"This package doesn't include installer and Explorer extensions which add context menu to Dokan drive and permission setting dialog. If you want to support those features, please install dokan-sshfs-0.2.0.1226 and overwrite DokanNet.dll and DokanSSHFS.exe files by dokan-sshfs-0.6.0".

Now browse to the location you installed it to (if no shortcut is created) for example:

~~~
C:\Program Files\Dokan\DokanSSHFS\
~~~

Or

~~~
C:\Program Files (x86)\Dokan\DokanSSHFS\
~~~

You will need to copy the files from the Dokan sshfs 0.6.0 to this folder and overwrite the files.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Mount%20Your%20Server%20as%20a%20Local%20Filesystem%20-%20Windows%20and%20Dokan/update.0.2.0%201.png)

Confirm the overwrite action:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Mount%20Your%20Server%20as%20a%20Local%20Filesystem%20-%20Windows%20and%20Dokan/update.0.2.0%202.png)

These are the files that have been updated:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Mount%20Your%20Server%20as%20a%20Local%20Filesystem%20-%20Windows%20and%20Dokan/update.0.2.0%203.png)

### Step 4

Then run the DokanSSHFS.exe  located in this folder and enter your details in the windows that pops up:

One the program starts you will see something like this:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Mount%20Your%20Server%20as%20a%20Local%20Filesystem%20-%20Windows%20and%20Dokan/mount.png)

**Important note:** you need to specify the full path to the root of your home directory. So it will be something like:

~~~
/media/DiskID/home/yourusername
~~~

If you want to use a keyfile it will need to be in the OpenSSH format. To convert your PuTTy PPK file to the OpenSSH format do this:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Mount%20Your%20Server%20as%20a%20Local%20Filesystem%20-%20Windows%20and%20Dokan/puttygen.png)

Upon connecting Dokan will tell you that is has started SFTP and then you should see you mounted volume in My computer with the driver letter assigned in the settings. If you get an error about assigning the driver letter check that the Dokanmounter service is running.

this was done on: 

Windows 7 x86 & x64 with no compatibility settings used. Net 2 and 3.5 are included in an updated Windows 7. You must install Microsoft Visual C++ 2005 SP1 Redistributable Package (x86)

Windows 8 x86 & x64 with Windows 7 compatibility settings used. Net 2 and 3.5 must be installed manually. You must install Microsoft Visual C++ 2005 SP1 Redistributable Package (x86)