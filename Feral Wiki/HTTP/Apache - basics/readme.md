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

Then wait for the daemon to be automatically restarted, it can take up to five minutes for Apache to restart.

**List loaded modules:**

```
/usr/sbin/apachectl -t -D DUMP_MODULES
```

**List available modules.**

```
ls -1 ls /etc/apache2/mods-available/
```

**For example. Here is the way you would load the Auth Digest module:**

To load a modules you will need to create and then edit a **~/.apache2/conf.d/some.conf** file and then restart Apache like this:

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

Save by pressing and holding `CTRL` and then pressing `x` then press `Y` to confirm.

Now restart Apache using this command:

```
pkill -u $(whomami) apache2
```

**Important note:** It can take up to five minutes for Apache to restart.

Test it is loaded: might be near the bottom

```
/usr/sbin/apachectl -t -D DUMP_MODULES
```

The error log is found here:

```
~/.apache2/error.log
```



