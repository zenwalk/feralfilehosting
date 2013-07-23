
This rutorret plugin automatically changes the text in the rutorrent ratio column, from red to green, based on the users upload ratio.

Install it using [SSH](https://www.feralhosting.com/faq/view?question=12):

~~~
wget -qNO ~/ratio.zip http://git.io/7MNLaw
unzip -qo ~/ratio.zip -d ~/www/$(whoami).$(hostname)/public_html/rutorrent/plugins/
rm -f ~/ratio.zip
~~~

**Important note:** What is different from the original?

Inside the `init.js` **changeWhat = "cell-background";** has been changed to **changeWhat = "font";** So that the font is coloured instead the background. Based on this plugin: [https://github.com/Gyran/rutorrent-ratiocolor](https://github.com/Gyran/rutorrent-ratiocolor)

Or install the original plugin like this using [SSH](https://www.feralhosting.com/faq/view?question=12) to have coloured backgrounds on the ratio column:

It changes the background colour of the cell instead of the font.

~~~
cd ~/www/$(whoami).$(hostname)/public_html/rutorrent/plugins/
wget -qNO ratiocolor.zip http://git.io/PiSq_g && unzip -qo ratiocolor.zip
cp -rf rutorrent-ratiocolor-master/. ratiocolor && rm -rf rutorrent-ratiocolor-master ratiocolor.zip
cd
~~~




