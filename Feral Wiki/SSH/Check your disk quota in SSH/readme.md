
![](http://idzr.org/w7tn?.png)

**1:** [SSH](https://www.feralhosting.com/faq/view?question=12) into your slot.

Now run the command the matches your slot type
  
For instance, for a `Helium-4` run you would run `echo '400000' >> ~/.quotaspace`

Helium-3

~~~
echo -n '333000' > ~/.quotaspace
~~~

Helium-4
 
~~~
echo -n '400000' > ~/.quotaspace
~~~

Helium-5

~~~
echo -n '500000' > ~/.quotaspace
~~~

Neon-3

~~~
echo -n '500000' > ~/.quotaspace
~~~

Neon-4 

~~~
echo -n '600000' > ~/.quotaspace
~~~

Neon-5

~~~
echo -n '750000' > ~/.quotaspace
~~~

Argon-3

~~~
echo -n '666000' > ~/.quotaspace
~~~

Argon-4

~~~
echo -n '800000' > ~/.quotaspace
~~~

Argon-5

~~~
echo -n '1000000' > ~/.quotaspace
~~~

Xenon-3

~~~
echo -n '1000000' > ~/.quotaspace
~~~

Xenon-4

~~~
echo -n '1200000' > ~/.quotaspace
~~~

Xenon-5

~~~
echo -n '1500000' > ~/.quotaspace
~~~

Radon

~~~
echo -n '3000000' > ~/.quotaspace
~~~

**2:** After SSHing into your slot, run the following the commands

~~~
mkdir -p ~/bin
wget -qNO ~/bin/quota http://git.io/FolBxw
chmod +x ~/bin/quota
source ~/.bashrc && source ~/.profile
~~~

Now running `quota` in SSH will give you your disk quota

