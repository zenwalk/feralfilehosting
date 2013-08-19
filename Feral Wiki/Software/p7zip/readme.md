
You can ask for this to be installed on your slot by opening a ticket.

### pz7ip

Download the binaries and extract them using these commands:

~~~
wget -qO ~/p7zip.tar.bz2 http://downloads.sourceforge.net/project/p7zip/p7zip/9.20.1/p7zip_9.20.1_x86_linux_bin.tar.bz2
tar xf ~/p7zip.tar.bz2
~~~

Now you can use the binary by using this command:

~~~
~/p7zip_9.20.1/bin/7z
~~~

For example how to extract an iso:

~~~
~/p7zip_9.20.1/bin/7z x ~/Your.iso -oWhere/You/Want/It/Extracted/To
~~~

-o cannot use ~ in the path or have a space after it. It must be relative from you are in the shell.

### Rename the folder

**Important note:** You will need to use the full path to the binary when executing it if using 7z.

If you want it to be easier to call then rename the folder

~~~
cp -rf ~/p7zip_9.20.1/. ~/programs && rm -rf ~/p7zip_9.20.1
~~~

So now it will be:

~~~
~/programs/bin/7z x ~/Your.iso -oWhere/You/Want/It/Extracted/To
~~~

### Adding 7za to the PATH

7za is a standalone executable and can be added to the PATH. This does not work with 7z.

Now run this command if you copied the binaries using the command above:

~~~
echo 'PATH=~/programs/bin:$PATH' >> ~/.bashrc
~~~

Now reload your shell

~~~
source ~/.bashrc
~~~

OK, now you can simply use

~~~
7za x ~/path/to/some/archive
~~~


