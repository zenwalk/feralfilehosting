
**1:** Start by installing the extension from here:

~~~
https://chrome.google.com/webstore/detail/oabphaconndgibllomdcjbfdghcmenci
~~~

**2:** Open the settings for the extension.

**3:** Fill in the data in the form under the WebUI tab accordingly:

### Rutorrent

**Client:** ruTorrent WebUI (From the drop down menu)

**Host:** server.feralhosting.com (For example : aphrodite.feralhosting.com)

**Port:** 443

**SSL** Checked

**Username:** Your Feral Username

**Password:** Your rutorrent Web Gui Password (as shown on your Slot Details page for rutorrent)

**Important note:** on your username and password: If you have changed your default rutorrent Web Gui config using the [Password Protect Your WWW Page(s)](https://www.feralhosting.com/faq/view?question=22) guide you will need to use the **Username** and **Password** you created there.

**Relative Path:** 

~~~
/username/rutorrent/
~~~

**Label:** [Nothing required]

**Directory:** This is the directory where your torrent **data** will be stored, you will need the full path to this folder.
To get this you have to SSH into your box, then navigate to your:

~~~
media/DiskID/home/username/rutorrent/data
~~~

Directory by pasting the following command into the terminal: 

~~~
cd ~/private/rtorrent/data && pwd
~~~

The output should look something like this:

~~~
/media/DiskID/home/username/private/rtorrent/data/
~~~

If you press a torrent link now it should load the .torrent directly into rtorrent
on your slot.

You will get an error like this:

![]()

But it stills works.

### Client: Deluge

**Host:** server.feralhosting.com

**Port:** 443

**Username:** Your Feral username

**Password:** You Deluge Web Gui password as listed on your Slot Details page.


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



