
[Mumble](http://mumble.sourceforge.net/) is an open source, low-latency, high quality voice chat software primarily intended for use while gaming.

How to install and use the murmur Mumble server for use with Mumble clients.

The murmur server is the server for the mumble VoIP client.

```
wget -qO server.tar.bz2 http://downloads.sourceforge.net/project/mumble/Mumble/1.2.4/murmur-static_x86-1.2.4.tar.bz2
tar -xjf server.tar.bz2 && cp -rf ~/murmur-static_x86-1.2.4/. ~/private/murmur && rm -rf ~/murmur-static_x86-1.2.4
```

That is basically it for the download and extraction of the server. There are a couple of things we need to do before we start it.

Find and open this file.

```
~/private/murmur/murmur.ini
```

For example in SSH do this:

```
nano -w ~/private/murmur/murmur.ini
```

We must change the default port:

```
port=64738
```

to something else, any number between 6000 - 50000 is OK, for example:

```
port=23456
```

Optionally you can set a server password.

```
serverpassword=
```

Once this is done you can run the program using this command:

```
~/private/murmur/./murmur.x86 -ini ~/private/murmur/murmur.ini
```

Now you need to install the [Mumble client](http://mumble.sourceforge.net/) for your platform.

Create a new server and use the Address:

```
server.feralhosting.com
```

Where server is the actual name of your feral server.

**Important note:** You can use this command to run more than once server instance. So be careful to check for before running it.

Use this command to see all running instances of the murmur server

```
ps x | grep murmur | grep -v grep
```

To kill the process (all running instances) use this command:

~~~
killall -u $(whoami) murmur.x86
~~~






