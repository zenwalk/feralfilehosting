You need to SSH into your slot to complete this guide. If you don't know how to do this [here is a basic guide](https://www.feralhosting.com/faq/view?question=12):

	mkdir -p ~/private/ruby
	wget ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz
	tar -xzf ~/ruby-2.0.0-p0.tar.gz
	cd ~/ruby-2.0.0-p0
	./configure --prefix=$HOME/private/ruby && make && make install
	cd && rm -rf ~/ruby-2.0.0-p0 && rm -f ~/ruby-2.0.0-p0.tar.gz
	echo 'PATH=~/private/ruby/bin:$PATH' >> ~/.bashrc

###The do this to reload your shell:###

	bash

###Check our versions:###

Now these to check your versions:

	ruby -v
	gem -v

This command to update gems to 2.0.3

	gem update --system


### Optional Stuff: ###

Specify a custom libraries path.

	echo 'GEM_HOME=~/path/to/my/libs:$PATH >> ~/.bashrc
