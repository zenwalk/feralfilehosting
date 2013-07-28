
To check the amount of space used in your slice, type this command:

~~~
du -s --si ~/
~~~

 -s is for summarize, instead of each folder size listed separately
 --si is for use powers of 1000, not 1024 (Feral uses powers of 1000 to calculate your usage!)

There might be a delay before any response is displayed — it may take up to 3 minutes for the system to calculate the amount of data in your slice.

Tip:
You can create an alias for the above command (or any command) in your `.bash_aliases` file, which is located in your `~/` (home) directory. Just edit the `.bash_aliases` file, and add this line to it:

~~~
alias space='du -s --si ~/'
~~~

You can name it whatever you want - I happen to call it `space`, because it's easy for me to remember.

