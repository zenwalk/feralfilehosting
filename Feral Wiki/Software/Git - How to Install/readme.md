### Git 1.7.10.4

If your slot was updated to Debian Wheezy you already have `Git 1.7.10.4` installed and do not need to use this FAQ.

This command will show you your Slot's Debian version

```
lsb_release -d
```

This command will show you your installed Git version

```
git --version
```

If you specifically need a higher version you can used the FAQ to install 1.8.3.1.

### Git 1.8.3.1

You need to SSH into your slot to complete this guide. If you don't know how to do this [here is a basic guide](https://www.feralhosting.com/faq/view?question=12)

```
mkdir -p ~/private/git
wget -qNO ~/git.tar.gz  http://git-core.googlecode.com/files/git-1.8.3.1.tar.gz
tar -xzf ~/git.tar.gz && cd ~/git-1.8.3.1
./configure --prefix=$HOME/private/git && make && make install
cd && rm -rf ~/git-1.8.3.1 && rm -f ~/git.tar.gz
```

Git has been installed. Now use this command to add the PATH to your `~/.bashrc`

```
echo 'PATH=~/private/git/bin:$PATH' >> ~/.bashrc
```

Then do this to reload your shell:

```
bash
```

Then do this to check the version.

```
git --version
```

You can now do things like clone. Here is an example command:

```
git clone git://github.com/username/repo.git ~/where/you/want/this/repo
```




