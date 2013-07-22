
rTorrent is a text-mode bittorrent client — you can watch how it works through any ssh client, web browser or even a cellphone. Wikipedia and the official website say that the very optimized code makes rTorrent faster than the official client.

***If editing the rTorrent configuration file please note you will need to "Show Hidden Files" or equivalent if using a Windows or Mac based client as files beginning with a period (.) are hidden by default - the file is called .rtorrent.rc.***

### Getting Familiar with rTorrent

Use PuTTY to [log onto your server via secure shell (SSH)](https://www.feralhosting.com/faq/view?question=12).

rTorrent runs in screen sessions, which could be compared to windows. To minimize a window with rTorrent in it, you `detach` a screen. To reopen a window, you `reattach` a screen.

Try it. To join / reattach an existing rTorrent screen:

**1:** Find out your rTorrent screen session's PID (process ID).
  
Type to list all matching processes:

```
ps x | grep rtorrent | grep -v grep
```

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/rTorrent%20-%20troubleshooting%20common%20errors/rtorrent1.png)

Or for just the screen itself:

```
screen -ls | grep rtorrent
```

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/rTorrent%20-%20troubleshooting%20common%20errors/rtorrent2.png)

**2:** Reattach the screen session with rTorrent in it.
  
Type:

```
screen -r PID
```

Where *PID* is the process ID assigned by the system to your rTorrent screen session preceding *rtorrent* in the list shown above: The *PID* is *15057* in this example.   

Based of the example image above:

```
screen -r 15057
```

You should now see this if rtorrent is running.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/rTorrent%20-%20troubleshooting%20common%20errors/1.png)

### rTorrent Interface Overview

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/rTorrent%20-%20troubleshooting%20common%20errors/2.png)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/rTorrent%20-%20troubleshooting%20common%20errors/3.png)
  
### Controlling rTorrent

rTorrent is controlled entirely through keyboard shortcuts. Invest some time in learning them, and it will pay off greatly in no time.

Try moving about — use the arrow keys, or press 0-9 to see rTorrent's different `views`. If you can't, rTorrent may be frozen, and you will need to restart it (see below).
  
Here's a [handy reference card of all rTorrent shortcuts in a .pdf file](http://tekguru.files.wordpress.com/2009/05/rtorrent_ref.pdf).

### Minimizing / Detaching rTorrent Screen Session

If you close your PuTTY window at this point, it will effectively kill rTorrent. To exit PuTTY while leaving rTorrent running in the background, you will need to `detach` the screen session rTorrent is running in. This is similar to minimizing a window.

Press `ctrl + a, d` (that is press control, press a, release a, press d, release d) to minimize / detach the screen and return.

### Restarting rTorrent (Properly)

If rTorrent is running OK, you can attach to it (see above) with:

```
screen -r PID
```

Pressing `Ctrl + q` exits (terminates) rTorrent and closes the screen session. When rTorrent starts again it will not re-hash all your torrents (but it will if you use kill, see below).

There is a cron job running on the server that checks every 10 minutes if your rTorrent is running, and if it's not, restarts it for you.

### Restarting rTorrent if it has frozen

However if rTorrent is frozen, you will need to kill it in order to restart it afterwards.

**1:** Type:
  
```
ps x
```

(this will list all processes under your username).
  
**2:** Type:
  
```
kill -9 PID
```

(where PID is the process ID listed in the left column for rTorrent).

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/rTorrent%20-%20troubleshooting%20common%20errors/4.png)

Once killed run:

```
ps x | grep rtorrent | grep -v grep
```

again to make sure it is dead. Repeat the kill command a few times if it doesn't work the first time.

Now you can start it back up by typing:

```
screen rtorrent
```

It may take a few seconds to start up if you have a lot of torrents added.

### If rTorrent cannot be killed

Sometimes processes are not able to be killed, even with

```
kill -9
```

In this event please open a support ticket informing us that you have already tried the 'kill' command.

### rTorrent Preferences

rTorrent preferences are contained in the `.rtorrent.rc` file that is located in your home directory. Please be careful while changing these settings as doing so can have negative effect on the performance of the server which you are sharing with others.

### Enhancing rTorrent Interface

There are several things you can do to enhance your rTorrent interface. Consider adding the following lines to your default rTorrent config.

By default rTorrent doesn't delete the data associated with a .torrent, deleting just the .torrent file itself and leaving the data intact. This may not be what you want. To delete a .torrent file `and` the data (`ctrl + d` on a stopped torrent), add this to your `.rtorrent.rc` file (you will need to terminate rTorrent, edit the file, and restart rTorrent for the new settings to take effect):

**rTorrent 0.8.2**:

```
# Delete data on torrent deletion
on_erase = on_erase,"execute={rm,-rf,--,$d.get_base_path=}"
```

