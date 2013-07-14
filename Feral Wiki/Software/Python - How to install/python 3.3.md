mkdir -p ~/python/python.3.3

wget http://www.python.org/ftp/python/3.3.1/Python-3.3.1.tar.bz2

tar -xjf Python-3.3.1.tar.bz2

cd ~/Python-3.3.1

./configure --prefix=$HOME/python/python.3.3

make && make install

echo 'PATH=~/python/python.3.3/bin:$PATH' >> ~/.bashrc
echo 'PYTHONPATH=~/python/python.3.3/lib/python3.3/site-packages:$PATH' >> ~/.bashrc

bash

python3.3 -V

cd && rm -rf ~/Python-3.3.1 && rm -f ~/Python-3.3.1.tar.bz2