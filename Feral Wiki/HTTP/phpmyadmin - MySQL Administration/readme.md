
You will need to have Mysql already installed. You can do this from the [**Install Software** link in your Manager](https://www.feralhosting.com/manager/)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/0%20Generic/installmysql.png)

This is a relevant FAQ: [Mysql - Change php settings using htaccess](https://www.feralhosting.com/faq/view?question=213)

In SSH do these commands. Use this FAQ if you do not know how to SSH into your slot: [SSH basics - Putty](https://www.feralhosting.com/faq/view?question=12)

### phpmyadmin basic setup

Download the phpMyAdmin package:

~~~
wget -qNO ~/phpMyAdmin.zip http://sourceforge.net/projects/phpmyadmin/files/latest/download
unzip -qo phpMyAdmin.zip 
cp -rf ~/phpMyAdmin-*-all-languages/. ~/www/$(whoami).$(hostname)/public_html/phpmyadmin
mkdir -p ~/www/$(whoami).$(hostname)/public_html/phpmyadmin/config
rm -rf ~/phpMyAdmin.zip ~/phpMyAdmin-*-languages
~~~

### https URL redirect fix:

**Important note:** These commands only apply to a fresh installation. For example updating Apache to nginx will break the fix.

Please run the command below that matches your Web server. The Default is Apache. It will only be nginx if you manually updated Apache to nginx.

**Default: Apache**

~~~
sed -i 's/443/80/g' ~/www/$(whoami).$(hostname)/public_html/phpmyadmin/libraries/Config.class.php
~~~

**nginx**

~~~
sed -i 's/443/8080/g' ~/www/$(whoami).$(hostname)/public_html/phpmyadmin/libraries/Config.class.php
~~~

### Completing the Setup

The rest of this FAQ must be completed in a Browser.

Visit this page in a browser, replacing Your username with your Feral username and server with your slot servername

~~~
http://username.server.feralhosting.com/phpmyadmin/setup/
~~~

Now you will see this page.

Click on `New Server` to create our first custom server configuration file.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/phpmyadmin%20-%20MySQL%20Administration/1.png)

You do not need to do much here. Fill in what the image shows. Click on `Save` when you are done:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/phpmyadmin%20-%20MySQL%20Administration/2.png)

You will need to select your server from the drop down if it is not already selected and then click save.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/phpmyadmin%20-%20MySQL%20Administration/3.png)

You should see this dialogue once you have saved:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/phpmyadmin%20-%20MySQL%20Administration/4.png)

Once you have saved the configuration you need to run these two command in SSH to finalise the installation:

~~~
cd ~/www/$(whoami).$(hostname)/public_html/
cp -f phpmyadmin/config/config.inc.php ~/www/$(whoami).$(hostname)/public_html/phpmyadmin/config.inc.php
rm -rf ~/www/$(whoami).$(hostname)/public_html/phpmyadmin/config && cd
~~~

Now you can return to the main page and login at:

~~~
/phpmyadmin
~~~

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/phpmyadmin%20-%20MySQL%20Administration/5.png)

### https URL redirect issue

**Important note:** If you force https and you did not run the fix commands above the you will most likely see this error after you log in.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/phpmyadmin%20-%20MySQL%20Administration/6.png)

If you don't want to use the command you need to press back in your browser or using your mouse button (if available) when you see the error.

What is happening is that the application tries to redirect on the wrong port and gets confused.

~~~
https://somesite.com:80/...
~~~

For nginx:

```
https://somesite.com:8080/...
```

If you manually edit out the port it works fine to

```
https://somesite.com/...
```



