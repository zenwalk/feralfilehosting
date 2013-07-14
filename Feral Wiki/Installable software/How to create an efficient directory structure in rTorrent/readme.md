
There are certain torrents that you will want to keep, while others you will want to download and delete. Likewise you will likely want to be able to quickly see the torrents you have downloaded recently, in order that you can download those from your FTP.

I've found a way in which to achieve this.

All of my new torrent start in my rTorrent/data directory. Periodically I can go in and delete the torrents I no longer want to have on my slice. For torrents I want to keep I can move them to a subdirectory.

Step 1 - Set up the subdirectories.

In a shell navigate to your rTorrent/data directory and use the mkdir command to create all of the subdirectories you intend to use. You can always come back later and add more if you choose. "mkdir music" for example.

Step 2 - Moving individual torrent data

In ruTorrent right click on the torrent you wish to move. Select "Save to" and navigate into the directory you wish the torrent to move to. You would want to move your music torrent from rtorrent/data to /rtorrent/data/music for example. I have found that typing in the destination directory was not successful, I've had to use the mouse to navigate and select. This will cause the torrent to pause, and show 0% completion. That's fine!

Step 3 - Moving the actual data

By your method of choice move the torrent data to the new destination. I prefer WinSCP for a graphical file manager. Linux commands in shell work well. A standard FTP client I found was not so good. 

Step 4 - Re-check the data

In ruTorrent right click on the torrent and select Force Re-check. This will cause rTorrent to look in the directory you have selected, where it should find the file (if you have moved it correctly). It will then complete the hash check and leave the torrent in a paused state.

Step 5 - Reactivate the torrent

Your torrent is now in paused status. I have no idea why you can't simply select start. You will now need to stop the torrent, and then select start. Both of these operations you can perform with a right click. Congratulations you have moved your first torrent into a directory.

Repeat steps 2 to 5 for each torrent you wish to move. To do things faster you can perform each step for multiple torrents before moving to the next step. For example you could, in ruTorrent change the directory for all of your music torrents. Then you would move the data, followed by a re-check, and finally a stop/start.

*****
NOTE:
***** 
Following observations done in later versions of rTorrent (in this case 0.8.6/0.12.6), steps 3-5 aren't necessary anymore. As per Step 2; when right-clicking the torrent you wish to move, selecting the "Save To..." option will pop-up a window where you can choose the new directory AND you'll have a checkbox "Move Data Files". Checking that box is the equivalent of Steps 3-5.