You can now select your version for the rtorrent / libtorrent client. We offer all versions of rtorrent as far back as 0.8.1 and you can use all versions of libtorrent that will compile against it.

**First**, choose a version from one below. The rtorrent version is the string before "_" and libtorrent is the part after "_w":

~~~
current
0.9.3_w0.13.3 *
0.9.2_w0.13.2 *
0.9.1_w0.13.1 *
0.9.0_w0.13.0 *
0.8.9_w0.12.9 *
0.8.8_w0.12.9
0.8.8_w0.12.8 *
0.8.7_w0.12.7
0.8.6_w0.12.6 *
0.8.6_w0.12.5
0.8.5_w0.12.6
0.8.5_w0.12.5 *
0.8.4_w0.12.6
0.8.4_w0.12.5
0.8.4_w0.12.4 *
0.8.3_w0.12.6
0.8.3_w0.12.5
0.8.3_w0.12.4
0.8.3_w0.12.3 *
0.8.2_w0.12.6
0.8.2_w0.12.5
0.8.2_w0.12.4
0.8.2_w0.12.3
0.8.2_w0.12.2 *
0.8.1_w0.12.6
0.8.1_w0.12.5
0.8.1_w0.12.4
0.8.1_w0.12.3
0.8.1_w0.12.2
0.8.1_w0.12.1 *
0.8.1_w0.12.0
~~~

* these versions were released in tandem and are the candidates most likely to work together. You are free to try as many versions as you wish however please bear in mind that versions ending in an odd number were classed as development releases so may have stability issues.

Older versions of rtorrent may not work well with our rutorrent installation which is currently locked at 3.5. A future update will see a version select system for that too.

**Second**, place the version string selected (e.g., "0.9.2_w0.13.2") into the following file, creating it if needs be:

~~~
~/private/rtorrent/.version
~~~

This is the file name and location

This example [SSH](https://www.feralhosting.com/faq/view?question=12) command below will create this file and populate it with a particular version:

~~~
echo -n '0.9.2_w0.13.2' > ~/private/rtorrent/.version
~~~

All you need to do is change the '0.9.2_w0.13.2' to match your version requirements.

**Third**, restart rtorrent by entering the following command in [SSH](https://www.feralhosting.com/faq/view?question=12):

~~~
killall -9 rtorrent; screen rtorrent
~~~

**Finally**, verify the specific version was selected by checking the version string at the top of the screen:

~~~
*** rTorrent 0.9.2/0.13.2 - hyperion.feralhosting.com:25376 ***
~~~

And disconnect from screen with <Ctrl-A-D>

## Troubleshooting

If you receive the text "screen is terminating" when trying to restart rtorrent, please try waiting a few minutes then executing the restart command again.

If this doesn't resolve the issue then try running "rtorrent" on its own. You will probably see output similar to this:

~~~
<hyperion ~/private/rtorrent> screen rtorrent
<screen is terminating>
<hyperion ~/private/rtorrent> rtorrent
/usr/local/bin/rtorrent: line 24: /opt/rtorrent/version_entered/bin/rtorrent: No such file or directory
~~~

In the example shown, you will see `version_entered` with a version close to what you entered in the file ".version". This error means that the version as not found and you should double check the input.



