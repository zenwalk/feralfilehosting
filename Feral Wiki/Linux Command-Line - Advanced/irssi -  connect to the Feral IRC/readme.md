
Here is the basic set-up to get connected to the Feral IRC channel using Irssi:

Doe these commands in [SSH](https://www.feralhosting.com/faq/view?question=12):

1: Create a required folder and get a custom theme

~~~
mkdir -p ~/.irssi/scripts
wget -qNO ~/.irssi/xchat.theme http://irssi.org/themefiles/xchat.theme
~~~

2: Get a nick colour and trigger script:

~~~
wget -qNO ~/.irssi/scripts/xchatnickcolor.pl http://dave.waxman.org/irssi/xchatnickcolor.pl
wget -qNO ~/.irssi/scripts/trigger.pl http://scripts.irssi.org/scripts/trigger.pl
~~~

3: Create a screen and open irssi in it using this command:

~~~
screen -S irssi irssi
~~~

Once it has loaded copy or type these commands to configure your username. Where `username` is your Feral username (it can be something else):

~~~
/set NICK username
/set user_name username
/set real_name username
/HILIGHT username
~~~

4: Make some configuration changes

~~~
/set autolog ON
/set recode_autodetect_utf8 ON
/set recode_fallback utf-8
/set recode_out_default_charset utf-8
/set term_charset utf-8
/set theme xchat
/run xchatnickcolor.pl
~~~

Configure your server and channel settings:

Remove -auto to stop it automatically connecting on start-up:

~~~
/network ADD -autosendcmd "/msg nickserv IDENTIFY YourPassGoesHere;wait 2000" What-Network
/server ADD -ssl -auto -network What-Network irc.what-network.net 6697
/channel ADD -auto #feral What-Network
~~~

Save your configuration changes

~~~
/save
~~~

~~~
/connect What-Network
~~~

~~~
/window 1
/window 2
/window 3
/window 4
~~~

Or the `ESC` key and a number, for example: Press and hold `ESC` then press `3`. If you are already on this window it will just print the number.

Detach from the screen using this keyboard sequence:

The press and hold `CTRL` and `a` then press `d` to detach from the screen. This leaves it running in the background.

Use this command to re attach to the screen:

~~~
screen -r irssi
~~~

And that is basically it. You are automatically connecting to the What-Network, Feral channel with a username