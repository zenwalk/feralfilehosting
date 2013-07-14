
**Please note that this software is not officially supported by Feral Hosting.**

**1:** Download SABnzbd from [here](http://sabnzbd.org/download/) to your slot. You can do this either by downloading it on your computer and then uploading it using FTP/SFTP, or with the following command on your server using SSH:

```
wget -qNO ~/SABnzbd.tar.gz http://sourceforge.net/projects/sabnzbdplus/files/latest/
```

**2:** Extract the files from the archive.

```
tar -xzf ~/SABnzbd.tar.gz
```

**3:** Run SABnzbd.py

```
screen -S sabnzbd -fa -d -m python SABnzbd-*/SABnzbd.py --server $(whoami).$(hostname):PORT
```

Be sure to replace **PORT** with any port number, anything over 6000 should do.  I used 6903.  If you pick the same port as someone else, you'll get an error.  Quit and restart with a different port number.

**4:** Access SABnzb through your browser.

```
http://username.server.feralhosting.com:PORT/sabnzbd/
```

**5:** Follow the SABnzbd wizard to set up your Usenet account.

** Make sure you set-up a username and password under `Config > General`**

**6:**  You'll need to make 3 folders, you can make the toplevel 'downloads' folder wherever you wish:

```
downloads
```

Inside this new folder make another 2 folder with these names:

```
complete
```
 
```
incomplete
```
 
(**Note, the two subfolders are required**)

Make sure you've set the proper path to these under *Config* in the web interface. **You will need to use the full path**. Below you'll find a sample path:

```
/media/DiskID/home/username/private/sab/downloads/
```




