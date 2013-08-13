
### Bash script

This script will:

1: Ask you for a suffix for this unique instance of rtorrent and rutorrent.
2: Clone the existing rtorrent/rutorrent installation files, adding this suffix
3: Make the required edits to the files using this suffix
4: Start rtorrent in a screen using the unique rtorrent/rc for this instance.

It will not damage your existing installation or overwrite custom instances if the same suffix is used.

~~~
wget -qO ~/multirtru.sh http://git.io/m_dugQ && bash ~/multirtru.sh
~~~

### Running multiple instances of rtorrent and rutorrent

**Important note:** Please make sure you have installed rtorrent/rutorrent using the [**Install Software** link in your Manager](https://www.feralhosting.com/manager/)

This is quite easy to do once you have understood the basic idea. We will:

**1:** Clone the existing installation giving it a new name.
**2:** We edit some files to reflect the new paths.
**3:** We run our new instance in a custom named screen.
**4:** Visit the new Web Gui in your WWW and use it.
**5:** Repeat as many times as needed.

### Clone our existing installation

**1:** Clone our `~/rtorrent.rc`

~~~
cp -f ~/.rtorrent.rc ~/.rtorrent-1.rc
~~~

**2:** Clone the rutorrent Web Gui

You can do this one of two ways:

cp -rf /opt/rutorrent/current/. ~/www/$(whoami).$(hostname)/public_html/rutorrent-1/

~~~
cp -rf ~/www/$(whoami).$(hostname)/public_html/rutorrent/. ~/www/$(whoami).$(hostname)/public_html/rutorrent-1
~~~

**3:** Create some directories for our new instance.

~~~
mkdir -p ~/private/rtorrent-1/data ~/private/rtorrent-1/watch ~/private/rtorrent-1/work
~~~

**Important note:** Take note of the suffix `-1` used in all cases. rtorrent to rtorrent-1 and rutorrent to rutorrent-1.

### Edit the files - rtorrent

We must now make some edits to these files so that our new rtorrent and rutorrent will work together.

~~~
~/rtorrent-1.rc
~~~
~~~
~/www/username.feralhosting.com/public_html/rutorrent-1/conf/config.php
~~~

**Important note:** EOL is important for this file, it must be UNIX/LF if using a text editor over FTP. Please see this FAQ: [Text editing - Over FTP or SFTP](https://www.feralhosting.com/faq/view?question=219)

Open the `~/rtorrent-1.rc`:

~~~
nano -w ~/.rtorrent-1.rc
~~~

Edit these 5 lines in you `~/rtorrent-1.rc`, changing the paths to reflect the new locations with the new suffix. This FAQ uses the examples of `-1`:

~~~
directory = media/DiskID/home/username/private/rtorrent/data
session = media/DiskID/home/username/private/rtorrent/work
schedule = watch_directory, 5, 60, load_start=media/DiskID/home/username/private/rtorrent/watch/*.torrent
execute = {sh,-c,/usr/bin/php media/DiskID/home/username/www/username.server.feralhosting.com/public_html/rutorrent/php/initplugins.php username &}
scgi_local = media/DiskID/home/username/private/rtorrent/.socket
~~~

For this example we make these changes:

`rtorrent` to `rtorrent-1`

~~~
directory = media/DiskID/home/username/private/rtorrent-1/data
~~~

`rtorrent` to `rtorrent-1`

~~~
session = media/DiskID/home/username/private/rtorrent-1/work
~~~

`rtorrent` to `rtorrent-1`

~~~
schedule = watch_directory, 5, 60, load_start=media/DiskID/home/username/private/rtorrent-1/watch/*.torrent
~~~

`rutorrent` to `rutorrent-1`

~~~
execute = {sh,-c,/usr/bin/php media/DiskID/home/username/www/username.server.feralhosting.com/public_html/rutorrent-1/php/initplugins.php username &}
~~~

`rtorrent` to `rtorrent-1`

~~~
scgi_local = media/DiskID/home/username/private/rtorrent-1/.socket
~~~

And then save the changes. in nano you would press and hold `CTRL` and then press `x`. Press `y` to confirm and exit

### Edit the files - rutorrent

Open your `~/www/username.feralhosting.com/public_html/rutorrent-1/conf/config.php`

~~~
nano -w ~/www/$(whoami).$(hostname)/public_html/rutorrent-1/conf/config.php
~~~

Edit this line, changing the paths to reflect the new locations.

~~~
$scgi_host = 'unix://'.$_pw['dir'].'/private/rtorrent/.socket';
~~~

For this example it is:

~~~
$scgi_host = 'unix://'.$_pw['dir'].'/private/rtorrent-1/.socket';
~~~

### Starting your new instance

Load your custom instance in a new screen window.

~~~
screen -S rtorrent-1 rtorrent -n -o import=~/.rtorrent-1.rc
~~~

If you see the screen is terminating error, do this:

~~~
screen -S rtorrent-1
~~~

The do this:

~~~
rtorrent -n -o import=~/.rtorrent-1.rc
~~~

You will now see what the actual error is.

Press and hold `CTRL` and `a`, then press `d` to detach from this screen session.

### More instances

Bascially follow this FAQ again, as many times as you want and just change the suffix.

~~~
rtorrent-2 and rutorrent-2
rtorrent-3 and rutorrent-3
rtorrent-4 and rutorrent-4
rtorrent-5 and rutorrent-5
rtorrent-6 and rutorrent-6
~~~

And so on. It is pretty much that simple.



