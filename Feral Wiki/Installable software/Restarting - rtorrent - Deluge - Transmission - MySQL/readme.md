**Related tutorial:**  [How to SSH Into Your Feral Slot](https://www.feralhosting.com/faq/view?question=12)

Note: a quick way to restart software is to install it again from the software page - this will leave data intact,but will reset configuration (e.g., passwords, RSS feeds, custom folders).

### Restarting rtorrent

Run the following commands through [ SSH](https://www.feralhosting.com/faq/view?question=12). (Copy and paste these commands directly as written). Command (2) is optional, you can wait for the system to auto restart your client. 

**1:** Kill rtorrent
 
```
killall -9 rtorrent -u $(whoami)
```

**2:** Start it again in a screen

```
screen -S rtorrent rtorrent
```

If all goes well, you should be greeted with your rtorrent  and you should see your torrents. To exit rtorrent (and keep it running) press and hold `CTRL` and `a` then press `d` to detach from the screen once you are sure rtorrent is running.

If instead you are given a "screen is terminating" error, please consult command (3).

**3.0:** screen is terminating error

```
rm -rf ~/private/rtorrent/work/rtorrent.*
```

**3.1:** Start it again in a screen

```
screen -S rtorrent rtorrent
```

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Restarting%20-%20rtorrent%20-%20Deluge%20-%20Transmission%20-%20MySQL/1.png)

### Restarting Transmission

Run the following commands through [SSH guide basics - PuTTy](https://www.feralhosting.com/faq/view?question=12). (Copy and paste these commands directly as written). Command (2) is optional, you can wait for the system to auto-restart your client.   

**1:** Kill transmission

```
killall -9 transmission-daemon -u $(whoami)
```

**2:** Start transmission

```
transmission-daemon
```

If all goes well, you should be greeted with an empty command prompt

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Restarting%20-%20rtorrent%20-%20Deluge%20-%20Transmission%20-%20MySQL/2.png)

### Restarting Deluge

Run the following commands through [ SSH](https://www.feralhosting.com/faq/view?question=12). (Copy and paste these commands directly as written). Commands (3) and (4) are optional, you can wait for the system to autorestart your client.

Use the commands you need to kill and start the deluge daemon and Web Gui:

### Kill the deluge daemon and Web Gui

**Option 1:** Kill deluge only

```
killall -9 deluged -u $(whoami)
```

**Option 2:** Kill the Web Gui only

```
killall -9 deluge-web -u $(whoami)
```

**Option 3** This command would kill the deluge process and the web gui together

```
killall -9 deluged deluge-web -u $(whoami)
```

### Restart the deluge daemon and Web Gui

**Option 1:** Start deluge only

```
deluged
```

**Option 2:** Start the Web Gui only

```
deluge-web --fork
```

**Option 3:** This command would start the deluge process and the Web Gui together

```
deluged && deluge-web --fork
```

If you get this error you will need to open a [support ticket](https://www.feralhosting.com/manager/tickets/) with a relevant title. This problem requires Staff to fix.

```
twisted.internet.error.CannotListenError: Couldn't listen on any:53162: [Errno 98] Address already in use
```

If all goes well, you should be greeted with an empty command prompt:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Restarting%20-%20rtorrent%20-%20Deluge%20-%20Transmission%20-%20MySQL/3.png)

### Restarting MySQL

Run the following commands through [ SSH](https://www.feralhosting.com/faq/view?question=12). (Copy and paste these commands directly as written). 

**1:** Kill mysql

```
killall -9 mysqld mysqld_safe -u $(whoami)
```

**2:** Start mysql

```
bash ~/private/mysql/launch.sh
```

If all goes well, you should be greeted by two messages like the ones below

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/Restarting%20-%20rtorrent%20-%20Deluge%20-%20Transmission%20-%20MySQL/4.png)

**Finally...**

If you continue to have problems after following these steps closely, please open a support ticket providing details of the error message you are receiving for which software and we will gladly help you.



