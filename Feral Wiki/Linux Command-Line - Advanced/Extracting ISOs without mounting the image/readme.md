
Uploading DVD ISO's from your Feral slice can be time consuming as you will have to download the complete ISO-file to create MediaInfo, screenshots and such. 

To simplify this process, there's an easy way of extracting the ISO-file into a VIDEO_TS folder. For this you will need poweriso.

~~~
wget -qO ~/poweriso.tar.gz http://www.poweriso.com/poweriso-1.3.tar.gz
tar xzf ~/poweriso.tar.gz && chmod 700 ~/poweriso
~~~

Poweriso will create the directory you tell it use when it outputs the files.

Here is an example command.

~~~
~/./poweriso extract ~/path/to/my.iso / -od ~/examplefolder
~~~

Will extract `~/path/to/my.iso` to `~/examplefolder` and create this folder if it does not exist

This will extract the contents of the image to your designated folder. 

**Please note:**

~~~
/ -od
~~~

Is required between the path to is and the output directory




