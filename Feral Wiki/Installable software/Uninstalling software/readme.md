
So you've tried several torrent clients and now you feel you'd like to stop using some of them. If you are concerned about system resources, do not worry: if you do not actively use a client, it consumes almost no resources, even if it remains running. Simply clear out any data in the client and leave it be.

Though sometimes you really may not want your client to run any longer, for instance, you switched to another for good. If you kill the process, it will just restart again — this is by design. We want your programs to run all the time for you. 

To make a client stop loading automatically after being killed, simply [log into your shell](https://www.feralhosting.com/faq/view?question=12), and create a special file in the client's folder. Then kill its process. Please check the FAQ for each client on how to kill it.

For [rtorrent](https://www.feralhosting.com/faq/view?question=2), please execute this command: 

```
touch ~/private/rtorrent/.prevent-restart
```

For [transmission](https://www.feralhosting.com/faq/view?question=4): 

```
touch ~/private/transmission/.prevent-restart
```

For [deluge](https://www.feralhosting.com/faq/view?question=62): 

```
touch ~/private/deluge/.prevent-restart
```

For [MySQL](https://www.feralhosting.com/faq/view?question=9): 

```
touch ~/private/mysql/.prevent-restart
```

With the `.prevent-restart` file in place, the client will not be started automatically. If you change your mind in the future, just remove the file from the corresponding folder. Remember, it is a .dot file or hidden, so it may seem like it's not there in your FTP or SFTP client; make sure you tell it to display hidden files and folders. In the shell, use the `ls -a` command to see it listed and `rm` command to remove it. After removing the special file, the client will be automatically restarted for you. 

But wait! You say that the very sight of the program's folder offends you? Just remove the folder for the client from the `~/private` directory, and don't forget the webui from the `public_html` directory and the program is gone. All that will remain is the login information on your [Plan's page under your manager](https://www.feralhosting.com/manager/) — we can't do much about that part, without going into a lengthy explanation. You can always change your mind later and issue a re-install from the [**Install Software** link in your manager](https://www.feralhosting.com/manager/).








