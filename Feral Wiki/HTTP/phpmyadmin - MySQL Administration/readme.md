
You will need to have Mysql already installed. You can do this from the [**Install Software** link in your Manager](https://www.feralhosting.com/manager/)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Worpress/installmysql.png)

This is a relevant FAQ: [Mysql - Change php settings using htaccess](https://www.feralhosting.com/faq/view?question=213)

In SSH do these commands. Use this faq if you do not know how to SSH into your slot: [SSH basics - Putty](https://www.feralhosting.com/faq/view?question=12)

### phpmyadmin basic setup

Download the phpMyAdmin package:

```
wget -qNO ~/phpMyAdmin.zip http://downloads.sourceforge.net/project/phpmyadmin/phpMyAdmin/4.0.4.1/phpMyAdmin-4.0.4.1-all-languages.zip
unzip -qo phpMyAdmin.zip -d ~/www/$(whoami).$(hostname)/public_html/
cp -rf ~/www/$(whoami).$(hostname)/public_html/phpMyAdmin-4.0.4.1-all-languages/. ~/www/$(whoami).$(hostname)/public_html/phpmyadmin
mkdir -p ~/www/$(whoami).$(hostname)/public_html/phpmyadmin/config
rm -rf ~/phpMyAdmin.zip ~/www/$(whoami).$(hostname)/public_html/phpMyAdmin-4.0.4.1-all-languages
```

The rest of this FAQ must be completed in a Browser.

Visit this page in a browser, replacing Your username with your Feral username and server with your slot servername

```
http://username.server.feralhosting.com/phpmyadmin/setup/
```

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

```
cp -f ~/www/$(whoami).$(hostname)/public_html/phpmyadmin/config/config.inc.php ~/www/$(whoami).$(hostname)/public_html/phpmyadmin/config.inc.php
rm -rf ~/www/$(whoami).$(hostname)/public_html/phpmyadmin/config
```

Now you can return to the main page and login.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/phpmyadmin%20-%20MySQL%20Administration/5.png)

**Important note:** If you force https you will most likely see this error after you log in. This is not actually a problem, just a nuisance. You are logged in just fine.

All you need to do is press back in your browser on using your mouse button (if available) when you see the error

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/phpmyadmin%20-%20MySQL%20Administration/6.png)

What is happening is that the application tries to redirect on the wrong port and gets confused.

```
https://somesite.com:80/...
```

For nginx:

```
https://somesite.com:8080/...
```

If you manually edit out the port it works fine to

```
https://somesite.com/...
```



