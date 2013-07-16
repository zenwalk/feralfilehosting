
Plowshare homepage: [http://code.google.com/p/plowshare/](http://code.google.com/p/plowshare/)
Plowshare Readme: [http://code.google.com/p/plowshare/wiki/Readme](http://code.google.com/p/plowshare/wiki/Readme)

Plowshare is a UNIX/Linux command line tool for downloading files from file sharing websites like rapidshare.com, hotfile.com, depositfiles.com, and so on, it currently has support for 36 sites.

The real benefit for users is Plowshare's ability to take a file of links and download them all, with automatic captcha solving, and you can start it running and then logout of your Feral slot leaving it to do all the hard work.

The automatic captcha solving is done by using one of several sites which allow you to either buy captchas or to earn them by solving other people's captchas and so build up captcha credits for your own future use. In this guide I will explain how to setup Plowshare to use captchatrader.com which is the site that allows you to earn captchas by solving them as and when you want to earn credits. When Plowshare needs to solve a captcha it will send a request to captchatrader.com and as long as you have credits available the captcha will be solved. As well as captchatrader.com you can also use deathbycaptcha.com and antigate.com which both sell captcha solving cheaply, but only captchatrader.com has the facility to earn credits by solving other people's captchas. Note: Cost, deathbycaptcha.com sells 5000 captchas for US$6.95, the cost on the other 2 sites is in the same ballpark.

Plowshare is a command line tool and while not hard to install, setup, and run, it is not for Linux newbies. You really need to know how to edit files on your Feral slot, create and change directories, and such like. This is a step-by-step guide for installing and using Plowshare on your Feral slot and not a how-to-do the basics of UNIX/Linux.

### Step 1 - Get the Plowshare source file on to your Feral slot.

Download the latest "Plowshare source tarball" (the file which ends in ".tar.gz") from this page:
     
[http://code.google.com/p/plowshare/downloads/list](http://code.google.com/p/plowshare/downloads/list)

The current version as of July 17, 2012 is `"plowshare-snapshot-git20120707.tar.gz"` but that will change in time.
     
Create a temp 'install' directory on your Feral slot, let's say 'plowtemp', and put the "plowshare-snapshot-version-num.tar.gz" file into that directory.
     
More advanced Linux users can use wget to download the file directly to their Feral slot. e.g.

Note: For the correct link to use with wget click on the ".tar.gz" file on the Plowshare downloads page and then copy the download link on the page you are taken to.

~~~
wget http://plowshare.googlecode.com/files/plowshare-snapshot-git20120707.tar.gz
~~~

### **Step 2 - Untar the Plowshare source.**

Make sure you are in the temp install directory you created, e.g. 'plowtemp'.

Untar the source tarball with this command:

~~~
tar -zxvf plowshare-snapshot-*.tar.gz
~~~

The tar command above will create a new directory with the same name as the plowshare-snapshot-version-num.tar.gz but without the ".tar.gz" extension. This directory will contain all the files needed for the installation.

### **Step 3 - Install Plowshare.**

Change to the directory that was created by tar in Step 2, e.g. 'plowshare-snapshot-version-num'.

If you type the command "ls -l" you should see a file listing of something like this:

~~~
-rw------- 1 YourUserName YourUserName  2342 Jun  9 11:38 AUTHORS
-rw------- 1 YourUserName YourUserName  9203 Jun  9 11:38 CHANGELOG
drwx------ 2 YourUserName YourUserName  4096 Jun  9 11:38 contrib
-rw------- 1 YourUserName YourUserName 35147 Jun  9 11:38 COPYING
drwx------ 2 YourUserName YourUserName  4096 Jun  9 11:38 docs
drwx------ 2 YourUserName YourUserName  4096 Jun  9 11:38 etc
-rw------- 1 YourUserName YourUserName  1338 Jun  9 11:38 INSTALL
-rw------- 1 YourUserName YourUserName  3702 Jun  9 11:38 Makefile
-rw------- 1 YourUserName YourUserName  6805 Jun  9 11:38 README
-rwx------ 1 YourUserName YourUserName  3746 Jun  9 11:38 setup.sh
drwx------ 4 YourUserName YourUserName  4096 Jun  9 11:38 src
drwx------ 2 YourUserName YourUserName  4096 Jun  9 11:38 tests
~~~

To install Plowshare as non-root (you do not have root / sudo privileges on your Feral slot), run the "make install" command below:

NOTE: It is important that you use exactly this command and not the one specified in the INSTALL file which does not work (I know I tried it and it does not put the executable links in the 'bin' directory - see below).

~~~
make install PREFIX=$HOME
~~~

NOTE: When you run the command above you might notice the error below - Do Not Worry! The install process is just trying to check that you are installing the newest version of Plowshare and using 'git' to check. Feral slots do not have 'git' installed so this process will not work, but the install will continue to work perfectly well.

~~~
/bin/sh: git: command not found
~~~

The "make install" command will install the Plowshare script into a directory called 'share' in your home directory. It will also create another directory in your home directory called 'bin' (if that does not already exist) into which it will place symbolic links to the various executable scripts that make up Plowshare. Do not move or change the names of these directories or anything inside them or Plowshare will probably stop working.
     
You can now check to see if Plowshare is installed, just run the following command:

~~~
plowdown -h
~~~

You should see a page of usage and options. If instead you get "command not found", it will be because the 'bin' directory has not been added to your $PATH. Just log out of Feral and then log back in again and it should work. (Feral slots have a '.bashrc' file which automatically adds the '~/bin' directory to your path if 'bin' exists and '.bashrc' is run when you login.)

At this point you can delete the temp install directory you created, i.e. 'plowtemp', as well as the source tarball (.tar.gz) file if you want, they won't be needed again.

### **Step 4 - Fix Potential IPv6 (Internet Protocol v6) Problem.**

There is no support on Feral slots for IPv6 (Internet Protocol version 6) at the moment. Plowshare makes extensive use of a program called 'curl' to access the web and you must create a 'curl' init file to make sure 'curl' always uses IPv4 IP addresses and not IPv6.
     
Create a file in your home directory called '.curlrc' and in it place just the short line below:

~~~
--ipv4
~~~

You can achieve this by running the following command:

~~~
echo '--ipv4' >> ~/.curlrc
~~~
 
### Step 5 - Create an automated captcha Account (Optional).

If you prefer just to buy some captcha solving you can instead use deathbycaptcha.com or antigate.com to buy credits

Using captchatrader.com for free resolutions is no longer possible, as the site has been down for some time. Automated captcha solving now seems to be fully in the realm of paid services. An alternative for manual captcha solving is to use the --captchamethod=imgur option. Plowshare will provide you with an imgurlink hosting the captcha, and you will need to solve it yourself.

### Step 6 - Create a Plowshare Config File.

You do not need to create a config file, everything can be done on the command line, but it is useful to use one.
 
Plowshare uses this file location for its config file: ~/.config/plowshare/plowshare.conf
 
Go to your home folder and make the directories and file, e.g. like this:

~~~
cd $HOME
mkdir .config
cd .config
mkdir plowshare
cd plowshare
touch plowshare.conf
~~~

Now you must edit the 'plowshare.conf' file. Mine looks like this:

~~~
# Plowshare configuration file

[General]
# I have a rapidshare Premium account, so have entered my login details:
rapidshare/a=UserName:UserPass

# Plowshare readme shows how to enter login details for other sites, e.g.
# mediafire/a="UserName:Pass With Spaces Use Quotes"
# freakshare/b=UserName:UserPass
# Note: The "/a" denotes a premium account, the "/b" denotes a registered but free account.

[Plowdown]
timeout=21600
max-retries=15
captchatrader=UserName:UserPass

# If using deathbycaptcha.com use this instead of "captchatrader=":
# deathbycaptcha=UserName:UserPass

# If using antigate.com use your key instead of user/pass:
# antigate=49b1b8740e4b51cf51838975de9e1c31

#
~~~

I have a rapidshare.com account, so my login details go in the `'General'` section. The other sites can have login details entered as well, see the notes in the example config file above and the readme linked below.

The `'Plowdown'` section can have all kinds of things set in them, I just have a few. If you are using captchatrader.com enter your login details in the way of my example, if your username or pass uses spaces then add double quotes, e.g. captchatrader="UserName:UserPass"
     
Any option can be placed in the config file, please see the Plowshare Readme config file section, here:
[http://code.google.com/p/plowshare/wiki/Readme#Configuration_file](http://code.google.com/p/plowshare/wiki/Readme#Configuration_file)


### **Step 7 - Using Plowshare.**

Plowshare can be used to download, upload, list, and delete files on the file sharing websites.

See the Plowshare Readme usage examples section, here:
[http://code.google.com/p/plowshare/wiki/Readme#Usage_examples](http://code.google.com/p/plowshare/wiki/Readme#Usage_examples)

I would think you'll mainly be downloading files using 'plowdown', here are a few examples of its basic usage, but you can get a lot more information in the readme (already linked above) or by entering 'man plowdown' on the command line. If you want to use 'plowup' for uploading files, 'plowdel' for deleting them, or 'plowlist' for listing the contents of a shared-folder link then read their man pages and the webpage readme.

To download a single file it's as easy as this:
~~~
plowdown http://www.rapidshare.com/files/86545320/TestName.rar
plowdown http://depositfiles.com/files/zqwghtyz
~~~

If a captcha needs to be solved, and you set it up correctly, then that will be done automatically for you.

To download a file of links, just create a text file with each link on a single line, e.g.

# --------------------------------------------------------------------
### Links example file: links.txt
http://depositfiles.com/files/zqwghtyz
http://depositfiles.com/files/qwwgmsjs
http://depositfiles.com/files/shashsnd
http://depositfiles.com/files/whayetms
# --------------------------------------------------------------------

Then run plowdown with the file name:
~~~
plowdown links.txt
~~~

If you use the -m switch then each link will be 'commented out' in the 'links.txt' file as and when it has been successfully downloaded.
~~~
plowdown -m links.txt
~~~

You can also use plowdown to check - but not download - links, so you can check that all parts of a multi-part archive exist before starting the download process. Again using a single link or a file of links.
~~~
plowdown -c http://depositfiles.com/files/zqwghtyz
plowdown -c links.txt
~~~

**How to run plowdown even after you have logged off Feral:**

A useful hint for Feral users is that if you use the '&' control operator at the end of the command line, then the command will 'return' immediately and continue to run as a background task. This means you can start plowdown and then logoff Feral while plowdown continues to run. If you stay logged in you will continue to get messages from plowdown in your terminal window (unless you used the -q, --quiet switch) but logging out of Feral will not kill the process.
     
Just enter the command, add a '&' at the end of it, and afterwards logout of Feral as normal, e.g.
~~~
plowdown -m links.txt &
~~~

 
That is the end of this tutorial but there is lots more information on the Plowshare site. If you decide to use  captchatrader.com you might use me as your referrer when you create your account (just enter 'gencon' as the referrer) and I'll be given a few credits - no need unless you've found this tutorial useful and want to do me a favour for the 2-3 hours it took me to write. Cheers.


**Thanks to user gencon for the original writeup!**