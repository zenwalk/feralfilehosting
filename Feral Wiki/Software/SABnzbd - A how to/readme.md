**Please note that this software is not officially supported by Feral Hosting.**

**1:** Download SABnzbd from [here](http://sabnzbd.org/download/) to your slot. You can do this either by downloading it on your computer and then uploading it using FTP/SFTP, or with the following command on your server using SSH:

~~~
wget -qO ~/SABnzbd.tar.gz http://sourceforge.net/projects/sabnzbdplus/files/latest/
~~~

**2:** Extract the files from the archive.

~~~
tar -xzf ~/SABnzbd.tar.gz
~~~

**3:** Run SABnzbd.py

~~~
screen -fa -dmS sabnzbd python SABnzbd-*/SABnzbd.py --server $(whoami).$(hostname):PORT
~~~

Be sure to replace **PORT** with any port number, anything over 6000 should do.  I used 6903.  If you pick the same port as someone else, you'll get an error.  Quit and restart with a different port number.

**Important note:** Once you have completed the Web Gui wizard and it restarts the but the Web Gui is not loading:

1: In SSH connect to the screen process using this command:

~~~
screen -r sabnzbd
~~~

The press enter, you will now see the lynx setup wizard. Now press `q` then press `y` to quit the setup wizard. It should now restart properly

2: If you chose to connect using SSL and it restarted with port 9090 then you can edit the port on this file:

~~~
nano -w ~/.sabnzbd/sabnzbd.ini
~~~

The edit the `https_port` setting.

Pick any port between 6000 - 50000 and then save you changes by pressing and holding CTRL and then press x. Press y to confirm and save. Now connect to the screen using this command.

Use this command to kill the screen and the process:

~~~
screen -S sabnzbd -X quit
~~~

Now you can restart it using just this command and the new SSL port will have taken effect.

~~~
screen -fa -dmS sabnzbd python SABnzbd-*/SABnzbd.py
~~~

**4:** Access SABnzb through your browser.

~~~
http://username.server.feralhosting.com:PORT/sabnzbd/
~~~

**5:** Follow the SABnzbd wizard to set up your Usenet account.

** Make sure you set-up a username and password under `Config > General`**

**6:**  You'll need to make 3 folders, you can make the toplevel 'downloads' folder wherever you wish:

~~~
downloads
~~~

Inside this new folder make another 2 folder with these names:

~~~
complete
~~~

 
~~~
incomplete
~~~

 
(**Note, the two subfolders are required**)

Make sure you've set the proper path to these under `Config` in the web interface. **You will need to use the full path**. Below you'll find a sample path:

~~~
/media/DiskID/home/username/private/sab/downloads/
~~~