**rTorrent 0.8.4**:

```
# Delete data on torrent deletion
system.method.set_key = event.download.erased,on_erase,"execute={rm,-rf,--,$d.get_base_path=}"
```

The following setting will enhance rTorrent's active view (9) by making it what it really should be — a dynamically updated explicit list of what you're uploading and downloading at the moment:

```
# Show jobs currently uploading or downloading in active view. Update every 10 seconds.
schedule = filter_active,10,10,"view_filter = active,\"or={d.get_up_rate=,d.get_down_rate=}\""
```

If you wish to sort your main view (1) in reverse chronological order (newly added torrents first), add this to your config:

```
# Sort main view by last added
view_sort_current = main,greater=d.get_creation_date=
```

### Configuring rTorrent to Use Several Watch and Data Directories

Press `ctrl + q` to quit / exit rTorrent.

Locate the .rtorrent.rc file that resides in your home directory, and add the following lines to it:

```
# Watch directory 2 with a different destination.
schedule = watch_directory_2,60,60,"load_start=/PATH_TO_WATCH2/*.torrent,d.set_directory=/PATH_TO_DATA2/"
```

Restart rTorrent.

Now when you put a .torrent into the WATCH2 dir, rTorrent will pick it up within 60 seconds and store the data in the DATA2 dir.

You can have several more, if that suits your needs:

```
# Watch directory 3 with a different destination.
schedule = watch_directory_3,60,60,"load_start=/PATH_TO_WATCH3/*.torrent,d.set_directory=/PATH_TO_DATA3/"
```

... and so on.

That's the beauty of rTorrent — it's highly configurable.

### Errors and Status Messages

**FILE CHUNK ERROR / STORAGE ERROR: CANNOT ALLOCATE MEMORY**

When you get that error, it means rTorrent is running out of available RAM to download to, and is moving data out of RAM and onto the disk. It doesn't usually happen with audio torrents since those are relatively small in size.

If you just let it keep running, it will work fine, downloading data to the disk, which is a little slower. It will finish downloading, and then it will look like it's hashing, but what it's actually doing is putting the pieces back together.

**COULD NOT PARSE BENCODED DATA**

This message is rTorrent's way of saying that there is a communication problem with the tracker. (Like a 404 error for websites.) Just leave it be, and once the communication resumes, the error will go away. You can also go check with your tracker, to see if they are having issues: most trackers have a status in the IRC channel or website.

**TRIED ALL TRACKERS**

From the developer himself: 

`The message just means it was at the end of the list, or reached the end, not that it didn't manage to connect to any trackers. This can happen when libtorrent automatically requests more peers.`

In other words, it's harmless — just ignore it.

**PROBLEM: rTorrent will not start in shell**

You try to start the rTorrent process with the command:

```
screen rtorrent
```
 
but it just returns an error:

**Important note:** This is not an rtorrent error, this is a screen command error.

```
Screen is terminating
```



You can then start Screen with a command:

```
screen
```

This will put you inside a Screen session. And once inside the Screen session, type: 

```
rtorrent
```

It will give you some kind of error telling you why it cannot start. 

If the error is:

```
rtorrent: Could not lock session directory: "/home/USERNAME/private/rtorrent/work/", held by "<error>".
```

or the errors states:

```
rtorrent: Invalid DHT cache
```

then here is what needs to be done:

**1:** Close the Screen session you just opened, by typing:

```
exit
```

**2:** Now you need to delete the `rtorrent.lock` file which is located in the `~/private/rtorrent/work/` folder with this command:

```
rm -f ~/private/rtorrent/work/rtorrent.lock
```

Or delete the file `rtorrent.dht_cache`, which is in the same directory, with this command: 

```
rm -f ~/private/rtorrent/work/rtorrent.dht_cache
```

**3:** You can now start rTorrent with the normal command: 

```
screen rtorrent
```

It should now launch without an error. Log into your wTorrent or ruTorrent session to verify.

### Monitoring rTorrent from a Symbian OS Smartphone

Did you know you can monitor and control your rTorrent from a Symbian OS (3rd edition) smartphone (like Nokia E series) and Series 80 communicators? [PuTTY for Symbian OS](http://s2putty.sourceforge.net) gives you SSH access to the server right from the screen of your smartphone via wi-fi or GPRS/3G connection. This means you can control your rtorrent from wherever you are.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Installable%20software/rTorrent%20-%20troubleshooting%20common%20errors/5.png)

`rTorrent on the screen of a Nokia e71 smartphone`

You might want to check out the tutorial on [Setting up Public Key Authentication with Putty on Windows](https://www.feralhosting.com/faq/view?question=13). Once you have created your private key, you can transfer it to your smartphone, enable the corresponding option in PuTTY for Symbian OS, and it will log you onto the server automatically in a matter of seconds not asking you to type in the password.



