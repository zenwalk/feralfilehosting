
Official product description:

~~~
WinSCP is an open source SFTP client and FTP client for Windows. Its main function is the secure file 
transfer between a local and a remote computer. Beyond this, WinSCP offers basic file manager functionality. 
It uses Secure Shell (SSH) and supports, in addition to Secure FTP, also legacy SCP protocol.
~~~

WinSCP is often disregarded by many users. The purpose of this tutorial, however, is to show you that WinSCP is much more than a file transfer client - it offers a clean, well designed graphic user interface (GUI) for performing many common tasks that otherwise could be confusing for a novice Linux user to achieve in the shell.

WinSCP is a very useful program for novice users.

### Getting Familiar with WinSCP

[Download](http://winscp.net/download/winscp515setup.exe) the installer version 5.1.5. This installation package has certain explorer like plug-ins for drag and drop.

[Download](http://winscp.net/download/winscp515.zip) Portable version 5.1.5. This way WinSCP will store all its settings in its own directory, not writing anything into the registry. Portable also means you will be able to run it from your USB drive.

Install or Save the executable to a directory of your choice and launch it. It will display a configuration window. Fill out the fields as suggested in the screen-shot below:

![](http://i31.tinypic.com/3133fdk.jpg)

You can find your access details [**Slot/Servername** link in your manager](https://www.feralhosting.com/manager/) (the Shell Access section).

Please note that if you followed our tutorial on [setting up public key authentication with PuTTY](https://www.feralhosting.com/faq/view?question=13) and created your key pair, you can provide the path to your private key file here — in this case there's no need to fill out the password field.

**Important note:** Please be sure to select SFTP as your connection protocol.

Please note that WinSCP might time out when executing a command — this is normal and should not frighten you :) — WinSCP displays a time-out warning if it doesn't receive a response from the server within 15 seconds, and some commands may need more than that to complete. Just click **OK** and disregard the time-out message — the command will complete in the background.

We suggest however that, while still in the WinSCP Login configuration dialogue, you click on **Connection** in the left pane and set the server response time-out to 600 seconds as shown in the screen-shot below.

![](http://i31.tinypic.com/2isioi1.jpg)

Click **Save** and give your session a name — for example, MY FERAL BOX. Be sure to tick the **Save password** option (even though it says it is not recommended).

Click **Login**. WinSCP will connect to your Feral box, and you will be presented with a view comparable to that of a regular FTP client — local files on the left, and remote files on the right:

![](http://i32.tinypic.com/aew6ye.jpg)

You can transfer files from your computer to the server and back, but WinSCP tends to be slow at that due to the fact that it encrypts the data on the fly. We suggest you use regular FTP over [VPN](https://www.feralhosting.com/faq/view?question=5) for your file transfers, or [download your files via http](https://www.feralhosting.com/faq/view?question=20).

WinSCP does shine however at helping you perform common server tasks easily and effortlessly — something that you might have not felt comfortable with when using SSH.

Let's see how this works.

Navigate to your rTorrent data dir —

~~~
/home/YOUR_USERNAME/private/rtorrent/data
~~~

— and right-click on any DIR in there. As you can see, among other things, you can:

- duplicate a DIR (create a copy of the current DIR and move it elsewhere on the server);

- move a DIR (use **Move to** to move a DIR elsewhere on the server; the **Move** command will move a dir to your local drive);

- change properties (i.e. chmod);

- apply custom commands, and that is where the real power is.

**Configuring Custom Commands**

**When running commands in WinSCP, you may get the following message: "Current SFTP-3 session does not support command you request. Separate shell session may be opened to process the command. Do you want to open a separate shell session?" Tick [b]"don't ask me again"** and click **OK**.[/b]

Right-click on the top toolbar and select **Custom Command Buttons**.

![](http://i32.tinypic.com/n6cnpv.jpg)

Your custom command bar will have less buttons since we have not configured our custom commands yet. Let's do that.

**CUSTOM COMMAND: CREATING A TORRENT**

Click on the last button in the custom command bar (**Customize Custom Commands** button). Then click **Add**.

You will see a custom command configuration window:

![](http://i25.tinypic.com/x1wx21.jpg)

Let's create a custom command for creating a torrent for what.cd.

Give your command a name and fill out the **Description** field. Let's call it WHAT.

![](http://i31.tinypic.com/14josaf.jpg)

Select **Remote command** and **Apply to directories**.

If you tick the last setting — **Show results in terminal** — then each time you create a torrent you will be shown the results in the console — useful for verifying that everything went well.

Now let's create the command itself:

~~~
mktorrent -a 'http://YOUR_ANNOUNCE_URL' -p -l 21 !&
~~~

Please note that the announce URL is placed in between single quotes. Substitute the example URL with your actual what.cd announce URL and fill out the custom command field. Click **OK**.

What exactly does this command do?

- creates a .torrent with your custom announce URL in it from the data in the selected dir;

- names the .torrent by the name of the selected dir;

- marks the .torrent as private;

- uses the **-l 21** switch for a non-default piece length which will (most probably) result in a different hash as compared to the original .torrent, which in its turn will let you seed the newly created .torrent in rTorrent along with the original one without any [additional hacks](https://www.feralhosting.com/faq/view?question=26);

- places the newly created .torrent in the current dir; now you can first copy it to you local drive and upload it to what.cd, and then right-click on it, choose **Move to** and move it to your rTorrent watch folder:

~~~
/home/YOUR_USERNAME/private/rtorrent/watch/
~~~

Please note that WinSCP remembers the paths you supply when running commands. Later on there will be no need to type in full paths again — you will just select a previously used path from a dropdown menu. Having a smart GUI can be nice.

Our first custom command is ready, and you should see a WHAT button in your custom command toolbar. Let's test it.

Navigate to your rTorrent data dir, choose any dir, select it — now you can either right-click on it and choose **Custom commands** > **WHAT**, or simply press the WHAT button in your custom commands toolbar to apply the command to the selected dir.

Repeat these steps  to create custom commands for making torrents for other trackers of your choice. You can have as many as you like.

As you can see, now it is a matter of simply selecting a dir and pressing a button. This is even faster and easier than in uTorrent, and that means something :).

**CUSTOM COMMAND: UNRAR'ING**

Here is a pastebin of the Feral Unrar Manual.

[Unrar Manual - Usage](http://pastebin.com/ds1w4Nzv)

another handy link regarding usage:

[Unrar Man Page http://linux.die.net](http://linux.die.net/man/1/unrar)

Follow the same steps to create a new custom command, and call it **UNRAR**.

[img=http://i26.tinypic.com/21or9dd.jpg][/img]

The command you will need to use is:

This command below uses e (Extract files to current directory) and -r (Recurse subdirectories} if they have the extension .rar

~~~
unrar e -r *.rar
~~~

This command below will unrar everything that is a rar

~~~
unrar x "*"
~~~

This command below will unrar everything that is a rar to a specific location, such as a WWW folder you created.

~~~
unrar x "*" Full/path/to/wanted/location
~~~

To run these commands, navigate to any dir containing rar'ed files, select a .rar and press the **UNRAR** button in your custom command toolbar. There will be a delay of about 1-2 minutes, after which you will be presented a console with the operation results. The unrar'ed file will be found in the same dir where you ran the command.

**Creating Symbolic Links (Symlinks)**

If you followed our tutorial on [setting up your public_html folder](https://www.feralhosting.com/faq/view?question=20), you might remember that creating symlinks via SSH requires a good deal of concentration. With WinSCP it's just a couple of clicks.

Use WinSCP to navigate to

~~~
/media/DISKID/home/username/www/username.server.feralhosting.com/public_html/
~~~

Right-click anywhere on the empty space in the remote pane and choose **New** > **Link...**.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SFTP%20and%20FTP/WinSCP%20-%20usage%20-%20performing%20common%20tasks%20-%20creating%20torrents%20-%20unrar%20-%20symlinks%20and%20more/symlink.png)

Choose a name for your symlink (it can be anything) and supply the path to your rtorrent data dir as shown in the screen-shot above. 

The path to your default rtorrent data folder will be like this for example:

~~~
/media/DISKID/home/username/private/rtorrent/data/
~~~

Where **DISKID** is your disk ID and **username** is your Feral username from the **Full Path**.

Click **OK**. And you're done.

**FLAC to MP3 Conversion and Automatic What.CD .torrent Creation**

Please see the Guide [here](https://www.feralhosting.com/faq/view?question=38).




