
### Install Ajax Explorer 5

In SSH do these commands. Use this faq if you do not know how to SSH into your slot: [SSH basics - Putty](https://www.feralhosting.com/faq/view?question=12)

```
wget -qNO ~/ajaxex.zip http://downloads.sourceforge.net/project/ajaxplorer/ajaxplorer/stable-channel/5.0.1/ajaxplorer-core-5.0.1.zip
unzip -qo ~/ajaxex.zip
cp -rf ~/ajaxplorer-core-5.0.1/. ~/www/$(whoami).$(hostname)/public_html/ajaxplorer
sed -i 's|//define("AJXP_LOCALE", "en_EN.UTF-8");|define("AJXP_LOCALE", "en_GB.UTF-8");|g' ~/www/$(whoami).$(hostname)/public_html/ajaxplorer/conf/bootstrap_conf.php
```
The last command sets the locale to en.GB.UTF-8.

Remove the files we don't need:

```
rm -f ~/ajaxex.zip && rm -rf ~/ajaxplorer-core-5.0.1
```

Now visit the URL (where `server` if then name of your Feral Slot's server):

```
https://server.feralhosting.com/ajaxplorer
```

Ignore the warnings.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Ajaxplorer%205%20-%20Basic%20setup/1.png)

Click "Start Wizard"

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Ajaxplorer%205%20-%20Basic%20setup/setup1.png)

This is an overview of the setup wizard:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Ajaxplorer%205%20-%20Basic%20setup/setup2.png)

Enter a username and password:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Ajaxplorer%205%20-%20Basic%20setup/setup2.5.png)

Configure the Global options as you wish, they can be left as they are:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Ajaxplorer%205%20-%20Basic%20setup/setup3.png)

Select "Database" from the drop down menu:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Ajaxplorer%205%20-%20Basic%20setup/setup4.png)

For this FAQ we use sqlite, so select sqlite from the drop down menu, the path is relative to the installation folder's root.

For mysql:

The socket path must start with `:` , for example:

```
:/media/DiskID/home/username/private/mysql/socket
```
This is a relevant FAQ - [Mysql - Change php settings using htaccess](https://www.feralhosting.com/faq/view?question=213) which will allow you to use `localhost` as the hostname.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Ajaxplorer%205%20-%20Basic%20setup/setup5.png)

Optional: Add some users if you wish. This can be done later:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Ajaxplorer%205%20-%20Basic%20setup/setup6.png)

Click on "Install AjaXplorer Now!" to finish the installation.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Ajaxplorer%205%20-%20Basic%20setup/setup7.png)

Once you have installed AjaXplorer you will create a "Workspace"

You start this process by clicking on your `username` in the top right, then clicking on `settings`

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Ajaxplorer%205%20-%20Basic%20setup/workspace1.png)

Pn the settings page click on `Workspaces` to view the drop down menu and then click on `New Workspace`

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Ajaxplorer%205%20-%20Basic%20setup/workspace2.png)

Now you can configure some basics of your new workspace. In this example I have used:

**Access Driver:** File System (Standard)
**Path:** The full path to the root of this workspace, which in my example is my root folder.
**File Creation Mask:** 0700 (0666 is the default)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Ajaxplorer%205%20-%20Basic%20setup/workspace3.png)

