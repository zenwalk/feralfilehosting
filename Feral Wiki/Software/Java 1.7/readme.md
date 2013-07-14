**FeralHosting does not allow gameservers of any type, especially those based on Java.  Java-based applications that consume large amounts of memory and other resources will also not be tolerated; this includes BTC/LTC mining and encoding**

If you need java 1.6 it's likely already installed by request of another user. If not, open a ticket and request it to be installed.

If you need a newer version of Java, such as 1.7, follow these directions. These directions can be adapted to support any version of Java.
    
### Installing Java into a user directory, and setting paths.

Files found via [http://www.java.com/en/download/manual.jsp?locale=en](http://www.java.com/en/download/manual.jsp?locale=en). You want the `.tar.gz` file, not the `.deb` or `.rpm` -- those are used when you are installing with root privileges.
     
#### This will download an update the 64 bit java files for Linux

Download v7 update 25
     
```
wget -qNO java.tar.gz http://javadl.sun.com/webapps/download/AutoDL?BundleId=78697
```

### Unpack the files:

```
tar -xzf java.tar.gz && cp -rf ~/jre1.7.0_25/. ~/private/java/ && rm -f ~/java.tar.gz && rm -rf ~/jre1.7.0_25
```

This command also removes the folders and archives we don't need after we are done with them.

Manually call java it like this:

```
~/private/java/bin/java -version
```

You will see this:

```
java version "1.7.0_25"
Java(TM) SE Runtime Environment (build 1.7.0_25-b15)
Java HotSpot(TM) 64-Bit Server VM (build 23.25-b01, mixed mode)
```

Or add it to your PATH using the `./bashrc` so it is used by default:

```
echo 'PATH=~/private/java/bin:$PATH' >> ~/.bashrc
```

Reload your shell using this command:

```
bash
```

Now do this command from any location:

```
java -version
```

You should see the same result as before.



