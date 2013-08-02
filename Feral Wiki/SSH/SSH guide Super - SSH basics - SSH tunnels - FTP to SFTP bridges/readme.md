
If all you need is very quick and simple SSH access using PuTTy or Mac [use this guide](https://www.feralhosting.com/faq/view?question=12).

**Please read this Section First:**

The guide follows a specific format for each section.

**1:** Basic connection using the default pass phrase (usually image 1 & 2 only)

**2:** Using keyfiles to connect ( the guide assumes you have already created these as it does not explain how)

**3:** Creating SSH Tunnels.

**4:** SFTP Bridges where applicable.

**Important note:** You ONLY need to use the stages that apply to what you want to do.

The guide is **Comprehensive** so it covers all stages. You do not actually need to complete every stage. Just the relevant ones. So if you only want to connect using a password for Kitty then follow those steps first section of the Kitty guide.

If you want to connect using a pass-phrase and key file then create a SSH tunnel using XShell then use only steps 2 & 3 from the XShell section.

Each Section is labelled. 

- Please actually look/skim over the whole section you are interested in.
- This Comprehensive Guide is going to cover these aspects where applicable.
- Basic SSH configuration to connect to your slot
- Saving passwords where applicable
- Using keyfiles and pass phrases and key file management using PAGEANT
- Creating SSH tunnels
- FTP to SFTP Bridge for mounting your remote slot as a local file system ( this means you can browse it with explorer like an external drive)
- Basic guide to using tunnels with applications and related network settings

We are going to cover 4 SSH client/programs for basic usage with Feral. The guide will not cover advanced usage for any particular app. What is will show is how to use each app to SSH using a password or public/private key file and use those apps to create a SSH tunnel, and with Bitvise SSH client and Mindterm, set up FTP to SFTP Bridges. `All  of these apps are free for Home or Personal use or use a free edition`

### CONTENTS OF THIS GUIDE

**Important note:** Each listed Contents has a Legend to help easily locate the section of the guide you are interested in. Search for text on the page pressing and holding `CTRL` and then pressing `F`. Now search for the legends, for example: `xsssh` will return the start of the XShell section

#### SSH Clients:

Xshell 4 SSH Client (recommended by guide author, a very good tabbed terminal) - xsssh

Bitvise SSH Client ( Formerly Tunnelier) - bvssh

Kitty SSH Client (a updated version of PuTTy) - ktssh

Mindterm SSH CLient ( a java SSH client) - mtssh

OS X Built-In SSH client - oxssh

#### Mounting Remote file systems as local drives using:

Netdrive - requires an SFTP Bridge - ndmnt

Gladinet (starter edition) - requires an SFTP Bridge - gnmnt

SFTP Net Drive - sftpnd

#### Key File management:

PAGEANT - pagnt

#### Applications and tunnels

Basic usage - bcusg

Firefox - firfx

Chrome - chrme

### Xshell 4  SSH Client (recommended by guide author) - xsssh

Xshell is a very good SSH client with many useful and advanced features such as tabbed sessions, saving passwords, themes and lots more all available for free for home/personal use.

#### Download XShell - 

[Download XShell - email required](http://www.netsarang.com/download/down_xsh.html)

If you are asked to save the Host's Key, say yes and check to any options/boxes to remember this/always do this.

This guide assumes you have created a private key according to this FAQ: [Setting up Public Key Authentication for Password-less Login](https://www.feralhosting.com/faq/view?question=13)

#### Topics covered:

- Connecting Via SSH using the default password and using private key files.
- Creating SSH tunnels.

#### INFORMATION

It is important to note that completing the whole guide is not Required to use xshell to connect to your slot. Complete the steps in images 1 & 2 to use xshell in the conventional way

#### Key Features :

- Saves Passwords and Key file Pass phrases
- Easily configure multiple SSH tunnels from a single GUI.
- Tabbed Gui
- Gui is feature rich with copy and paste option, theme changing.

**Important note:** Can be used with the free for home use lightweight SFTP/FTP client [xftp4](http://www.netsarang.com/products/xfp_overview.html)

Basically a very good SSH/terminal program. Very customisable look and feel.

#### Getting started

After you have Downloaded and Installed XShell 4, run the application and you will see a window similar to this: Follow the instructions in the images.

So click on the `New Session` icon to open the Session Properties. ( the short cut for this ALT + N )

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/xshell/1.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/xshell/2.png)

NOTE: If you click OK and then connect here you can use XShell in the conventional (putty) way with your default password found in your Manager/Slot/Server page.

#### Authentication using a Username and Password

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/xshell/3.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/xshell/4.png)

#### Authentication using a public/private key and Username

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/xshell/5.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/xshell/6.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/xshell/7.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/xshell/8.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/xshell/9.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/xshell/10.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/xshell/11.png)

#### Creating our SSH tunnel

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/xshell/12.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/xshell/13.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/xshell/14.png)

