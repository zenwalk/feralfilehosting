
Aerofs is essentially a peer to peer secure dropbox style app. You only share directly with your attached devices.

"AeroFS encrypts your data end-to-end, and only shares your files with those who you invite. Files are never stored in the public cloud."

### Prerequisites ###

You need Java installed on your slot to use this application. Do this command in a SSH:

You need to SSH into your slot to complete this guide. If you don't know how to do this [here is a basic guide](https://www.feralhosting.com/faq/view?question=12):

~~~
java -version
~~~

If you see something like this:

~~~
java version "1.7.0_26"
~~~

You already have it. If you get a `command not found` error you don't have Java and need to:

1: Open a ticket and ask for it to be installed.

or

2: Install it yourself using this [Java 1.7](https://www.feralhosting.com/faq/view?question=183 "Java 1.7") FAQ.

### Install AeroFS: ###

Please got to [https://aerofs.com/](https://aerofs.com/ "aerofs.com") and create an account.

~~~
wget -qNO ~/aerofs.tgz https://dsy5cjk52fz4a.cloudfront.net/aerofs-installer.tgz
tar -xzf ~/aerofs.tgz -C ~/private/
wget -qNO ~/sharutils.deb http://ftp.uk.debian.org/debian/pool/main/s/sharutils/sharutils_4.11.1-1_amd64.deb
dpkg-deb -x ~/sharutils.deb ~/private/aerofs
cp -r private/aerofs/usr/bin/. private/aerofs/ && rm -rf private/aerofs/usr/
rm -f ~/sharutils.deb && rm -f ~/aerofs.tgz
echo 'PATH=~/private/aerofs/:$PATH' >> ~/.bashrc
~~~

These command download and install everything we need.

Please reload your shell using this command:

~~~
source ~/.bashrc
~~~

At first run we need set up the app and it work better in a screen, so type this command:

~~~
screen -S aerofs
~~~

Inside the screen type:

~~~
aerofs-cli
~~~

This will start the set-up process.

- Enter the email you registered with when prompted.

- Enter you password for this account when prompted.

- Enter the path you want for you Aerofs folder when prompted. This path will `~/Aerofs` by default if you just press enter.

When the set-up is complete press this keyboard sequence to detach from the screen:

Press and hold `CTRL` and `A` then press  `D`

Once you have setup up Aerofs you can start it easily using this command:

~~~
screen -dmS aerofs aerofs-cli
~~~

To use the process interactively use this command:

~~~
aerofs-sh
~~~

Here is the result:

~~~
AeroFS>
~~~

Type `help` to see the help page

~~~
AeroFS> help
~~~



