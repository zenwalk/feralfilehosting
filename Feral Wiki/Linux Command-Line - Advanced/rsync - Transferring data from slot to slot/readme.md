### Rsync toolkit bash script

Do this command on your **NEW** slot:

~~~
wget -qNO ~/rsynctk.sh http://git.io/ikae7Q && bash ~/rsynctk.sh
~~~

This script basically does 3 things.

**1:** Asks you for inputs such as **username** and **server** name and will generate you a working command that you can do inside a screen window.

**2:** You can continue and have the script create a screen and add the command. This stage requires your SSH passwords for your old slot. If you complete the steps correctly it will create a screen and start the transfer based on your input.

**3:** whatbox.ca: The script can perform the same two features as above but for importing from whatbox.ca . You will be presented with this option when the script runs.

If anything you can just do stage one to get a working command. Remember you run this script on your **NEW** slot. It copies files from your old slot to the new. The process is started and runs on the new slot.

### Rysnc usage explained with an example situation

Let us say that you have just purchased an upgraded slot and would like to move files over from the old slot over to your newer slot. This can be done through a ticket and usually is, but here I will explain how to do this partially or completely by yourself in SSH with very reliable results using program called screen with another program called rsync

**Step 1:** First though, a couple of preparation steps to make life and the task a bit easier. There are several ways to do this part, pick what is easiest for you to do. 

Don't forget you can open a ticket and ask Staff to do this for you if you are struggling:

If you plan on cloning/copying you entire HOME folder or a particular and existing folder like `~/private` to `~/private`  you do not need to move the files first. You can just skip to **Step 3**. **Step1:** and **Step2** describes preparing a method for easily and selectively copying files from one slot to another. 

**Step 3:** onwards describes the use of rysnc in general to copy files.

### Step 1: Selectively copying files and folders

**1** [SSH](https://www.feralhosting.com/faq/view?question=12) to your NEW slot (**the slot that has the files you want to move**) and copy or type this command.

~~~
mkdir -p ~/rysnc
~~~

**Step 2**:

**1** [SSH](https://www.feralhosting.com/faq/view?question=12) to you NEW slot.

Here we will now create the folder where you wish to store the transferred files. Staff use a naming scheme like `data-from-old` of similar. Here we will use `rysnc`

~~~
mkdir -p ~/rysnc
~~~

This means both folders are within your `~/` or slot root on both servers. Check you can `cd` you (move your location) to within the folder by using the code below in a terminal. Once you are happy both locations exist and are in the correct place move to the next step.

CD to the newly created or existing folder to check paths. **Use the name of the folders you selected/created**

~~~
cd ~/rysnc
~~~

The result in your Terminal will look something like this. 

~~~
chamois ~/rysnc
~~~

**Step 3**: This is the command we will use but first it needs to be edited to suit your details

**3.1**

**Important note:** It is best to start transfers inside a screen window. This is a pretty simple thing to do.

Use this command to create a screen for us to use.

~~~
screen -S transfer
~~~

Once this has opened you will be placed inside it the new screen window, now continue reading the guide:

**3.1** rsync command and structure

**Important note:** Please see the end of the FAQ for a breakdown of the arguments used as well as for some optional extras.

This is the command we will use to copy files from our old slot to our new slot, while connected to our new slot via SSH.

~~~
rsync -avhPS usename@server.feralhosting.com:~/location/of/files/ ~/destination/of/files/
~~~

for example, using the directories we created in step one we can do this

~~~
rsync -avhPS usename@server.feralhosting.com:~/rsync/ ~/rsync/
~~~

This will move the contents of the `~/rsync` directory from the `usename@server.feralhosting.com` used in the command into the `~/rsync` directory of the slot you are currently SSH'd into.

Once we have the correct command with the relevant paths to your directories let's do a quick check

**3:** We have SSH'd t the server we want to copy the file to i.e your new slot.

**3.1:** We have opened a screen window in the terminal and given it a name we can easily recognize ( that is what the -S does), in this example it is **transfer**.

**3.2:** We have edited the command to be relevant to our details? So **username@server.feralhosting.com** has been edited to contain your relevant info such as the host where the files are we want to copy, for example: **huzzah378@lemur.feralhosting.com**

**3.3:** We have used existing directories that we either created in step 1 or that already existed.

**3.4:** Our command now looks something like this:

~~~
rsync -avhPS huzzah378@lemur.feralhosting.com:~/fxp/ ~/fxp/
~~~

Then in your screen window copy or type this command (in putty or Linux a right click will paste the contents of your clip board including a password, even if you don't see it.)

**Important note:** It does not matter if you have set up public or private key auth for your SSH. The password that SSH will ask for is the one that is shown in your Slot Details page in your [Account Manager](https://www.feralhosting.com/manager/). This is the one that you received upon the creation of you slot.

If all goes to plan the transfers should start and you will see stuff being moved in the screen window. now you can either wait around and what it's progress or detach from the screen to leave it running in the background. This will allow you to close the SSH connection(terminal) without interrupting the transfer, to do this, in your screen do button combo:

press and hold left **CTRL + a** then press d

You should see a "you have been detached" or similar prompt from within the terminal.

that is it, you can attach to the screen at any time to check on things but typing this in a terminal

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

-a, --archive               archive mode; equals -rlptgoD (no -H,-A,-X)

-r, --recursive             recurse into directories
-l, --links                 copy symlinks as symlinks
-p, --perms                 preserve permissions
-t, --times                 preserve modification times
-g, --group                 preserve group
-o, --owner                 preserve owner (super-user only)
-D                          same as --devices --specials

-h, --human-readable        output numbers in a human-readable format
-P                          same as --partial --progress
-S, --sparse                handle sparse files efficiently

**Optional arguments**

-n, --dry-run               perform a trial run with no changes made
-c, --checksum              skip based on checksum, not mod-time & size
-z, --compress              compress file data during the transfer

~~~
-anczvhPS
~~~
