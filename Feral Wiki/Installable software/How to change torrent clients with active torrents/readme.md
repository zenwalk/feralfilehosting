
### Using SSH with PuTTy:

**1:** Login to your server via [SSH](https://www.feralhosting.com/faq/view?question=12)

**Important note:** You can pick to either move the files or to copy the files. Both commands are listed below, you do not have to do both.

Should I move or copy? It is up to you and depends what you are aiming to do. 

**Move** (mv) if you do not plan to use to the old client any more and are permanently moving to another client.

**Copy** (cp) if you want to still use the client and seed files file you transition into another client. If you have the space to spare.

**Important note:** Ignore errors about non existing files. It just means there was nothing to move or copy

### Rutorrent throttle

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/General/Completing%20a%20data%20transfer/rutorrent.png)

### rtorrent to transmission

**1:** To move (mv) or copy (cp) `~/private/rtorrent/data` contents:

~~~
mv -f ~/private/rtorrent/data/. ~/private/transmission/data

cp -rf ~/private/rtorrent/data/. ~/private/transmission/data
~~~

**2:** To move (mv) or copy (cp) the `~/private/rtorrent/watch` contents:

~~~
mv -f ~/private/rtorrent/watch/*.torrent ~/private/transmission/watch

cp -rf ~/private/rtorrent/watch/*.torrent ~/private/transmission/watch
~~~

**3:** To move (mv) or copy (cp) the `~/private/rtorrent/work` contents:

~~~
mv -f ~/private/rtorrent/work/*.torrent ~/private/transmission/watch

cp -rf ~/private/rtorrent/work/*.torrent ~/private/transmission/watch
~~~

### rtorrent to deluge

**1:** To move (mv) or copy (cp) the `~/private/rtorrent/data` contents:

~~~
mv -f ~/private/rtorrent/data/. ~/private/deluge/data

cp -rf ~/private/rtorrent/data/. ~/private/deluge/data
~~~

**2:** To move (mv) or copy (cp) the `~/private/rtorrent/watch` contents:

~~~
mv -f ~/private/rtorrent/watch/*.torrent ~/private/deluge/watch

cp -rf ~/private/rtorrent/watch/*.torrent ~/private/deluge/watch
~~~

**3:** To move (mv) or copy (cp) the `~/private/rtorrent/work` contents: 

~~~
mv -f ~/private/rtorrent/work/*.torrent ~/private/deluge/watch

cp -rf ~/private/rtorrent/work/*.torrent ~/private/deluge/watch
~~~

### Transmission throttle

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/General/Completing%20a%20data%20transfer/transmission 1.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/General/Completing%20a%20data%20transfer/transmission 2.png)

### transmission to rtorrent

**1:** To move (mv) or copy (cp) the `~/private/transmission/data` contents:

~~~
mv -f ~/private/transmission/data/. ~/private/rtorrent/data

cp -rf ~/private/transmission/data/. ~/private/rtorrent/data
~~~

**2:** To move (mv) or copy (cp) the `~/.config/transmission-daemon/torrents` contents:

~~~
mv -f ~/.config/transmission-daemon/torrents/*.torrent ~/private/rtorrent/watch

cp -rf ~/.config/transmission-daemon/torrents/*.torrent ~/private/rtorrent/watch
~~~

**3:** To move (mv) or copy (cp) the `~/private/transmission/watch` contents:

~~~
mv -f ~/private/transmission/watch/*.torrent ~/private/rtorrent/watch

cp -rf ~/private/transmission/watch/*.torrent ~/private/rtorrent/watch
~~~

### transmission to deluge

**1:** To move (mv) or copy (cp) the `~/private/transmission/data` contents:

~~~
mv -f ~/private/transmission/data/. ~/private/deluge/data

cp -rf ~/private/transmission/data/. ~/private/deluge/data
~~~

**2:** To move (mv) or copy (cp) the `~/private/transmission/watch` contents:

~~~
mv -f ~/private/transmission/watch/*.torrent ~/private/deluge/watch

cp -rf ~/private/transmission/watch/*.torrent ~/private/deluge/watch
~~~

**3:** To move (mv) or copy (cp) the `~/.config/transmission-daemon/torrents` contents:

~~~
mv -f ~/.config/transmission-daemon/torrents/*.torrent ~/private/deluge/watch

cp -rf ~/.config/transmission-daemon/torrents/*.torrent ~/private/deluge/watch
~~~

### Deluge throttle

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/General/Completing%20a%20data%20transfer/deluge.png)

### deluge to rtorrent

**1:** To move (mv) or copy (cp) the `~/private/deluge/data` contents:

~~~
mv -f ~/private/deluge/data/. ~/private/rtorrent/data

cp -rf ~/private/deluge/data/. ~/private/rtorrent/data
~~~

**2:** To move (mv) or copy (cp) the `~/private/deluge/watch` contents:

~~~
mv -f ~/private/deluge/watch/*.torrent ~/private/rtorrent/watch

cp -rf ~/private/deluge/watch/*.torrent ~/private/rtorrent/watch
~~~

**3:** To move (mv) or copy (cp) the `~/private/deluge/torrents` contents:

~~~
mv -f ~/private/deluge/torrents/*.torrent ~/private/rtorrent/watch

cp -rf ~/private/deluge/torrents/*.torrent ~/private/rtorrent/watch
~~~

### deluge to transmission

**1:** To move (mv) or copy (cp) the `~/private/deluge/data` contents:

~~~
mv -f ~/private/deluge/data/. ~/private/transmission/data

cp -rf ~/private/deluge/data/. ~/private/transmission/data
~~~

**2:** To move (mv) or copy (cp) the `~/private/deluge/watch` contents:

~~~
mv -f ~/private/deluge/watch/*.torrent ~/private/transmission/watch

cp -rf ~/private/deluge/watch/*.torrent ~/private/transmission/watch
~~~

**3:** To move (mv) or copy (cp) the `~/private/deluge/torrents` contents:

~~~
mv -f ~/private/deluge/torrents/*.torrent ~/private/transmission/watch

cp -rf ~/private/deluge/torrents/*.torrent ~/private/transmission/watch
~~~

### After you have transferred the files

Once completed, simply check out the Web Gui and make sure everything is up and running.

Then un-throttle your client/s.

### Other:

- If the torrents don't automatically begin checking for the material in the new folder, simply right click the torrent and click Verify local data and it should force it to begin.

