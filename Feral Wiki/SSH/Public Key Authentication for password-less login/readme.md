There is a Mac version at the end of the guide.

**A little background first.**
 
Public key authentication is an alternative means of identifying yourself to a login server, instead of typing a password. It is more secure and more flexible, but more difficult to set up. You generate a key pair, consisting of a public key (which everybody is allowed to know), and a private key (which you keep secret and do not give to anybody). The private key is able to generate signatures. A signature created using your private key cannot be forged by anybody who does not have that key; but anybody who has your public key can verify that a particular signature is genuine. There is more than one public-key algorithm available. The one we will use is RSA.

We will generate the public and private key on your home computer and then copy the public key to your feral server via FTP or client in command line using  SSH.

**Step 1: Using PuTTYgen to Generate the Key Pair**

You can generate the key pair using PuTTYgen which is maintained by the author of PuTTy. It generates pairs of public and private keys to be used with PuTTY, PSCP, and Plink, as well as the PuTTy authentication agent, Pageant. PuTTYgen generates RSA and DSA keys using the .ppk format. If you downloaded the Putty installer package, you already have PuTTYgen located in the place you installed PuTTy to, usually **Program files/PuTTy**. If not, you can download it by itself from [here](http://the.earth.li/~sgtatham/putty/latest/x86/puttygen.exe) as a single executable file.

**After you locate it or download PuTTygen, it's time to run it.**

First, you need to select which type of key you want to generate, and also select the strength of the key. **We will be using RSA and 2048** as the strength. Click the radio button next to SSH-2 RSA at the bottom of the PuTTYgen window, and then type 2048 in the box below it ( if the value is different)
   
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Public%20Key%20Authentication%20for%20password-less%20login/1.png)

**[Click here for more Info for Understanding RSA Key lengths](http://www.javamex.com/tutorials/cryptography/rsa_key_length.shtml)**
 
Then press the "Generate" button to actually generate the key. First, a progress bar will appear and PuTTYgen will ask you to move the mouse around to generate randomness. Wave the mouse in circles over the blank area in the PuTTYgen window, and the progress bar will gradually fill up as PuTTYgen collects enough randomness. You don't need to wave the mouse in particularly imaginative patterns (although it can't hurt); PuTTYgen will collect enough randomness just from the fine detail of exactly how far the mouse has moved each time Windows samples its position.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Public%20Key%20Authentication%20for%20password-less%20login/2.png)

When the progress bar reaches the end, PuTTYgen will begin creating the key. The progress bar will reset to the start, and gradually move up again to track the progress of the key generation. It will not move evenly, and may occasionally slow down to a stop; this is unfortunately unavoidable, because key generation is a random process and it is impossible to reliably predict how long it will take. 

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Public%20Key%20Authentication%20for%20password-less%20login/3.png)
	
Once you have generated the key, select a comment field and (optionally) a pass-phrase. (You can read more about why you would want to set a pass-phrase [here](http://the.earth.li/~sgtatham/putty/0.58/htmldoc/Chapter8.html#puttygen-passphrase).)

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Public%20Key%20Authentication%20for%20password-less%20login/4.png)

**IMPORTANT INFORMATION**

The comment field is a good place to store info about which server you will be connecting to, especially if you have several other keys. To alter the key comment, just type your comment text into the "Key comment" box before saving the private key. If you want to change the comment later, you can load the private key back into PuTTYgen, change the comment, and save it again. 

For now, leave the pass-phrase field blank. If you want to use it, **do not forget your pass-phrase. There is no way to recover it**.

What using a Pass-phrase means to you: ( For the guide, from the list below, 1 & 2 are best, 3 is overkill and does not make things easier)

**1:** NO pass-phrase = easy to use and safe for home usage: but anyone with access to your key file can use it until you revoke it.

**2:** A Good but "easily remembered" and "easy to type" pass phrase  = easy to use and prevents most unauthorized usage. reasonably safe if used portably.

**3:** A super complicated generated pass phrase = very secure if lost i.e. portable but not very easy to use with out PAGEANT ( and there is no PAGEANT for OpenSSH keys). This is not the most convenient route. There is no PAGEANT equivalent for our exported OpenSHH .pub keyfiles. Some software can remember your pass phrase but most do not on purpose and require you to enter it on each use.

Now you're ready to save the private key to disk. Press the "Save private key" button. PuTTYgen will put up a dialogue box asking you where to save the file. Select a directory, type in a file name, and press "Save". This file is in PuTTy's native format (*.PPK); it is the one you will need to tell PuTTy to use for authentication.

Also it will be a good idea to export the key to the OpenSSH format for use with other programs, since a lot of software works with public/private keys but does not support the .ppk format, instead they support the OpenSSH .pub format instead. This will just make our key more compatible and make sure we can use it wherever we need to.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Public%20Key%20Authentication%20for%20password-less%20login/5.png)

After you have saved both files your Super Secret Location should look like this:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Public%20Key%20Authentication%20for%20password-less%20login/6.png)
	
