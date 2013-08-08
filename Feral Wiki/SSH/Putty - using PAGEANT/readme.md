
### PAGEANT = For use with .ppk - pagnt

This will cover the use of PAGEANT for loading private .PPK keyfiles generated with puttygen with pass phrases for easy use with other programs that do not directly support private key files with pass phrases. As mentioned in the guide for setting up public/private key files, if you use a very complicated password for your keyfile (maybe a password generator) then things can be complicated to set up.

So instead of entering our complicated (or simple) password every time we ssh to our server we can enter it one time and PAGEANT will forward it for us.

#### How to get PAGEANT?

If you have already installed the puTTy installer or downloaded the [snapshot zip](http://tartarus.org/~simon/putty-snapshots/x86/putty.zip) file you have PAGEANT already. For the installer look under the installation directory (Program files (x86)/PuTTy/) or where you extracted the zip file to. You can also get the [snapshot EXE](http://tartarus.org/~simon/putty-snapshots/x86/pageant.exe)

#### How to use PAGEANT?

Now using PAGEANT is a very simple process. You double click on the exe and the programs icons will appear in the task bar. You can right or double click on this icon to "Add Key". Point the program to where you keyfile is located and it will ask for a pass phrase and then load your key into memory.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/pageant/1.png)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/pageant/2.png)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/pageant/3.png)

#### Create a Unique shortcut for you keyfile

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/pageant/4.png)

**Target:** "C:\Program Files\PuTTY\pageant.exe" C:\Path\to\myKeys\MyKey.ppk

For multiple keys this is where the field "Start in" can help. By changing it we can tell Pageant to start in the folder containing our keys and load them by file name:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/pageant/4.5.png)

**Target:** "C:\Program Files\PuTTY\Pageant.exe" key1.ppk key2.ppk key3.ppk

**Start in:** "C:\Documents and Settings\myaccount\My Documents\myKeys"

**Have it start with Windows**

You will need to add this new shortcut you you startup folder. Which is located here ( replace USERNAME with your own)

press the Windows + R and enter this in the run box.( you need to have Replaced USERNAME with your own.)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/pageant/5.png)

**C:\Users\USERNAME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\**

Copy and paste your short cut here



