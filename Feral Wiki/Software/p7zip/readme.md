
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

### Organise the binaries

You can do these stesp to make put the binaries in a more organised location and add that location to your PATH so you can easily call the binary.

~~~
cp -rf ~/p7zip_9.20.1/. ~/private/programs && rm -rf  ~/p7zip_9.20.1
~~~

Now run this command.

~~~
echo 'PATH=~/private/programs/bin:$PATH' >> ~/.bashrc
~~~

Now reload your shell

~~~
source ~/.bashrc
~~~

OK, now you can simply use

~~~
7z x ~/path/to/some/archive
~~~



