
A very basic guide to manual installation of sqlite 3.

~~~
wget -qNO ~/sqlite3.tar.gz http://www.sqlite.org/2013/sqlite-autoconf-3071700.tar.gz
tar xzf ~/sqlite3.tar.gz && cd ~/sqlite-autoconf-3071700/
./configure --prefix=$HOME/private/programs && make && make install
cd && rm -rf ~/sqlite-autoconf-3071700/ ~/sqlite3.tar.gz
~~~

Now you can also add the bin path to your PATH to execute the sqlite 3 binary more easily:

~~~
echo 'PATH=~/private/programs/bin:$PATH' >> ~/.bashrc && source ~/.bashrc
~~~

For some applications you will have to link to this location, for example:

~~~
env CPPFLAGS="-I$HOME/private/programs/include" LDFLAGS="-L$HOME/private/programs/lib" ./configure --prefix=$HOME/private
~~~


