
**Connecting with Terminal (Mac users)**

Mac OS X comes with its own implementation of OpenSSH, so you don't need to install any third-party software to take advantage of the extra security SSH offers — just open a terminal window and jump in.

If you haven't already created a dock icon for "Terminal", open your Macintosh HD and go to the Applications folder, then Utilities from within that. Terminal is in the Utilities folder. Just drag it on to the Dock, and it'll make a permanent Dock icon.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/SSH%20guide%20basics%20-%20Mac/terminalicon.png)

In the command-line (versus graphical) interface window enter:

```
ssh username@servername.feralhosting.com
```

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



