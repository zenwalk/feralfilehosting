
In SSH do these commands. Use this FAQ if you do not know how to SSH into your slot: [SSH basics - Putty](https://www.feralhosting.com/faq/view?question=12)

These commands will download the linked version of node.js and set it up inside your `~/private` directory.

~~~
wget -qO ~/node.js.tar.gz http://nodejs.org/dist/v0.10.17/node-v0.10.17-linux-x64.tar.gz
~~~

This downloads the `node-v0.10.17-linux-x64.tar.gz` and then saves it as `node.tar.gz` in your  `~/private` directory.

~~~
tar -xzf ~/node.js.tar.gz -C ~/private
~~~

This unpacks the folder archived inside the node.tar.gz into the `~/private` directory.

~~~
cp -rf ~/private/node-*/. ~/private/node/
~~~

This moves and renames the recently unpacked folder to `~/node`

~~~
rm -rf ~/node.js.tar.gz ~/private/node-*
~~~

This deletes the tar archive.

~~~
echo 'PATH=~/private/node/bin:$PATH' >> ~/.bashrc
~~~

This command appends the path to the bottom of the `~/.bashrc` for you. As long as you have not changed the paths in the previous commands. If you have, for example, decided to store the main directory in the root, you need to edit the path in the echo.

~~~
source ~/.bashrc
~~~

This reloads your shell.

~~~
node -v
~~~

Tries to call node.js to check the version and should return:

~~~
v0.10.17
~~~

If you see the version then it is ready to use.

Once you have done this, you are ready to start writing and running your node.js apps from anywhere in your account. I personally put all my apps in `~/private/node/apps/` to keep things tidy though.



