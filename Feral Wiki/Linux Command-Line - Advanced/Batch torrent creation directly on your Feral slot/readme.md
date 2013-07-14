The following set of commands will allow you to batch create .torrent files for all directories and/or single files in a directory of your choice.

**Step 1:**

[SSH to your Feral server](https://www.feralhosting.com/faq/view?question=12). Navigate to the directories containing the data you wish to batch create .torrents for:

```
cd media/DiskID/home/username/private/TEST_DIR
```

**Step 2:**

Copy and paste the following set of commands to batch create your .torrents. Modify the announce URL and other mktorrent parameters to suit your needs.

This will process directories only:

```
ls -F | grep / | while read line; do mktorrent -a "http://announce/url" -p "$line"; done
```

`This will process both dirs and single files:`

```
ls -F | grep . | while read line; do mktorrent -a "http://announce/url" -p "$line"; done
```


The command assumes the default piece size for your .torrents, which will work fine for music albums and other relatively small files. Use the following set of commands for batch creating .torrents for bigger files such as packs or video:

```
ls -F | grep / | while read line; do mktorrent -a "http://announce/url" -p -l 21 "$line"; done
```




