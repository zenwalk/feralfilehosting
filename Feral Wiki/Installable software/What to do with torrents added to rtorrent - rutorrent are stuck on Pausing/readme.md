
**1. Did you change the data save path?**

If you changed the save path, please be sure that the directory exists.  Rutorrent cannot make the directories.

**2.  Stuck on "Pausing" or "Paused" and stopping and restarting doesn't help?**

Try using our [torrent fixer](http://fiberdk.horus.feralhosting.com/).  Torrents occasionally contain excess metadata, one of them is the "rtorrent fast resume" metadata.  This can cause torrents to go into pausing because rtorrent can't find the data for fast resume to work.  Our tool removes this and other metadata that isn't necessary.  

** 3.  Still not starting? **

Please check your disks usage using:

```
df -h ~/
```

If your disk is >95% full, please ensure that you aren't over your quota.  If you aren't, please open a ticket and we'll address any users who are over their quota.



