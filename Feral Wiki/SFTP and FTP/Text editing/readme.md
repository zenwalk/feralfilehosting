
### Text editing

Text editing when using SFTP/FTP

Some FTP programs will ship with a default text editor of some type. They will also usually allow you to specify a default editor for file types.

Why is this useful?

1: It will preserve the EOL or End Of Line of the original document which is important.

2: It will allow you to download, edit/create and upload text files in an easy way and not as separate actions.

3: We can use a good text editor such as [Notepad ++](http://notepad-plus-plus.org/) or [Sublime2](http://www.sublimetext.com/2) with our setting requirements.

So get Notepad ++ and install it. - [http://notepad-plus-plus.org/](http://notepad-plus-plus.org/)

**Important note:** Transfers over SFTP are all binary (Feral uses OpenSSH with SFTP v3). Setting transfers to binary for text transfers is just useful in case you used the proftpd guide with ftps. So it is recommended you do it.

### In Filezilla:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SFTP%20and%20FTP/Text%20editing/filezilla/1.png)

Here you can force Binary transfer in Filezilla just to be certain:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SFTP%20and%20FTP/Text%20editing/filezilla/2.png)

### In Winscp:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SFTP%20and%20FTP/Text%20editing/winscp/1.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SFTP%20and%20FTP/Text%20editing/winscp/2.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SFTP%20and%20FTP/Text%20editing/winscp/3.png)

Here you can force Binary transfer in WinSCP just to be certain:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SFTP%20and%20FTP/Text%20editing/winscp/transfer%201.png)
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SFTP%20and%20FTP/Text%20editing/winscp/transfer%202.png)

### Notepadd ++

Here is an example of the recommend settings for Notepad ++ when creating or editing UNIX files.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SFTP%20and%20FTP/Text%20editing/notepad++/1.settings.png)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SFTP%20and%20FTP/Text%20editing/notepad++/2.new.file.png)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SFTP%20and%20FTP/Text%20editing/notepad++/3.tabs.png)

Here is an overview of the Notepad ++ Gui. It shows how to tell what type of file you are editing.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SFTP%20and%20FTP/Text%20editing/notepad++/eol.png)



