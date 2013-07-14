Here are some basic usages of Apache 2.

**Configuration files**

Drop your custom `.conf` files in to this folder:

```
~/.apache2/conf.d/
```

Then restart Apache.

**Restart Apache 2**

```
pkill -u $(whomami) apache2
```

Then wait for the daemon to be automatically restarted

**List loaded modules:**

```
/usr/sbin/apachectl -t -D DUMP_MODULES
```

**List available modules.**

```
ls -1 ls /etc/apache2/mods-available/
```

**For example. loading Auth Digest:**

To load a modules you need to create and edit a **~/.apache2/conf.d/some.conf** file and then restart Apache:

```
touch ~/.apache2/conf.d/digest.conf
```

This creates a new file in the correct location, with a relevant name.

```
nano ~/.apache2/conf.d/digest.conf
```

Now Add this line to the top of the file to load the auth digest module.

```
Include /etc/apache2/mods-available/auth_digest.load
```

Save using CTRL + x then press Y.

Now restart Apache.

```
/usr/sbin/apache2ctl restart
```

Test it is loaded: might be near the bottom

```
/usr/sbin/apachectl -t -D DUMP_MODULES
```

The error log is found here:

```
~/.apache2/error.log
```



