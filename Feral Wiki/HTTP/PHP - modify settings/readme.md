
There are some things you can do to tweak some settings using htaccess.

In your `.htaccess` files you can add these lines and change the paths or numbers to match yours:

**Important note:** `.htaccess` files work recursively from their current location. If you want some settings to apply to the entire server put these settings in a `.htaccess` in your server root. If you only need them to apply to certain directories, place the settings in a `.htaccess` within those directories.

This is an example of the `.htaccess` in your server root.

Where `username` is your Feral username and `server` is the name of the server your slot is hosted on.

~~~
~/www/username.server.feralhosting.com/public_html/.htaccess
~~~

**Default Socket setting**

~~~
php_value mysql.default_socket "/media/DiskID/home/username/private/mysql/socket"
php_value mysqli.default_socket "/media/DiskID/home/username/private/mysql/socket"
~~~

Will make it so localhost uses these socket paths.

If networking has been enabled in your `~/private/mysql/my.conf`:

**Default port settings**

~~~
php_value mysql.default_port 23456
php_value mysqli.default_port 23456
~~~

This will define the default port.

**Modifying other settings:**

The basic concept is this:

~~~
php_value some_setting value/path
~~~

For example:

~~~
php_value max_execution_time 100
~~~

This will change the default value from 30 to 100

**Max file upload size**

~~~
php_value upload_max_filesize 100M
php_value post_max_size 100M
~~~

Will allow larger file uploads, up to 100M.

And so on.

### nginx

Execute this command after nginx is installed:

~~~
cp -f /etc/php5/fpm/php.ini ~/.nginx/php/php.ini
~~~

Now you can edit your `php.ini` located at:

~~~
~/.nginx/php/php.ini
~~~

Restart nginx for the changes to take effect:

~~~
killall -9 nginx php5-fpm -u $(whoami)
~~~

Now wait until it restarts within 5 minutes.



