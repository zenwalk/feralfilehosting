
RapidLeech allows you to download files from file-hosting services such as Rapidshare.com etc. directly on to your Feral slot. You can then FTP them down to your home computer without any timers.

Installation is exceptionally easy — run these two command in [SSH](https://www.feralhosting.com/faq/view?question=12):

The URL is using Rapidleech `rl23_v43_SVN422.zip` dated 3nd February 2013.

```
wget -qNO ~/rapid.zip http://git.io/PwldRA
unzip -qn ~/rapid.zip -d ~/www/$(whoami).$(hostname)/public_html/
```

Then visit your Feral URL in a web browser, for example:

~~~
http://username.server.feralhosting.com/rapidleech/
~~~

### Creating your config.php

Now, you can set whatever options you need or want then scroll to the bottom and click `Save Configuration` to create your first `config.php`.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/Software/RapidLeech%20-%20How%20to%20Install/config.png)

Now you can password protect your installation.

You newly created config.php file is located at (relative path to the WWW root):

~~~
/rapidleech/configs/config.php
~~~

Rapidleech has no password authentication turned on by default, so it is necessary to follow [this Rapidleech Wiki article](http://wiki.rapidleech.com/FAQ#How_to_setup_password_on_rapidleech.3F) to enable it. This is a required step.

**New Password Protection Method:**

**1:** Make sure you have created and saved your `config.php` and shown in the previous step.

**2:** Edit you config.php using nano in SSH using this command:

~~~
nano -w ~/www/$(whoami).$(hostname)/public_html/rapidleech/configs/config.php
~~~

Find the line:

~~~
'login' => false,
~~~

then replace it with:

~~~
'login' => true,
~~~

**3:** In the next line, you will see :

```
'users' => 
  array (
    'test' => 'test',
  ),
```

**4:** change: `test` to your user name and then the second `test` to your password

```
'feral' => 'password',
```

Where feral is your username and password is your password.

**5:** Now, it should look like this :

```
'users' => 
  array (
    'feral' => 'password',
  ),
```

Where `feral` is your username and `password` is your password.

**6:** Save this file and your password protection will be active.

Please read through the [Rapidleech Wiki](http://wiki.rapidleech.com/FAQ) for more answers about how to use Rapidleech.


