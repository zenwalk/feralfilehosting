apache2nginx

A web server is software that sends web pages to your browser over the HTTP protocol. Apache is the name of the current web server we're using, however we're looking to move to `nginx` as it's easier to configure, uses less memory and is faster. Updating to `nginx` is essential if you want to run a lot of concurrent HTTP connections.

To switch to `nginx` create the folder called 

~~~
.nginx
~~~

in the base of your home folder with an [FTP / SFTP client](https://www.feralhosting.com/faq/view?question=187). 

Or [using SSH](https://www.feralhosting.com/faq/view?question=12) run this command:

~~~
mkdir -p ~/.nginx
~~~

After **waiting 5 minutes** Apache will shut down and `nginx` will have been auto-configured to be very similar to Apache. It will attempt to:

- Configure PHP
- Serve domains from `~/www/*/public_html`
- Password protect rutorrent
- Set up an rtorrent SCGI rpc mount point at `/$username/RPC` (necessary for wtorrent and Transdroid)
- Deny access to areas of rutorrent / wtorrent which do not need web access
- Deny access to all files beginning with `.ht`
- Deny access to any folder with a `.htaccess` file at the time of auto-configuration

Additional domain top-level configuration and domains can be updated by dropping (or editing) files in the directory: 

~~~
~/.nginx/conf.d
~~~

You should not need to do this if you just want to [add a domain](https://www.feralhosting.com/faq/view?question=52). 

Configuration for the default domain can be updated by adding (or editing) files in the folder 

~~~
~/.nginx/conf.d/000-default-server.d
~~~

You will need to restart `nginx` to apply configuration.

If you run any custom configuration in Apache (found in the `.htaccess` files or the `~/.apache2/conf.d/` directory) then you should carefully review and apply this configuration to `nginx`. 

**Important note:** As a precaution any folder containing a `.htaccess` file will be denied access at the time of auto-configuration.

To review the configuration will need to consult the [Apache 2.2 documentation](http://httpd.apache.org/docs/2.2/index.html) and corresponding [nginx command](http://wiki.nginx.org/Main)

There exist tools to assist with the conversion if you [Google "nginx htaccess converter"](https://www.google.com/#q=nginx+htaccess+converter). The paths with a `.htaccess` are denied by the default server configuration in the files 

~~~
*-deny-htaccess.conf
~~~

Which can be removed once you've reviewed the set up.

`nginx` can be restarted by running the [SSH command](https://www.feralhosting.com/faq/view?question=12) 

~~~
killall -9 nginx php5-fpm -u $(whoami)
~~~

and waiting 5 minutes for it to be restarted.




