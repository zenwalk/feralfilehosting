
### Find your IP Address in SSH

**To find the IP address for your server, use this command:**

-i is for IP addresses for the host name:

~~~
hostname -i
~~~

This shows the hostname and IP:

~~~
host $(hostname)
~~~

This is an external check.

~~~
curl icanhazip.com
~~~

In IRC do this command:

~~~
$ip servername
~~~

Where `servername` is the name of your server.

~~~
$ip aphrodite
~~~

Alternatively, you can just simply use the **ping** command from any computer:

*note* When running this command in Windows, press and hold the [windows logo key and press R](http://support.microsoft.com/kb/126449) to bring up the run dialogue then type `cmd`.

~~~
ping server.feralhosting.com
~~~

**Example:**

~~~
ping aphrodite.feralhosting.com
~~~

The output will be your server's IP address, and some other information.

Since this is GNU/Linux, there are many ways to to the same thing and here is one more way.

~~~
host server.feralhosting.com
~~~
 
Replace server with your server name.

**Example:**

~~~
host rabbit.feralhosting.com
rabbit.feralhosting.com has address 85.17.27.70
~~~

Also, if you have OpenVPN installed on your slot, the IP given for OpenVPN on your [Software Status page](https://www.feralhosting.com/heron/manager/software/) is the IP address of your server.



