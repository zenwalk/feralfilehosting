
~~~
mkdir -p ~/private/programs
~~~

~~~
wget -qNO ~/sqlite3.tar.gz http://www.sqlite.org/2013/sqlite-autoconf-3071700.tar.gz
tar xzf ~/sqlite3.tar.gz && cd ~/sqlite-autoconf-3071700/
./configure --prefix=$HOME/private/programs && make && make install
cd && rm -rf ~/sqlite-autoconf-3071700/ ~/sqlite3.tar.gz
~~~

~~~
wget -qNO ~/wired.tar.gz http://downloads.sourceforge.net/project/wired2/wired/wired.tar.gz
tar -xzf ~/wired.tar.gz && cd ~/wired
env CPPFLAGS="-I$HOME/private/programs/include" LDFLAGS="-L$HOME/private/programs/lib" ./configure --prefix=$HOME/private --with-user=$(whoami) --with-group=$(whoami)
make && make install
rm -rf ~/wired ~/wired.tar.gz 
~~~

~~~
echo 'PATH=~/private/programs/bin:$PATH' >> ~/.bashrc && source ~/.bashrc
~~~

~~~
source ~/.bashrc
~~~