Saving the public key: not necessary for feral server.

**Step 2: Transferring the Public Key to the Server**

You will now want to copy the public key file to your SSH server machine. The field labelled **Public key for pasting into authorized_keys file** gives the public key data in the correct one-line format for the SSH-2 protocol that feralhosting uses. You will want to select the entire contents of the box using the mouse, press **ctrl + C** to copy it to the clipboard, and then paste the data into a PuTTy session which is connected to the server. 
	
Open PuTTy and connect to your slice. Log in with your username and password and we will use the below command to open the **authorized_keys** file to edit:

We are going to use an editor (we'll use Nano in this tutorial), and edit the authorized_keys file. If it does not already exists, we will create it by opening nano using the command below and saving the file. 

~~~
nano -w ~/.ssh/authorized_keys
~~~

So it will look like this:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Public%20Key%20Authentication%20for%20password-less%20login/7.png)

Once Nano has opened the file you will see something like this:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Public%20Key%20Authentication%20for%20password-less%20login/8.png)

The first thing we do is Immediately press the RETURN/ENTER key then Press the UP arrow key. it will then look like this
	
![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Public%20Key%20Authentication%20for%20password-less%20login/9.png)

Now paste the key using right-click into your PuTTy window.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Public%20Key%20Authentication%20for%20password-less%20login/10.png)

It will then look something like this: Notice the **== rsa-key**  near the end of the line.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Public%20Key%20Authentication%20for%20password-less%20login/11.png)
   
Press **ctrl + x** to exit Nano. It will ask if you want to save — press Y:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Public%20Key%20Authentication%20for%20password-less%20login/12.png)

Then press Enter. Nano will close and you will have a key file saved:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Public%20Key%20Authentication%20for%20password-less%20login/13.png)
	
**Step 4: Chmod'ing the .ssh Directory**

You will need to ensure that your .ssh directory and the authorized_keys file are not group-writable or world-writable. You do this by using this command:

~~~
chmod 700 ~/.ssh
~~~

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Public%20Key%20Authentication%20for%20password-less%20login/test.png)

Your server should now be configured to accept authentication using your private key. Now you need to configure PuTTy to attempt authentication using your private key.

**Step 5: Configuring PuTTy to use Private Key for Authentication**

Open another PuTTy window. Select your saved session and press LOAD.

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/SSH/Public%20Key%20Authentication%20for%20password-less%20login/kitty%20key%20file.png)

On the left, double-click on the SSH section to expand it, then click on the Auth section. On the right side, click the Browse button to point PuTTy to your freshly-created private key that you saved in Step 1.
 
(Optional) To make logins even easier, click on the Data key on the left side, it's just a little above the SSH section, right under Connection. Fill out the auto-login details with your username.

Now we need to save the changes we just made. Click on the Session section on the left side of PuTTy, then press the SAVE button. This will save the private key setting you just made. 
   
If now you click Open, Putty will connect to your server, give it your username and use the private key to authenticate. You should be logged in, without having to type anything!

* More information for the interested can be found on the official PuTTy [manual page](http://the.earth.li/~sgtatham/putty/0.62/htmldoc/Chapter8.html#pubkey).

**For Mac Users:**

Open up terminal.

Type this in and press Enter:
 
~~~
ssh-keygen -t rsa
~~~

It will ask you what directory to save it in, just leave that blank (default) the files we create will be located in **/Users/Yourusername/.ssh** (In the finder task bar click on Go and go to folder since **.ssh** is hidden by default)

Next it will ask you to enter a pass-phrase.  Enter something easy to remember but not too easy to guess.  You can later add this to your key-chain and never have to type it in again.

Login to your Feral account with SSH as usual and type in:

~~~
touch .ssh/authorized_keys
~~~

This will create the file for you.

Next open up the file **id_rsa.pub** on your Mac and copy the entire contents of it.

Go back to your Feral terminal and type:

~~~
cd ~/.ssh
~~~

Then type: 

~~~
nano authorized_keys
~~~

This will open up a text editor.  Paste your key into the very last line and make sure it looks similar to the others (it doesn't have an extra space after the first few words)

It should look like this:

![](http://i49.tinypic.com/313rgio.png)

Press Ctrl+X or Cmd+X (however you have your keyboard set up) type y to save the changes and press enter to save the changes to authorized_keys.

Next you need to chmod it. To do this type:

~~~
chmod 600 authorized_keys
~~~

Close the feral terminal and your other terminal.

Open up a new terminal and start to login to feral. Type your username@color.feralhosting.com  you will notice a box pops up put your pass-code that I told you to make earlier (the one I told you that you could remember easy but wasn't to easy to guess) and tick the remember password box.  Click okay.

Next time you go to login all you will have to do is type:

~~~
ssh username@color.feralhosting.com
~~~

and it will login without you needing to worry about a password.

If you would like a video reference to all of this please go [here](http://peter.upfold.org.uk/blog/2009/09/11/set-up-public-key-authentication-for-ssh-on-the-mac/).



