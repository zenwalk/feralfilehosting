
You will need to have Mysql already installed. You can do this from your [Manager](https://www.feralhosting.com/manager/)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Worpress/installmysql.png)

If you have your own domain you can use this [vhost FAQ](https://www.feralhosting.com/faq/view?question=52) to host it here.

This is a relevant FAQ: [Mysql - Change php settings using htaccess](https://www.feralhosting.com/faq/view?question=213)

In SSH do these commands. Use this faq if you do not know how to SSH into your slot: [SSH basics - Putty](https://www.feralhosting.com/faq/view?question=12)

### [Relay](http://code.google.com/p/relay/)

Relay is an AJAX-enabled web-based file manager

**Features**

drag-n-drop files and folders
dynamic loading file structure
upload progress bar
thumbnail view, including pdf
multiple users & accounts

### Pre-install Requirements

**1:** Please install MySQL from your software install page

**2:** Use this guide to set up [Adminer](https://www.feralhosting.com/faq/view?question=116)

**3:**  **Required Step** Create a user and database for Relay ( see the Step 2 above for using Adminer)

**4:** In SSH find your home directory's full path via SSH using this command **pwd** for example:

```
cd && pwd
```

Returns something like this

```
/media/DiskID/home/YourUsername
```

### Installation

**1:** SSH into your slot.

**2:** Grab extract the extra files you'll need when configuring the Relay install (utilities paths).

```
wget -qNO ~/package.zip https://bitbucket.org/feralhosting/feralfiles/downloads/package.zip
unzip -qo ~/package.zip
chmod 700 gs convert
rm -f ~/package.zip
```

**3:**  Grab and extract the relay files

```
wget -qNO ~/relay.1.53.tar.gz http://relay.googlecode.com/files/relay.1.53.tar.gz
tar -xzf relay.1.53.tar.gz -C ~/www/$(whoami).$(hostname)/public_html/
rm -f ~/relay.1.53.tar.gz
```

Now we need to run this command to fix an installer issue with mysql.

```
sed -i 's/) TYPE=MyISAM AUTO_INCREMENT=100000 ;/) ENGINE=MyISAM AUTO_INCREMENT=100000 ;/g' ~/www/$(whoami).$(hostname)/public_html/relay/install/index.php
```

Now continue with the Web set-up.

**5:**  Open relay in your browser

```
http://username.server.feralhosting.com/relay
```

**Be sure to replace $user and $server with your user and server name**

**6:** Fill in the required paths

Be sure to note that:

Hostname = Mysql socket listed on your software page, don't forget to prefix it with a **:** 

Utilities = the paths are as shown by the pwd command, for example:

```
/media/DiskID/home/username/gs
```

and

```
/media/DiskID/home/username/convert
```

**Please make sure you set-up an admin password**

**7:** Click save, it should give you OKs for MySQL related tasks for everything and then give you an error.  Feel free to ignore that.

**8:**  Reload Relay (not the /install/ folder)

```
 http://**user**.**server**.feralhosting.com/relay
```

**9:**  Log into relay and click the `Admin Panel` link at the top and then the `Virtual Directories` section.

**10:**  Delete the existing "filestore" directory from the list at the bottom.  

**11:**  In the `Make a Virtual Directory from an existing folder` box fill in the following

```
Name: Anything You want
Path: /media/DiskID/home/username/private/rtorrent/data
```

**You can set the path to any folder you wish, for deluge or transmission data, just replace 'rtorrent' with the appropriate client name**

**12:**  Press the "Submit Query" button

**13:**  Click on "Relay" in the top right to return to the file list.

Ta da!

One caveat:  If downloading many and/or large files, do not do it through relay.  Relay zips files into a package (even if you select one) prior to download.  Think of the other users on your disk as well as your own space and time.



