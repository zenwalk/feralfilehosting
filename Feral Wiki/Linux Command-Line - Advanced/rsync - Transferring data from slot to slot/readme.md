### Rsync toolkit bash script

Do this command on your **NEW** slot:

~~~
wget -qO ~/rsynctk.sh http://git.io/ikae7Q && bash ~/rsynctk.sh
~~~

This script basically does 3 things.

**1:** Asks you for inputs such as username and server name and will then generate you a working command that you can do inside a screen window.

**2:** You can continue and have the script create a screen and add the command. This stage requires your SSH passwords for your old slot. If you complete the steps correctly, it will create a screen and start the transfer based on your input.

**3:** whatbox.ca: The script can perform the same two features as above, but for importing from whatbox.ca. You will be presented with this option when the script runs.

If anything, you can just do stage one to get a working command. Remember, you run this script on your **NEW** slot. It copies files from your old slot to the new. The process is started and runs on the new slot.

### rysnc Intro

Let us say that you have just purchased an upgraded slot and would like to move files over from the old slot over to your newer slot. This can be done through a ticket and usually is, but here I will explain how to do this partially or completely by yourself in SSH with very reliable results using a program called screen with another program called rsync.

**Step 1:** First though, a couple of preparation steps to make life and the task a bit easier. There are several ways to do this part -- pick what is easiest for you. 

Don't forget that you can open a ticket and ask Staff to do this for you if you are struggling:

If you plan on cloning/copying your entire HOME folder or a particular and existing folder like `~/private` to `~/private`, you do not need to move the files first. You can just skip to **Step 2**. 

**Step 1:** describes preparing a method for easily and selectively copying files from one slot to another. 

**Step 2:** further describes the use of rysnc to copy files.

### Step 1: Prepare our NEW slot

**1** [SSH](https://www.feralhosting.com/faq/view?question=12) to your NEW slot.

Here we will now create the folder where you wish to store the transferred files. Staff use a naming scheme like `data-from-old` of similar. Here we will use `rysnc`:

~~~
mkdir -p ~/rysnc
~~~

This means there is now a folder called `rysnc` within your `~/` or slot root on the NEW server.

Now the process below will describe how to copy all or parts of your old slot's data to the newly created `rsync` folder on your new slot.

### Step 2: Using rysnc

**2.1**

**Important note:** It is best to start transfers inside a screen window. This is a pretty simple thing to do.

Use this command to create a screen for us to use:

~~~
screen -S transfer
~~~

If it already exists, reconnect to it using this command:

~~~
screen -r transfer
~~~

Once it has opened you will be placed inside the new screen window.

**2.2** rsync, the command and structure

**Important note:** Please see the end of the FAQ for a breakdown of the arguments used as well as some optional extras.

This is the command we will use to copy files from our old slot to our new slot, while connected to our new slot via SSH.

~~~
rsync -avhPS usename@server.feralhosting.com:~/location/of/files ~/destination/of/files/
~~~

For example, using the directories we created in **Step 1** we can do this

~~~
rsync -avhPS usename@server.feralhosting.com:~/private/rtorrent/data ~/rsync/
~~~

This will copy the folder and the contents of the `~/private/rtorrent/data` directory from the `usename@server.feralhosting.com` used in the command into the `~/rsync` directory of the slot you are currently SSH'd into.

**2.3** Understanding trailing slashes `/` in paths.

rysnc will be very specific about the use of a trailing slash in your paths. It has an important meaning to rsync and should be explained, so let us look at the example command above:

Here, rsync is copying from the left to the right. There is no trailing slash on our `~/private/rtorrent/data` path.

To help with the example, our `~/private/rtorrent/data` contains a single folder called `some.film.2013.720p`

~~~
~/private/rtorrent/data ~/rsync/
~~~

This means that rsync will copy the whole folder `data` into the `~/rsync/` directory on our new slot like this:

~~~
~/rsync/data/some.film.2013.720p
~~~

If we had used a trailing slash, we would be telling rsync that we want to copy the contents of the folder and not the actual folder itself.

~~~
~/private/rtorrent/data/ ~/rsync/
~~~

This command has a trailing slash, so the outcome will be different. The **contents** of the `~/private/rtorrent/data` will be copied to the `~/rsync/` directory on our new slot.

All files from within the data directory on our old slot will be copied to the `~/rsync/` directory.

~~~
~/rsync/some.film.2013.720p
~~~

Be careful with the use of a trailing slash. You could use the general rule of telling rysnc to look `inside this directory` when deciding whether to apply a trailing slash.

Here is a useful explanation of the use of a trailing slash: [External link](http://devblog.virtage.com/2013/01/to-trailing-slash-or-not-to-trailing-slash-to-rsync-path/)

### Step 3: Applying our command:

Once we have the correct command, with the relevant paths to your directories, let's do a quick check:

**3.1:** We have SSH'd to the server we want to copy the files to. This means your NEW slot.

**3.2:** We have opened a screen window in SSH and given it a name we can easily recognize ( that is what the -S does), in this example the screen name is **transfer**.

**3.3:** We have edited the command to be relevant to our details. So `username@server.feralhosting.com` has been edited to contain your relevant info such as the host where the files are we want to copy, for example: `huzzah378@lemur.feralhosting.com`

**3.4:** We have used existing directories that we either created in **Step 1** or that already exist.

**3.5:** Our command now looks something like this:

~~~
rsync -avhPS huzzah378@lemur.feralhosting.com:~/private/rtorrent/data ~/rsync/
~~~

Then in your screen window copy or type this command (in putty or Linux a right click will paste the contents of your clip board including a password, even if you don't see it.)

**Important note:** It does not matter if you have set up public or private key Auth for your SSH. The password that SSH will ask for is the one that is shown in your Slot Details page in your [Account Manager](https://www.feralhosting.com/manager/). This is the one that you received upon the creation of your slot.

If all goes to plan, the transfers should start and you will see stuff being moved in the screen window. You can either wait around and monitor its progress or detach from the screen to leave it running in the background. This will allow you to close the SSH connection (terminal) without interrupting the transfer. To do this in your screen:

Press and hold `CTRL` then press `d` to detach from the screen. This leaves it running in the background.

You should see a "you have been detached" or similar prompt from within the terminal.

That is it. 

You can attach to the screen at any time to check on things by typing this in a terminal:

~~~
screen -r transfer
~~~

Please see this Guide for [Completing a Data transfer](https://www.feralhosting.com/faq/view?question=122) for getting your torrent programs back up and running.

### Notes:

[http://linux.die.net/man/1/rsync](http://linux.die.net/man/1/rsync)

[http://ss64.com/bash/rsync.html](http://ss64.com/bash/rsync.html)

Here is the command broken down.

~~~
-avhPS
~~~

-a, --archive           archive mode; equals -rlptgoD (no -H,-A,-X)

-r, --recursive         recurse into directories
-l, --links             copy symlinks as symlinks
-p, --perms             preserve permissions
-t, --times             preserve modification times
-g, --group             preserve group
-o, --owner             preserve owner (super-user only)
-D                      same as --devices --specials

-h, --human-readable    output numbers in a human-readable format
-P                      same as --partial --progress
-S, --sparse            handle sparse files efficiently

**Optional arguments**

-n, --dry-run           perform a trial run with no changes made
-c, --checksum          skip based on checksum, not mod-time & size
-z, --compress          compress file data during the transfer

~~~
-anczvhPS
~~~



