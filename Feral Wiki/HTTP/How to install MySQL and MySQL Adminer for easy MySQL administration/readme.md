**1:** First go to the software install page for feralhosting at: [https://www.feralhosting.com/manager/](https://www.feralhosting.com/manager/software/)slots/servername/Install Software

**2:** Install MySQL via the Software Page (selecting the radio button to the left of Mysql):

Take note of your `Socket` path and your `Password` once the installation is completed. 
You do not need them until Step 2. Your user-name should be `root`.

**NOTE:** MYSQL can take up to 15 minutes to install as it is compiled upon request of installation so please be patient:

This next stage of the guide needs to be done in an SSH client such as PuTTy. [You can use this basic guide to connect using your Feral credentials.](https://www.feralhosting.com/faq/view?question=12)

**3:** Now to install Adminer to configure your mysql, this is the procedure I used:
    
cd ~/www/$(whoami).$(hostname)/public_html/
mkdir -p adminer && cd adminer
wget -qN http://downloads.sourceforge.net/project/adminer/Adminer/Adminer%203.7.1/adminer-3.7.1.php
ln -sf adminer-3.7.1.php index.php

**Step 2:**

*Please note where you see `username` and `server` you are required to provide your relevant info for it to work.*

**1:** Now go to your slot HTTP url which needs to be in this format. HTTPS will only work with this format. 

	http://username.server.feralhosting.com/adminer

**2:** You will need the `Socket` path, `username` and `password` you obtained after installing the MySQL server from the very first step.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/How%20to%20install%20MySQL%20and%20MySQL%20Adminer%20for%20easy%20MySQL%20administration/0.0.png)

**3:** Put the socket path in the hostname/server field prefixed with a [colon :](http://en.wikipedia.org/wiki/Colon_%28punctuation%29)

	:/media/DiskID/home/username/private/mysql/socket

**4:** Put in `root` for the `username`

**5:** Put in the `password*` obtained from the software install page.

Here is a very simple view of creating a New Database and User.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/How%20to%20install%20MySQL%20and%20MySQL%20Adminer%20for%20easy%20MySQL%20administration/0.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/How%20to%20install%20MySQL%20and%20MySQL%20Adminer%20for%20easy%20MySQL%20administration/1.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/How%20to%20install%20MySQL%20and%20MySQL%20Adminer%20for%20easy%20MySQL%20administration/2.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/How%20to%20install%20MySQL%20and%20MySQL%20Adminer%20for%20easy%20MySQL%20administration/3.png)]
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/How%20to%20install%20MySQL%20and%20MySQL%20Adminer%20for%20easy%20MySQL%20administration/4.png)

*These are safe to use privileges that will work with most (pretty much all) web apps*

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/How%20to%20install%20MySQL%20and%20MySQL%20Adminer%20for%20easy%20MySQL%20administration/adminerpriv.png)

Once saved you are ready to use this new Database and user with your web app.



