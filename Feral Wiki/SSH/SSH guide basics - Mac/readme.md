
**Connecting with Terminal (Mac users)**

Mac OS X comes with its own implementation of OpenSSH, so you don't need to install any third-party software to take advantage of the extra security SSH offers — just open a terminal window and jump in.

If you haven't already created a dock icon for "Terminal", open your Macintosh HD and go to the Applications folder, then Utilities from within that. Terminal is in the Utilities folder. Just drag it on to the Dock, and it'll make a permanent Dock icon.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20basics%20-%20Mac/terminalicon.png)

In the command-line (versus graphical) interface window enter:

~~~
ssh username@servername.feralhosting.com
~~~

Press **enter** to send the command to the server. You will now be prompted for you password.

Please see the [Slot Details](http://www.feralhosting.com/manager/) pages to look up your server name, SSH username and password.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/General/Your%20Feral%20slot%20is%20active%20-%20Part%201%20-%20The%20Account%20Manager/02%20slot%20detail%201.png)

**Do not type it in** — copy it (be careful not too introduce extra white spaces) paste it by pressing: 

**command-v** 

or

**middle-click on a 3-button mouse** 

To paste it in.

**There will be no visual response when you paste in your password** — this is a security measure so that your password cannot be stolen by someone looking over your shoulder. Simply paste it and press **enter** to send the password to the server.

At this point you should be logged into your Feral server and ready to execute commands in shell.

### OS X Built-in SSH Client - oxssh

ssh is the built-in OS X SSH client and is very powerful and simple to use if you follow the instructions in this guide.

**Connecting Via SSH using the default password and using private key files.**

**1:** In terminal on mac run

~~~
ssh-keygen -t rsa
~~~

- enter for default file save location
- enter when prompted for passphrase (no passphrase)
   
**2:** Then run:

~~~
cat ~/.ssh/id_rsa.pub | pbcopy
~~~

to copy the key to your clipboard

**3:** Then run:

~~~
ssh -l <feralusername> <servername>.feralhosting.com
~~~

- replace `feralusername` and  `servername` with your own details 
- use the SSH password from your feral Manager webpage
   
**4:** Once logged into your feral slot via ssh run:

~~~
nano ~/.ssh/authorized_keys
~~~

**5:** Paste your clipboard contents into the file, ensuring that the contents are all on one line (remove line breaks)
**6:** **Ctrl-X** to exit nano. Be sure to say yes to save
**7:** Type **exit** to leave ssh session on feral slot

#### Creating SSH tunnels:

**1:** In terminal, type 

~~~
ssh -D 55555 -l <feralusername> <servername>.feralhosting.com
~~~

- replace <feralusername> and <servername> with your own details (Don't include the <>)
- you can change 55555 to another port number if you wish

**2:** You have now created an Socks proxy on port 55555. See instructions later in this article for instructions on how to use this proxy.

#### Creating SSH tunnels in background

You can semi-automate the above process by creating an alias for the tunnel command and setting it up to run in a screen session in the background

**1:** in terminal type 

~~~
nano ~/.bash_profile
~~~

**2:** In the resulting  editor window type 

~~~
alias feraltun="screen ssh -D 55555 -l <feralusername> <servername>.feralhosting.com"
~~~

- replace <feralusername> and <servername> with your own details (Don't include the <>)
- you can change 55555 to another port number if you wish

**3:** Ctrl-X to exit nano. Be sure to say yes to save

**To use your new alias:**

**1:** Start a new terminal session (type exit to leave the old one if still open)

**2:** Type:

~~~
feraltun
~~~
 
- your SSH tunnel is now active

**3:** Type Ctrl-A-D to put the tunnel in the background

**4:** You can now close terminal and use your tunnel

`If you have any questions about this procedure for OS X or suggestions on improving the instructions, please contact liriel in IRC.`



