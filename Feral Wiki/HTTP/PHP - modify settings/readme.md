
### Apache:  

There are some things you can do to tweak some settings using htaccess.

In your .htaccess add these lines and change the paths or numbers to match yours:

~~~
php_value mysql.default_socket "/media/DiskID/home/username/private/mysql/socket"
php_value mysqli.default_socket "/media/DiskID/home/username/private/mysql/socket"
~~~

Will make it so localhost uses these socket paths.

If networking has been enabled in your `~/private/mysql/my.conf`:

~~~
php_value mysql.default_port 23456
php_value mysqli.default_port 23456
~~~

This will define the default port.

The basic concept is this:

~~~
php_value some_setting value/path
~~~

For example:

~~~
php_value max_execution_time 100
~~~

This will change the default value from 30 to 100

### nginx

~~~
cp -f /etc/php5/fpm/php.ini ~/.nginx/php
~~~

Now you can modify your `php.ini`.

~~~
max_execution_time = 30
~~~

~~~
max_execution_time = 120
~~~

For Mysql socket:

~~~
mysql.default_socket =
~~~

To, for example:

~~~
mysql.default_socket = "/media/DiskID/username/private/mysql/socket"
~~~

For Mysqli socket:

~~~
mysqli.default_socket =
~~~

~~~
mysqli.default_socket = "/media/DiskID/username/private/mysql/socket"
~~~

And then save the changes. You will need to restart nginx for these changes to take effect:

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


