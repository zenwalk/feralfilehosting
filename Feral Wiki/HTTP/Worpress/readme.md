
**First:** go to the software install page for feralhosting at: [Install Software](https://www.feralhosting.com/manager/slot/install).

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Worpress/installmysql.png)

**NOTE:** MySQL can take up to 15 minutes to install as it is compiled upon request of installation so please be patient.

**NOTE:** If you have your own domain you can use this [VHost FAQ](https://www.feralhosting.com/faq/view?question=52) to host it here.

This is a relevant FAQ: [PHP - modify settings](https://www.feralhosting.com/faq/view?question=213)

**Step 1:** In order to use Wordpress you will need to have MySQL user and database set up for it to connect with to MySQL with, so follow this FAQ: [Adminer - MySQL administration](https://www.feralhosting.com/faq/view?question=116)

**Step 2:** Then in SSH do these commands. Use this FAQ if you do not know how to SSH into your slot: [SSH basics - Putty](https://www.feralhosting.com/faq/view?question=12)

### Bash script easy download and extract to default WWW

This bash script will download and extract Wordpress for you to your default WWW directory.

~~~
wget -qNO ~/wordpress.sh http://git.io/sBXgog
~~~

Now do this to execute it:

~~~
bash ~/wordpress.sh
~~~

Done.

### Manual installation via SSH:

~~~
wget -qNO ~/latest.tar.gz http://wordpress.org/latest.tar.gz
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

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Worpress/socket.png)

### Mysql connection with networking enabled:

Please see this [FAQ](https://www.feralhosting.com/faq/view?question=9) for enabling networking.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Worpress/networking.png)







