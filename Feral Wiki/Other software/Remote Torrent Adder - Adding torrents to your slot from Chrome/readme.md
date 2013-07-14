Fed up with copying or downloading torrents just to upload them to rTorrent through your webUI? Well you can make that first world problem go away by using the Remote Torrent Adder extension for Google Chrome.

**An Important Note on using SSL**

You can set this add-on to use SSL and port 443 with the default URL format but you must do something for this to work when adding torrents.

!! This will not work with the Secondary URL format of **server.feralhosting.com/username/** !!

You must visit the **https://username.server.feralhosting.com** in your chrome browser and accept the mismatched certificate. Once you have done this and you can browse your default URL, adding torrents via SSL/433 will work.

You will have to do this each time you close and reopen Chrome since it does not store this as a permanent exception.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Other%20software/Remote%20Torrent%20Adder%20-%20Adding%20torrents%20to%20your%20slot%20from%20Chrome/sslerror.png)

**This is how you use it:**

**1:** Start by installing the extension from here:

~~~
https://chrome.google.com/webstore/detail/oabphaconndgibllomdcjbfdghcmenci
~~~

**2:** Open the settings for the extension.

**3:** Fill in the data in the form under the WebUI tab accordingly:

### Rutorrent

**Client:** ruTorrent WebUI (From the drop down menu)

**Host:** username.server.feralhosting.com (For example : superman.zeus.feralhosting.com)

**Port:** 80 (You can use 443 if you had understood the Notice at the start of this guide)

**SSL** Leave Unchecked (same warning as port applies. Must be checked to use port 443)

**Username:** Your Feral Username

**Password:** Your Password (as shown on your Manager/Slots/server for rutorrent)

NOTE on Usernames and Passwords: If you have changed your default rutorrent webgui config using the [Password Protect Your WWW Page(s)](https://www.feralhosting.com/faq/view?question=22) guide you will need to use the **Username** and **Password** you created there.

**Relative Path:** 

~~~
/rutorrent/
~~~

Note: This addon is peculiar. if the above relative path gives you errors, try using: 

~~~
/rutorrent
~~~

**Label:** [Nothing required]

**Directory:** This is the directory where your torrent **data** will be stored, you will need the full path to this folder.
To get this you have to ssh into your box, then navigate to your:

~~~
rtorrent/data/
~~~

Directory by pasting the following command into the terminal: 

~~~
cd ~/private/rtorrent/data && pwd
~~~

The output should look something like this:

~~~
/media/sdl1/home/username/private/rtorrent/data/
~~~

And voila if you press a torrent link now it should load the .torrent directly into rtorrent
on your slot.

### Client: Deluge

**Host:** server.feralhosting.com

**Port:** 80

**Username:** Your Feral username

Password (retrieval instructions):

**1:** [SSH into your Server slot](http://www.feralhosting.com/heron/faq/view?question=12)

**2:** Type command 

~~~
cat ~/.config/deluge/auth | grep $(whoami) | cut -d\:  -f2
~~~

This will return something like: 

~~~
dgDEgs34uehw3
~~~

This is the password

**3:** Relative path is:

~~~
/username/deluge
~~~

### Notes

You can also let the option of downloading on your torrent only be available by right-clicking
the torrent link by deselecting the "clicks on links" in the "link catching" tab.
(I'd recommend doing this so you don't download all kinds of rubbish onto your slot)

You will also override downloading this on your box by holding down Alt+Ctrl+Shift
while clicking the link.



