
**Important Note:** Do not install Python manually without a good reason. It will most likely cause more problems than is solves.

**Python 2.7.3 is already installed on your slot**

Type to show the current version:

~~~
python -V
~~~

To install python mods using the Feral python uses these steps:

**1:** Add the location to your PATH and then reload the `~/.bashrc`

**Important note:** You only need to do this once.

~~~
echo 'PATH=~/.local/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
~~~

**2:** Now install `virtualenv` like this:

~~~
easy_install --user virtualenv
~~~

Other mods can be installed using the `--user` argument, for example:

~~~
easy_install --user somemodule
~~~

**3:** Now you can use VirtualENV with programs, for example, installing [flexget](http://flexget.com):

~~~
virtualenv ~/flexget/
~/flexget/bin/pip install flexget
~~~

**Related FAQ:** [Flexget - Basic installation](https://www.feralhosting.com/faq/view?question=234)

You **do not** need to follow this FAQ to use python or python scripts. If you have a missing module you can open a ticket and ask staff to install it.

This is a basic guide to installing Python to your home directory and using it as your default Python. You will also be able to use easy_install to install mods.

### Python Active State 2.7.2:

Includes lots of things such as VirtualENV, distribute, PIP and more. Super simple to install.

~~~
wget -qNO ~/ActivePython.tar.gz http://downloads.activestate.com/ActivePython/releases/2.7.2.5/ActivePython-2.7.2.5-linux-x86_64.tar.gz
tar -xzf ActivePython.tar.gz
bash ~/ActivePython-2.7.2.5-linux-x86_64/install.sh
~~~

Select a path to install to. This will create the path if it does not exist.

~~~
Install directory: ~/activestate
~~~

If you make an mistake while typing press and hold `CTRL` and press `backspace` to delete characters.

Read the information displayed, it will tell you what `PATH` to add and where.

Optional: To remove the installation files.

~~~
rm -f ActivePython-2.7.2.5-linux-x86_64.tar.gz && rm -rf ~/ActivePython-2.7.2.5-linux-x86_64
~~~

Type this command to reload the shell:

~~~
source ~/.bashrc
~~~

Done.

### Compile Python from source.

In SSH do these commands. Use this faq if you do not know how to SSH into your slot: [SSH basics - Putty](https://www.feralhosting.com/faq/view?question=12)

### Installing Python:

~~~
mkdir -p ~/private/python/python.2.7
wget -qNO ~/Python-2.7.5.tgz http://www.python.org/ftp/python/2.7.5/Python-2.7.5.tgz
tar -xzf ~/Python-2.7.5.tgz && cd ~/Python-2.7.5
./configure --prefix=$HOME/private/python/python.2.7 && make && make install
~~~

The configuration and isntallation can take some time to be patient.

When it is finished installing, do some clean up with this command.

~~~
cd && rm -rf ~/Python-2.7.5 && rm -f ~/Python-2.7.5.tgz
~~~

Python has been installed. Now use this command to add the PATH to your `~/.bashrc`

~~~
echo 'PATH=~/private/python/python.2.7/bin:$PATH' >> ~/.bashrc
~~~

Now use this command to reload the shell:

~~~
source ~/.bashrc
~~~

Now check which version is in use:

~~~
python -V
~~~

### Installing distribute

~~~
curl -o ~/distribute_setup.py http://python-distribute.org/distribute_setup.py
python ~/distribute_setup.py
rm -f ~/distribute_setup.py
~~~

Distribute is replacing setuptools.

### Installing setuptools:

~~~
wget https://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11-py2.7.egg
bash ~/setuptools-0.6c11-py2.7.egg
rm -f ~/setuptools-0.6c11-py2.7.egg
~~~

That is done. Python and setup tools are now installed and added to your paths. There should be no need to prefix when installing mods.

Using `easy_install` from the command line to install mods:

~~~
easy_install pip
~~~

~~~
easy_install virtualenv
~~~

~~~
easy_install flexget
~~~


### Optional Stuff:

Specify a custom libraries path.

~~~
echo 'PYTHONPATH=~/path/to/my/libs:$PATH' >> ~/.bashrc
~~~




