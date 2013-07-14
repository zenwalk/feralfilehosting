
I am assuming you are moving from wtorrent/rtorrent to transmission. Of course, you can do it the opposite way and it will work. Just replace rtorrent with transmission and it is easy as pie.

### USING FTP:

**1:** Stop your torrents in rtorrent or wtorrent before beginning so you don't run into any problems.

**2:** Login to a FTP.

**3:** Find the url 

~~~
~/private/rtorrent/data/
~~~

**4:** Once there copy/move your torrent data to

~~~
~/private/transmission/data/
~~~

This will take quite awhile depending on your speeds and how much info you have.

**5:** After that is completed, the go to: 

~~~
~/private/rtorrent/watch/
~~~

or

~~~
~/private/rtorrent/work/
~~~

and copy your `.torrent` files to

~~~
~/private/transmission/watch/
~~~

**6:** Open up your Web Gui and then it should be checking your torrents data to make sure it is all there and once that is completed it will begin uploading. However, if material is missing, it will begin downloading the missing material to complete the download.

**7:** If you want, you can go back to rtorrent and delete the torrent from there, but you really don't have to. There isn't much harm there. But I did, just so I wouldn't have any complications with my private trackers.

**8:** DONE

### Using SSH with PuTTy:

**1:** Login to your server via PuTTY

Choose a command that suits your needs, or customize one of them to reflect them.

Enter this code to move the torrent files from watch folder of rtorrent to the watch folder of transmission: 

~~~
mv ~/private/rtorrent/watch/* ~/private/transmission/watch
~~~

Copy:

~~~
cp -rf ~/private/rtorrent/watch/* ~/private/transmission/watch
~~~

Enter this code to move the torrent files from work folder of rtorrent to the watch folder of transmission: 

~~~
mv ~/private/rtorrent/work/* ~/private/transmission/watch
~~~

Copy:

~~~
cp -rf ~/private/rtorrent/work/* ~/private/transmission/watch
~~~

Enter this code to move the data from rtorrent to transmission:

~~~
mv ~/private/rtorrent/data/* ~/private/transmission/data
~~~

Copy:

~~~
cp -rf ~/private/rtorrent/data/* ~/private/transmission/data
~~~

**3:** Once completed, simply check out the Web Gui and make sure everything is up and running.

**4:** DONE

### Other:

- username means YOUR username here...self explanatory really.
- If the torrents don't automatically begin checking for the material in the new folder, simply right click the torrent and click Verify local data and it should force it to begin.



