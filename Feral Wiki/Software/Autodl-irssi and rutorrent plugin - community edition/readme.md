### rtorrent change 30.06.2013

rtorrent was changed to use a socket and this has broken the autodl rutorrent plugin, not autodl itself.

[Try this manual fix](http://pastebin.com/y7jNijsS)

Or the bash script. Apply to an existing installation. Tested with the autodl installer script below.

```
wget -qNO ~/autodlrutorrentfix.sh http://git.io/BBUryw && bash ~/autodlrutorrentfix.sh
```

It has been reported as working

### What's changed?

The main application on [ autodl on Sourceforge](http://sourceforge.net/projects/autodl-irssi/) was not being actively developed and the author was M.I.A. The official forum was removed also. This is a new community driven version that has been forked to [autodl on github.com](https://github.com/autodl-community/autodl-irssi) and is now actively maintained, updated and developed. It is also the new home of the new wiki and other information resources.

### Installing autodl-irssi

This FAQ requires you SSH into your box. You can read more about how to SSH into your box here: [SSH Guide Basic](https://www.feralhosting.com/faq/view?question=12)

After you’re connected to your box, run the following commands:

We highly recommend that you perform a clean install when switching from the official release of autodl-irssi to prevent any possible conflicts. Running these commands in your terminal or deleting that directory through an FTP client is suggested:

```
rm -rf ~/.irssi/scripts/AutodlIrssi
rm -f ~/.irssi/scripts/autorun/autodl-irssi.pl
rm -rf ~/www/$(whoami).$(hostname)/public_html/rutorrent/plugins/autodl-irssi
```

### Automated installation

After SSH'ing into your slot run the following commands

**Important note:**  If you have IRSSI configured already, this may screw with your server configurations.

```
wget -qNO ~/installautodl.sh http://git.io/Ch0LqA && bash ~/installautodl.sh
```

Now follow the prompts, if you don't like your password entering 'n' at the confirmation step will prompt you for a new password.  In some cases, this script will fail to properly setup your autodl, it does not check if the port it randomly generates is open.  If your autodl does not connect, please change the ports in the two configuration files mentioned in the manual section

### Manual installation

~~~
mkdir -p ~/.irssi/scripts/autorun ~/.autodl
echo -e "[options]\ngui-server-port = 0\ngui-server-password = PASS" > ~/.autodl/autodl.cfg
wget -qNO ~/autodl-irssi.zip https://autodl-irssi-community.googlecode.com/files/autodl-irssi-community.zip
unzip -qo ~/autodl-irssi.zip -d ~/.irssi/scripts/
cp -f ~/.irssi/scripts/autodl-irssi.pl ~/.irssi/scripts/autorun/
rm -f ~/autodl-irssi.zip ~/.irssi/scripts/README* ~/.irssi/scripts/autodl-irssi.pl
~~~

Configuring your autodl-irssi connection to the autodl-irssi rutorrent plugin. This step is not required. If you don’t want to use the UI configuration editor, 

To configure autodl-irssi for rutorrent:

You can use any torrent client. You just need the rutorrent UI installed to use this feature.

```
nano ~/.autodl/autodl.cfg
```

The `autodl.cfg` it will look like this

~~~
[options]
gui-server-port = 0
gui-server-password = PASS
~~~

**1:** Change the port to something between `6000` and `50000`

**2:** Create a password and replace `PASS` with your new password.

Save the file by Pressing **CTRL X** then **Y**

**These next commands are to download and then edit the GUI plugin to connect with the process. And are required if you wish to use the rutorrent GUI to manage autodl-irssi.**

```
cd ~/www/$(whoami).$(hostname)/public_html/rutorrent/plugins/
wget -qNO autodl-rutorrent.zip https://github.com/autodl-community/autodl-rutorrent/archive/master.zip
unzip -qo autodl-rutorrent.zip
cp -rf autodl-rutorrent-master/. autodl-irssi
rm -rf autodl-rutorrent.zip autodl-rutorrent-master
cp -f autodl-irssi/_conf.php autodl-irssi/conf.php
nano autodl-irssi/conf.php
```

**Edit this info:**

```
$autodlPort = 15896; // Set the same port value as you set earlier (the one in ~/.autodl/autodl.cfg)
```

```
$autodlPassword = "ey47DT7heE7E8"; // Set the same password as before (while editing ~/.autodl/autodl.cfg)
```

Save the file by Pressing **CTRL X** then **Y**

**Run Irssi in a screen**
 
```
screen -dmS autodl irssi
```

Press and hold **CTRL A D** ( in that order ) to detach from the screen leaving the process running in the background.

To re attach to this screen in SSH to control irssi type this command in your shell:

```
screen -r autodl
```

**Using rutorrent autodl-irssi plugin:**

[http://code.google.com/p/rutorrent/wiki/PluginAutodlirssi#Usage](http://code.google.com/p/rutorrent/wiki/PluginAutodlirssi#Usage)

** Updating **

If you are running the autodl-irssi-community version (installed here) and `NOT` the autodl-irssi version from months ago, you can update to the latest plugin version by re-running these steps, or running the following command in irssi:

```
/autodl update
```




