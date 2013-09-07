
If you require a **speedtest.net** sort of test, unfortunately this cannot be achieved as the servers lack a GUI and thus a web browser which you could run on your server to test speeds.

**Important note:** Feral are aware of the python speed test tool. It is not used due to being buggy and inaccurate.

There are some options you can offer to those who wish to test the speed of our/your server:

**1:** Provide them with a download link to a file hosted on your server. This will just show the through put is maxing connections where available. Since most home lines will not have the capacity max the upload potential of the server it is not a true representation of your overall speed. Cogent to Leaseweb, server to server would be more accurate of max speed potential.

Here are some FAQs on how to go about sharing your files:

Create sftp/ftps jails using this FAQ: [Installing an FTP daemon for extra accounts](https://www.feralhosting.com/faq/view?question=193)

Create WWW/http shareable links and files: [Putting your WWW folder to use](https://www.feralhosting.com/faq/view?question=20)

Create shareable links using [Ajaxplorer 5 - Basic setup](https://www.feralhosting.com/faq/view?question=222)
 
**Important note:** You can open a ticket so staff can look at your slot if you feel there is an ongoing issue.

**2:** Provide them with a download link to a file hosted on one of our servers:

Feral OVH test file:

~~~
ftp://scarlet.feralhosting.com/8.0-RELEASE-amd64-disc1.iso
~~~

Leaseweb Test File:

~~~
http://mirror.nl.leaseweb.net/speedtest/100mb.bin
~~~

Fiberring test file:

~~~
http://test.fiberring.net/100mb.bin
~~~

Feral Cogent test file:

~~~
http://aphrodite.feralhosting.com/test.bin
~~~

This will only show your the potential upload speed if they have a large download capacity as well as the file being hosted on another server (**scarlet**). Provide them with a link to a file on your server using your *WWW/Http* directory. Then they can *ftp/http/wget* a file of your choosing from **your** server.

**3:** Download a big file to your server with wget and take a screenshot:

~~~
wget -O /dev/null http://mirror.nl.leaseweb.net/speedtest/100mb.bin
wget -O /dev/null http://aphrodite.feralhosting.com/test.bin
wget -O /dev/null http://test.fiberring.net/100mb.bin
wget -O /dev/null ftp://scarlet.feralhosting.com/8.0-RELEASE-amd64-disc1.iso
~~~

Pres and hold `CTRL` then press `c` at any time to quit the download.

This is a a test of your servers download potential not your upload.

**4:** Take a screenshot of software you're using while uploading/downloading at a nice speed. This won't be an accurate measure of your max upload or download speed potential.



