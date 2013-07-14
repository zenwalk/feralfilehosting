In SSH do these commands. Use this faq if you do not know how to SSH into your slot: [SSH basics - Putty](https://www.feralhosting.com/faq/view?question=12)

Execute these commands:

	mkdir -p ~/private/spideroak
    wget 'https://spideroak.com/getbuild?platform=ubuntu&arch=x86_64' -O ~/spideroak.deb
    dpkg-deb -x ~/spideroak.deb ~/private/spideroak
    rm -f ~/spideroak.deb
    mv ~/private/spideroak/usr/bin/SpiderOak ~/private/spideroak

These commands below will do required start-up script edits for you. There are 4 commands in total:

    sed -i "3iSPIDEROAK_ROOT=$(cd ~/private/spideroak && pwd)\n" ~/private/spideroak/SpiderOak
    sed -i 's|LD_LIBRARY_PATH="/opt|LD_LIBRARY_PATH="$SPIDEROAK_ROOT/opt|g' ~/private/spideroak/SpiderOak
    sed -i 's|QT_PLUGIN_PATH="/opt|QT_PLUGIN_PATH="$SPIDEROAK_ROOT/opt|g' ~/private/spideroak/SpiderOak
    sed -i 's|exec "/opt|exec "$SPIDEROAK_ROOT/opt|g' ~/private/spideroak/SpiderOak

###Optionally you can do the start-up script edits manually:###

	cd ~/private/spideroak && pwd

You will see a result like this:

	/media/DiskID/home/username/private/spideroak

Edit the ~/private/spideroak/SpiderOak startup script with a text editor. It will look like this:

	#!/bin/sh

	LD_LIBRARY_PATH="/opt/SpiderOak/lib:$LD_LIBRARY_PATH"
	export LD_LIBRARY_PATH
	QT_PLUGIN_PATH="/opt/SpiderOak/lib/plugins/" ; export QT_PLUGIN_PATH
	SpiderOak_EXEC_SCRIPT=$(cd `dirname $0` ; pwd)/SpiderOak
	export SpiderOak_EXEC_SCRIPT
	exec "/opt/SpiderOak/lib/SpiderOak" "$@"[/code]

We must edit it to be like this:

	#!/bin/sh

	SPIDEROAK_ROOT=/media/DiskID/home/username/private/spideroak

	LD_LIBRARY_PATH="$SPIDEROAK_ROOT/opt/SpiderOak/lib:$LD_LIBRARY_PATH"
	export LD_LIBRARY_PATH
	QT_PLUGIN_PATH="$SPIDEROAK_ROOT/opt/SpiderOak/lib/plugins/" ; export QT_PLUGIN_PATH
	SpiderOak_EXEC_SCRIPT=$(cd `dirname $0` ; pwd)/SpiderOak
	export SpiderOak_EXEC_SCRIPT
	exec "$SPIDEROAK_ROOT/opt/SpiderOak/lib/SpiderOak" "$@"[/code]

1: Create the new line using your result from the `cd ~/private/spideroak && pwd` command: `SPIDEROAK_ROOT=/media/DiskID/home/username/private/spideroak`
2: Edit the `LD_LIBRARY_PATH="...`
3: Edit the `QT_PLUGIN_PATH="...`
4: Edit the `exec "...`

Then save the file, uploading and overwriting if necessary:

###SpiderOak First run.###

You need to have already created an account on the website. If you have not already done so, please do this now here: [SpiderOak signup](https://spideroak.com/signup/)

You also need to have set-up the application on your main device before setting it up on a Feral Slot. If you try to login before doing this you will get an error like this:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/SpiderOak/setuperror.png)

Once you have done that then execute this command to configure SpiderOak:

	~/private/spideroak/SpiderOak --setup=-

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/SpiderOak/setup1.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/SpiderOak/setup2.png)

When you install SpiderOak for the first time onto your machine you will create a "device". This will be linked to your main account. In this example i have already configured other devices elsewhere.

Leave this option blank when following this FAQ to create a new device, which we will call [b]FeralSpider[/b] in this example.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/SpiderOak/setup3.png)

After you have named your new device it will take some time to synchronise.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/SpiderOak/setup4.png)

When you see this it is done.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/SpiderOak/setup5.png)

###Run SpiderOak in a screen:###

Type this command

	screen -S SpiderOak

Once inside the screen type this:

	~/private/spideroak/SpiderOak --headless

You will get no result as shown in the below image. No error is a good thing. If you get an error re check the step in this FAQ for configuring the start up script.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/SpiderOak/screen.png)

Press this keyboard sequence to detach from the screen

	ctrl a d

SpiderOak is now running on your slot.

By default in v5 of SpiderOak it will be syncing to a newly created HIVE folder in your home/root directory. You can find this folder at:

	~/SpiderOak Hive

Anything you put in here will sync to your other devices Hive directory.

###Mini FAQ:###

Q: Where are the configuration files stored?

A: When you run the set-up a new, hidden directory is created at: `~/.SpiderOak`

###Useful links:###

[Command Line Help](https://spideroak.com/faq/questions/67/how_can_i_use_spideroak_from_the_commandline/)

[SpiderOak FAQs](https://spideroak.com/faq/)