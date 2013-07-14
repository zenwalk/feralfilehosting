Related FAQs:

[How to SSH into your slot](https://www.feralhosting.com/faq/view?question=12)
[Password Protect Your WWW Page(s)](https://www.feralhosting.com/faq/view?question=22)
[Putting your WWW folder to use](https://www.feralhosting.com/faq/view?question=20)
[ Upload a Downloaded Torrent to Another Tracker](https://www.feralhosting.com/faq/view?question=26).

This FAQ also assumes you know [how to SSH into your slot](https://www.feralhosting.com/faq/view?question=12).  This FAQ will be done via SSH, but can realistically all be done on your home computer.

[MkTorrent Webui](http://sourceforge.net/projects/mktorrentwebui/)

A Web Frontend for MkTorrent. To avoid the need of user accounts and SSH access.

**1:** Download the the [mktorrent webui archive](http://sourceforge.net/projects/mktorrentwebui/files/latest/download?source=files)

```
wget -qNO mk.tar.gz http://sourceforge.net/projects/mktorrentwebui/files/latest/download?source=files
```

**2:** Extract the tar file and cd into the folder

```
tar xfvz mk.tar.gz && cd ~/mktorrent/
```

**3:**  Find the full path to your client's data folder.  The easiest way to do this in ssh to to just type 'pwd' and it will return the full path to whatever folder you're currently in:

```
cd && pwd
```

Will return something like:

```
/media/sdk1/home/bobtentpeg
```

For those of you using an FTP client, you can find your full path usually by looking at the remote path in your FTP client's path bar. In FileZilla its the path listed in the `remote site` box.  If your client doesn't have this, you can also find the appropriate DiskID, which in my example is:

```
sdk1
```

by going up two directories in the file listing

**4:** Edit the index.php to include the proper root folder path. To edit the file:

```
nano index.php
```

Change the the line below to include the proper path:

```
$root = "/home/rtorrent";
```

The corrected line for me looks like:

```
$root = "/media/sdk1/home/bobtentpeg/private/rtorrent/data/";
```

Save the file by pressing Control+x and accepting with Y.

**5:** Move the `index.php` to be visible by HTTP.  If you're an rutorrent user, the easiest way to to move it to your rutorrent folder with the below command

```
mv index.php ~/www/$(whoami).$(hostname)/public_html/rutorrent/make.php
```
.
5b. If you aren't an rutorrent user, be sure to put the php file in a folder that is password protected.  You can find directions to pass protect your WWW folders in the introduction for this FAQ.

**6:** Visit it in your browser.  If you're an rutorrent user, visit your rutorrent URL and login then add "make.php" to the end of the URL.  It will look like:

```
https://server.feralhosting.com/username/rutorrent/make.php
```




**Thanks to Bobtentpeg for the original writeup**

