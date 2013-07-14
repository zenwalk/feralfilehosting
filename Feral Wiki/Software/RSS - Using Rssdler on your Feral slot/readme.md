[Rssdler](http://code.google.com/p/rssdler/) is a utility to automatically download enclosures and other objects linked to from various types of RSS feeds. Works well on podcasts, videocasts, and torrents. This tutorial will guide you through setting up rssdler on your Feral box. (note: Waffles.FM prevents accessing RSS feeds directly on your Feral box. See [this guide](https://www.feralhosting.com/faq//view?question=39) for a possible workaround.)

### Downloading and Installing Rssdler ###

#### Using SSH (recommended):####

Connect to your server using an SSH client: Here is a guide on [using putty](https://www.feralhosting.com/faq/view?question=12):

	cd

Moves you to your home directory. You should be here by default, but just to be safe execute this command to start.

	mkdir -p ~/bin && mkdir -p ~/.rssdler

Makes directories named `.rssdler` and `bin` at `~/` which is short your your HOME directory.

### Download and prepare rssdler ###

    wget -qNO ~/rssdler.tar.gz http://rssdler.googlecode.com/files/rssdler-0.4.2.tar.gz
    tar -xzf ~/rssdler.tar.gz
    cp -rf ~/rssdler042/. ~/.rssdler
    rm -f ~/rssdler.tar.gz && rm -rf ~/rssdler042/

Downloads rssdler, extracts it, copies the contents, removes the tar and unpacked folder.

    touch ~/.rssdler/config.txt

Creates the config.txt

    echo -e '#!/bin/bash\npython '$HOME'/.rssdler/rssdler.py --run' > ~/bin/rssdler
    chmod 700 ~/bin/rssdler

This echo creates a simple script in the `~/bin` directory so we can easily run rssdler with a screen in a moment. We must then make it executable. If you get permission errors when running the screen command you did not do this step. Execute these two commands and that is the bash script created using SSH.

	echo $HOME

The last command with show you the path info you need to edit the `config.txt`

*Optional:  Using the nano command below you can edit the file:*

	nano -w ~/.rssdler/config.txt

Opens the blank new file in nano ready to paste in the custom config details in the paste bin link:

Or you can edit the new`~/.rssdler/config.txt` file with ftp and a text editor.

### The example config.txt ###

[Use this pastebin example config.txt](http://pastebin.com/QTakP9mj)

This `config.txt` must be edited a little to work on your slot. Please read the next section.

A commented config file with all available options can be found [commented config here](http://code.google.com/p/rssdler/wiki/CommentedConfig). Also here, a [pastebin rssdler commented version](http://pastebin.com/4VHjFPwX)

The `config.txt` you need to populate with the content of the example file can be found here:

	/media/DISKiD/home/USERNAME/.rssdler/config.txt

Note: The previous SSH commands created this file four you using the `touch` command.

### config.txt settings: ###

1: We suggest that you use the temporary download directories to test your set-up before using it properly as used in the config.txt:

These are already configured in the example `config.txt` linked above. You just need to change the path to that used on your slot. These are the parts you must edit:

In the Global section:

	downloadDir = /media/DISKiD/home/USERNAME/private/TESTdownload
	workingDir = /media/DISKiD/home/USERNAME/.rssdler

And in the example sections:

    directory = /media/DISKiD/home/USERNAME/private/TESTlegittorrents
    directory = /media/DISKiD/home/USERNAME/private/TESTmininova

Be sure to substitute `DISKiD` and `USERNAME` with your actual disk ID username in the config file. use this command to find your info:

Remember to use this command in SSH:

	echo $HOME

This will give you the info you need to copy and replace in the `config.txt`

2: In the last section of the `config.txt` we have three profiles, one for each feed. You create a new profile by creating a square bracketed name, for example: `[Cartoons]` . All info after that comes after this is related to this profile until you create a new square bracketed profile such ass `[Movies]`. 

What makes this quite useful is that if you can specify which feed goes where using the `directory = field. If you leave this blank things will be download to the folder specified in the `[Global]` section. In this the example config.txt the global value is `~/private/TESTdownload` 

The example `config.txt` has three working profiles, two with custom directories and one that has no directory specified and will therefore use the global value. This is so you can easily see how to set up your profiles.

- Mininova - custom directory ~ 20 torrents in the feed
- Legittorrents - custom directory ~ 20 torrents in the feed
- OpenOffice - global directory ~ 940 torrents in the feed. Uses filters to only return ~ 38 Linux x86_64 results.

In my testing TESTmininova was populated first, then TESTdownload then TESTlegittorrents. This might not be the same for you though.
 
Please see the example `config.txt` and Configuring Filters section  further on for examples of this.

3: This application seems to downloads one rss feed at a time and takes a second or more per rss item. This means if your feed has hundreds of items that the app needs to get in order to be up to date, you might be in for a long wait.

So if you are using a feed with many many items consider this before you think something is not working. Try using some filters on this feed first.

There are some demo filters with the OpenOffice Linux feed.

4: URL encoding: This link below caused the application to fail because of `%` in the url. You must escape it with another `%` symbol for it to work so:

This:

	link = http://borft.student.utwente.nl/%7Emike/oo/bt.rss

becomes:

	link = http://borft.student.utwente.nl/%%7Emike/oo/bt.rss

Now it will work.

5: The working directory: this is set to use the `~/.rssdler/` directory by default. This means that anything that does not use a full path is treated and being relative to this location.

6: Pay special attention to the `scanMins` setting — this is how often rssdler will be checking the feed. Don't set this value too low — 15 minutes should be safe to start with. Consult with your tracker regarding the minimum allowed Rss poll frequency on this specific tracker. Don't joke with it — your IP will most likely get banned by the tracker if you check the feed way too frequently.

7: Please note that we are specifying no filters for our tests feed apart from the Linux ones (since there was over 900) — this means that rssdler will download all .torrents in the feed not filtering them for now by any criteria.

It's time to test our set-up.

### Launching rssdler in Screen and testing Your set-up ###

[SSH](https://www.feralhosting.com/faq/view?question=12) to your server. Type:

	screen -dmS myrssdler rssdler

This command will start a screen session in the background called `myrssdler` using the bash script we created in `~/bin/rssdler`

After you have done this type:

	screen -ls

This will show you all active screens and we are looking for something like this:

	11431.myrssdler	(30/04/13 16:51:12)	(Detached)

If you do not see this then most likely something went wrong when rssdler tried to start based on your `config.txt` additions (all examples have been tested to work). You can check the `~/.rssdler/downloads.log` for any information.

I found the easiest way to figure out was wrong when the app would not start was to open and attach to a screen then run the application to see the error:

	screen -S myrssdler

Then inside the screen type:

	rssdler

You should now see what was causing the error and know where to start troubleshooting.

To check on rssdler, you will just reattach this screen session by typing `screen -r myrssdler`. You will be able to leave rssdler running in the background by detaching the screen session `ctrl + a + d`. Read our [rTorrent tutorial](https://www.feralhosting.com/faq/view?question=2) or the more general tutorial on [using Screen](https://www.feralhosting.com/faq/view?question=16) to familiarize yourself with the concept.

If everything was set up correctly and you made no typos in the configuration file, rssdler should start up, read the config file, download .torrents from your test feed and store them in your test directory.

*(Please note that there's no need to restart rssdler for it to pick the changes you make to the config file. You can edit the config, and rssdler will pick up the changes on the fly.)*

Leave rssdler running for a while and observe it in Screen. Once you are satisfied with the results, you can edit config.txt and change the download directory to your actual watch folder.

Please be very careful with this script. Filters need to be set-up correctly for rssdler to download only what you want, and not everything in the feed. Errors in the config may harm your ratio or, in the worst scenario, destroy it completely.

**ATTENTION: Do test your set-up properly before sending .torrents to your actual watch folder! Configure your filters and leave rssdler running for about a day, then examine the download directory to see what it actually downloaded and if your filters are actually filtering out the right stuff!**

### Configuring Filters ###

This part of the tutorial needs to be expanded on. For now please consult [this file](http://code.google.com/p/rssdler/wiki/CommentedConfig) for reference.

**Example 1:**

    [Example1]
    link = http://rss.torrentleech.org/rss.php?passkey=XXXXXXXXX--EDIT-ME--XXXXXXXXXX
    maxSize = 400
    directory =/media/DISKiD/home/USERNAME/private/rtorrent/TEST
    regextrue = (Dexter)
    regexfalse = (hr|720|1080|ntsc|x264|sct)
    nosave = False

**Example 2:**

    [Example2]
    link = http://rss.torrentleech.org/rss.php?passkey=XXXXXXXXX--EDIT-ME--XXXXXXXXXX
    maxSize = 0
    minSize = 195
    nosave = False
    # checkTime1Day = Mon
    # checkTime1Start = 18
    # checkTime1Stop = 21
    regextrue = (Prison.Break|Heroes|Gossip.Girl|Sons.of.Anarchy|Fringe)
    regexfalse = (HEBSUB|D0|DVDR|DVD-R|DVDRip)

Please note that no download directory was specified in `Example 2` — rssdler will use the global setting in this case.

The lines starting with a # are commented out — this means rssdler will ignore these settings when parsing the config.

You can learn about all available settings [here](http://code.google.com/p/rssdler/wiki/HelpMessage).

If you need help on using regular expressions, you can find it [here](http://www.regular-expressions.info/quickstart.html). You can use this [online tool](http://erik.eae.net/playground/regexp/regexp.html) for testing your regex.

Provided your filters are configured correctly, these settings should suffice for running rssdler on most trackers.

**For some trackers however it's necessary to have a properly formatted cookies.txt file in the .rssdler dir. Please search the tracker's forum for information on how to configure this file.**

### Advanced: Command Line Options ###

To add these commands all you have to do is edit the `~/bin/rssdler` bash script and add your options there. The kill the PID and run the screen command above again.

	--config/-c can be used with all the options except --comment-config, --help
    --comment-config: Prints a commented config file to stdout
    --help/-h: print the short help message (command line options)
    --full-help/-f: print the complete help message (quite long)
    --run/-r: run according to the configuration file
    --runonce/-o: run only once then exit
    --daemon/-d: run in the background (Unix-like only)
    --kill/-k: kill the currently running instance (may not work on Windows)
    --config/-c: specify a config file (default /home/james/.rssdler/config.txt).
    --list-failed: Will list the urls of all the failed downloads
    --purge-failed: Use to clear the failed download queue. 
        Use when you have a download stuck (perhaps removed from the site or 
        wrong url in RSS feed) and you no longer care about RSSDler attempting 
        to grab it. Will be appended to the saved download list to prevent 
        readdition to the failed queue.
        Should be used alone or with -c/--config. Exits after completion.
    --list-saved: Will list everything that has been registered as downloaded.
    --purge-saved: Clear the list of saved downloads, not stored anywhere.
    --state/-s: Will return the process ID if another instance is running with.
        Otherwise exits with return code 1
        Note for Windows: will return the pid found in daemonInfo,
        regardless of whether it is currently running.

### Dealing with Unicode Related Issues in Rssdler ###
rssdler is known to crash on encountering Unicode characters in file names. If the feeds you'll be using do not normally contain those, there's no further action required. If however you plan on using what.cd feeds, patching rssdler to ignore errors is a must.

Open the `rssdler.py` file. Locate the line:

	if not isinstance(s, basestring): s= unicode(s) # __str__ for exceptions etc

Erase it, and paste the following instead:

    if not isinstance(s, basestring):
        try:
            s= unicode(s) # __str__ for exceptions etc
        except:
            s= unicode(s.__str__(), errors='ignore')
    if isinstance(s, str): s = unicode(s, 'utf-8', 'replace')
    if not isinstance(s, unicode): 
        raise UnicodeEncodeError(u'could not encode %s to unicode' % s)

Be careful while editing the file. Indentation is important. Do not use tab for indentation, use the space key. The screen shot below shows what this section of the file must look like (with whitespace marked):

![](http://i29.tinypic.com/1zntkyr.jpg)

An already modified rssdler.py can be found [here](http://rusak.pastebin.com/f624298d3).

### Other Known Issues ###

`WAFFLES.FM`:

Until further notice, Waffles.FM banned OVH IP ranges from accessing the website, while still allowing access to the tracker. You will thus be able to use your Feral box to download/upload stuff from/to Waffles.FM, but you will not be able to access Waffles.FM website using Feral VPN / SSH tunnel or use Waffles.FM RSS feeds directly on your Feral box. See [this guide](https://www.feralhosting.com/faq/view?question=39) for a possible workaround.



