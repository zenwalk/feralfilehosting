
### transmisson-remote-gui supported platforms:

Windows
Linux
Mac

This software can be installed from the [**Install Software** link in your Manager](https://www.feralhosting.com/manager/) for the slot you wish to use it on.

**Remote GUI Clients for Transmission**

The host name entered should be your server, and the username and password the same for the web interface.

[transmisson-remote-gui](http://code.google.com/p/transmisson-remote-gui/)

**Important note:** The [transmission-remote-dotnet](http://code.google.com/p/transmission-remote-dotnet/) client does not work with our services.

### Transmission Remote GUI Configuration*

![](http://i45.tinypic.com/n5lg5d.jpg)

**use your own username, password, server name and port number**

The **RPC** port can be found in the file. This port is needed to the **Remote Gui** to control Transmission

~~~
~/.config/transmission-daemon/settings.json
~~~

As the number on the line with **rpc-port** in it. This can be found quickly [via SSH](https://www.feralhosting.com/faq/view?question=12) by running the command 

~~~
grep rpc-port ~/.config/transmission-daemon/settings.json
~~~

Users with a large amount of torrents in their account may experience a slow down as it takes much longer to load and subsequently refresh. wTorrent suffers less from this as it does not automatically refresh.

**When Transmission is Unresponsive**

If transmission is frozen you will need to kill it. [Log in via SSH](https://www.feralhosting.com/faq/view?question=12), and:

**1** type:

~~~
ps x
~~~

This will list all processes / PIDs under your username).

**2** type:

~~~
kill -9 PID
~~~

Where **PID** is the process **ID** listed in the left column for transmission. This **ID** is in the form of a 4 to 5 digit number

You can now restart transmission by typing: 

~~~
transmission-daemon
~~~

It may take a few seconds to start up if you have a lot of torrents added.

Transmission should now be accessible through web interface or remote GUI.

**What Version of Transmission Am I Running?**

[SSH to your server](https://www.feralhosting.com/faq/view?question=12), and type:

~~~
transmission-daemon -V
~~~

Press **enter** to confirm.

Press **ctrl+d** to log out and terminate session.