#### Finalizing the setup and connecting

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/xshell/15.png)

You are now connected if all went well and your screen will look something like this.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/xshell/16.png)

### Bitvise SSH Client - bvssh

DOWNLOAD = [Get from here](http://www.bitvise.com/ssh-client-download)

If you are asked to save the HOSTs Key say yes and check and box that says to remember/always do this.

This guide assumes you have created a private key according to this** Guide :** [Setting up Public Key Authentication for Password-less Login](https://www.feralhosting.com/faq/view?question=13)

#### Topics covered:

**Connecting Via SSH using the default password and using private key files.**

- Creating SSH tunnels.
- Creating a FTP to SFTP Bridge to mount your slot as a local file system with Netdrive or Gladinet Starter Edition

#### INFORMATION

It is important to note that completing the whole guide is not Required to use Tunnelier to connect to your slot. Complete the steps in images 1 & 2 to use Tunnelier in the conventional way

#### Key Features :

- Easy to configure and use.
- Nice stable program with a feature rich GUI
Easy to set up SSH tunnels
Built in SFTP file transfer/browser support.
FTP to SFTP Bridge for mounting your remote slot as a local file system (this means you can browse it with explorer like an external drive)

#### Getting Started with Bitvise SSH Client

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/tunnelier/1.png)

#### Using the Default password

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/tunnelier/2.png)

#### Using a Public/Private key file

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/tunnelier/3.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/tunnelier/4.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/tunnelier/5.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/tunnelier/6.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/tunnelier/7.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/tunnelier/8.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/tunnelier/9.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/tunnelier/10.png)

#### Creating a SSH Tunnel

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/tunnelier/11.png)

#### Creating a FTP to SFTP Bridge to mount your slot as a local file system with Netdrive or Gladinet Starter Edition

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/tunnelier/12.png)

### Kitty SSH Client - ktssh

DOWNLOAD =   [an actively maintained fork or PuTTy with many extra features (like saving passwords)](http://www.9bis.net/kitty/?page=Download)

If you are asked to save the HOSTs Key say yes and check and box that says to remember/always do this.

This guide assumes you have created a private key according to this **Guide :** [Setting up Public Key Authentication for Password-less Login](https://www.feralhosting.com/faq/view?question=13)

Kitty is very similar to putty but with some long missed features, also is a direct replacement for putty meaning you can rename it to putty.exe and use it wherever an app needs putty or in terms of portability.

**So the FIRST thing to do is rename kitty.exe to putty.exe now.**

Topics covered:

- Connecting Via SSH using the default password and using private key files.
- Creating SSH tunnels.

For tabbed interface / session management of PuTTy/KiTTy.

[mremoteNG](http://www.mremoteng.org/)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/putty/mremoteNG.png)

[Super Putty](http://code.google.com/p/superputty/)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/putty/Super-Putty.jpg)

#### INFORMATION

It is important to note that completing the whole guide is not Required to use Kitty to connect to your slot. Complete the steps in images 1 & 2 to use Kitty in the conventional way

#### Getting Started with KiTTy

**So the FIRST thing to do is rename kitty.exe to putty.exe now.**

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/kitty/1.png)

#### Connect using a username and password

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/kitty/2.png)

#### Connect using a key file and pass phrase

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/kitty/3.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/kitty/4.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/kitty/5.png)

#### Create a SSH Tunnel with KiTTy

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/kitty/6.png)

