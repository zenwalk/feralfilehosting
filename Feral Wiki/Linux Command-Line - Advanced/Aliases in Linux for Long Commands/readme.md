
###  Aliases Overview

One of the great conveniences in Linux is the ability to set-up aliases for commands. When you have a command that you find yourself typing in frequently, it is a perfect candidate for an alias.

For example, the command to check your used space is:

~~~
du ~/ -s --si
~~~

 While some people have really good memories and can remember all the switches easily, I do not. So I created an alias for it, called `space`. Now all I have to type is the word `space` in the shell and it executes the long command for me.

### How to setup an Alias

To create an alias, you need to edit or create a file in your home directory, called `~/.bash_aliases`. Notice that this file starts with a dot. You may already have some aliases there that were automatically created by the system or the administrator. In this file, you will enter your alias definition, one per line: 

Edit the file in [SSH](https://www.feralhosting.com/faq/view?question=12) using this command:

~~~
nano -w ~/.bash_aliases
~~~

The copy and paste or type this on a new line:

~~~
alias space='du ~/ -s --si'
~~~

Notice the lack of spaces around the equal sign (=), and also the single quotes around the command itself (') - those elements are very important for the alias to work properly. 

Save your file by pressing and holding `CTLR` then pressing `x`. To see the effect of the alias you just created, you can log off and back on, or, easier, type

~~~
source ~/.bash_aliases
~~~

Which forced the system to re-read that file as if you just logged freshly on. You could make that command an alias as well - you can call it `reload`: 

~~~
alias reload='source ~/.bash_aliases'
~~~

As you can see, all sorts of command can be made into aliases to make your life easier.

Once you have some aliases created a really quick way to review them is to just type `alias` at the prompt - it will list your aliases for you.

**Important note:** Alias names should not have spaces in them. You can use an underscore to make multi-word aliases, for example: `alias some_alias`

### Some More Examples

Here is some of my `~/.bash_aliases` file as an example. I will try to explain what each one does.

~~~
alias ll='ls -lh'
~~~

Tells the ls command to display file sizes in human readable form (KB's and MB's), and use the long format of file listing. 

~~~
alias la='ls -lAh'
~~~

Same as above, but also will force the display of hidden files (starting with a dot)

~~~
alias space='du ~/ -s --si'
~~~

This command tells you the used space in your slice

~~~
alias wspace='watch -n 60 du ~/ -s --si'
~~~

This command displays an updating version of the command above. It will update every 60 seconds.

~~~
alias speed='bwm-ng'
~~~

This command will display a bandwidth meter for your server. 

These should get you started with the concept. There are many great resources on the web for more fun aliases.




