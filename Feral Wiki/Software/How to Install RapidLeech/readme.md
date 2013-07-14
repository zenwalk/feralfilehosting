**This guide might be dated and in need of updating**

RapidLeech allows you to download files from file-hosting services such as Rapidshare.com etc. directly on to your Feral slot. You can then FTP them down to your home computer without any timers.

Installation is exceptionally easy — simply download the files from [the Rapidleech website](http://code.google.com/p/rapidleech/downloads/list) onto your computer, extract them, and then upload them to your website area on your server:

```
/home/username/www/username.server.feralhosting.com/public_html/rapidleech/
```

(For those who are more comfortable with Linux, you can also just wget the files from the Rapidleech site directly to your server.)

**Rapidleech has no password authentication turned on by default, so it is necessary to follow [this Rapidleech Wiki article](http://wiki.rapidleech.com/FAQ#How_to_setup_password_on_rapidleech.3F) to enable it. This is OBLIGATORY.**

**New Password Protection Method:**

**1:** Login to your cPanel and Go to configs folder via File Manager.
**2:** You will see a file `config.php`
**3:** Open this file for editing in notepad or any other text editor
**4:** Find the line `'login' => false,`
**5:** Replace :

```
'login' => false,
```

to

```
'login' => true,
```

**6:** then in the next line, you will see :

```
'users' => 
  array (
    'test' => 'test',
  ),
```

**7:** change: `test` to your user name and then the second `test` to your password

```
'feral' => 'password',
```

Where feral is your username and password is your password.

**8:** Now, it should look like this :

```
'users' => 
  array (
    'feral' => 'password',
  ),
```

Where `feral` is your username and `password` is your password.

**9:** Save this file and your password protection will be active.

Please read through the [Rapidleech Wiki](http://wiki.rapidleech.com/FAQ) for more answers about how to use Rapidleech.