
**1:** First, go to the [Account Manager](https://www.feralhosting.com/manager/) and then use the [**Install Software** link in your Manager](https://www.feralhosting.com/manager/) for that slot.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/0%20Generic/installmysql.png)

**Important note:** MySQL can take up to 15 minutes to install as it is compiled upon request of installation so please be patient.

**Important note:** If you have your own domain you can use this [VHost FAQ](https://www.feralhosting.com/faq/view?question=52) to host it here.

This is a relevant FAQ: [PHP - modify settings](https://www.feralhosting.com/faq/view?question=213)

**Step 1:** In order to use Wordpress you will need to have MySQL user and database set up for it to connect with to MySQL with, so follow this FAQ: [Adminer - MySQL administration](https://www.feralhosting.com/faq/view?question=116)

**Step 2:** Then in SSH do these commands. Use this FAQ if you do not know how to SSH into your slot: [SSH basics - Putty](https://www.feralhosting.com/faq/view?question=12)

### Bash script easy download and extract to default WWW

This bash script will download and extract Wordpress for you to your default WWW directory.

~~~
wget -qO ~/wordpress.sh http://git.io/sBXgog && bash ~/wordpress.sh
~~~

Done.

### Manual installation via SSH:

~~~
wget -qO ~/latest.tar.gz http://wordpress.org/latest.tar.gz
~~~

Then do this command:

~~~
tar -xzf ~/latest.tar.gz -C ~/www/$(whoami).$(hostname)/public_html
~~~

Optionally: remove the tar archive:

~~~
rm -f ~/latest.tar.gz
~~~

Now Visit your `public_html/wordpress` directory in a Web Browser and complete the installation:

### Mysql connection with a socket:

**Important note:** This is the default connection option.

When you install MySQL you are provided with a `socket` to connect to the database server. You can find this on the Slot details page for the relevant slot.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/0%20Generic/mysqlsocket.png)

This images shows the hows the fields would be filled out when using a socket.

**Important note:** Put the socket path in the `hostname/server` field prefixed with a [colon :](http://en.wikipedia.org/wiki/Colon_%28punctuation%29) for example:

~~~
:/media/DiskID/home/username/private/mysql/socket
~~~

**Important note:** If you set the `mysql.default_sockect` and `mysqli.default_sockect` in this FAQ: [PHP - modify settings](https://www.feralhosting.com/faq/view?question=213) you only need to enter `localhost` as the host to use the socket.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Worpress/socket.png)

### Mysql connection with networking enabled:

Please see this [FAQ](https://www.feralhosting.com/faq/view?question=9) for enabling networking.

This images shows the hows the fields would be filled out when using networking.

Where:

**IP** = Your servers hostname such as `server.feralhosting.com` or the [IP of your slot](https://www.feralhosting.com/faq/view?question=74).

**PORT** = Is the port shown when you followed this [FAQ](https://www.feralhosting.com/faq/view?question=9) to enable networking in MySQL.

**Important note:** If you set the `mysql.default_port` and `mysqli.default_port` in this FAQ: [PHP - modify settings](https://www.feralhosting.com/faq/view?question=213) you only need to enter the hostname or IP without the PORT for a network connection.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Worpress/networking.png)



