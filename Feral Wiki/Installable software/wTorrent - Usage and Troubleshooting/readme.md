### Installing wTorrent

This software can be installed along with rTorrent in the [account manager](https://www.feralhosting.com/manager/).

The wTorrent application is the web interface for rTorrent. It allows you to manage your torrents from a web browser by contacting a running rTorrent instance. If you receive a message that wTorrent can not connect to rTorrent then rTorrent has probably crashed and needs to be started up again; if this occurs, please contact an administrator to start it back up for you.

### wTorrent Overview

After installing wTorrent you can visit the URL and login with the information given to you by the [plan page in your manager](https://www.feralhosting.com/manager/). You will immediately notice there are three parts to the interface: a summary at the top, the torrent view in the middle, and finally the refresh button at the bottom.

The top portion provides meta-information about the server you're on. It contains the total upload and download speed in KB/s -- a 100Mbps connection typically has a maximum rate of 12,200 KB/s, this includes both upload and download combined. The disk space also shows the current disk usage of the folder the torrents are saved to; **this does not represent just what you have been allocated but is the total usage of all users on that disk**.

The middle section displays all torrents for the current view. The different views can be changed by clicking on the tabs just above the main section after the page has finished loading. Each tab has a different meaning:

  * **Public:** displays torrents from all users not added as "private".
  * **Private:** displays torrents that the current user entered as "private".
  * **Active:** all torrents that are currently running.
  * **Started:** torrents that have been added since rTorrent was started.
  * **Stopped:** torrents that have been stopped by the user.
  * **Completed:** all torrents that have reached 100%.
  * **Incomplete:** torrents that have not yet reached 100%.
  * **Hashing:** torrents that are undergoing or are queued for a hash check.
  * **Seeding:** all torrents that are being seeded.

The notion of a user is solely to do with wTorrent and does not affect your torrents at all as rTorrent does not know about them. This means that the private tab is useless unless you plan to add users.

Finally, the bottom section contains one button refreshing the both panels above it. This is not an automatic refresh and is often beneficial for clients running a large number of torrents (e.g. more than 200).

### Troubleshooting wTorrent

`Most of the steps below will require you to type commands into the shell via ssh in PuTTy. The commands assume you are in your home directory.`

**Problem: wTorrent web page will not load**

If your wTorrent page will not load, it might be due to the rTorrent process having crashed/locked/freezing. First you should try to stop and restart rTorrent:

  1) Type: 

```
ps x
```
 
This will list all processes under your username.

  2) Type: 

```
kill -9 12345
```
 
where 12345 is the PID listed in the left column for rTorrent.

If after all this, rTorrent isn't running (it shouldn't be if you've killed it...). You can start it back up with 

```
screen -S rtorrent rtorrent
```
 
It may take a few seconds to start up if you have a lot of torrents added. You should then try to access wTorrent webgui. It should load right up.

**Problem: wTorrent web page will not accept your password**

After you've verified that you are using the correct username and password in wTorrent, and the web page still not letting you past the login screen, you might have to reinstall rTorrent/wTorrent. But before you do, we need to rename the wTorrent folder, because it does not get overwritten correctly by the automated install script. You will need to kill the rTorrent process first.

  1) Type:
 
```
ps x
```
 
This will list all processes under your username.

  2) Type:

```
kill -9 12345
```
 
where 12345 is the PID listed in the left column for rTorrent.
  3) Type:

```
cd ~/www/$(whoami).$(hostname)/public_html/
```

```
mv wtorrent/ wtorrent_backup/
```

  4) Go to the [Install Software page in your manager](https://www.feralhosting.com/manager/) page and check rTorrent/wTrorrent, then click Install software.
     
The install should finish in 5 to 10 minutes and you should check the [Software Status page](https://www.feralhosting.com/manager/) for your new wTorrent password. Then try to login to wTorrent. It should be fixed.

Optional - Remove backup
  5) If you can log in and everything is working fine, it is fine to go ahead and delete the backup of wtorrent.
 
     Type:

```
cd ~/www/$(whoami).$(hostname)/public_html/
```

```
rm -rf wtorrent_backup
```

**Problem: rTorrent will not start in shell**

You try to start the rTorrent process with the command:

```
screen -S rtorrent rtorrent
```
 
but it just returns an error:

```
Screen is terminating
```

You can then start Screen with a command:

```
screen -S rtorrent
```

This will put you inside a Screen session called rtorrent. And once inside the Screen session, type: 

```
rtorrent
```

It will give you some kind of error telling you why it cannot start. 

If the error is:
`rtorrent: Could not lock session directory: "/home/USERNAME/private/rtorrent/work/", held by "<error>".`
then here is what needs to be done:
  1) Close the Screen session you just opened, by typing:

```
exit
```

  2) Now you need to delete the `rtorrent.lock` file which is located in the `~/private/rtorrent/work/` folder with this command:

```
rm ~/private/rtorrent/work/rtorrent.lock
```

  3) You can now start rTorrent with the normal command: 

```
screen -S rtorrent rtorrent
```

It should now launch without an error. Log into your wTorrent session to verify.

Detach from your screen session by pressing `ctrl + a, d`.