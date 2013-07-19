This rutorret plugin automatically changes the text in the rutorrent ratio column, from red to green, based on the users upload ratio.

I don't know if anyone will want to use this or not, but I wanted to redesign the ratiocolor plugin so that it would be a bit better looking and more appealing with dark backgrounds.

Install it using [SSH](https://www.feralhosting.com/faq/view?question=12):

~~~
wget -qNO ~/ratio.zip http://git.io/7MNLaw
unzip -qo ~/ratio.zip -d ~/www/$(whoami).$(hostname)/public_html/rutorrent/plugins/
rm -f ~/ratio.zip
~~~

**Important note:** What is different from the original?

Inside the `init.js` **changeWhat = "cell-background";** has been changed to **changeWhat = "font";**

~~~
//changeWhatEnum = ["cell-background", "font"];

// what to change:
// cell-background
// font
changeWhat = "font";
~~~

Based on this plugin

[https://github.com/Gyran/rutorrent-ratiocolor](https://github.com/Gyran/rutorrent-ratiocolor)

Install the original plugin like this using [SSH](https://www.feralhosting.com/faq/view?question=12):

It changes the background colour of the cell instead of the font.

~~~
cd ~/www/$(whoami).$(hostname)/public_html/rutorrent/plugins/
wget -qNO ratiocolor.zip http://git.io/PiSq_g && unzip -qo ratiocolor.zip
cp -rf rutorrent-ratiocolor-master/. ratiocolor && rm -rf rutorrent-ratiocolor-master ratiocolor.zip
cd
~~~