**Don't forget to SAVE your session under the original Session page in the first image.**

### Putty 0.62

DOWNLOAD - [get the latest putty installer](http://the.earth.li/~sgtatham/putty/latest/x86/putty-0.62-installer.exe)

There are already a million and 1 guides for putty and we don't need another one. Everything that works for putty works for KiTTy. Kitty is a better version of putty and %100 compatible if you rename it from kitty.exe to putty.exe

### Mindterm a java based SSH client - mtssh

DOWNLOAD = [Mindterm 4.1.1 (recommended version)](http://tech.cryptzone.com/download/MindTerm-4.1.1/mindterm_4.1.1-bin.zip)

If you are asked to save the HOSTs Key say yes and check and box that says to remember/always do this.

This guide assumes you have created a private key according to this** Guide :** [Setting up Public Key Authentication for Password-less Login](https://www.feralhosting.com/faq/view?question=13)

Mindterm is a java based SSH client. This means is is Cross Platform and will work anywhere the Java Run time is present.

#### Topics covered:

- Connecting Via SSH using the default password and using private key files.
- Creating SSH tunnels.
- Creating a FTP to SFTP Bridge to mount your slot as a local file system with Netdrive or Gladinet Starter Edition

#### INFORMATION

It is important to note that completing the whole guide is not Required to use Mindterm to connect to your slot. Complete the steps in images 1 & 2 to use Mindterm in the conventional way

#### Key Features:

- Simple to use
- Cross Platform
- Can create SSH Tunnels
- Can create FTP to SFTP Bridges to mount your slot as a local file system( this means you can browse it with Explorer like and external drive)[/i]

#### Getting Started with Mindterm 4.1.1

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/mindterm/1.png)

#### Connect using your default password

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/mindterm/2.png)

#### Connect using a Key file and Pass phrase

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/mindterm/3.png)

#### Create a SSH tunnel

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/mindterm/4.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/mindterm/5.png)

#### Create a FTP to SFTP bridge

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/mindterm/6.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/mindterm/7.png)

### OS X Built-in SSH Client - oxssh

ssh is the built-in OS X SSH client and is very powerful and simple to use if you follow the instructions in this guide.

**Connecting Via SSH using the default password and using private key files.**

**1:** In terminal on mac run

```
ssh-keygen -t rsa
```

- enter for default file save location
- enter when prompted for passphrase (no passphrase)
   
**2:** Then run:

```
cat ~/.ssh/id_rsa.pub | pbcopy
```

to copy the key to your clipboard

**3:** Then run:

```
ssh -l <feralusername> <servername>.feralhosting.com
```

- replace `feralusername` and  `servername` with your own details 
- use the SSH password from your feral Manager webpage
   
**4:** Once logged into your feral slot via ssh run:

```
nano ~/.ssh/authorized_keys
```

**5:** Paste your clipboard contents into the file, ensuring that the contents are all on one line (remove line breaks)
**6:** **Ctrl-X** to exit nano. Be sure to say yes to save
**7:** Type **exit** to leave ssh session on feral slot

#### Creating SSH tunnels:

**1:** In terminal, type 

```
ssh -D 55555 -l <feralusername> <servername>.feralhosting.com
```

