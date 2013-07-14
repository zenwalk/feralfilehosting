You can use Markdown to create a FAQ if you wish. You will have to convert it to Feral BBCode using this tool:

[Markdown to BBCode](http://feralhosting.github.io/convert/m2b/index.html)

Please use github style code blocks and in-line URLs (not the type linked at the bottom of the page)

    ```
    Some code
    ```

Here are some good on-line Markdown editors. 

[http://markable.in/](http://markable.in/editor/) 

[http://dillinger.io](http://dillinger.io/)

There is also a BBCode to Markdown tool for porting an existing FAQ so it can be edited or updated in Markdown.

[BBCode to Markdown](http://feralhosting.github.io/convert/b2m/index.html)

Copy and paste the returned text into a new FAQ or an edit. The layout and formatting will be correct, there is no need to change it.

Please don't get too creative with the tags. These tools are very specific to the tags used here at Feral, which are documented below.

### How do I create a FAQ?

Click on this link: [Add a Question](https://www.feralhosting.com/faq/add) and paste in your formatted text as the answer. Your question is the Title of the FAQ or guide. Open a ticket as outlined below to inform staff of the new FAQ.

### How do I edit a FAQ?

Simply **click on edit at the bottom of the FAQ** and submit your edited version along with reason for the change.

These are some Tags that work for formatting. They all need to be properly closed using [/tag].
For example you would close code like this: [/code]

Do not use [...] brackets inside a tag unless it is used with a valid BBCode listed here. It will break any tag.

[h1]  Title
# Hello

[h2]  Second
## Hello

[h3]  Third
### Hello

[h4]  not sure
#### Hello

[h5]  Title
##### Hello

[h6]  Title
###### Hello

**  [b]bold**

[strong] (can/will be manually replaced by bold)

`  [i]italic` 

[em] italic (can/will be manually replaced by italic)

[img] Use this opening and closing tag for direct links to images.

[ this tag must be used in a specific way.

**example URL tag:** [http://pastebin.com/VaBaWZVg]( this tag must be used in a specific way.

**example URL tag:** [url=http://pastebin.com/VaBaWZVg]http://pastebin.com/VaBaWZVg)

**Dealing with SQUARE BRACKETS:**

Currently there is a bug with the use of square brackets and anything between that is not an existing BBCode. The only way to effectively deal with this for certain things like BASH Scripts is to:

**1:** Use [url=http://pastebin.com/]PasteBin.com](http://pastebin.com/VaBaWZVg) for scripts and link to them.

### CODE blocks

```
 for pre formatted code blocks follow this rule below:

When using the code tag use this rule for formatting regarding new lines please.

Blank line above

**Some code wrapped in code tags**
No new/blank line below.

This rule also applies for tags that also apply formatting above and below the line like 
the H2 and H3 tag do, but not the Bold tag for example. You can leave a blank line below
the b,i,img,url tags.

**File Hosting**

**IMAGES**

When needed some images will be re-hosted, so use whatever you need/can when editing the faq.

[http://imgur.com/](http://imgur.com/) is a popular choice.

**FILES**

Important files will be re-hosted on a more permanent platform when needed. If this is important include this info in the ticket.

[http://www.mediafire.com/](http://www.mediafire.com/) is a good choice.

**Closing: At the end of the FAQ**

Please leave 4 blank lines at the end of any question you edit or submit. This is a visual thing.

Credit will be attributed to the original author(s) where needed manually. So do not worry about this.

**After you have edited the guide please submit a ticket called:**

**FAQ Edit - FAQ name - Category**

In the body submit a link to the FAQ you edited. So for example:

**Title:** FAQ Edit - I want to edit a FAQ or guide - General

**Body:** https://www.feralhosting.com/faq/view?question=122 I fixed a broken link.

**Feral FAQ Cheat Sheet**

What is this? this is a list of preferred formatting when adding certain info. Feel free to add to this.

**Use $(whoami) and $(hostname) to automatically insert a users info.**

[code]cd ~/www/$(whoami).$(hostname)/public_html/
```

**The following command in SSH to see the hostname and IP**

```
host $(hostname)
```

**The following command in SSH to see the IP only**

```
hostname -i
```

The following command to get your external IP

```
curl -s icanhazip.com
```

**[wget](http://linux.die.net/man/1/wget)**

-q quiet
-N Overwrite if newer or different
-O Save to file.
-P Set directory prefix to prefix. Is the directory where all other files and subdirectories will be saved to

```
wget -qN www.somelink.com/script.sh -O thisfile.sh
```

**[tar](http://linux.die.net/man/1/tar)**

-c create
-x extract
-z .gz or .tgz
-j .bz2
-f file
-v verbose
-C to directory

```
tar -xzf archive.tar.gz
```

```
tar -xzf archive.tar.gz -C some/directory/
```

**[unzip](http://linux.die.net/man/1/unzip)**

-q quiet
-o overwrite
-d extract to directory 

```
unzip -qo archive.zip
```

```
unzip -qo archive.zip -d some/directory/
```

**screen**

Send a command to a running screen and window of choice.

```
screen -S screen-name -p 0 -X exec your-command-goes-here
```

`-S` screen-name you want to match
`-p` number of the screen window, 0 in this case sends it to the first.
`exec` some-command

When using **screen** give the window a name by using **-S** for easier management. The word after the **-S** is the name of the window, in this case Rtorrent.

```
screen -S Rtorrent rtorrent
```

This will attach to a screen with this name

```
screen -R Rtorrent rtorrent
```

This will attach to a screen with this name or create it if it doesn't

**[kill](http://linux.die.net/man/1/kill)**

```
kill -9 PID
```

**[killall](http://linux.die.net/man/1/killall)**

```
killall -9 processname -u $(whoami)
```

**Use [b]TAB** to autocomplete parts of your SSH commands.[/b]

For example: if I am in my home folder and I wish to go to my 

```
~/private/rtorrent
```

I can do this

```
cd ~/p **TAB**
```

Which will give me this:

```
~/private/
```

Unless I have more than one folder starting with **p**. then I must give a second or third letter depending on how they conflict. In this case I do not have a conflicting folder name.

Then if I do:

```
cd ~/private/r **TAB**
```

I will end up with this:

```
cd ~/private/rtorrent/
```

So now I press enter. I have now used TAB to auto-complete parts of my **cd** command.

**github url shortening**

[http://git.io/](http://git.io/)

[git-io-github-url-shortener](https://github.com/blog/985-git-io-github-url-shortener)

You can do it in SSH using this command.

```
curl -i http://git.io -F "url=YOU.URL.HERE"
```

**Chaining Commands**

The use of `&&` will move to the next command if the previous command was successful.

```
cd ~/private && mkdir test && cd test
```

So if the directory `~/private` did not exist the command would stop at the point where a single command did not execute successfully.

The use is `;` will just chain a series of commands. 

```
cd ~/private; mkdir test; cd test
```

Here it will just do command one then execute the next until it reaches the end. So if `~/private` did not exist the command would create the `test` folder in the wrong place.

**Run a process and send it to the background.**

if you add a `&` to the end of your command it will be sent to the background as your run it.

```
./some/path/to/a/binary &
```

### Crontab

To edit your crontab:

~~~
crontab -e
~~~

To execute a bash script from crontab you need to use this command:

~~~
bash -l
~~~

For example:

~~~
@reboot bash -l ~/myscript.sh
~~~

You can use this command to easily create a cronjob for users from inside a bash script, or in some sort of support capacity:

~~~
(crontab -l ; echo "* * * * * some/cron/thing") |uniq - | crontab -
~~~

This will create a specified cronjob while also checking to make sure it is not created more than once. So with a single command you can have create and insert a cronjob for a user.


