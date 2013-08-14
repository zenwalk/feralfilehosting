
You might want to back up your rutorrent RSS feeds and filters in case they get lost or accidentally deleted. While there is no foolproof method of doing this and it may not work between different versions as there is no official "export" button, it is the best way of doing so for rutorrent.

1) To backup browse to the following directory from your home folder:

```
~/www/username.server.feralhosting.com/public_html/rutorrent/share/users/username/settings/rss
```

Replacing **username** with your user and **server** with your Feral server name.

2) Download the entire contents of this folder including the cache folder.

3) Save it somewhere safe.

4) It is now backed up so if you need to restore it just put your saved version back into the same directory.

### Using SSH

This command will backup all profile folders for rutorrent users to a folder in your private directory. So this will include user based settings and torrent file as well as RSS.

```
rsync -avhPS ~/www/$(whoami).$(hostname)/public_html/rutorrent/share/users/ ~/rssbackup
```

You can edit this command however you wish. This is the command broken down into its 3 main parts for easier reading.

```
rsync -avhPS
```

The rysnc command itself with options. you can mostly ignore this part.

```
~/www/$(whoami).$(hostname)/public_html/rutorrent/share/users/
```

The location of the directory you wish rsync to backup

```
~/rssbackup/
```

the location you wish rysnc to backup the files to (separated by a single space from the previous command)