- replace <feralusername> and <servername> with your own details (Don't include the <>)
- you can change 55555 to another port number if you wish

**2:** You have now created an Socks proxy on port 55555. See instructions later in this article for instructions on how to use this proxy.

#### Creating SSH tunnels in background

You can semi-automate the above process by creating an alias for the tunnel command and setting it up to run in a screen session in the background

**1:** in terminal type 

```
nano ~/.bash_profile
```

**2:** In the resulting  editor window type 

```
alias feraltun="screen ssh -D 55555 -l <feralusername> <servername>.feralhosting.com"
```

- replace <feralusername> and <servername> with your own details (Don't include the <>)
- you can change 55555 to another port number if you wish

**3:** Ctrl-X to exit nano. Be sure to say yes to save

**To use your new alias:**

**1:** Start a new terminal session (type exit to leave the old one if still open)

**2:** Type:

```
feraltun
```
 
- your SSH tunnel is now active

**3:** Type Ctrl-A-D to put the tunnel in the background

**4:** You can now close terminal and use your tunnel

`If you have any questions about this procedure for OS X or suggestions on improving the instructions, please contact liriel in IRC.`

### FTP to SFTP Bridge - Mount your slot as a local file system.

Well there are a few ways to achieve this.

First way - [use the DOKAN guide here](https://www.feralhosting.com/faq/view?question=136).

Two two other free programs are capable of creating a FTP to SFTP bridge that 2 more programs can then mount as a local filesystem.

`You must have already set up either Bitvise SSH Client or Mindterm and created an FTP to SFTP Bridge before you can use Netdrive or Gladinet to mount your remote file system`

[Bitvise Tunnelier](http://www.bitvise.com/ssh-client-download) + [Netdrive](http://www.netdrive.net/download.html) or [Gladinet (starter version)](http://gladinet.com/p/download_starter_V4.htm).

[Mindterm 4.0 (recommended version)](http://tech.cryptzone.com/download/MindTerm-4.0/mindterm_4.0-bin.zip) (requires Jave Run Time) + [Netdrive](http://www.netdrive.net/download.html) - Gladinet does not play nice with Mindterm

There are two versions of Mindterm. V4.0 and v3.4.2. For this guide i recommend version 4.0 as it is stable to use with Feral slots when using the FTP the SFTP Bridge with Netdrive.
[Here is the link to the download page for both versions in case of issues and for the documentation](http://tech.cryptzone.com/mindterm/mindterm.html)

#### Settings For Netdrive - ndmnt

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/SFTPbridge/netdrive.png)

#### Settings For Gladinet from the Management Console - gnmnt

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/SFTPbridge/glad%201.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/SFTPbridge/glad%202.png)

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

Copy and paste your shortcut here

### Using SSH Tunnels with your applications:

**Basic usage - bcusg**

On Windows once you have created and opened your tunnels you need to configure you applications to use them.

This guide cannot possibly cover each and every program. Also your program needs to support proxying in some way.

This will usually be in the settings or preferences somewhere under the title of

Proxy  / Network Settings / Connection Settings

Now with most apps you can either proxy directly using settings or with addons or plugins of some type like foxyproxy in firefox.

#### FireFox's Connection settings

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/applications/settings.png)

#### Filezilla proxy settings

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/applications/filezilla.png)

#### Firefox - firfx

[Firefox Foxy Proxy](https://addons.mozilla.org/en-US/firefox/addon/foxyproxy-standard/)

This is the best method for firefox. A very customizable proxy addon. 

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/applications/foxyproxy1.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/applications/foxyproxy2.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/applications/foxyproxy3.png)

#### Chrome - chrme

[Chrome Proxy SwitchySharp](https://chrome.google.com/webstore/detail/proxy-switchysharp/dpplabbmogkhghncfbfdeeokoefdjegm)

Chrome does not give the user any useful built in network/proxy options. The plugin below is the best choice to do this (it is a good plugin)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/applications/proxysharp.png)

After you have saved, you can click on the icon to select from any configured proxies.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20Super%20-%20SSH%20basics%20-%20SSH%20tunnels%20-%20FTP%20to%20SFTP%20bridges/applications/proxysharp2.png)