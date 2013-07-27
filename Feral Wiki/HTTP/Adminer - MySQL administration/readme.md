
**Step 1:** First, go to the [Account Manager](https://www.feralhosting.com/manager/) and then use the [**Install Software** link in your Manager](https://www.feralhosting.com/manager/) for that slot:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/0%20Generic/installmysql.png)

**Step 2:** Install MySQL via the Software Page (selecting the radio button to the left of MySQL):

**Important note:** Take note of your `Socket` path and your `Password` once the installation is completed. You do not need them until Step 2. Your username should be `root`.

**Important note:** MySQL can take up to 15 minutes to install as it is compiled upon request of installation so please be patient:

**Important note:** If you have your own domain you can use this [VHost FAQ](https://www.feralhosting.com/faq/view?question=52) to host it here.

This is a relevant (optional) FAQ: [PHP - modify settings](https://www.feralhosting.com/faq/view?question=213) for configuration of some PHP settings before you start.

This next stage of the guide needs to be done in an SSH client such as PuTTy.How to [SSH](https://www.feralhosting.com/faq/view?question=12) to your slot.

**Step 3:** Now to install Adminer to configure your MySQL using these SSH commands:

~~~
cd ~/www/$(whoami).$(hostname)/public_html/
mkdir -p adminer && cd adminer
wget -qN http://downloads.sourceforge.net/project/adminer/Adminer/Adminer%203.7.1/adminer-3.7.1.php
ln -sf adminer-3.7.1.php index.php
~~~

**Step 4:**


**1:** Now go to your slot HTTP URL which MUST be in this format, where `username` if your Feral username and `server` if the name of the server that the relevant slot is hosted on.

~~~
http://username.server.feralhosting.com/adminer
~~~

You can use https if you accept the Feral certificate, which is a mismatch to the URL format but perfectly fine for the purpose.

~~~
https://username.server.feralhosting.com/adminer
~~~

**Important note:** The URL format `server.feralhosting.com/username/` will not work for Adminer.

**2:** You will need the `Socket` path, `username` and `password` you obtained after installing the MySQL server from the very first step as shown on the Slot Details page for the relevant slot.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/0%20Generic/mysqlsocket.png)

**Important note:** Put the socket path in the `hostname/server` field prefixed with a [colon :](http://en.wikipedia.org/wiki/Colon_%28punctuation%29), for example:

~~~
:/media/DiskID/home/username/private/mysql/socket
~~~

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Adminer%20-%20MySQL%20administration/0.0.png)

**3:** Put in `root` for the `username`

**4:** Put in the `password` obtained from the software install page.

### A very simple overview of creating a New Database and User.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Adminer%20-%20MySQL%20administration/0.png)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Adminer%20-%20MySQL%20administration/1.png)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Adminer%20-%20MySQL%20administration/2.png)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Adminer%20-%20MySQL%20administration/3.png)

You can edit the user in the next step as well.

**Important note:** This user is going to be restricted `localhost` connections only by default. Meaning if you do not use a socket they will not be able to connect to the database.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Adminer%20-%20MySQL%20administration/4.local.png)

If you require that your user has network access (networking has been enabled) to the Database you would do this instead:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Adminer%20-%20MySQL%20administration/4.any.png)

Where the Server files has had `localhost` has been changed to `%` allowing outside connections to the Database.

**Important note:** These are safe to use privileges that will work with most (pretty much all) web applications.

In this image you can see that we are editing the privileges for the database `example` that we just created:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Adminer%20-%20MySQL%20administration/adminerpriv.png)

Once saved, you are ready to use this new Database and user with your web applications.



