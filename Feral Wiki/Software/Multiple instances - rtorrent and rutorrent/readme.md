
### Bash script

This script will:

1: Ask you for a suffix for this unique instance of rtorrent and rutorrent.
2: Create you a fresh install based on the Feral rtorrent and rutorrent installation. Colored ratio and Feralstats plugins included.
3: Make the required edits to some using this suffix so it becomes an independent installation.
4: Ask you for a username and password to password protect the folder. All instances are unique and will not clash even if the same username and password is used in another instance.
5: Start rtorrent in a screen using the unique rtorrent/rc for this instance.

It will not damage your existing installation or overwrite custom instances if the same suffix is used.

~~~
wget -qO ~/multirtru.sh http://git.io/m_dugQ && bash ~/multirtru.sh
~~~

### Important: Read this first

When creating a new instance of rutorrent there is an important behaviour using the `.htaccess` and `.htpasswd` combo that you need to understand.

The default rutorrent `.htaccess` has a line like this:

~~~
AuthName "username"
~~~

And the default rutorrent `.htpasswd` has a line like this, which is the md5 salted password for this user:

~~~
username:$apr1$MPG6YdI6$8qwQtGQj5jHoL62L2/rhg1
~~~

If you have a new instance that uses the same AuthName but the relevant `.htpasswd` does not contain a matching username and md5 salt you will start to confuse rutorrent because this is how it authorizes you.

The script deals with this by giving each instance a unique AuthName based on the suffix used, such as:

~~~
AuthName "rutorrent-3"
~~~

When you clone the existing installation you will need to take this into account, so to sum it up:

When you want to be able to log into a single instance and be logged into multiple instance simultaneously you will need to:

1: Make sure all instances and their `.htaccess` have the same AuthName. The default is

~~~
AuthName "username"
~~~

2: All linked to `.htpasswd` files have the the same user and more importantly, the same md5 salt. Having the same username and password in not enough. It must be the same salt.

### Running multiple instances of rtorrent and rutorrent

You can do this in two ways.

**1:** You can clone an existing installation. So this can be useful if you want to preserve customisations and settings.

**2:** You can use template files which mimics almost identically a Feral fresh install. The bash script uses this option

If you want to use option 2 then use the bash script.

If you want to clone an existing installation in whatever state it currently is use the FAQ.

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

~~~
cp -rf /opt/rutorrent/current/. ~/www/$(whoami).$(hostname)/public_html/rutorrent-1/
~~~

~~~
htpasswd -cm ~/www/$(whoami).$(hostname)/public_html/rutorrent-1/.htpasswd username
~~~

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
screen -fa -dmS rtorrent-1 rtorrent -n -o import=~/.rtorrent-1.rc
~~~

If you see the screen is terminating error, do this:

~~~
screen -fa -S rtorrent-1
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



