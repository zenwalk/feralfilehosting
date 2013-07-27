### What this guide is:

This guide outlines the installation of generic Linux software. Following this guide is a good place to get started installing most, but not all Linux packages. Please keep in mind that Feralhosting.com is does not officially support any software installed via this method -- but you might get lucky on the IRC channel -- many of the other customers volunteer to help out with unofficial support there.

You may wish to use this guide instead of one you found via Google -- any guide that has any of the following commands **will not work as written** on Feralhosting.com slots.

~~~
apt-get
yum
sudo
su
~~~

For various reasons, any guide that requires **any** of these commands **will** fail, but you may be able to modify that guide with the steps given here.

This guide will work in many cases. Most Linux software is packaged with support for these steps built into it.

###  What this is not:

This guide is not a catch all. It is not going to work for all software, and there is no way to know or list what software it will or will not work with. It is not comprehensive -- there is no reasonable way to cover all possible issues. This guide is also not a guide for any one specific application. Any and all examples are exactly that -- examples.

### Intended audience:

It is assumed that you understand how to use the Linux command line, and can use SSH to access it. You should be comfortable with basic commands, and understand how to ask for assistance when encountering issues. You do not have to be a Linux pro, but you should be comfortable enough to try things on your own before asking for help. That said, do not hesitate to ask on IRC for help.

###  How this works:

There are typically two ways to install software on Linux 1) with a package manager or 2) from source. Using a package manager requires administrative access, something users do not have on Feralhosting slots. Installing from source does *not* require administrative access.

What we are going to do:

1) download the source code for the software we want to install.
2) configure it to install where we want it to.
3) compile it.
4) install it.

### Download it:

In order for this to work, we need to have the source code. This is typically in either a "zip file" (filename.zip) or a "tarball" (filename.tar.gz). You will need to go to the author's website, and find the download section.

For my example, I went to [wiki.znc.in/ZNC](http://wiki.znc.in/ZNC) and found this download link: [http://znc.in/releases/znc-1.0.tar.gz](http://znc.in/releases/znc-1.0.tar.gz)

Now that I have a file, I need to download it. I recommend installing all your software in a special directory reserved for this purpose. This way, all of your custom installed applications are in one place for easy maintenance. I personally use ~/user_apps/PACKAGE_NAME

To go back to our ZNC example...

Make the directories to contain our code and finished packages:

~~~
mkdir -p ~/user_apps/znc/source
mkdir -p ~/user_apps/znc/binaries
~~~

Change into that directory:

~~~
cd ~/user_apps/znc/source
~~~

Now fetch the package:

~~~
wget --content-disposition 'http://znc.in/releases/znc-1.0.tar.gz'
~~~

wget is 'web get' -- get something off the web, --content-disposition helps keep the name of the downloaded file sane, and single quotes around the URL helps prevent minor errors.

Now  we have a downloaded file. We can check this with 'ls'

~~~
ls
znc-1.0.tar.gz
~~~

Now we unpack the file. If it is a tarball (FILE.tar.gz) we use:

~~~
tar xvfz znc-1.0.tar.gz
~~~

If it was a zipfile (FILE.zip) we use:

~~~
unzip znc-1.0.zip
~~~

Note -- I have never seen a case where you needed to run both commands. If you come into IRC and have issues because you run both -- we might tease you....

Now you need to change directories into the recently unpacked directory:

~~~
cd znc-1.0
~~~

And now... the magic. The first step to installing many Linux packages from source is to configure it -- but we need to give it a special argument so it configures to install where we want it to -- not where it defaults to. To do this, we use the --prefix argument. This is *prefixed* to the location the file is installed to. This can be any path you want, but I suggest something like the following:

~~~
./configure --prefix=${HOME}/user_apps/znc/binaries/znc-1.0
~~~

Now we need to compile this:

~~~
make
~~~

And now to install it:

~~~
make install
~~~

That's it.. It's installed. You can run your newly installed software by running:

~~~
~/user_apps/znc/binaries/znc-1.0/bin/znc
~~~

If you want to add a few bells and whistles:

###  Cleaning up the paths and making updating easier

Make a symlink to the current version:

~~~
ln -s ~/user_apps/znc/binaries/znc-1.0/ ~/user_apps/znc/current
~~~

This creates a shortcut so that we can run:

~~~
~/user_apps/znc/current/bin/znc
~~~

Instead of

~~~
~/user_apps/znc/binaries/znc-1.0/bin/zinc
~~~

The real benefit here is that when you update ZNC to a new version, you have the same command to run to run it, no matter what the version number is.  ~/user_apps/znc/current/bin/znc if maintained, will always be the most recent version -- and if you find an upgrade breaks something, you can change back to an older version easily. You will not need to update your crontab or scripts if you change versions.

BUT WAIT, THERE' S MORE!!

That's still an awkward command -- we can make it even easier:

~~~
mkdir -p ~/bin
ln -s  ~/user_apps/znc/current/bin/znc ~/bin/
~~~

This makes it so we just have to run `~/bin/znc` to start our new application.

BUT WAIT, THERE' S MORE!!

We can be even lazier:

On older slots (non Cogent) do this command:

~~~
source ~/.bashrc
~~~

On Cogent slots do this command:

~~~
source ~/.profile
~~~

Now all you need to do is run "znc" -- about as short as you can make it.




