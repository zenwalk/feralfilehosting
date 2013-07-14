
If you wish to "reserve" your nickname so others may not use it, you need to register your desired nickname with NickServ.

The first time you join the What-Network IRC network, you will want to register your nickname with NickServ. To do this, type:

```
/msg NickServ REGISTER PASSWORD EMAIL
```

Replacing PASSWORD with any password you wish, and EMAIL with a real email address (in case you need to reset your password).

If the command completes successfully, NickServ will protect your nick by requiring a password when you attempt to use it.

The next time you log into IRC, you won't be automatically recognized by the NickServ system. You will need to identify yourself to the server. QYou do this by typing:

```
/msg NickServ IDENTIFY PASSWORD
```

If you want to be automatically identified when you open your client, you will have to set up commands to be run. Each client has its own way, but mIRC will let you do it in Tools > Options > Connect > Options > Perform
When you have this window open, make sure to "enable perform on connect", and enter the commands to be run in the biggest box below.

This is everything you need to know about using IRC.
If you have trouble with the NickServ system, type:

```
/msg NickServ HELP
```

This command will explain how to use the NickServ service.





