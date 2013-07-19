
### Using ranger

[ranger](http://ranger.nongnu.org/) is an interactive SSH file manager using python.

~~~
git clone git://git.savannah.nongnu.org/ranger.git
~~~

This will download ranger and put it into directory called `~/ranger`

To run the file manager you use this command:

~~~
~/ranger/./ranger.py
~~~

To add an alias for ranger use these steps:

~~~
nano -w ~/.bash_aliases
~~~

Then type or copy this:

~~~
alias ranger='~/ranger/./ranger.py'
~~~

To save press and hold `CTRL` then press `x` to save. Press `y` to confirm.

The to make it usable;

~~~
source ~/.bash_aliases
~~~

Press `q` at any time to quit ranger.



