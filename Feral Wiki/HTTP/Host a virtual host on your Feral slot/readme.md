The steps will similar for any other domain name provider.

**STEP 1:** Register Your Domain Name through a registrar.

In order to use a custom domain with Feral you must register one. There is only really one free option available and that is the [www.dot.tk](http://www.dot.tk/en/index.html?lang=en) People have complained that they force you to pay if your domain becomes popular.

The best option to it register a top level domain such a `.com` or `.co.uk` (depending on your region). If the privacy of domain registration is an issue that is something you must consider before linking your domain to your Feral account.

Once you are in control of a valid domain proceed with the guide.

**STEP 2:** Obtain the IP of Your Feral Server to configure your DNS settings.

You need this IP of your Feral slot in order to configure the DNS settings/Records.

You can do this by pinging you servername in Windows via the command prompt. Open a Command prompt and type, replacing server with your slots server name:

```
ping server.feralhosting.com
```

You can also get this information using SSH. [SSH to your server](https://www.feralhosting.com/faq/view?question=12), and type:

```
curl -s icanhazip.com
```

Press `Enter`. Write down your server's IP address, as you will need in the next step.

**STEP 3:** Configure Your Domain Name using DNS settings:

The DNS settings of any domain are controlled by the host of the Name Servers. If you have changed the name servers at some point you must use their DNS manager to configure the DNS records. By default you names servers should be controlled by the registrar post registration.

**Feral does not provide or manage name servers.**

Your domain registrar or name server host will provide you with basic or advanced tools (a DNS records editor) to manage your DNS settings for each domain they are managing the name servers for.

Find their DNS Settings Manager or similar and then create two A records for this domain pointing to your Feral server.

Click on the domain name you'd like to configure, and then click the `Manage DNS` or similar options.

**Important note:** Some hosting providers will automatically create a `CNAME` for your www version, such a GoDaddy. In this case you should only need to create Record 1.

You will have to create two A records. One for the non www version one for the www version:

**Record 1:** example.co.uk

**Record 2:** www.example.co.uk

These are treated as two separate domains. This is something you can deal with after the DNS records have been correctly set up.

**Record 1:**

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Host%20a%20virtual%20host%20on%20your%20Feral%20slot/1.png)

**Host**: example.co.uk

**TTL**: 1H or 3600

**Type**: A

**Value**: the IP of your Feral server

Add this new Record

**Record 2:**

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Host%20a%20virtual%20host%20on%20your%20Feral%20slot/2.png)

**Host**: www.example.co.uk

**TTL**: 1H or 3600

**Type**: A

**Value**: The IP of your Feral server

Add this new Record

Note: Activating domains can take up to 24 hours while the DNS propagates fully. This is beyond Feral's control and you should consider changing your DNS servers if your ISP is taking too long to acknowledge the changes.

[Google DNS](https://developers.google.com/speed/public-dns/)

[Comodo DNS](http://www.comodo.com/secure-dns/)

[OpenDNS](http://www.opendns.com/)

**STEP 4: Add it to the Server**

After you're done with the above steps, simply create these folders with the same name as the domain in `~/www/` that all slots have in their home folder.

**Folder name 1:** example.co.uk

**Folder name 2:** www.example.co.uk

So you will have something that looks like this:

![](https://raw.github.com/feralhosting/feralfilehosting/master/Feral%20Wiki/HTTP/Host%20a%20virtual%20host%20on%20your%20Feral%20slot/3.png)

It should be added almost immediately and when it is, another folder "public_html" should be created inside of each folder.

Now you will have two folders that are technically two separate websites. To deal with this you must either:

**Method 1:** Use `.htaccess` files inside your `public_html` folders to create a 301 (permanent) redirect. For example www to non-www.

Here, I have liberally borrowed from [HTML5 Boilerplate's](http://html5boilerplate.com/) .htaccess file. 

**You cannot use both of these at the same time. You must pick one and commit to it. www to non www is recommended.**

[rewrite www.example.com → example.com](http://pastebin.com/YFCEEdHJ)

[rewrite example.com → www.example.com](http://pastebin.com/mdEdBTc6)

**Method 2:** Instead of creating a directory with the name `www.example.co.uk` under `www` directory you can  rather create a symbolic link that points to the directory without the www or vice versa, for example:

```
ln -s ~/www/example.co.uk ~/www/www.example.co.uk
```

### nginx

Add this to a custom `.conf` files in your `~/.nginx/conf.d/000-default-server.d` folder, for example `wwwredirect.conf`:

~~~
if ($http_x_host = 'www.somesite.com') {
rewrite ^ http://somesite.com$request_uri permanent; 
}
~~~

You have to be specific with nginx. replace `'www.somesite.com'` with the www URL of your hosted domain

Then  replace `somesite.com` on line two with the non www URL.

~~~
if ($http_x_host = 'www.mynewsite.co.uk') {
rewrite ^ http://mynewsite.co.uk$request_uri permanent; 
}
~~~

The restart nginx.

You can then use the domains by putting files inside the relevant `public_html` folder set up.



