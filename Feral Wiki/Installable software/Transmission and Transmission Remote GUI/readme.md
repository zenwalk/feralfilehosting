
### transmisson-remote-gui supported platforms:

Windows
Linux
Mac

This software can be installed from the [**Install Software** link in your Manager](https://www.feralhosting.com/manager/) for the slot you wish to use it on.

In [SSH](https://www.feralhosting.com/faq/view?question=12) run this command to see you main info except the password:

~~~
wget -qO ~/info.sh http://git.io/QsfUKA && bash ~/info.sh
~~~

To see you password you must click on the Slot Details page of the relevant slot in your [Account Manager](https://www.feralhosting.com/manager/) and it will look like this:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Transmission%20and%20Transmission%20Remote%20GUI/transslotdetail.png)

### Remote GUI Client for Transmission

Download it from here and then install it.

[transmisson-remote-gui](http://code.google.com/p/transmisson-remote-gui/)

**Important note:** The [transmission-remote-dotnet](http://code.google.com/p/transmission-remote-dotnet/) client does not work with our services.

### Transmission Remote GUI Configuration*

Once you open transmisson-remote-gui you will see something like this:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Transmission%20and%20Transmission%20Remote%20GUI/1.png)

This is where you will need to click to create a new connection:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Transmission%20and%20Transmission%20Remote%20GUI/2.png)

This is what you will see and it is also where you will enter you connection information:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Transmission%20and%20Transmission%20Remote%20GUI/3.png)

It will start to look something like this:

**Important note:** Do not check SSL, this will cause the connection to fail.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Transmission%20and%20Transmission%20Remote%20GUI/4.png)
 
Please use the bash script linked above to get most of this information using a single command.

**Connection:** A name for this connection. Filled in automatically as you fill in the `Remote host:` field.

**Remote host:** You server hostname for example, `chronos.feralhosting.com`

**Port:** The `rpc-port` listed port in the `~/.config/transmission-daemon/settings.json` file.

**User name:** Your Feral username

**Password:** As listed under the Transmission section of your Slot Details page for the relevant slot.

When you have filled out the fields correctly  click OK and you will be automatically connected to transmission running on the selected slot.

### When Transmission is Unresponsive

If transmission is frozen you will need to kill it. Log into your slot via  [SSH](https://www.feralhosting.com/faq/view?question=12), and run these commands:

To kill the transmission daemon:

~~~
killall -9 transmission-daemon -u $(whoami)
~~~

You can now restart transmission again by typing: 

~~~
transmission-daemon
~~~

It may take a few seconds to start up if you have a lot of torrents added.

Transmission should now be accessible through web interface or remote GUI.

**What Version of Transmission Am I Running?**

[SSH](https://www.feralhosting.com/faq/view?question=12) to your server, and type:

~~~
transmission-daemon -V
~~~



